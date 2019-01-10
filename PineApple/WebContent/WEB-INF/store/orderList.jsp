<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ***** head 시작 ***** -->	
<jsp:include page="../head.jsp"/>

<link rel="stylesheet" type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="styles/orderList_styles.css">
<link rel="stylesheet" type="text/css" href="styles/cart_responsive.css">

<!-- ***** header 시작 ***** -->
<jsp:include page="../header.jsp"/>

	<!-- orderList -->

	<div class="orderList_section" style="align-content: center;">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="orderList_container" style="overflow: auto;" >
					<%--타이틀--%>
						<div class="orderList_title"><span style="color: rgba(0,0,0,0.5);">배송정보</span></div>
						
						<%-- 주문 리스트 --%>
						<div class="orderList_items">
							<ul class="orderList_list">
								<li class="orderList_item clearfix">
									<div class="orderList_item_image"><img src="images/shopping_cart.jpg" alt=""></div>
									<div class="orderList_item_info d-flex flex-md-row flex-column justify-content-between">
										<div class="orderList_item_name orderList_info_col">
											<div class="orderList_item_title">상품명</div>
											<div class="orderList_item_text"><span style="width: 200px;">MacBook Air 13</span></div>
										</div>
										<div class="orderList_item_color orderList_info_col">
											<div class="orderList_item_title">수령자</div>
											<div class="orderList_item_text"><span style="width: 80px;">유세원</span></div>
										</div>
										<div class="orderList_item_quantity orderList_info_col">
											<div class="orderList_item_title">주문일자</div>
											<div class="orderList_item_text">2018-11-28</div>
										</div>
										<div class="orderList_item_price orderList_info_col">
											<div class="orderList_item_title">주문금액</div>
											<div class="orderList_item_text">
												<span  style="width: 110px; border: 0px solid red;">
													<fmt:formatNumber value="" pattern="###,###" />
													900,000 원
												</span>
											</div>
										</div>
										<div class="orderList_item_total orderList_info_col">
											<div class="orderList_item_detail" style="margin-top: 60px; text-align: right;">
												<ul>
													<li>
														<span style="margin: 15px;"><a href="#">[주문상세]</a> </span>
													</li>
													<li>
														<span><a href="#">[배송조회]</a></span>
													</li>
												</ul>									
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>


						<div class="orderList_buttons">
							<button type="button" class="button orderList_button_checkout">계속 쇼핑하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- ***** footer 시작 ***** -->
<jsp:include page="../footer.jsp"/>