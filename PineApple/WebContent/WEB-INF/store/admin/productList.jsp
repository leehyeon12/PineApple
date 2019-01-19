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

<!-- ***** head 시작 ***** -->	
<jsp:include page="../../head.jsp"/>

	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/styles/shop_styles.css">
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/styles/shop_responsive.css">
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/styles/admin_styles.css">
	
<!-- ***** header 시작 ***** -->
<jsp:include page="../../header.jsp"/>

	<script src="<%= ctxPath%>/plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="<%= ctxPath%>/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	<script src="<%= ctxPath%>/plugins/parallax-js-master/parallax.min.js"></script>
	<script src="<%= ctxPath%>/js/shop_custom.js"></script>
	<script src="<%= ctxPath%>/js/admin_custom.js"></script>
	
<title>상품목록</title>

</head>
<style type="text/css">
.btn-box{
	text-align:right;
	position:relative;
	right:15px;
}

.btn-box button{
	background:#0e8ce4;
	border:1px solid #0e8ce4;
	border-radius:3px;
	color:#fff;
	padding:5px;
	width:auto;
	cursor:pointer;
}

.btn-box button:hover{
	border:1px solid #0e8ce4;
	background:#fff;
	color:#0e8ce4;
}

.register-table input{
	width:97%;
	border:1px solid #dadada;
}

.register-table th, td{
	height:50px;
}

button.registerBtn{
	background:#0e8ce4;
	border:1px solid #0e8ce4;
	border-radius:3px;
	color:#fff;
	padding:5px;
	width:auto;
	cursor:pointer;
}

button.registerBtn:hover{
	border:1px solid #0e8ce4;
	background:#fff;
	color:#0e8ce4;
}

button.closeBtn{
	background:#083766;
	border:1px solid #083766;
	border-radius:3px;
	color:#fff;
	padding:5px;
	width:auto;
	cursor:pointer;
}

button.closeBtn:hover{
	border:1px solid #083766;
	background:#fff;
	color:#083766;
}
</style>

