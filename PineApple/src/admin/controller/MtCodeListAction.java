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

public class MtCodeListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		InterStoreDAO sdao = new StoreDAO();
		List<HashMap<String, String>> mtComboCodeList = sdao.getmtComboCode(); 

		JSONArray jsonArray = new JSONArray();
		
		if(mtComboCodeList != null && mtComboCodeList.size() > 0) {
			for(HashMap<String, String> map : mtComboCodeList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("mtCode", map.get("MTCODE"));
				jsonObj.put("mtName", map.get("MTNAME"));
				jsonObj.put("mtNameSpec", map.get("MTNAMESPEC"));
				jsonObj.put("mtPrice", map.get("MTPRICE"));
				
				jsonArray.add(jsonObj);
			} // end of for
		}
		
		String str_jsonArray = jsonArray.toString();
	// System.out.println("str_jsonArray => "+str_jsonArray);
		req.setAttribute("str_jsonArray", str_jsonArray);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/mtCodeList.jsp");

	} // end of void execute(HttpServletRequest req, HttpServletResponse res)------------------------------

}
