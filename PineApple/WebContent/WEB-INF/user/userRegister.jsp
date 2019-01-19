<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String ctxPath = request.getContextPath();
%>  
    
<%------ Include the above in your HEAD tag ----------%>
<!DOCTYPE html>
<html>
<head> 
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="js/jquery-3.3.1.min.js"></script>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<%-- Website Font style --%>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
	<link rel="stylesheet" href="styles/registerstyle.css">
	<%-- Google Fonts --%>
	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

	<title>회원가입</title>
	
	<script type="text/javascript">

		$(document).ready(function() {
						
			$("#userid").focus();
			
			$(".form-control").each(function() {
				
				$(this).blur(function() {
					var data = $(this).val().trim();
					if(data == "") {
						$(":input").attr("disabled", true);
						$(this).attr("disabled", false);
						$(this).focus();
					}
					else {
						$(":input").attr("disabled", false);						
					}
				});
				
			});
			
			$("#userid").bind("keyup", function() {
				alert("아이디 중복체크버튼을 눌러주세요");
				$(this).val("");
			});
			
			$("#idcheck").click(function() {
				
				var url = "idDuplicateCheck.do";				
				window.open(url, "idcheck"
						 , "left=500px, top=100px, width=300px, height=230px");			
		
			});
			
			$("#pwd").blur(function() {
				
				var pwd = $(this).val();				
				var regExp_pwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
				var bool_pwd = regExp_pwd.test(pwd);
				
				if(!bool_pwd) {
					$(":input").attr("disabled", true);					
					$(this).attr("disabled", false);
					$(this).focus();
				}
				else {
					$(":input").attr("disabled", false);
					$("#pwdCheck").focus();
				}
				
			});
			
			$("#pwdCheck").blur(function() {
				
				var pwd = $("#pwd").val();
				var pwdCheck = $(this).val();
				
				if(pwd != pwdCheck) {
					$(":input").attr("disabled", true);
					$(this).attr("disabled", false);
					$("#pwd").attr("disabled", false);
					$("#pwd").focus();
				}
				else {
					$(":input").attr("disabled", false);
					$("#name").focus();
				}
				
			});
						
			$("#email").blur(function() {
				
				var email = $(this).val();
				var regExp_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;  
				var bool_email = regExp_email.test(email);
				
				if(!bool_email) {
					$(":input").attr("disabled",true);
					$(this).attr("disabled", false);
					$(this).focus();
				}
				else {
					$(":input").attr("disabled", false);
					$("#phone").focus();
				}
				
			});
			
			$("#phone").blur(function() {
				
				var phone = $(this).val();
				if(phone.length == 10) {
					regExp_phone10 = /^01([0|1|6|7|8|9])([0-9]{3})([0-9]{4})$/;
					var bool_phone10 = regExp_phone10.test(phone);
					$(":input").attr("disabled", false)
					$("#post").focus();
				}
				else if(phone.length == 11) {
					regExp_phone11 = /^01([0|1|6|7|8|9])([0-9]{4})([0-9]{4})$/;
					var bool_phone11 = regExp_phone11.test(phone);
					$(":input").attr("disabled", false)
					$("#post").focus();
				}
				else{
					$(":input").attr("disabled", true);
					$(this).attr("disabled", false);
					$(this).focus();					
				}
				
			});
			
			$("#zipcodeSearch").click(function(){
				new daum.Postcode({
					oncomplete: function(data) {
					    $("#post").val(data.zonecode);  // 우편번호의 첫번째 값     예> 151
					    $("#addr").val(data.roadAddress);    // 큰주소                        예> 서울특별시 종로구 인사로 17 
					    $("#addrDetail").focus();
					}
				}).open();
			});

			
			$("#btn").click(function() {
				var frm = document.registerFrm;
			   	  frm.method = "POST";
			   	  frm.action = "userRegisterEnd.do";
			   	  frm.submit();
			});
			
		}); // end of $(document).ready()------------------------------

