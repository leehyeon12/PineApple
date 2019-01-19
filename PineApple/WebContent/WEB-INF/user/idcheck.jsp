<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<% String ctxPath = request.getContextPath(); %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script type="text/javascript" src="<%= ctxPath %>/js/jquery-3.3.1.min.js"></script>
		
	<script type="text/javascript">
			
		$(document).ready(function() {
			
			$("#error").hide();
			
		}); // end of $(document).ready()------------------------------
	
	
		function goCheck() {
			
			var userid = $("#userid").val().trim();
			
			if(userid == ""){
				$("#error").show();
				$("#userid").val("");
				$("#userid").focus();
				return;
			}
		
			$("#error").hide();		
			var frm = document.frmIdcheck;
			frm.method = "POST";
			frm.action = "idDuplicateCheck.do";
			frm.submit();
			
		} // end of function goCheck()------------------------------
	
		
		function setUserID(userid) {

			$(opener.document).find("#userid").val(userid);
			$(opener.document).find("#pwd").focus();
			self.close();
			
		} // end of function setUserID(userid)------------------------------
	
	</script>


</head>
<body style="background-color: #fff0f5;">
	
	<c:if test="${method == 'GET'}">
		<form name="frmIdcheck">
	  	 	<table style="width: 95%; height: 100px;">
	  	 		<tr>
	  	 			<td style="text-align: center;">
	  	 				아이디를 입력하세요<br style="line-height: 200%;"/>
	  	 				<input type="text" id="userid" name="userid" size="20" class="box" /><br style="line-height: 300%;"/>
	  	 				<span id="error" style="color: red; font-size: 12pt; font-weight: bold;">아이디를 입력하세요!!!</span><br/> 
	  	 				<button type="button" class="box" onClick="goCheck();">확인</button> 
	  	 			</td>
	  	 		</tr>
	  	 	</table>
		</form>
	</c:if>
	
	<c:if test="${method == 'POST' && isUSEuserid == 'false'}">
		<div align="center">
		[<span style="color: red; font-weight: bold;">${userid}</span>] 는 이미 사용중입니다. 
		<br/>
			<form name="frmIdcheck">
		  	 	<table style="width: 95%; height: 100px;">
		  	 		<tr>
		  	 			<td style="text-align: center;">
		  	 				아이디를 입력하세요<br style="line-height: 200%;"/>
		  	 				<input type="text" id="userid" name="userid" size="20" class="box" /><br style="line-height: 300%;"/>
		  	 				<span id="error" style="color: red; font-size: 12pt; font-weight: bold;">아이디를 입력하세요!!!</span><br/> 
		  	 				<button type="button" class="box" onClick="goCheck();">확인</button> 
		  	 			</td>
		  	 		</tr>
		  	 	</table>
			</form>
		</div>
	</c:if>
		
	<c:if test="${method == 'POST' && isUSEuserid == 'true'}">
		<div align="center">
			<br style="line-height: 400%;" />
			ID로[ <span style="color: red; font-weight: bold;">${userid}</span> ] 사용가능합니다.
			<br/><br/><br/>
			<button type="button" class="box" onClick="setUserID('${userid}');">닫기</button>
		</div>
	</c:if>
		
</body>
</html>