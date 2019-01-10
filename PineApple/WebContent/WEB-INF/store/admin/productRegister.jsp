<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!------ Include the above in your HEAD tag ---------->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<!-- Website Font style -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link rel="stylesheet" href="styles/registerstyle.css">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
<title>제품등록</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		/* 이미지 인풋태그를 누를경우 */
		$(".thumb").click(function() {
			// 팝업창 띄우기
			var url = "insertImages.do";
			window.open(url, "images", "left=500px, top=100px, width=700px, height=400px");
		});// end of thumb
		
		$(".colors").click(function() {
			var url = "insertColors.do";
			window.open(url, "colors", "left=500px, top=100px, width=700px, height=400px");
		});

		
		$("#bcategory").change(function() {
			var category = $(this).val();
			
			console.log(category)
			
			if(category == "300000" || category == "400000") {
				$(".comSet").attr("disabled", true);
			} else {
				$(".comSet").attr("disabled", false);
			}
		});
		
	});// end of document ready

</script>
</head>
<body>
	
		<div class="header_main">
			<div class="container">
				<div class="row">
	
					<!-- Logo -->
					<div class="col-lg-12 col-sm-12 col-12 order-12" align="center">
						<div class="logo_container">
							<div class="logo" style="margin-top: 30px;">
								<a href="index.do">
									<img src="images/adminlogo.jpg" width="15%" height="15%">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<div class="container" style="width: 35%;">
		<div class="row clearfix">
			<div class="col-md-12" >
				<h4 style="font-weight: bold;">제품등록</h4>
				<form>

					<table class="table table-bordered table-hover" id="tab_logic">

						<tr>
							<td>카테고리</td>
							<td><select class="form-control" name='fk_bcategory_num'
								id="bcategory">
									<option value="100000" selected>컴퓨터</option>
									<option value="200000">노트북</option>
									<option value="300000">모니터</option>
									<option value="400000">주변기기</option>
							</select></td>
						</tr>

						
						<tr>
							<td>색상</td>
							<td><button type="button" name="colors"
								class="form-control colors btn-dark btn-light"
								style="background-color: #000000; color: #ffffff;">색상등록</button></td>
						</tr>
						
						<tr>
							<td>CPU</td>
							<td><input type="text" id="cpu" class="form-control comSet"
								placeholder="CPU"/></td>
						</tr>
						
						<tr>
							<td>MAINBOARD</td>
							<td><input type="text" class="form-control comSet"
								placeholder="MAINBOARD"></td>
						</tr>
						
						<tr>
							<td>POWER</td>
							<td><input type="text" class="form-control comSet"
								placeholder="POWER"></td>
						</tr>
						
						<tr>
							<td>CASE</td>
							<td><input type="text" class="form-control comSet"
								placeholder="CASE"/></td>
						</tr>
						
						<tr>
							<td>OS</td>
							<td><input type="text" class="form-control comSet" /></td>
						</tr>
				
						<tr>
							<td>제품명</td>
							<td><input type="text" name="pname" class="form-control"
								placeholder="제품명" /></td>
						</tr>

						<tr>
							<td>제조사명</td>
							<td><input type="text" name="company" class="form-control"
								placeholder="제조사명" /></td>
						</tr>

						<tr>
							<td>정가</td>
							<td><input type="number" name="price" class="form-control"
								placeholder="정가" /></td>
						</tr>

						<tr>
							<td>판매가격</td>
							<td><input type="number" name="saleprice"
								class="form-control" placeholder="판매가" /></td>
						</tr>

						<tr>
							<td>이미지첨부</td>
							<td><button type="button" name="pimage"
									class="form-control thumb btn-dark btn-light"
									style="background-color: #000000; color: #ffffff;">이미지
									추가</button></td>
						</tr>

						<tr>
							<td>제품설명</td>
							<td><input type="text" name="pcontent" class="form-control"
								placeholder="제품설명" /></td>
						</tr>

						<tr>
							<td>포인트</td>
							<td><input type="number" name="point" class="form-control"
								placeholder="포인트" /></td>
						</tr>

						<tr>
							<td>재고량</td>
							<td><input type="number" name="pqty" class="form-control"
								placeholder="재고" /></td>
						</tr>


						<tr id="pcspec" colspan='5'>
						</tr>

					</table>

				</form>
			</div>
		</div>

	</div>

</body>
</html>