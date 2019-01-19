package user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import user.model.InterUserDAO;
import user.model.UserDAO;
import user.model.UserVO;

public class UserRegisterEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) 
		throws Exception {
		
		String userid = req.getParameter("userid");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String post = req.getParameter("post");
		String addr = req.getParameter("addr");
		String addrDetail = req.getParameter("addrDetail");
		String birthyyyy = req.getParameter("birthyyyy");
		String birthmm = req.getParameter("birthmm");
		String birthdd = req.getParameter("birthdd");
		String gender = req.getParameter("gender");
		
		UserVO uvo = new UserVO();
		uvo.setUserid(userid);
		uvo.setPwd(pwd);
		uvo.setName(name);
		uvo.setEmail(email);
		uvo.setPhone(phone);
		uvo.setPost(post);
		uvo.setAddr(addr);
		uvo.setAddrDetail(addrDetail);
		uvo.setBirth(birthyyyy + birthmm + birthdd);
		uvo.setGender(gender);
		
		InterUserDAO udao = new UserDAO();
		
		int n = udao.registerMember(uvo); 

		String msg = "";
		String loc = "";
		
	    if(n == 1) { 
	    	msg = "회원가입 성공!!";
	    	loc = "index.do";
	    }
	    else { 
		    msg = "회원가입 실패!!";
	    	loc = "memberRegister.do";
	    }
	    
	    req.setAttribute("msg", msg);
	    req.setAttribute("loc", loc);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/msg.jsp");
		
	}

}