<script type="text/javascript">

	$(document).ready(function() {
		
		getmtCodes("RAM");
		getmtCodes("SSD");
		getmtCodes("Windows");
		changeValue();
		
		var brCode = "";
		brCode += '<option value="">선택하세요.</option>';
	<c:forEach var="map" items="${brCodeList}">
	brCode += '<option value="${map.BRCODE}">${map.BRNAME}</option>';
    </c:forEach>
	    $("#brSel").empty().append(brCode);
	    
		var subCategoryName = "";
	    subCategoryName += '<option value="">해당사항 없음</option>';
	    $("#subCategory").empty().append(subCategoryName).attr("disabled", true);
/*	    
	    $("#categoryCode").bind("change", function() { 

	    	var categoryCodeVal = $("#categoryCode").val();
	    	if(categoryCodeVal == "400000") {
	    		
	    		$(".notAcc").empty().append('<option value="">해당사항 없음</option>').attr("disabled", true);
	    		
	    		var form_data = categoryCodeVal;
	    		$.ajax({
	    			
	    			url: "subCategoryCode.do",
	    			type: "GET",
	    			data: form_data,
	    			dataType: "JSON",
	    			success: function(json){
	    				
	    				if(json.length > 0) {
	    					
	    		    		subCategoryName = "";
	    		    		
	    		    		$.each(json, function(entryIndex, entry){
	    		    			subCategoryName += '<option value="'+entry.acc_code+'">'+entry.acc_name+'</option>';
	    		    		}) 
	    		    		$("#subCategory").empty().append(subCategoryName).attr("disabled", false);	    		    
	    				}	    				
	    			},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
		    	});	    			    		
	    	}
	    	else{
	    		subCategoryName = "";
	    		subCategoryName += '<option value="">해당사항 없음</option>';
	    		$("#subCategory").empty().append(subCategoryName).attr("disabled", true);
	    		
	    		getmtCodes("RAM");
	    		getmtCodes("SSD");
	    		getmtCodes("Windows");
	    		$(".notAcc").attr("disabled", false);
	    	}	
	    	
	    }); // end of $("#categoryCode").bind()

*/	
	}); // end of $(document).ready()------------------------------

	/* $.fn.makeCombo = function(options){
		var name = $(this).attr("id");
		
		var mtcodeName = "";
		mtcodeName += '<option value="">선택하세요.</option>';
		
		$.ajax({
			url: "mtCodeList.do",
			type: "GET",
			dataType: "JSON",
			success: function(json){
				
				if(json.length > 0) {
					
		    		$.each(json, function(entryIndex, entry){
		    			if(entry.mt_namespec == options){
			    			mtcodeName += '<option value="'+entry.mt_code+'">'+entry.mt_namespec+'</option>';
		    			}
		    		}) 
		    		$("#" + name).empty().append(mtcodeName);
				}	    				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
    	});	    
	} */
	
	function getmtCodes(mtSel) {
		
		var mtcodeName = "";
		mtcodeName += '<option value="">선택하세요.</option>';
		
		$.ajax({
			url: "mtCodeList.do",
			type: "GET",
			dataType: "JSON",
			success: function(json){
			//	console.log(json);
				if(json.length > 0) {
					
		    		$.each(json, function(entryIndex, entry){
		    			if(entry.mtName == mtSel){
		    			//	console.log(entry.mt_name +","+ mtSel);
			    						    			mtcodeName += '<option value="'+entry.mtCode+'">'+entry.mtNameSpec+'</option>';
		    			}
		    		}) 
		    		$("#sel_" + mtSel).empty().append(mtcodeName);
				}	    				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
    	});	   
	
	} // end of function getmtCodes(mtSel)
	
	function changeValue(){
		$("#brSel").on("change",function(){
			var text = $("#brSel option:selected").text();
			$("#brName").val(text);
		});
		
		$("#sel_RAM").on("change",function(){
			var text = $("#sel_RAM option:selected").text();
			$("#ramName").val(text);
		});
		
		$("#sel_SSD").on("change",function(){
			var text = $("#sel_SSD option:selected").text();
			$("#storageName").val(text);
		});
		
		$("#sel_Windows").on("change",function(){
			var text = $("#sel_Windows option:selected").text();
			$("#osName").val(text);
		});
	}
	
	function goRegister() {
		
		var image1 = document.getElementById("image1").files[0].name;
		alert(image1);
		var frm = document.registerForm;
		frm.method="POST";
		frm.action="productRegisterEnd.do";
		frm.submit();
		
	}
	
</script>

<body>
	
	<%-- 관리자 배너 --%>
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="<%= ctxPath%>/images/shop_background.jpg"></div>
		<div class="home_overlay"></div>
		<div class="home_content d-flex flex-column align-items-center justify-content-center">
			<h2 class="home_title">PineApple Administrator</h2>
		</div>
	</div>

	<!-- 관리자 메뉴 -->	
	<div class="shop" style="margin-bottom: 10%;">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">

				<!-- 사이드바 -->
				<div class="shop_sidebar">
					<div class="sidebar_section">
						<div class="sidebar_title admin-top">관리자 메뉴</div>
						<div class="accordion_banner faq_accordion">
							
							<%-- 회원관리 --%>
							<div class="accordion_title">
							<ul class="admin_menu" style="margin-top:10px;">
								<li>
									<span class="menu-tit">
										<span>
											회원관리
											<span class="menu-arrow"><img src="<%= ctxPath%>/images/down-arrow.png" style="cursor:pointer; width:13px; height:13px;"></span>
										</span>
									</span>
								</li>
							</ul>
							</div>
							<div class="accordion_sub">
								<div class="sub-tit">
									<a href="userList.do">회원목록</a>
								</div>
							</div>
							
							<%-- 상품관리 --%>
							<div class="accordion_title">
							<ul class="admin_menu" style="margin-top:10px;">
								<li>
									<span class="menu-tit">
										<span>
											상품관리
											<span class="menu-arrow"><img src="<%= ctxPath%>/images/down-arrow.png" style="cursor:pointer; width:13px; height:13px;"></span>
										</span>
									</span>
								</li>
							</ul>
							</div>
							<div class="accordion_sub">
								<div class="sub-tit">
									<a href="productRegister.do">상품등록</a>
								</div>
								<div class="sub-tit">
									<a href="productList.do">상품목록</a>
								</div>
								<div class="sub-tit">
									<a href="productRegister.do">상품수정/삭제</a>
								</div>
							</div>
							
							<!-- 주문관리 -->
							<div class="accordion_title">
							<ul class="admin_menu" style="margin-top:10px;">
								<li>
									<span class="menu-tit">
										<span>
											주문관리
											<span class="menu-arrow"><img src="<%= ctxPath%>/images/down-arrow.png" style="cursor:pointer; width:13px; height:13px;"></span>
										</span>
									</span>
								</li>
							</ul>
							</div>
							
							<div class="accordion_sub">
								<div class="sub-tit">
									<a href="#">주문목록</a>
								</div>
							</div>
							
							<!-- 게시글관리 -->
							<div class="accordion_title">
							<ul class="admin_menu" style="margin-top:10px;">
								<li>
									<span class="menu-tit">
										<span>
											게시글관리
											<span style="text-align:right;width:44%;position:absolute;"><img src="<%= ctxPath%>/images/down-arrow.png" style="cursor:pointer; width:13px; height:13px;"></span>
										</span>
									</span>
								</li>
							</ul>
							</div>
							<div class="accordion_sub">
								<div class="sub-tit">
									<a href="#">공지사항관리</a>
								</div>
								<div class="sub-tit">
									<a href="#">리뷰관리</a>
								</div>
								<div class="sub-tit">
									<a href="#">1:1질문 관리</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
				
				<!--========================= Content(col-lg-9) ==============================-->
				<div class="col-lg-9">
					<div class="btn-box" data-toggle="modal" data-target="#registerModal">
						<button id="btn-register" type="button">등록하기</button>
					</div>
					<!-- navbar tap 시작 -->
					<ul class="nav nav-tabs navbar-collapse">
						<li class="nav-item"><a href="nav-link" id="warnings" class="active" data-num="1"
							data-toggle="tab" data-target="#tabone">전체 상품</a></li>
						<li class="nav-item"><a class="nav-link" href="" id="desktop"
							data-toggle="tab" data-target="#tabtwo">노트북</a></li>
						<li class="nav-item"><a class="nav-link" href="" id="laptop"
							data-toggle="tab" data-target="#tabthree">데스크탑</a></li>
						<li class="nav-item"><a class="nav-link" href="" id="monitor"
							data-toggle="tab" data-target="#tabfour">모니터</a></li>
						<li class="nav-item"><a class="nav-link" href="" id="accessories"
							data-toggle="tab" data-target="#tabfive">주변기기</a></li>
					</ul>
					<!-- navbar tap 끝 -->
					<div class="tab-content mt-2">
						<div class="tab-pane active" id="tabone" role="tabpanel">
							<div class="tab-header">
								<div class="shop_bar clearfix">
									<div class="shop_product_count"><span>130</span> 개</div>
									<div class="shop_sorting">
										<span>정렬 기준:</span>
										<ul>
											<li>
												<span class="sorting_text">이름<i class="fas fa-chevron-down"></span></i>
												<ul>
													<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "original-order" }'>가격</li>
													<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "name" }'>등록일</li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="tab_content">
								<div class="row" style="margin-left:1.5%;">
									<div class="col-md-3 prod-box" data-toggle="modal" data-target="#classModal">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/gram.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 노트북</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/gram.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 모니터</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
								</div>
							</div>
							<div class="tab_footer">
								<div class="product_grid">
									<!-- 페이징 -->
									<div class="shop_page_nav d-flex flex-row" style="margin-left:24%;">
										<div class="page_prev d-flex flex-column align-items-center justify-content-center"><i class="fas fa-chevron-left"></i></div>
										<ul class="page_nav d-flex flex-row">
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">...</a></li>
											<li><a href="#">21</a></li>
										</ul>
										<div class="page_next d-flex flex-column align-items-center justify-content-center"><i class="fas fa-chevron-right"></i></div>
									</div>
									<!-- //페이징  -->
								</div>
							</div>
						</div><!-- //tab one -->
						
						<!-- ============== 데스크탑 =================== -->
						<div class="tab-pane fade" id="tabtwo" role="tabpanel">
							<div class="tab-header">
								<div class="shop_bar clearfix">
									<div class="shop_product_count"><span>100</span> 개</div>
									<div class="shop_sorting">
										<span>정렬 기준:</span>
										<ul>
											<li>
												<span class="sorting_text">이름<i class="fas fa-chevron-down"></span></i>
												<ul>
													<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "original-order" }'>가격</li>
													<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "name" }'>등록일</li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="tab_content">
								<div class="row" style="margin-left:1.5%;">
									<div class="col-md-3 prod-box" data-toggle="modal" data-target="#classModal">
										<div class="prod-img-box">
											<img src="/SEMI/images/gram.png">
										</div>
										<div class="prod-text-box">
											<h5>LG 올뉴그램</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/samsung.jpg">
										</div>
										<div class="prod-text-box">
											<h5>삼성 갤럭시 노트북</h5>
											<div class="origin-price">정가 : <span>1,100,000원</span></div>
											<div class="selling-price">판매가 : <span>1,100,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/renovo.jpg">
										</div>
										<div class="prod-text-box">
											<h5>레노버 노트북</h5>
											<div class="origin-price">정가 : <span>1,050,000원</span></div>
											<div class="selling-price">판매가 : <span>1,000,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>맥북 프로 레티나</h5>
											<div class="origin-price">정가 : <span>2,500,000원</span></div>
											<div class="selling-price">판매가 : <span>2,350,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/asus.jpg">
										</div>
										<div class="prod-text-box">
											<h5>ASUS 게이밍 노트북</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/oldLg.jpg">
										</div>
										<div class="prod-text-box">
											<h5>LG그램 구형</h5>
											<div class="origin-price">정가 : <span>1,050,000원</span></div>
											<div class="selling-price">판매가 : <span>990,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
								</div>
							</div>
							<div class="tab_footer">
								<div class="product_grid">
									<!-- 페이징 -->
									<div class="shop_page_nav d-flex flex-row" style="margin-left:24%;">
										<div class="page_prev d-flex flex-column align-items-center justify-content-center"><i class="fas fa-chevron-left"></i></div>
										<ul class="page_nav d-flex flex-row">
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">...</a></li>
											<li><a href="#">10</a></li>
										</ul>
										<div class="page_next d-flex flex-column align-items-center justify-content-center"><i class="fas fa-chevron-right"></i></div>
									</div>
									<!-- //페이징  -->
								</div>
							</div>
						</div><!-- //tab two -->
						
						<!-- ============== 노트북 =================== -->
						<div class="tab-pane fade" id="tabthree" role="tabpanel">
							<div class="tab-header">
								<div class="shop_bar clearfix">
									<div class="shop_product_count"><span>130</span> 개</div>
									<div class="shop_sorting">
										<span>정렬 기준:</span>
										<ul>
											<li>
												<span class="sorting_text">이름<i class="fas fa-chevron-down"></span></i>
												<ul>
													<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "original-order" }'>가격</li>
													<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "name" }'>등록일</li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="tab_content">
								<div class="row" style="margin-left:1.5%;">
								
								<c:forEach var="svo" items="${productList}">
									<div class="col-md-3 prod-box" data-toggle="modal" data-target="#classModal">
										<div class="prod-img-box">
											<img src="${svo.image1}">
										</div>
										<div class="prod-text-box">
											<h5>${svo.name}</h5> 
											<div class="origin-price">정가 : <span>${svo.price}</span></div>
											<div class="selling-price">판매가 : <span>${svo.saleprice}</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
								</c:forEach>
								

								
								
								<%-- 
									<div class="col-md-3 prod-box" data-toggle="modal" data-target="#classModal">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 노트북</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/gram.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/gram.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
								</div>
							</div>
							<div class="tab_footer">
								<div class="product_grid">
									<!-- 페이징 -->
									<div class="shop_page_nav d-flex flex-row" style="margin-left:24%;">
										<div class="page_prev d-flex flex-column align-items-center justify-content-center"><i class="fas fa-chevron-left"></i></div>
										<ul class="page_nav d-flex flex-row">
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">...</a></li>
											<li><a href="#">21</a></li>
										</ul>
										<div class="page_next d-flex flex-column align-items-center justify-content-center"><i class="fas fa-chevron-right"></i></div>
									</div>
									<!-- //페이징  -->
								</div>
							</div>
						</div><!-- //tab three --> --%>
						
						<!-- ============== 모니터 =================== -->
						<div class="tab-pane fade" id="tabfour" role="tabpanel">
							<div class="tab-header">
								<div class="shop_bar clearfix">
									<div class="shop_product_count"><span>130</span> 개</div>
									<div class="shop_sorting">
										<span>정렬 기준:</span>
										<ul>
											<li>
												<span class="sorting_text">이름<i class="fas fa-chevron-down"></span></i>
												<ul>
													<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "original-order" }'>가격</li>
													<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "name" }'>등록일</li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="tab_content">
								<div class="row" style="margin-left:1.5%;">
									<div class="col-md-3 prod-box" data-toggle="modal" data-target="#classModal">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 모니터</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/gram.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/gram.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
								</div>
							</div>
							<div class="tab_footer">
								<div class="product_grid">
									<!-- 페이징 -->
									<div class="shop_page_nav d-flex flex-row" style="margin-left:24%;">
										<div class="page_prev d-flex flex-column align-items-center justify-content-center"><i class="fas fa-chevron-left"></i></div>
										<ul class="page_nav d-flex flex-row">
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">...</a></li>
											<li><a href="#">10</a></li>
										</ul>
										<div class="page_next d-flex flex-column align-items-center justify-content-center"><i class="fas fa-chevron-right"></i></div>
									</div>
									<!-- //페이징  -->
								</div>
							</div>
						</div><!-- tab four -->
						
						<!-- ============== 주변기기 =================== -->
						<div class="tab-pane fade" id="tabfive" role="tabpanel">
							<div class="tab-header">
								<div class="shop_bar clearfix">
									<div class="shop_product_count"><span>100</span> 개</div>
									<div class="shop_sorting">
										<span>정렬 기준:</span>
										<ul>
											<li>
												<span class="sorting_text">이름<i class="fas fa-chevron-down"></span></i>
												<ul>
													<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "original-order" }'>가격</li>
													<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "name" }'>등록일</li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="tab_content">
								<div class="row" style="margin-left:1.5%;">
									<div class="col-md-3 prod-box" data-toggle="modal" data-target="#classModal">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 주변기기주변기기주변기기</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/gram.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/gram.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
									<div class="col-md-3 prod-box">
										<div class="prod-img-box">
											<img src="/SEMI/images/macbook_pro.png">
										</div>
										<div class="prod-text-box">
											<h5>2019년 LG 신상 고성능 데스크탑</h5>
											<div class="origin-price">정가 : <span>1,200,000원</span></div>
											<div class="selling-price">판매가 : <span>1,050,000원</span></div>
										</div>
										<a href="#" class="prod-hover"><span>상세 보기</span></a>
									</div>
								</div>
							</div>
							<div class="tab_footer">
								<div class="product_grid">
									<!-- 페이징 -->
									<div class="shop_page_nav d-flex flex-row" style="margin-left:24%;">
										<div class="page_prev d-flex flex-column align-items-center justify-content-center"><i class="fas fa-chevron-left"></i></div>
										<ul class="page_nav d-flex flex-row">
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">...</a></li>
											<li><a href="#">21</a></li>
										</ul>
										<div class="page_next d-flex flex-column align-items-center justify-content-center"><i class="fas fa-chevron-right"></i></div>
									</div>
									<!-- //페이징  -->
								</div>
							</div>
						</div><!-- tab five -->
					</div>	
				</div>
				<!--========================= // end of Content(col-lg-9) ==============================-->
			</div>
		</div>
	</div>
