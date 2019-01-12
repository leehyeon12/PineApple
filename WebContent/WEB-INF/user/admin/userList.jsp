<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<!-- ***** head 시작 ***** -->	
<jsp:include page="../../head.jsp"/>
<title>사용자 목록</title>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/styles/shop_styles.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/styles/shop_responsive.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/styles/admin_styles.css">

<style>

</style>

<!-- ***** header 시작 ***** -->
<jsp:include page="../../header.jsp"/>

<script src="<%= ctxPath%>/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="<%= ctxPath%>/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="<%= ctxPath%>/plugins/parallax-js-master/parallax.min.js"></script>
<script src="<%= ctxPath%>/js/shop_custom.js"></script>
<script src="<%= ctxPath%>/js/admin_custom.js"></script>

	<%-- 관리자 배너 --%>
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/shop_background.jpg"></div>
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
					<div class="shop_content">
						<div class="shop_bar clearfix">
							<div class="shop_product_count"><span>186</span> 명</div>
							<div class="shop_sorting">
								<span>정렬 기준:</span>
								<ul>
									<li>
										<span class="sorting_text">이름<i class="fas fa-chevron-down"></span></i>
										<ul>
											<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "original-order" }'>이름</li>
											<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "name" }'>가입일</li>
											<li class="shop_sorting_button"data-isotope-option='{ "sortBy": "price" }'>등급</li>
										</ul>
									</li>
								</ul>
							</div>
						</div>
						<div class="product_grid">
							<div class="product_grid_border"></div>
							<div style="margin-top: 10px;">
								<table class="popTable2" style="width:95.7%;margin-left:20px;">
								<colgroup>
									<col width="8%;"/>
									<col width="8%;"/>
									<col width="10%;"/>
									<col width="10%;"/>
									<col width="20%;"/>
									<col width="20%;"/>
									<col width="10%;"/>
									<col width="15%;"/>
								</colgroup>
									<tr>
										<th>상세보기</th>
										<th>회원번호</th>
										<th>회원명</th>
										<th>아이디</th>
										<th>이메일</th>
										<th>연락처</th>
										<th>등급</th>
										<th>가입일자</th>
									</tr>
								<c:forEach var="uservo" items="${userList}">
									<tr>
										<td style="text-align:center;">
											<a href="javascript:userInfoPop(${uservo.idx})">
												<img src="<%= ctxPath%>/images/search_icon.png" data-toggle="modal" data-target="#classModal" style="cursor:pointer; width: 16px; height: 16px;" >
											</a>
										</td>
										<td style="text-align:center;">${uservo.idx}</td>
										<td style="text-align:center;">${uservo.name}</td>
										<td style="text-align:center;">${uservo.userid}</td>
										<td style="text-align:center;">${uservo.email}</td>
										<td style="text-align:center;">${uservo.phone}</td>
										<td style="text-align:center;"><span class="grade-bronze">${uservo.gradeCode_fk}</span></td>
										<td style="text-align:center;">${uservo.registDate}</td>
									</tr>

								</c:forEach>
								</table>
								
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
						
					</div>
				</div>
				<!--========================= // end of Content(col-lg-9) ==============================-->
			</div>
		</div>
	</div>

<!-- ================= 유저 상세 모달 시작 =============== -->
<div class="modal fade bs-example-modal-lg" id="classModal" tabindex="-1" role="dialog" aria-labelledby="classInfo" aria-hidden="true">
   <div class="modal-dialog">
   <div class="modal-content">
   		<div class="modal-header">
   			<span style="text-align:center;">PineApple</span>
   			<button class="close" data-dismiss="modal">&times;</button>
   		</div>
   		<div class="modal-body">
   			<div id="umodal-append"></div>
   		</div>
   </div>
   </div>
</div>

<!-- ================= 유저 상세 모달 끝 =============== -->

<!-- ***** footer 시작 ***** -->
<jsp:include page="../../footer.jsp"/>


