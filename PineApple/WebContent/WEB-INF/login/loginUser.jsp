<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery-3.3.1.min.js"></script>
<link href="/SEMI/styles/bootstrap4/bootstrap.min.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

	}); // end of $(document).ready()

	function userLoginAction() {
		var userid = $("#userid").val().trim();
		var pwd = $("#pwd").val().trim();

		if (userid == "") {
			alert("아이디를 입력하세요!")
			$("#userid").val("");
			$("#userid").focus();
			return;
		}
		if (pwd == "") {
			alert("비밀번호를 입력하세요!")
			$("#pwd").val("");
			$("#pwd").focus();
			return;
		}

		var frm = document.loginUserFrm;
		frm.submit();
	}// end of function goLogin()
/*
	function adminLoginAction() {
		//페이지 이동하는 버튼
		location.href="loginAdmin.do";
	}
*/	
</script>

<title>Login Page By USER</title>
</head>
<body>
	
	<div id="wrap">
		<!-- 스킵네비게이션 : 웹접근성대응-->

		<!-- //스킵네비게이션 -->
		<!-- header -->
		<div id="header" style="text-align: center;">
			<h1>
				<a href="http://localhost:9090/SEMI/index.do" class="sp h_logo">
				<img src="images/mainlogo.png" width="10%" height="10%"></a>
			</h1>

		</div>
		<!-- //header -->
		<!-- container -->
		<div id="container">
			<!-- content -->
			<div id="content">
				<div class="title">
					<p></p>
				</div>
				<!------ Include the above in your HEAD tag ---------->
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">로그인</h3>
								</div>
								<div class="panel-body">
									<form name="loginUserFrm" method="POST" action="loginEnd.do"
										accept-charset="UTF-8" role="form">
										<fieldset>
											<div class="form-group">
												<input class="form-control" id="userid" placeholder="ID"
													name="userid" type="text" 
													value="${saveid}" required />
											</div>
											<div class="form-group">
												<input class="form-control" id="pwd" placeholder="Password"
													name="pwd" type="password" required />
											</div>
											<div class="checkbox">
												<label><input name="remember" type="checkbox"
													value="1"> Remember Me
												</label>
											</div>
											<button class="btn btn-lg btn-info btn-block" type="button"
												onClick="userLoginAction();">Login</button>
										</fieldset>
										<fieldset style="padding-top: 10px;">
											<div align="center">
												<a href="idFind.do">아이디 찾기</a> <span>|</span> <a
													href="pwdFind.do">비밀번호 찾기</a>
											</div>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>

				<form name="loginAdminFrm" method="POST" action="loginAdmin.do">
					<div align="center">
						<button type="button" class="btn btn-outline-dark btn-light"
							style="background-color: #ffffff;" onClick="adminLoginAction();"></button>
					</div>
				</form>
</body>
</html>