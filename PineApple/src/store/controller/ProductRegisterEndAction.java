package store.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import store.model.StoreDAO;
import store.model.StoreVO;

public class ProductRegisterEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		// 1. 첨부파일이 어느 경로에 업로드 할 것인지 그 경로를 설정해야 한다.
		HttpSession session = req.getSession();
		ServletContext svlCtx = session.getServletContext(); // #프로그램 전체 환경값을 알아온다. C:\myjsp\MyMVC\WebContent\images의 이미지를 보는 게 아니라, C:\myjsp\.metadata에 있다.
		String imagesDir = svlCtx.getRealPath("/images");
		System.out.println("=== 첨부되어지는 이미지 파일이 올라갈 절대경로 imagesDir ==> " + imagesDir);
		
		MultipartRequest mtreq = null;
		try {
		/*
			MultipartRequest의 객체가 생성됨과 동시에 파일 업로드가 이루어 진다.
				 
			MultipartRequest(HttpServletRequest request,
							 String saveDirectory,		-- 파일이 저장될 경로
							 int maxPostSize,			-- 업로드할 파일 1개의 최대 크기(byte)
							 String encoding,
							 FileRenamePolicy policy)	-- 중복된 파일명이 올라갈 경우 파일명다음에 자동으로 숫자가 붙어서 올라간다. 
			   
			파일을 저장할 디렉토리를 지정할 수 있으며, 업로드제한 용량을 설정할 수 있다.(바이트단위). 
			이때 업로드 제한 용량을 넘어서 업로드를 시도하면 IOException 발생된다. 
			또한 국제화 지원을 위한 인코딩 방식을 지정할 수 있으며, 중복 파일 처리 인터페이스를사용할 수 있다.
			   		
			이때 업로드 파일 크기의 최대크기를 초과하는 경우이라면 
			IOException 이 발생된다.
			그러므로 Exception 처리를 해주어야 한다.                
		 */
			mtreq = new MultipartRequest( req, imagesDir, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy() );
			
		} catch (IOException e) {
			e.printStackTrace();
			req.setAttribute("msg", "파일 업로드 실패 ==> 용량 10MB 초과했으므로 실패함!!");	
			req.setAttribute("loc", "productList.do"); 
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
		}
		
		// 2. 첨부 이미지 파일을 올렸으니 그 다음으로는 상품정보(상품명, 정가, 제품설명...)를 
		//	  DB의 pa_product 테이블에 insert 를 해주어야 한다. 
		StoreDAO sdao = new StoreDAO();
		
		String categoryCode = mtreq.getParameter("categoryCode"); 
	//	String subCategory = mtreq.getParameter("subCategory"); 
		String brCode = mtreq.getParameter("brCode");
		String brName = mtreq.getParameter("brName");
		String name = mtreq.getParameter("name");
		String cpu = mtreq.getParameter("cpu");
		String inch = mtreq.getParameter("inch");
		String ramCode = mtreq.getParameter("ramCode");
		String ramName = mtreq.getParameter("ramName");
		String storageCode = mtreq.getParameter("storageCode");
		String storageName = mtreq.getParameter("storageName");
		String osCode = mtreq.getParameter("osCode");
		String osName = mtreq.getParameter("osName");
		String price = mtreq.getParameter("price");
		String image1 = mtreq.getFilesystemName("image1");
		String image2 = mtreq.getFilesystemName("image2");
		//String image1 = mtreq.getParameter("image1"); System.out.println("image1 => "+image1);
		//String image2 = mtreq.getParameter("image2"); System.out.println("image2 => "+image2);
		String content = mtreq.getParameter("content");
		String pqty = mtreq.getParameter("pqty");

		StoreVO svo = new StoreVO();
		int idx = sdao.getPnumOfProduct(); // 제품번호 채번 해오기

		svo.setIdx(idx);
		svo.setCategoryCode_fk(categoryCode);
		svo.setBrCode_fk(brCode);
		svo.setBrName(brName);
		svo.setName(name);
		svo.setCpu(cpu);
		svo.setInch(inch);
		svo.setRamCode_fk(ramCode);
		svo.setRamName(ramName);
		svo.setStorageCode_fk(storageCode);
		svo.setStorageName(storageName);
		svo.setOsCode_fk(osCode);
		svo.setOsName(osName);
		svo.setPrice(Integer.parseInt(price));
		svo.setImage1(image1);	
		svo.setImage2(image2);
		svo.setContent(content);
		svo.setPqty(Integer.parseInt(pqty));
		
		int n = sdao.productInsert(svo); // jsp_product 테이블에 insert 하기
/*		
		int m = 1;
		String str_attachCount = mtreq.getParameter("attachCount"); // #spinner할때마다 늘어나는 숫자를 읽어온다.
		if( !"".equals(str_attachCount) ) { // #뭔가 들어왔다면 
			int attachCount = Integer.parseInt(str_attachCount);
			
			for(int i=0; i<attachCount; i++) {
				String attachFilename = mtreq.getFilesystemName("attach" + i); // #html += "<input type='file' name='attach" + i + "' class='btn btn-default' />";에서 읽어온다.
				System.out.println("attach" + i + ". attachFilename => " + attachFilename);
				m = pdao.product_imagefile_Insert(pnum, attachFilename);
				
				if(m == 0) break;
			} // end of for				
		
		} // end of if( !"".equals(str_attachCount) )
*/		
		String msg = "";
		String loc = "";

		if(n == 1) {
			msg = "제품등록 성공!!";
			loc = req.getContextPath() + "mallHome.do";
		}
		else {
			msg = "제품등록 실패!!";
			loc = req.getContextPath() + "admin/productRegister.do";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/msg.jsp");		
		
	}

}
