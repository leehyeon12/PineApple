package user.model;

import java.sql.SQLException;
import java.util.List;

public interface InterUserDAO {

	// **** 중복 ID 여부를 체크하는 추상 메소드 **** // 
	boolean idDuplicateCheck(String userid) throws SQLException;
	
	// **** 회원가입(insert)하기 추상 메소드 **** //
	int registerMember(UserVO uservo) throws SQLException;
	
	// *** 로그인처리(로그인 성공 : 회원정보를 리턴, 로그인 실패 : null 리턴) *** // 
	UserVO loginOKmemberInfo(String userid, String pwd) throws SQLException; 

	// *** 검색 및 날짜구간이 있는 페이징 처리를 한 탈퇴한 회원을 포함한 전체회원 목록 가져오는 추상 메소드 *** //
	List<UserVO> getAllMember() throws SQLException;
	
	// *** 회원 1명에 대한 정보를 보여주는 추상 메소드 *** //
	UserVO getUserOneByIdx(String userIdx) throws SQLException;
	
} // end of interface InterUserDAO 
