package store.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import store.model.InterStoreDAO;
import store.model.StoreDAO;
import store.model.StoreVO;

public class AdminProductListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		InterStoreDAO sdao = new StoreDAO();
		// 1. 상품리스트
		List<StoreVO> noteBookList = sdao.selectByCategoryCode("200000");		
		req.setAttribute("noteBookList", noteBookList);
		
		// 2. 전체 상품리스트
		List<StoreVO> productList = sdao.getProductList();
		req.setAttribute("productList", productList);
		System.out.println(productList);
		// 2. 상품등록
		List<HashMap<String, String>> brCodeList = sdao.getbrCode();	
		List<HashMap<String, String>> mtComboCodeList = sdao.getmtComboCode(); 
		
		req.setAttribute("brCodeList", brCodeList);
		req.setAttribute("mtComboCodeList", mtComboCodeList);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/admin/productList.jsp");

	} // end of void execute(HttpServletRequest req, HttpServletResponse res)------------------------------
	
}
