package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import user.model.UserVO;

public class LoginStartAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		UserVO loginuser = super.getLoginUser(req);
		if(loginuser != null) {			
			String msg = "이미 로그인 되었습니다.";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
		} // end of if(loginuser != null)
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/login/loginUser.jsp");
		
	} // end of void execute(HttpServletRequest req, HttpServletResponse res)------------------------------

}