<!-- ================= 상품 등록 모달 시작 =============== -->
<div class="modal fade bs-example-modal-lg" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="classInfo" aria-hidden="true">
   <div class="modal-dialog modal-lg">
   <div class="modal-content modal-lg">
   		<div class="modal-header">
   			<span style="text-align:center;">PineApple</span>
   			<button class="close" data-dismiss="modal">&times;</button>
   		</div>
   		<div class="modal-body">
   			<div class="row">
			<div class="col-md-12" >
				<div class="popup"><h3>상품등록</h3></div>
				<form id="registerForm" name="registerForm" enctype="multipart/form-data">
					<input type="hidden" name="brName" id="brName">
					<input type="hidden" name="ramName" id="ramName">
					<input type="hidden" name="storageName" id="storageName">
					<input type="hidden" name="osName" id="osName">
				
					<table class="popTable2 register-table" style="width:500px;">
						<colgroup>
							<col width="30%;"/>
							<col width="*"/>
						</colgroup>
						<tr>
							<th>카테고리</th>
							<td>
								<select id="categoryCode" name="categoryCode">
									<option value="100000" selected>컴퓨터</option>
									<option value="200000">노트북</option>
									<option value="300000">모니터</option>
									<option value="400000">주변기기</option>
								</select>
							
								<select id="subCategory" name="subCategory">
									<!--  	
									<option value="100000" selected>마우스</option>
									<option value="200000">키보드</option>
									-->
								</select>
							</td>
						
						</tr>
						<tr>
							<th><font color="red">*</font>브랜드</th>
							<td>  
								<select id="brSel" name="brCode">
									<!-- 
									<option>==선택하세요==</option>
									<option>삼성전자</option>
									<option>LG전자</option>
									<option>ASUS</option> 
									-->
								</select>
							</td>
						</tr>
						<tr>
							<th><font color="red">*</font>상품명</th>
							<td><input type="text" name="name" placeholder="상품명" /></td>
						</tr>
						
						<tr> 
							<th><font color="red">*</font>CPU</th>
							<td>
								<select id="sel_CPU" name="cpu" class="notAcc">
									<option>선택하세요.</option>
									<option>i3</option>
									<option>i5</option>
									<option>i7</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><font color="red">*</font>화면크기</th>
							<td>
								<select name="inch">
									
									<option value="">선택하세요.</option>
									<option value="13">13인치</option>
									<option value="14">14인치</option>
									<option value="15">15인치</option>
									
								</select>
							</td>
						</tr>
						<tr>
							<th><font color="red">*</font>RAM</th>
							<td>
								<select id="sel_RAM" name="ramCode" class="notAcc">
									<!-- 
									<option> ==선택하세요==</option>
									<option>4GB</option>
									<option>8GB</option>
									<option>12GB</option>
									 -->
								</select>
							</td>
						</tr>
						<tr>
							<th><font color="red">*</font>저장장치</th>
							<td>
								<select id="sel_SSD" name="storageCode" class="notAcc">
								<!-- 
									<option> ==선택하세요==</option>
									<option>SSD 128</option>
									<option>SSD 256</option>
								-->
								</select>
							</td>
						</tr>		

										
						<tr>
							<th><font color="red">*</font>운영체제</th>
							<td>
								<select id="sel_Windows" name="osCode" class="notAcc">
									<!-- 
									<option value="Y">Y</option>
									<option value="N">N</option>
									 -->
								</select>
							</td>
						</tr>
						<tr>
							<th><font color="red">*</font>정가</th>
							<td><input type="number" name="price" placeholder="정가" /></td>
						</tr>
						<tr>
							<th>판매가격</th>
							<td><input type="number" name="saleprice" placeholder="판매가" /></td>
						</tr>
						<tr>
							<th><font color="red">*</font>이미지첨부</th>
							<td>
								<div class="file-box">
									<input type="file" id="image1" name="image1">
									<input type="file" id="image2" name="image2">
								</div>
							</td>
						</tr>
						<tr>
							<th>상품설명</th>
							<td><textarea name="content" style="width:98%;" rows="3">상품설명</textarea></td>
						</tr>
						<tr>
							<th>색상</th>
							<td>
								<input type="text" id="pColor" value="" placeholder="색상명" style="width:33%;">
								<a href="javascript:colorChoice();">
									<img src="<%= ctxPath%>/images/search_icon.png" data-toggle="modal" data-target="#colorModal" style="cursor:pointer; width:18px; height:18px;" alt="색상표 팝업">
								</a>
								
							</td>
						</tr>
						
						<tr>
							<th><font color="red">*</font>재고량</th>
							<td><input type="number" name="pqty" placeholder="재고" /></td>
						</tr>
					</table>
				</form>
				
	   			<div style="width:100%;text-align:center;margin-top:8px;">
	   				<button class="registerBtn" type="button" onclick="goRegister();">등록</button>
	   				<button class="closeBtn" data-dismiss="modal">닫기</button>
	   			</div>
			</div>
		</div>
   		</div>
   </div>
   </div>
