<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>Login Page By Admin</title>
</head>
<body>

	<div id="wrap">
		<!-- 스킵네비게이션 : 웹접근성대응-->

		<!-- //스킵네비게이션 -->
		<!-- header -->
		<div id="header" style="text-align: center;">
			<h1>
				<a href="http://localhost:9090/SEMI/index.do" class="sp h_logo">
					<img src="images/adminlogo.jpg" width="10%" height="10%">
				</a>
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
								<div class="panel-heading"><h3 class="panel-title">Welcome stranger!</h3></div>
								<div class="panel-body">
									<form accept-charset="UTF-8" role="form">
										<fieldset>
											<div class="form-group">
												<input class="form-control" placeholder="SUPERUSER ID"
													name="adminid" type="text">
											</div>
											<div class="form-group">
												<input class="form-control" placeholder="SUPERUSER PASSWORD"
													name="password" type="password" value="">
											</div>
											<div class="checkbox">
												<label> <input name="remember" type="checkbox"
													value="Remember Me"> Remember Me
												</label>
											</div>
											<button type="button" class="btn btn-lg btn-dark btn-block"
												style="background-color: #000000; color: #ffffff;">Login</button>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>
	
</body>
</html>