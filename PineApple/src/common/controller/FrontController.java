package common.controller;

import java.io.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class FrontController
 */
@WebServlet(
		description = "사용자가 웹에서 *.do 를 했을 경우 이 클래스가 먼저 응답을 해주도록 한다.", 
		urlPatterns = { "*.do" }, 
		initParams = {
				@WebInitParam(name = "propertyConfig", value = "C:/Git/PineApple/PineApple/WebContent/WEB-INF/Command.properties"
							, description = "*.do 에 대한 클래스의 매핑파일")
		})
public class FrontController extends HttpServlet { 
	private static final long serialVersionUID = 1L;

	HashMap<String, Object> cmdMap = new HashMap<String, Object>(); 
	
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) 
		throws ServletException { 
		
		// *** 확인용 *** //
		System.out.println("확인용 ==> 서블릿 FrontController 의  init(ServletConfig config) 메소드가 실행됨.");
		
		String props = config.getInitParameter("propertyConfig"); 
		
		// *** 확인용 *** //
		System.out.println("<<확인용>> 초기화 파라미터 데이터 값이 저장된 파일명 props => " + props);
		
		Properties pr = new Properties();  
		
		FileInputStream fis = null; 
		
		try {
			fis = new FileInputStream(props);
			
			pr.load(fis);
			
			Enumeration<Object> en = pr.keys();
			
			while ( en.hasMoreElements() ) { 
				
				String key_urlcmd = (String)en.nextElement();
				String className = pr.getProperty(key_urlcmd); 
				
				if(className != null) { 
					className = className.trim();
					Class<?> cls = Class.forName(className);
					Object obj = cls.newInstance();
					
					cmdMap.put(key_urlcmd, obj); 								
				} // end of if(className != null)
				
			} // end of while			
		
		} catch (ClassNotFoundException e) {
			System.out.println("문자열로 명명되어진 클래스가 없습니다.");
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			System.out.println("C:/myjsp/MyMVC/WebContent/WEB-INF/Command.properties 파일이 없습니다.");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	} // end of void init(ServletConfig config)------------------------------

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {

		requestProcess(request, response);
	} // end of doGet(HttpServletRequest request, HttpServletResponse response)------------------------------

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		requestProcess(request, response);
	} // end of doPost(HttpServletRequest request, HttpServletResponse response)------------------------------

	private void requestProcess(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException { 
		
		String uri = request.getRequestURI();
		// uri는 /MyMVC/test2.do 이다.
		
		String ctxPath = request.getContextPath();
		
		String mapKey = uri.substring( ctxPath.length() );
		// mapKey 는  /test2.do 이다.
		
		AbstractController action = (AbstractController)cmdMap.get(mapKey); 
	
		if(action == null) { 
			System.out.println(mapKey + " URL 패턴에 매핑된 객체가 없습니다.");
			return; 
		} 
		else {
			try {
				action.execute(request, response);
				
				boolean bool = action.isRedirect();
				String viewPage = action.getViewPage();
				
				if(bool) {
					response.sendRedirect(viewPage); 
				}
				else {
					RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
					dispatcher.forward(request, response);
				} // end of if ~ else
				
			} catch (Exception e) {
				e.printStackTrace();
			}			
			
		} // end of if(action == null) ~ else
		
		
	} // end of requestProcess(HttpServletRequest request, HttpServletResponse response)------------------------------
	
	
	
} // end of class FrontController
