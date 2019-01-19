package admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import user.model.InterUserDAO;
import user.model.UserDAO;
import user.model.UserVO;

public class AdminUserListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		InterUserDAO udao = new UserDAO();
		List<UserVO> userList = udao.getAllMember();
		
		req.setAttribute("userList", userList);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/user/admin/userList.jsp");
		
	} // end of void execute(HttpServletRequest req, HttpServletResponse res)------------------------------

}