</script>

	
</head>
<body>

	<div class="header_main">
		<div class="container">
			<div class="row">

				<%-- Logo --%>
				<div class="col-lg-12 col-sm-12 col-12 order-12" align="center">
					<div class="logo_container">
						<div class="logo" style="margin-top: 30px;"><a href="<%= ctxPath %>/index.do"><img src="images/mainlogo.png" width="10%" height="10%"></a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row main">
			<div class="main-login main-center">
			<h3>회원가입</h3>
				<form name="registerFrm" method="post" action="userRegisterEnd.do">
				
					<div class="form-group">
						<label for="userid" class="cols-sm-2 control-label">아이디&nbsp;&nbsp;<img id="idcheck" src="images/b_id_check.gif" style="vertical-align: middle; cursor: pointer;" /></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
								<input type="text" class="form-control" name="userid" id="userid"  placeholder="아이디" required/>
								<input type="text" id="idDuplicateCheck" value="">
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="pwd" class="cols-sm-2 control-label">비밀번호</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<input type="password" class="form-control requiredInfo" name="pwd" id="pwd"  placeholder="비밀번호" required/>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="pwdCheck class="cols-sm-2 control-label">비밀번호 확인</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<input type="password" class="form-control" name="pwdCheck" id="pwdCheck"  placeholder="비밀번호 확인" required/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">성명</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
								<input type="text" class="form-control" name="name" id="name"  placeholder="성명" required/>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">이메일</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
								<input type="text" class="form-control" name="email" id="email"  placeholder="example@google.com" required/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="phone" class="cols-sm-2 control-label">연락처</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-phone fa" aria-hidden="true"></i></span>
								<input type="text" class="form-control" name="phone" id="phone"  placeholder="- 없이 입력해주세요" required/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="post" class="cols-sm-2 control-label">우편번호 &nbsp;&nbsp;<img id="zipcodeSearch" src="images/b_zipcode.gif"></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-home fa" aria-hidden="true"></i></span>
								<input type="text" class="form-control" name="post" id="post"  placeholder="" required/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="addr" class="cols-sm-2 control-label">주소</label>
						<div class="cols-sm-10" style="margin-bottom: 10px;">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-home fa" aria-hidden="true"></i></span>
								<input type="text" class="form-control" name="addr" id="addr"  placeholder="주소" required/>
							</div>
						</div>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-home fa" aria-hidden="true"></i></span>
								<input type="text" class="form-control" name="addrDetail" id="addrDetail"  placeholder="상세주소" required/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="birthyyyy" class="cols-sm-2 control-label">생년월일</label>
						<div class="cols-sm-10">
							<div class="col-sm-12" style="padding-left: 0px; padding-right: 0px; padding-bottom: 10px;">
								<div class="col-sm-4">
									<input type="number" id="birthyyyy" name="birthyyyy" min="1950" max="2050" step="1" value="1995" class="form-control"/>
								</div>
								<div class="col-sm-4">
									<select id="birthmm" name="birthmm" class="form-control">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select>
								</div>
								<div class="col-sm-4">
									<select id="birthdd" name="birthdd" class="form-control">
										<option value ="01">01</option>
										<option value ="02">02</option>
										<option value ="03">03</option>
										<option value ="04">04</option>
										<option value ="05">05</option>
										<option value ="06">06</option>
										<option value ="07">07</option>
										<option value ="08">08</option>
										<option value ="09">09</option>
										<option value ="10">10</option>
										<option value ="11">11</option>
										<option value ="12">12</option>
										<option value ="13">13</option>
										<option value ="14">14</option>
										<option value ="15">15</option>
										<option value ="16">16</option>
										<option value ="17">17</option>
										<option value ="18">18</option>
										<option value ="19">19</option>
										<option value ="20">20</option>
										<option value ="21">21</option>
										<option value ="22">22</option>
										<option value ="23">23</option>
										<option value ="24">24</option>
										<option value ="25">25</option>
										<option value ="26">26</option>
										<option value ="27">27</option>
										<option value ="28">28</option>
										<option value ="29">29</option>
										<option value ="30">30</option>
										<option value ="31">31</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="gender" class="cols-sm-2 control-label">성별</label>
						<div class="cols-sm-10">
							<div class="">
								<label class="radio-inline" for="gender-0">
									<input type="radio" name="gender" id="gender-0" value="0" checked="checked"> 남자
								</label> 
								<label class="radio-inline" for="gender-1"> 
									<input type="radio" name="gender" id="gender-1" value="1"> 여자
								</label>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						
						<button id="btn" name="button1id" class="btn btn-primary btn-lg btn-block login-button">가입하기</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	
	<form name="idCheckFrm">
	    <input type="text" name="userid" />
	</form>
	
</body>
</html>