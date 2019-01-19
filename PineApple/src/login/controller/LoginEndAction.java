package login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import user.model.InterUserDAO;
import user.model.UserDAO;
import user.model.UserVO;

public class LoginEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String method = req.getMethod();
		
		if( !"POST".equalsIgnoreCase(method) ) {
			
			String msg = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
		} // end of if( !"POST".equalsIgnoreCase(method) )
		else {
			String userid = req.getParameter("userid");
			String pwd = req.getParameter("pwd");
			
			String saveid = req.getParameter("saveid");
		//	System.out.println("userid => "+userid); System.out.println("pwd => "+pwd); System.out.println("remember => "+remember);
			InterUserDAO udao = new UserDAO();
			UserVO loginuser = udao.loginOKmemberInfo(userid, pwd);
			
			if(loginuser == null) {
				String msg = "아이디 또는 비밀번호를 다시 확인하세요.";
				String loc = "javascript:history.back()";
				
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return;
			}
			else {
				HttpSession session = req.getSession();
				session.setAttribute("loginuser", loginuser);
				
				Cookie cookie = new Cookie( "saveid", loginuser.getUserid() );
				
				if(saveid != null) { // getParameter에서 받은 값이 null 이 아닌 "on" 이라면
					cookie.setMaxAge(7*24*60*60);
				}
				else {
					cookie.setMaxAge(0);
				}
				
				cookie.setPath("/");
				res.addCookie(cookie);
				
				super.setRedirect(true);
				super.setViewPage("index.do");

			} // end of if(loginuser == null) ~ else
			
		} // end of else
		
	} // end of void execute(HttpServletRequest req, HttpServletResponse res)------------------------------

} // end of class LoginEndAction

