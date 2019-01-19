package store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import store.model.CartVO;
import store.model.InterStoreDAO;
import store.model.StoreDAO;
import user.model.UserVO;

public class CartListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) 
		throws Exception { // 깃테스트

		HttpSession session = req.getSession();
		UserVO loginuser = (UserVO)session.getAttribute("loginuser");
		
		InterStoreDAO sdao =  new StoreDAO();

		// *** 페이징 처리 하기 이전의 장바구니 목록 보여주기 *** //
		List<CartVO> cartList = sdao.getCartList(loginuser.getUserid()); // System.out.println("cartList => "+cartList);
		req.setAttribute("cartList", cartList);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/store/cartList.jsp");
		
	}

}
