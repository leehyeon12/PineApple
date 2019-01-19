package user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class UserInfoAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/user/userInfo.jsp");
		
	}

}
