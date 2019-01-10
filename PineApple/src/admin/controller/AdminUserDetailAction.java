package admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.controller.AbstractController;
import user.model.InterUserDAO;
import user.model.UserDAO;
import user.model.UserVO;

public class AdminUserDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String userIdx = req.getParameter("userIdx");
		InterUserDAO udao = new UserDAO();
		
		UserVO userOne = udao.getUserOneByIdx(userIdx);
		
		JSONArray jsonArray = new JSONArray();
		
		if(userOne != null) {
			JSONObject jsonObj = new JSONObject();
			// JSONObject 는 JSON형태(키:값)의 데이터를 관리해 주는 클래스이다.
			
		    jsonObj.put("userid", userOne.getUserid());
		    jsonObj.put("fk_grade_code", userOne.getGradeCode_fk());
		    jsonObj.put("name", userOne.getName());
		    jsonObj.put("email", userOne.getEmail());
		    jsonObj.put("phone", userOne.getPhone());
		    jsonObj.put("post", userOne.getPost());
		    jsonObj.put("addr", userOne.getAddr());
		    jsonObj.put("addrDetail", userOne.getAddrDetail());
		    jsonObj.put("birth", userOne.getBirth());
		    jsonObj.put("gender", userOne.getGender());
		    jsonObj.put("sumTotalPoint",  userOne.getSumTotalPoint());
		    jsonObj.put("sumPurchasePrice", userOne.getSumPurchasePrice());
		    jsonObj.put("registDate", userOne.getRegistDate());
		    jsonObj.put("status", userOne.getStatus());
		    
		    jsonArray.add(jsonObj);
		}
		
		String userDetail = jsonArray.toString();
		
		req.setAttribute("userDetail", userDetail);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/user/admin/userDetail.jsp");
		
	} // end of void execute(HttpServletRequest req, HttpServletResponse res)------------------------------

}
