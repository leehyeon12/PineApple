package user.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;

import jdbc.util.*;
import my.util.MyKey;

public class UserDAO implements InterUserDAO {

	private DataSource ds = null;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;	
	AES256 aes = null;
	
	
	public UserDAO() {
		
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env"); 
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
			
			String key = MyKey.key;
			aes = new AES256(key);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			System.out.println("key 값은 17글자 이상이어야 합니다.");
			e.printStackTrace();
		}
		
	} // end of public UserDAO()------------------------------
	
	
	public void close() {
	
		try {
			if(rs != null) {
				rs.close();
				rs = null;
			}
			
			if(pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			
			if(conn != null) {
				conn.close();
				conn = null;
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}// end of void close()------------------------------
	
	
	// **** 중복 ID 여부를 체크하는 메소드 생성하기 **** // 
	@Override
	public boolean idDuplicateCheck(String userid) throws SQLException {
		
		try {
			conn = ds.getConnection();
			
			String sql = " select count(*) AS CNT "
					   + " from pa_user "
					   + " where userid =? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			rs.next();
			int cnt = rs.getInt("CNT");
			
			if(cnt == 1) return false;
			else return	true;
			
		} finally {
			close();
		}
		
	} // end of boolean idDuplicateCheck(String userid)------------------------------


	// **** 회원가입(insert)하기 메소드 생성하기 **** //
	@Override
	public int registerMember(UserVO uservo) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " insert into pa_user(userid, gradeCode_fk, idx, pwd, name, email, phone, post, addr, addrDetail, birth, gender, sumTotalPoint, sumPurchasePrice, lastLoginDate, lastPwdChangeDate, registDate, uAuth, status) "
					   + " values(?, default, seq_pa_user_idx.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, default, default, default, default, default, default) ";  
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, uservo.getUserid());
			pstmt.setString(2, SHA256.encrypt(uservo.getPwd())); // 암호를 SHA256 알고리즘으로 단방향 암호화 시키기 
			pstmt.setString(3, uservo.getName());
			pstmt.setString(4, aes.encrypt(uservo.getEmail()));  // 이메일을 AES256 알고리즘으로 양방향 암호화 시키기 
			pstmt.setString(5, aes.encrypt(uservo.getPhone()));  // 휴대폰을 AES256 알고리즘으로 양방향 암호화 시키기 			
			pstmt.setString(6, uservo.getPost());
			pstmt.setString(7, uservo.getAddr());
			pstmt.setString(8, uservo.getAddrDetail());			
			pstmt.setString(9, uservo.getBirth());
			pstmt.setString(10, uservo.getGender());
			
			result = pstmt.executeUpdate();
			
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
		
	} // end of int registerMember(UserVO uservo)------------------------------

	
	// *** 로그인처리(로그인 성공 : 회원정보를 리턴, 로그인 실패 : null 리턴) *** //
	@Override
	public UserVO loginOKmemberInfo(String userid, String pwd) throws SQLException {
		
		UserVO uservo = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select idx, userid, name, sumTotalPoint, sumPurchasePrice, uAuth, status "
					   + " from pa_user "
					   + " where uAuth in(0,5) "
					   + " and status = 0 "
					   + " and userid = ? and pwd =? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, SHA256.encrypt(pwd));
			rs = pstmt.executeQuery();
			
			boolean bool =  rs.next();
			
			if(bool) {
				int idx = rs.getInt("idx");
				String v_userid = rs.getString("userid");
				String name = rs.getString("name");
				int sumTotalPoint = rs.getInt("sumTotalPoint");
				int sumPurchasePrice = rs.getInt("sumPurchasePrice");
				int uAuth = rs.getInt("uAuth");
				int status = rs.getInt("status");
				
				uservo = new UserVO();
				uservo.setIdx(idx);
				uservo.setUserid(v_userid);
				uservo.setName(name);
				uservo.setSumTotalPoint(sumTotalPoint);
				uservo.setSumPurchasePrice(sumPurchasePrice);
				uservo.setuAuth(uAuth);
				uservo.setStatus(status);
			}
			
		} finally {
			close();
		}
		
		return uservo;
		
	} // end of UserVO loginOKmemberInfo(String userid, String pwd)------------------------------

	
	// *** 검색 및 날짜구간이 있는 페이징 처리를 한 탈퇴한 회원을 포함한 전체회원 목록 가져오는 메소드 생성하기 *** //
	@Override
	public List<UserVO> getAllMember() throws SQLException {
		
		List<UserVO> userList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select rno, userid, gradeCode_fk, idx, name, email, phone, post, addr, addrDetail, birth, gender, sumTotalPoint, sumPurchasePrice\n "
					   + "      , lastLoginDate, lastPwdChangeDate, registDate, status\n "
					   + " from\n "
					   + " (\n "
					   + "    select row_number() over(order by idx desc) AS rno\n "
					   + "         , userid, gradeCode_fk, idx, name, email, phone, post, addr, addrDetail, birth"
					   + "		   , case when gender = '0' then '남' else '여' end as gender, sumTotalPoint, sumPurchasePrice\n "
					   + "         , to_char(lastLoginDate, 'yyyy-mm-dd') AS lastLoginDate"
					   + "         , to_char(lastPwdChangeDate, 'yyyy-mm-dd') AS lastPwdChangeDate"
					   + "         , to_char(registDate, 'yyyy-mm-dd') AS registDate"
					   + "		   , status\n "
					   + "    from pa_user\n "
					   + "    where uAuth = 0 and status in(0,1,2)\n "
					   + " ) V ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				
				if(cnt==1)
					userList = new ArrayList<UserVO>(); 
				
				String userid = rs.getString("userid");
				String gradeCode_fk = rs.getString("gradeCode_fk");				
				int idx = rs.getInt("idx");
				String name = rs.getString("name");			
				String email = aes.decrypt(rs.getString("email") );  // 이메일을 AES256 알고리즘으로 복호화  
				String phone = aes.decrypt(rs.getString("phone"));  // 휴대폰을 AES256 알고리즘으로 복호화  
				String post = rs.getString("post");
				String addr = rs.getString("addr");
				String addrDetail = rs.getString("addrDetail");				
				String birth = rs.getString("birth");
				String gender = rs.getString("gender");
				int sumTotalPoint = rs.getInt("sumTotalPoint");
				int sumPurchasePrice = rs.getInt("sumPurchasePrice");
				String lastLoginDate = rs.getString("lastLoginDate");
				String lastPwdChangeDate = rs.getString("lastPwdChangeDate");
				String registDate = rs.getString("registDate");
				int status = rs.getInt("status");
				
				UserVO uvo = new UserVO(userid, gradeCode_fk, idx, "", name, email, phone, post, addr, addrDetail, birth, gender, sumTotalPoint, sumPurchasePrice, lastLoginDate, lastPwdChangeDate, registDate, 0, status);
				
				userList.add(uvo);
			} // end of while
			
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return userList;
		
	} // end of List<UserVO> getAllMember()------------------------------


	// *** 회원 1명에 대한 정보를 보여주는 메소드 생성하기 *** //
	@Override
	public UserVO getUserOneByIdx(String userIdx) throws SQLException {
		
		UserVO userOne = null; 
		
		try {
			conn = ds.getConnection();
			
			String sql = " select userid, gradeCode_fk, idx, name, email, phone, post, addr, addrDetail, birth, case when gender = '0' then '남' else '여' end as gender, sumTotalPoint, sumPurchasePrice "
		               + "      , to_char(registDate, 'yyyy-mm-dd') AS registDate, status "
		               + " from pa_user "
					   + " where idx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userIdx);
	
			rs = pstmt.executeQuery();
			
			boolean isExists = rs.next();
			
			if(isExists) {
				String userid = rs.getString("userid");
				String gradeCode_fk = rs.getString("gradeCode_fk");				
				int idx = rs.getInt("idx");
				String name = rs.getString("name");			
				String email = aes.decrypt(rs.getString("email") );  // 이메일을 AES256 알고리즘으로 복호화  
				String phone = aes.decrypt(rs.getString("phone"));
				String post = rs.getString("post");
				String addr = rs.getString("addr");
				String addrDetail = rs.getString("addrDetail");
				String birth = rs.getString("birth");
				String gender = rs.getString("gender");
				int sumTotalPoint = rs.getInt("sumTotalPoint");
				int sumPurchasePrice = rs.getInt("sumPurchasePrice");
				String registDate = rs.getString("registDate");
				int status = rs.getInt("status");
				
				userOne = new UserVO(userid, gradeCode_fk, idx, "", name, email, phone, post, addr, addrDetail, birth, gender, sumTotalPoint, sumPurchasePrice, "", "", registDate, 0, status);

			}
			
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return userOne;		
	} // end of UserVO getUserOneByIdx(String userIdx)------------------------------

	
} // end of class UserDAO