</div>
<!-- ================= 상품 등록 모달 끝 =============== -->
<!-- ================= 색상표 선택 모달 시작 =============== -->
<div class="modal fade bs-example-modal-sm" id="colorModal" tabindex="-1" role="dialog" aria-labelledby="classInfo" aria-hidden="true">
   <div class="modal-dialog modal-sm">
   <div class="modal-content">
   		<div class="modal-header">
   			<span style="text-align:center;">PineApple</span>
   			<button class="close" data-dismiss="modal">&times;</button>
   		</div>
   		<div class="modal-body">
   			<div id="cmodal-append"></div>
   		</div>
   </div>
   </div>
</div>
<!-- ================= 색상표 선택 모달 끝 =============== -->
<!-- ================= 상품 상세 모달 시작 =============== -->
<div class="modal fade bs-example-modal-lg" id="classModal" tabindex="-1" role="dialog" aria-labelledby="classInfo" aria-hidden="true">
   <div class="modal-dialog">
   <div class="modal-content">
   		<div class="modal-header">
   			<span style="text-align:center;">PineApple</span>
   			<button class="close" data-dismiss="modal">&times;</button>
   		</div>
   		<div class="modal-body">
   			<div id="pmodal-append"></div>
   		</div>
   </div>
   </div>
</div>
<!-- ================= 상품 상세 모달 끝 =============== -->
<!-- ***** footer 시작 ***** -->
<jsp:include page="../../footer.jsp"/>

</body>
</html>