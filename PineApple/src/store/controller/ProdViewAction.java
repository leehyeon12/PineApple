package store.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import store.model.InterStoreDAO;
import store.model.StoreDAO;
import store.model.StoreVO;

public class ProdViewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String idx = req.getParameter("idx");
		
		InterStoreDAO sdao = new StoreDAO();
		List<StoreVO> productDetail = sdao.selectByCategoryCode(idx);
	//	List<HashMap<String, String>> mtList = sdao.selectMtCode(mtName); 
		
		req.setAttribute("idx", idx);
	//	System.out.println(productDetail);
		req.setAttribute("productDetail", productDetail);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/prodview.jsp");
		
	}

}
