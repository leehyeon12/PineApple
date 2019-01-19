package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class LogoutAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		HttpSession session = req.getSession();
		session.invalidate();
	
		super.setRedirect(false);
		super.setViewPage("index.do");
		
	} // end of void execute(HttpServletRequest req, HttpServletResponse res)------------------------------

}
