package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.UserVO;

public class IndexController extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) 
		throws Exception {
		
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/main_index.jsp");

	
	} // end of void execute(HttpServletRequest req, HttpServletResponse res)------------------------------

} // end of class IndexController
