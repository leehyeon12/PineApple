package store.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterStoreDAO {
	
	// *** pa_product 테이블에서 categoryCode 컬럼의 값별로 상품 목록을 가져오는 추상 메소드 *** //
	List<StoreVO> selectByCategoryCode(String categoryCode) throws SQLException;
	
	// *** 테이블 pa_brand에서 brCode와 brName을 가져오는(select) 추상 메소드 *** // 
	List<HashMap<String, String>> getbrCode() throws SQLException;
	
	// *** 테이블 pa_material에서 mtCode와 mtName, mtNamespec을 가져오는(select) 추상 메소드 *** //
	List<HashMap<String, String>> getmtComboCode() throws SQLException;
	
	// *** 테이블 pa_accessories에서 고유한 accCode와 accRame을 가져오는(select) 추상 메소드 *** // 
	List<HashMap<String, String>> getSubCategory() throws SQLException;
	
	// *** 상품번호 채번 해오는 메소드 생성하기 *** // 
	int getPnumOfProduct() throws SQLException;
	
	// *** pa_product 테이블에 insert(제품등록) 해주는 추상 메소드 *** //
	int productInsert(StoreVO svo) throws SQLException;
	
	// === *** 테이블 pa_product 에서  데이터를 가져오는(select) 추상 메소드 *** // 
	List<StoreVO> getProductList() throws SQLException;
	
} // end of interface InterStoreDAO
