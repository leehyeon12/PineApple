package store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import store.model.InterStoreDAO;
import store.model.StoreDAO;
import store.model.StoreVO;

public class ProdListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		InterStoreDAO sdao = new StoreDAO();
		List<StoreVO> productList = sdao.getProductList();
		req.setAttribute("productList", productList);

		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/prodList.jsp");
		
	}

}
