package store.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdbc.util.AES256;
import my.util.MyKey;

public class StoreDAO implements InterStoreDAO {

	private DataSource ds = null;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;	
	AES256 aes = null;
	
	
	public StoreDAO() {
		
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
		
	} // end of void close()------------------------------
	
	
	// *** pa_product 테이블에서 categoryCode 컬럼의 값별로 상품 목록을 가져오는 메소드 생성하기 *** //
	@Override
	public List<StoreVO> selectByCategoryCode(String categoryCode) throws SQLException {
		
		List<StoreVO> noteBookList = null;
		
		try {
			conn = ds.getConnection();

			String sql = "select * from pa_product where idx = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(categoryCode));

			rs = pstmt.executeQuery();

			int cnt = 0;
			while ( rs.next() ) {
				cnt++;
				
				if(cnt == 1) {
					noteBookList = new ArrayList<StoreVO>();
				}
				
				int idx = rs.getInt("idx");
				String categoryCode_fk = rs.getString("categoryCode_fk");
				String brCode_fk = rs.getString("brCode_fk");
				String brName = rs.getString("brName");
				String name = rs.getString("name");
				String cpu = rs.getString("cpu");				
				String inch = rs.getString("inch");
				String ramCode_fk = rs.getString("ramCode_fk");
				String ramName = rs.getString("ramName");
				String storageCode_fk = rs.getString("storageCode_fk");
				String storageName = rs.getString("storageName");
				String osCode_fk = rs.getString("osCode_fk");
				String osName = rs.getString("osName");
				int price = rs.getInt("price");
				int saleprice = rs.getInt("saleprice");	
				String image1 = rs.getString("image1");
				String image2 = rs.getString("image2");				
				String content = rs.getString("content");	
				int pqty = rs.getInt("pqty");
				String inputdate = rs.getString("inputdate");
				String status = rs.getString("status");
				
				StoreVO svo = new StoreVO(idx, categoryCode_fk, brCode_fk, brName, name, cpu, inch, ramCode_fk, ramName, storageCode_fk, storageName, osCode_fk, osName, price, saleprice, image1, image2, content, pqty, inputdate, status);
				
				noteBookList.add(svo);
				
			} // end of while
						
		} finally {
			close();
		} // end of try ~ finally
				
		return noteBookList;	
	} // end of 

	
	// === *** 테이블 pa_brand 에서 br_code 와 br_name 을 가져오는(select) 메소드 생성하기 *** //
	@Override
	public List<HashMap<String, String>> getbrCode() throws SQLException {
		
		List<HashMap<String, String>> brCodeList = null;
		
		try {
			conn = ds.getConnection(); 
			
			String sql = " select brCode, brName "
					   + " from pa_brand "
					   + " order by idx asc ";
			
			pstmt = conn.prepareStatement(sql); 
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt == 1) {
					brCodeList = new ArrayList<HashMap<String, String>>();
				}
				
				String brCode = rs.getString("brCode"); 
			    String brName = rs.getString("brName"); 
			    
			    HashMap<String, String> map = new HashMap<String, String>();
			    map.put("BRCODE", brCode);
			    map.put("BRNAME", brName);
			      
			    brCodeList.add(map);  
			}// end of while-----------------
			
		} finally{
			close();
		}
		
		return brCodeList;
		
	} // end of List<HashMap<String, String>> getBrCode()------------------------------


	// === *** 테이블 pa_material 에서 mt_code 와 mt_name, mt_price, mt_namespec 을 가져오는(select) 메소드 생성하기 *** //
	@Override
	public List<HashMap<String, String>> getmtComboCode() throws SQLException {
		
		List<HashMap<String, String>> mtComboCodeList = null;
		
		try {
			conn = ds.getConnection(); 
			
			String sql = " select mtCode, mtName, mtName || ' ' || mtSpec AS mtNameSpec, mtPrice "
					   + " from pa_material ";
			
			pstmt = conn.prepareStatement(sql); 
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt == 1) {
					mtComboCodeList = new ArrayList<HashMap<String, String>>();
				}
				
				String mtCode = rs.getString("mtCode"); 
				String mtName = rs.getString("mtName"); 
			    String mtNameSpec = rs.getString("mtNameSpec"); 
			    String mtPrice = rs.getString("mtPrice");
			    
			    HashMap<String, String> map = new HashMap<String, String>();
			    map.put("MTCODE", mtCode);
			    map.put("MTNAME", mtName);
			    map.put("MTNAMESPEC", mtNameSpec);
			    map.put("MTPRICE", mtPrice);
			    
			    mtComboCodeList.add(map);  
			}// end of while-----------------
			
		} finally{
			close();
		}
		
		return mtComboCodeList;

	} // end of List<HashMap<String, String>> getmtComboCode()------------------------------
 
	

	// === *** 테이블 pa_accessories 에서 고유한 acc_code와 acc_name 을 가져오는(select) 추상 메소드 *** // 
	@Override
	public List<HashMap<String, String>> getSubCategory() throws SQLException {
				
		List<HashMap<String, String>> SubCategoryList = null;
	/*	
		try {
			conn = ds.getConnection(); 
			
			String sql = " select distinct acc_code, acc_name "
					   + " from pa_accessories ";
			
			pstmt = conn.prepareStatement(sql); 
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt == 1) {
					SubCategoryList = new ArrayList<HashMap<String, String>>();
				}
				
				String acc_code = rs.getString("acc_code"); 
				String acc_name = rs.getString("acc_name"); 
			    
			    HashMap<String, String> map = new HashMap<String, String>();
			    map.put("ACC_CODE", acc_code);
			    map.put("ACC_NAME", acc_name);
			      
			    SubCategoryList.add(map);  
			}// end of while-----------------
				
		} finally{
			close();
		}
	*/	
		return SubCategoryList;		
			
	} // end of List<HashMap<String, String>> getSubCategory(String mainCategory)------------------------------


	
	// *** 제품번호 채번 해오는 메소드 생성하기 *** // 
	@Override
	public int getPnumOfProduct() throws SQLException {
		
		int idx = 0; 
		
		try {
			conn = ds.getConnection();

			String sql = " select seq_pa_product_idx.nextval AS idx "
					   + " from dual ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next(); 
			idx = rs.getInt("idx");
			
		} finally {
			close();
		} // end of try ~ finally
		
		return idx;
	} // end of int getPnumOfProduct()------------------------------

	
	
	// *** pa_product 테이블에 insert(제품등록) 해주는 추상 메소드 *** //
	@Override
	public int productInsert(StoreVO svo) 
		throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
	
			String sql = " insert into pa_product(idx, categoryCode_fk, brCode_fk, brName, name, cpu, inch, ramCode_fk, ramName, storageCode_fk, storageName, osCode_fk, osName, price, saleprice, image1, image2, content, pqty, inputdate, status)\n "
					   + " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, default) ";			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, svo.getIdx());
			pstmt.setString(2, svo.getCategoryCode_fk());
			pstmt.setString(3, svo.getBrCode_fk());
			pstmt.setString(4, svo.getBrName());
			pstmt.setString(5, svo.getName());
			pstmt.setString(6, svo.getCpu());
			pstmt.setString(7, svo.getInch());
			pstmt.setString(8, svo.getRamCode_fk());
			pstmt.setString(9, svo.getRamName());
			pstmt.setString(10, svo.getStorageCode_fk());
			pstmt.setString(11, svo.getStorageName());
			pstmt.setString(12, svo.getOsCode_fk());
			pstmt.setString(13, svo.getOsName());
			pstmt.setInt(14, svo.getPrice());
			pstmt.setInt(15, svo.getSaleprice());
			pstmt.setString(16, svo.getImage1());
			pstmt.setString(17, svo.getImage2());
			pstmt.setString(18, svo.getContent());
			pstmt.setInt(19, svo.getPqty());
				
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		} // end of try ~ finally
		
		return result;
	} // end of int productInsert(ProductVO svo)------------------------------

	
	
	@Override
	public List<StoreVO> getProductList() throws SQLException {
		
		List<StoreVO> productList = null;
		 
		try {
			conn = ds.getConnection();

			String sql = "select * from pa_product";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			int cnt = 0;
			while ( rs.next() ) {
				cnt++;
				
				if(cnt == 1) {
					productList = new ArrayList<StoreVO>();
				}
				
				int idx = rs.getInt("idx");
				String categoryCode_fk = rs.getString("categoryCode_fk");
				String brCode_fk = rs.getString("brCode_fk");
				String brName = rs.getString("brName");
				String name = rs.getString("name");
				String cpu = rs.getString("cpu");				
				String inch = rs.getString("inch");
				String ramCode_fk = rs.getString("ramCode_fk");
				String ramName = rs.getString("ramName");
				String storageCode_fk = rs.getString("storageCode_fk");
				String storageName = rs.getString("storageName");
				String osCode_fk = rs.getString("osCode_fk");
				String osName = rs.getString("osName");
				int price = rs.getInt("price");
				int saleprice = rs.getInt("saleprice");	
				String image1 = rs.getString("image1");
				String image2 = rs.getString("image2");				
				String content = rs.getString("content");	
				int pqty = rs.getInt("pqty");
				String inputdate = rs.getString("inputdate");
				String status = rs.getString("status");
				
				StoreVO svo = new StoreVO(idx, categoryCode_fk, brCode_fk, brName, name, cpu, inch, ramCode_fk, ramName, storageCode_fk, storageName, osCode_fk, osName, price, saleprice, image1, image2, content, pqty, inputdate, status);
				
				productList.add(svo);
				
			}// end of while-----------------
			
		} finally{
			close();
		}
		
		return productList;		
	}


	// **** 장바구니 담기를 해주는 메소드 생성하기 **** //
	@Override
	public int insertCartList(HashMap<String, String> map) 
		throws SQLException {

		int result = 0;
		
		try {
			conn = ds.getConnection(); // #장바구니 비우기 또는 해당 제품을 주문하는 순간 장바구니에서 없어져 버린다.(전제조건)

			/*
			 	먼저 장바구니 테이블(jsp_cart)에 새로운 제품을 넣는 것인지,
			 	아니면 또 다시 제품을 추가로 더 구매하는 것인지 알기 위해서 
			 	사용자가 장바구니에 넣으려고 하는 제품번호가 장바구니 테이블에 
			 	이미 있는지 없는지 먼저 장바구니 번호(cartno)의 값을 알아온다 
			 	
			 	----------------------------------------
			 	cartno  fk_userid  fk_pnum  oqty  status
			 	----------------------------------------
			 	   1	  leess		  7		  2		1
			 	   2	  hongks	  7		  5		1	
			 	   3	  leess	      6		  3	  	1 #만약 이렇게 주문이 추가된다면, 4	  leess		  7		 10		1	
			 */
			
			String sql = " select cartNo " // #있으면, 기존 제품이 있는데 추가(update)를 하겠다. 없으면 insert
					   + " from pa_cartList "
					// + " where status = 1 and "
					   + " where fk_userid = ? and "
					   + " fk_pnum = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("FK_USERID"));
			pstmt.setString(2, map.get("IDX"));
			
			rs = pstmt.executeQuery(); // #rs가 있을수도 없을 수도, 있으면 딱 한 개 고유하니까
			
			if( rs.next() ) {
				// 이미 장바구니 테이블에 담긴 제품이라면
				// update 해주어야 한다.
				
				int cartNo = rs.getInt("cartNo");
				
				sql = " update jsp_cart set oqty = oqty + ? "
					+ " where cartNo = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(map.get("OQTY")));
				pstmt.setInt(2, cartNo);
				
				result = pstmt.executeUpdate();
			}
			else {
				// 장바구니 테이블에 없는 제품이라면
				// insert 해준다.
				
				sql = "insert into pa_cartList(cartNo, fk_userid, fk_pnum, oqty, ramOption, ssdOption, windowOption)\n"
					+ "values(seq_pa_cartList_cartNo.nextval, ?, ?, to_number(?), ?, ?, ?)"; // #?자체가 스트링 타입인데 어차피 숫자밖에 안들어온다. 안써도 상관없지만 찝찝하면 해라. 문자를 숫자로 바꿔주는 오라클 함수 to_number
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, map.get("FK_USERID"));
				pstmt.setString(2, map.get("IDX"));
				pstmt.setString(3, map.get("OQTY"));
				pstmt.setString(4, map.get("RAMOPTION"));
				pstmt.setString(5, map.get("SSDOPTION"));
				pstmt.setString(6, map.get("WINDOWOPTION"));
				
				result = pstmt.executeUpdate();
			}
			
		} finally {
			close();
		} // end of try ~ finally
		
		return result;
		
	}





	
	
} // end of class StoreDAO
