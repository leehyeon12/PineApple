package store.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import store.model.InterStoreDAO;
import store.model.StoreDAO;
import user.model.UserVO;

public class CartAddAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		HttpSession session = req.getSession();
		UserVO loginuser = (UserVO)session.getAttribute("loginuser"); 
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("FK_USERID", loginuser.getUserid());
		map.put("IDX", req.getParameter("idx"));
		map.put("OQTY", req.getParameter("oqty"));
		map.put("RAMOPTION", req.getParameter("ramOption"));
		map.put("SSDOPTION", req.getParameter("ssdOption"));
		map.put("WINDOWOPTION", req.getParameter("windowOption"));
		
		InterStoreDAO sdao = new StoreDAO();
		int n = sdao.insertCartList(map);
		
		if(n == 1) {
			String msg = "장바구니 담기 성공!!";
			String loc = "cartList.do";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		else {
			String msg = "장바구니 담기 실패!!";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
	}

}
