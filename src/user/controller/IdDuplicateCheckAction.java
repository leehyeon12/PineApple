package user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import user.model.InterUserDAO;
import user.model.UserDAO;

public class IdDuplicateCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) 
		throws Exception {
		
		String method = req.getMethod();
		
		if( "POST".equalsIgnoreCase(method) ) {			
			String userid = req.getParameter("userid");
			
			InterUserDAO udao = new UserDAO();
			boolean isUSEuserid = udao.idDuplicateCheck(userid);
			
			req.setAttribute("userid", userid);
			req.setAttribute("isUSEuserid", isUSEuserid);
		}

		req.setAttribute("method", method);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/user/idcheck.jsp");
		
	} // end of void execute(HttpServletRequest req, HttpServletResponse res)------------------------------

} // end of class IdDuplicateCheckAction
