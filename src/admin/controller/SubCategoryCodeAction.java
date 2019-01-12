package admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.controller.AbstractController;
import store.model.InterStoreDAO;
import store.model.StoreDAO;

public class SubCategoryCodeAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		InterStoreDAO sdao = new StoreDAO();
		List<HashMap<String, String>> SubCategoryList = sdao.getSubCategory();
		
		JSONArray jsonArray = new JSONArray();
		
		if(SubCategoryList != null && SubCategoryList.size() > 0) {
			for(HashMap<String, String> map : SubCategoryList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("acc_code", map.get("ACC_CODE"));
				jsonObj.put("acc_name", map.get("ACC_NAME"));
				
				jsonArray.add(jsonObj);
			} // end of for
		}
		
		String str_jsonArray = jsonArray.toString();
	//	System.out.println("str_jsonArray => "+str_jsonArray);
		req.setAttribute("str_jsonArray", str_jsonArray);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/subCategoryCode.jsp");
		
	} // end of void execute(HttpServletRequest req, HttpServletResponse res)------------------------------

}
