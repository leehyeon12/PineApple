package user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class UserRegisterStartAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/user/userRegister.jsp");
		
	} // end of void execute(HttpServletRequest req, HttpServletResponse res)------------------------------

} // end of class UserRegisterAction extends 
