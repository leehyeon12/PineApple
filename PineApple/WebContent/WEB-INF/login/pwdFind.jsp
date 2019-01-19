<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
  
  $(document).ready(function(){
	  
  });
  
  function pwdSearch() {
	  var frm = pwdSearchFrm;
	  frm.method="POST";
	  frm.action="pwdFind.do";
	  frm.submit();
  }

</script>
<title>Login Page By USER</title>
</head>
<body>

	<div id="wrap">
		<!-- 스킵네비게이션 : 웹접근성대응-->

		<!-- //스킵네비게이션 -->
		<!-- header -->
		<div id="header">
			<h1>
				<a href="http://localhost:9090/SEMI/index.do" class="sp h_logo" style="align-content: center;"><span class="blind">Pine Apple</span></a>
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
									<h3 class="panel-title">비밀번호 찾기</h3>
								</div>
								<div class="panel-body">
									<form name="pwdSearchFrm" accept-charset="UTF-8" role="form">
										<fieldset>
											<div class="form-group">
												<input class="form-control"
													placeholder="ID" name="name" type="text" required>
											</div>
											<div class="form-group">
												<input class="form-control" placeholder="이메일"
													name="email" type="text" required>&nbsp;
												<button type="button" class="btn btn-light btn-xs">인증번호 받기</button>
											</div>
											<button class="btn btn-lg btn-info btn-block" type="button"
												style="" onClick="pwdSearch();">찾기</button>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

</body>
</html>