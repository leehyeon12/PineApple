package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import user.model.UserVO;

public abstract class AbstractController 
	   implements Command {
	
	private boolean isRedirect = false; 	
	private String viewPage; 

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) { 
		this.isRedirect = isRedirect;
	}

	public String getViewPage() {
		return viewPage;
	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}
	
    // **** 로그인 유무를 검사해서 
    //		로그인 했으면 로그인 한 사용자의 정보를 return 해주고
    //		로그인 안했으면 NULL을 return 해주는 메소드 생성하기
	public UserVO getLoginUser(HttpServletRequest req) { 
		
		UserVO loginuser = null;
		
		// session에 저장된 값을 얻어온다.
		HttpSession session = req.getSession();
		loginuser = (UserVO)session.getAttribute("loginuser");
		
		if(loginuser == null) {
			String msg = "먼저 로그인 하세요!!";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			isRedirect = false;
			viewPage = "/WEB-INF/msg.jsp";
		} // end of if(loginuser == null)
		
		return loginuser;		
	} // end of public MemberVO getLoginUser(HttpServletRequest req)------------------------------
	

} // end of abstract class AbstractController 
