<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- ***** head 시작 ***** -->	
<jsp:include page="../head.jsp"/>


<link rel="stylesheet" type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="styles/cart_styles.css">
<link rel="stylesheet" type="text/css" href="styles/cart_responsive.css">

<!-- ***** header 시작 ***** -->
<jsp:include page="../header.jsp"/>


<body>
<!-- Cart -->

	<div class="cart_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 ">
					<div class="cart_container">
						<div class="cart_title">장바구니</div>
						
						<div class="cart_items" style="text-align:center;">
							<ul class="cart_list" style="text-align:center;">
								<li class="cart_item clearfix" style="text-align:center;">
									<!-- <div class="cart_item_image"><img src="images/shopping_cart.jpg" alt=""></div> -->
									
									<div class="cart_item_info d-flex flex-md-row flex-column justify-content-between">
										<div class="cart_checkbox cart_info_col " style="margin-left:10px;">	
											<div class="cart_item_title"><input type="checkbox" name="cart_allcheckbox"/></div>
											<div class="chkbox" style="height: 105px; font-size: 15px; margin-top: 20px; padding-top:42px;"><input type="checkbox" name="chkbox"/></div>
										</div>
							
										<div class="cart_item_num cart_info_col" style="margin-left:10px;">
											<div class="cart_item_title" style="text-align:center;">제품번호</div>
											<div class="productNum" style="height: 105px; font-size: 15px; margin-top: 20px; padding-top:40px;">CD20181130</div>
										</div>
										
										<div class="cart_item_name cart_info_col" style="margin-left:10px;">
											<div class="cart_item_title" style="text-align:center; " >제품정보</div>
											<div class="productInfo" style="height:105px; font-size:15px; margin-top:20px; text-align:left;">
												<div class="productImg" style="width:100px; height:100px; float:left;"><img src="images/shopping_cart.jpg" style="max-width: 100%;" alt=""></div>
												<span style="">### 제품명: MCPRO GRAM #####</span><br/>
												<span style="font-size:10pt; color:#0e8ce4;">[상세정보]</span><br/>
												<span style="font-size:10pt; color:#0e8ce4;">[배송조회]</span>
											</div>
										</div>
										<div class="cart_item_col cart_info_col" style="margin-left:10px;">
											<div class="cart_item_title" style="text-align:center;">색상</div>
											<div class="productCol" style="height: 105px; font-size:15px; margin-top:20px; padding-top:40px;">BLUE</div>
										</div>
										<div class="cart_item_quantity cart_info_col" style="margin-left:10px;">
											<div class="cart_item_title"  style="text-align:center;">수량</div>
											<div class="productQty" style="height: 105px; font-size: 15px; margin-top:20px; padding-top:35px;">
												<input type="text" style="margin-left:5px; width:40px; height:30px; font-size:10pt; text-align:center;">
												<button type="button" style="margin-left:5px; width:40px; height:30px; font-size:10pt;">변경</button>
											</div>
										</div>
										<div class="cart_item_price cart_info_col" style="margin-left:10px;">
											<div class="cart_item_title" >상품금액</div>
											<div class="productPrice" style="height: 105px; font-size: 15px; margin-top: 20px; padding-top:40px;">$2,000,000</div>
										</div>
										<div class="cart_item_salepercent cart_info_col" style="margin-left:10px;">
											<div class="cart_item_title" style="text-align:right;">할인금액</div>
											<div class="productSalePercent" style="height: 105px; font-size: 15px; margin-top: 20px; padding-top:40px;">$2,000</div>
										</div>
										<div class="cart_item_saleprice cart_info_col" style="margin-left:10px;">
											<div class="cart_item_title" style="text-align:right;">주문금액</div>
											<div class="productSalePrice" style="height: 105px; font-size: 15px; margin-top: 20px; padding-top:40px;">$2,000,000</div>
										</div>
										<div class="cart_item_others cart_info_col" style="margin-left:10px;">
											<div class="cart_item_title" style="text-align:center;">기타</div>
											<div class="delodrbtn" style="height: 105px; font-size: 15px; margin-top: 20px; padding-top:35px;">
												<button type="button" style="margin-left:5px; width:40px; height:30px; font-size:10pt; text-align:center;">주문</button>
												<button type="button" style="margin-left:5px; width:40px; height:30px; font-size:10pt; text-align:center;">삭제</button>
											</div>
											
										</div>
		
									</div>
								</li>
							</ul>
						</div>
						
						<!-- Order Total -->
						<div class="order_total">
							<div class="order_total_content text-md-right" >
								<div class="order_total_title" >총 상품금액:</div>
								<div class="order_total_price" >$2000</div>
							</div>
							<div class="order_total_content text-md-right" >
								<div class="order_total_title" style="">총 할인금액:</div>
								<div class="order_total_salepercent">(-)$20</div>
							</div>
							<div class="order_total_content text-md-right" >
								<div class="order_total_title" style="font-size:15pt; margin-top:10px; color:#0e8ce4; font-weight:bold;">총 결제금액:</div>
								<div class="order_total_saleprice" style="font-size:15pt;">$1980</div>
							</div>
						</div>

						<div class="cart_buttons">
							<button type="button" class="button chkord">선택주문</button>
							<button type="button" class="button chkdel">선택삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>

<!-- ***** footer 시작 ***** -->
<jsp:include page="../footer.jsp"/>