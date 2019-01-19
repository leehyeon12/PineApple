<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- ***** head 시작 ***** -->
<jsp:include page="../head.jsp" />

<link rel="stylesheet" type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="styles/cart_styles.css">
<link rel="stylesheet" type="text/css" href="styles/cart_responsive.css">

<!-- ***** header 시작 ***** -->
<jsp:include page="../header.jsp" />

<script type="text/javascript">

/* 깃테스트 */

</script>

<body>
	<!-- Cart -->

	<div class="cart_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 ">
					<div class="cart_container">
						<div class="title_box">
							<h1>
								장바구니 <span class="tx_num">2</span>
							</h1>
							<ul class="step_list">
								<li class="on"><span class="hide">현재단계</span><span
									class="step_num tx_num">1</span> 장바구니</li>
								<!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
								<li><span class="step_num tx_num">2</span> 주문/결제</li>
								<li class="last"><span class="step_num tx_num">3 </span>
									주문완료</li>
							</ul>
						</div>

						<form name="orderFrm">
							<table class="tbl_prd_list">
								<colgroup>
									<col style="width: 40px">
									<col style="width: *">
									<col style="width: 110px">
									<col style="width: 100px">
									<col style="width: 110px">
									<col style="width: 120px">
									<!-- 2017-01-13 수정 -->
									<col style="width: 150px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><input type="checkbox" id="inp_allRe1"
											name="" value=""></th>
										<th scope="col">상품정보</th>
										<th scope="col">판매가</th>
										<th scope="col">수량</th>
										<th scope="col">구매가</th>
										<th scope="col">배송정보</th>
										<th scope="col">선택</th>
									</tr>
								</thead>

								<tbody>
									<c:if test="${cartList == null || empty cartList}">
										<tr>
											<td colspan="6" align="center"><span
												style="color: red; font-weight: bold;"> 장바구니에 담긴 상품이
													없습니다. </span></td>
										</tr>
									</c:if>

									<c:if test="${cartList != null && not empty cartList}">
										<c:set var="cartTotalPrice" value="0" />
										<c:set var="cartTotalPoint" value="0" />

										<c:forEach var="cartvo" items="${cartList}">
											<tr>
												<td>
													<div class="tbl_cell w40">
														<input type="checkbox" checked="checked" id="inp_prd_chk1"
															name="s_checkbox1">
													</div>
												</td>
												<td>
													<div class="tbl_cell w390">
														<a class="prd_img" href="#"
															style="position: absolute; padding-top: 10px;"> <img
															class="completed-seq-lazyload" id="cart_prodImg"
															alt="상품이미지" src="/SEMI/images/${cartvo.storeitem.image1}">
														</a>
														<div class="prd_info">
															<a class="prd_name" href=""> <span id="brandNm">${cartvo.storeitem.name}</span>
																<p id="goodsNm">
																옵션 => 
																[램 :${cartvo.storeitem.ramName}], 
																[저정장치 :${cartvo.storeitem.storageName}], 
																[운영체제 :${cartvo.storeitem.osName}]</p>
															</a>
														</div>
													</div>
												</td>
												<td>
													<div class="tbl_cell w110">
														<span class="cur_price"><span class="tx_num"><fmt:formatNumber
																	value="${cartvo.storeitem.price}" pattern="###,###" /></span>원</span>
													</div>
												</td>
												<td>
													<div class="tbl_cell w100">
														<div class="prd_cnt">
															<input type="number" value="1">
														</div>
														<button type="button" class="btnSmall wGray"
															style="display: none;" name="btnQtyMod">
															<span>변경</span>
														</button>
													</div>
												</td>
												<td>
													<div class="tbl_cell w110">
														<span class="org_price"> </span> <span class="pur_price"><span
															class="tx_num"><fmt:formatNumber
																	value="${cartvo.storeitem.saleprice}" pattern="###,###" /></span>원</span>
													</div>
												</td>
												<td>
													<div class="tbl_cell w120  ">
														<p class="prd_delivery">
															<strong id="deliStrongText"> 2,500 <span
																class="ex">도서·산간 제외</span>
															</strong>
														</p>
													</div>
												</td>
												<td>
													<div class="tbl_cell w150">
														<div class="btn_group">
															<button type="button" class="btnSmall wGreen"
																name="btn_buy">
																<span>바로구매</span>
															</button>
															<br />
															<button type="button" class="btnSmall wGray delete"
																name="btnDelete">
																<span>삭제</span>
															</button>
															<!-- 버튼 공간(스페이스바)없이 붙여주세요. -->
														</div>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:if>

								</tbody>
							</table>

							<div class="basket_price_info">
								<div class="btn_area">
									<button type="button" class="btnSmall wGray type2"
										id="partDelBtn1" name="partDelBtn">
										<span>선택상품 삭제</span>
									</button>
									<button type="button" class="btnSmall wGray type2"
										id="soldOutDelBtn1" name="soldOutDelBtn">
										<span>품절상품 삭제</span>
									</button>
								</div>
								<div class="sum_price">
									총 판매가 <span class="tx_num">2,519,800</span>원 <span
										class="tx_sign minus">-</span> 총 할인금액 <span class="tx_num">0</span>원
									<span class="tx_sign plus">+</span> 배송비 <span class="tx_num">2,500</span>원
									<span class="tx_sign equal">=</span> <span
										class="tx_total_price">총 결제금액 <span class="tx_price"><span
											class="tx_num">22,300</span>원</span></span>
								</div>
							</div>

							<div class="total_price_info">
								<div class="detail_price">
									<p>
										총 판매가<span><span class="tx_num">2,519,800</span>원</span>
									</p>
									<span class="tx_sign2 minus">-</span>
									<p class="tx_sale">
										총 할인금액<span><span class="tx_num">150,000</span>원</span>
									</p>
									<span class="tx_sign2 plus">+</span>
									<p>
										배송비 <span><span class="tx_num">2,500</span>원</span>
									</p>
								</div>
								<div class="sum_price">
									<span class="tx_text">배송비는 쿠폰할인금액에 따라 변경될 수 있습니다.</span> 총
									결제예상금액 <span class="tx_price"><span class="tx_num">2,372,300</span>원</span>
								</div>
							</div>

							<div class="order_btn_area order_cart">
								<button type="button" class="btnOrangeW" name="partOrderBtn">선택주문</button>
								<button type="button" class="btnOrange" name="allOrderBtn">전체주문</button>
							</div>
						</form>
						<div class="cart_comment">
							<p>장바구니 상품은 90일동안, 판매종료 된 상품은 10일동안 보관됩니다.</p>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>

<!-- ***** footer 시작 ***** -->
<jsp:include page="../footer.jsp" />