<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- ***** head 시작 ***** -->
<jsp:include page="../head.jsp" />

<link rel="stylesheet" type="text/css"
	href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="styles/cart_styles.css">
<link rel="stylesheet" type="text/css" href="styles/cart_responsive.css">

<!-- ***** header 시작 ***** -->
<jsp:include page="../header.jsp" />

<script type="text/javascript">
	$(document).ready(function() {
		if($('.chkboxpnum').prop("checked", false)){
			$(".noDiscountTotal").text(0);
			$(".discountTotal").text(0);
			$(".totalDelivery").text(0);
			$(".totalPayment").text(0);
		}
		
		$('.chkboxpnum').change(function() {
			var checklength = $('input:checkbox[name="fk_pnum"]:checked').length;
			
			if(checklength <= 0 ){
				$(".noDiscountTotal").text(0);
				$(".discountTotal").text(0);
				$(".totalDelivery").text(0);
				$(".totalPayment").text(0);
			} else {
				if (this.checked != true) { 
					// 체크가 false라면
					getPriceWithCheck();
				
				} else { 
					// 체크가 true라면
					getPriceWithCheck();
				}
			}
		});

	}); // end of $(document).ready()--------------------------

	//천단위 콤마
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	// 체크박스 모두선택 및 모두해제 되기 위한 함수
	function allCheckBox() {

		var bool = $("#allCheckOrNone").is(':checked');

		$(".chkboxpnum").prop('checked', bool);
		
		if (bool == false) { 
			// 체크가 false 라면
			$(".noDiscountTotal").text(0);
			$(".discountTotal").text(0);
			$(".totalDelivery").text(0);
			$(".totalPayment").text(0);
		} else { // 체크가 true 라면
			getPriceWithCheck();
		}
		
	}// end of allCheckBox()------------

	function getPriceWithCheck() {
		// 1. 주문총액이 코인잔액을 초과한 경우 주문을 할수 없도록 해야 한다.
		var origintotalprice = 0;
		var sumtotalprice = 0;
		var sumtotalpoint = 0;

		$(".chkboxpnum").each(function() {
			if ($(this).is(':checked')) {
				var saleprice = $(this).attr("data-price");
				var curPrice = $(this).closest("tr").find("td div span.cur_price").attr("data-cur");
								
				//원 구매가
				var originArr = curPrice.split(',');
				var origin = originArr.join('');
				
				//실 구매가
				var saleArr = saleprice.split(',');
				var sale = saleArr.join(''); 
				
				origintotalprice += parseInt(origin);
				sumtotalprice += parseInt(sale);
				
				//총할인가
				var totalDiscount = origintotalprice - sumtotalprice;
				
				//배송비
				var delivery = 2500;
				sumtotalprice >= 300000 ? delivery = 0 : delivery = 2500;
				
				$(".noDiscountTotal").text(numberWithCommas(origintotalprice));
				$(".discountTotal").text(numberWithCommas(totalDiscount));
				$(".totalDelivery").text(numberWithCommas(delivery));
				$(".totalPayment").text(numberWithCommas(sumtotalprice+delivery));
		
			}
		});
	}

	// **** 주문하기 *****
	function goOrder() {

		// 체크박스의 체크가 하나라도 체크가 안되어 있으면 주문을 할 수 없도록 해야 한다.
		var flag = false;
		$(".chkboxpnum").each(function() {
			if ($(this).is(':checked')) {
				flag = true;
				return false;
			}
		});

		if (!flag) {
			alert("주문할 제품을 최소한 1개 이상은 선택하셔야 합니다.");
			return;
		} else {
			// 주문할 제품에 대해 체크박스가 최소한 1개 이상을 선택한 경우 
			var YN = confirm("선택한 제품을 주문하시겠습니까?");

			if (YN == false) {
				// 취소를 선택한 경우
				return;
			} else {
				// 확인을 선택한 경우

				// 1. 주문총액이 코인잔액을 초과한 경우 주문을 할수 없도록 해야 한다.
				var sumtotalprice = 0;
				var sumtotalpoint = 0;

				$(".chkboxpnum").each(
						function() {
							if ($(this).is(':checked')) {
								//var totalprice = $(this).parent().parent().find("#totalprice").text();

								var totalprice = $(this).attr("data-price");
								alert("-" + totalprice);

								var totalpoint = $(this).parent().parent()
										.find("#totalpoint").text();

								var strArr = totalprice.split(',');

								for (var i = 0; i < strArr.length; i++) {
									alert(strArr[i]);
								}

								//								var strArr2 = totalpoint.split(',');

								var str = strArr.join('');
								//	alert(str);

								//								var str2 = strArr2.join('');

								sumtotalprice += parseInt(str);
								alert(sumtotalprice);
								//								sumtotalpoint += parseInt(str2);
							}
						});

				//	alert("주문총액 : " + sumtotalprice);
				//	alert("총포인트 : " + sumtotalpoint);

				// 2. 주문하려는 제품의 주문량이 제품의 재고량보다 크면 주문을 할 수 없도록 해야 한다.
				var index = 0;
				flag = false;
				$(".chkboxpnum").each(function() {
					if ($(this).is(':checked')) {
						var jumunQty = parseInt($("#oqty" + index).val());
						var pQty = parseInt($("#pqty" + index).val());
						var pname = $("#pname" + index).text();

						if (jumunQty > pQty) {
							alert(pname + " 제품의 재고량이 주문량 보다 적어서 주문이 불가합니다.");
							flag = true;
						}
					}
					index++;
				}); // end of $(".chkboxpnum").each()--------------------

				if (flag) {
					return;
				}

				// 3. 폼에 있는 값들 중에서 체크박스에 체크가 되어진 행들만 활성화 시키고
				//    체크가 안되어진 행들은 비활성화 시키도록 한다.
				//    비활성화 되어진 것들의 값들은 frm.action = "orderAdd.do"; 로 안넘어간다.
				//    참고로 체크박스는 체크가 되어진 것들만 frm.action = "orderAdd.do"; 로 넘어간다.!!!!
				index = 0;
				$(".chkboxpnum").each(
						function() {
							if (!$(this).is(':checked')) {
								// 체크가 안된것은 폼전송이 안되어지도록 비활성화 시킨다.
								$(this).parent().parent().find(":input").attr(
										"disabled", true);
								/* 
								   $(this).attr("disabled",true);
								   $("#oqty"+index).attr("disabled",true);
								   $("#cartno"+index).attr("disabled",true);
								   $("#saleprice"+index).attr("disabled",true); 
								 */
							}
							index++;
						});

				// 총 주문총액 보다 코인액이 같거나 더 많이 있을 경우에는
				// 주문을 받아주도록 한다.
				var frm = document.orderFrm;
				frm.sumtotalprice.value = sumtotalprice;
				frm.sumtotalpoint.value = sumtotalpoint;

				frm.method = "POST";
				frm.action = "orderAdd.do";
				frm.submit();
			}

		}

	}// end of goOrder()-----------------------------
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
								장바구니 <span class="tx_num">${cartCnt}</span>
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
										<th scope="col"><input type="checkbox"
											id="allCheckOrNone" onClick="allCheckBox();"></th>
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
										<%-- <c:set var="cartTotalPriceNoDiscount" value="0" />
										<c:set var="cartTotalPrice" value="0" />
										<c:set var="cartTotalDiscount" value="0" />
										<c:set var="cartTotalPoint" value="0" /> --%>


										<c:forEach var="cartvo" items="${cartList}" varStatus="status">
											<%-- <c:set var="cartTotalPriceNoDiscount"
												value="${cartTotalPriceNoDiscount + cartvo.storeitem.price}" />
											<c:set var="cartTotalDiscount"
												value="${cartTotalDiscount + (cartvo.storeitem.price - cartvo.storeitem.saleprice)}" />
											<c:set var="cartTotalPrice"
												value="${cartTotalPrice + cartvo.storeitem.totalPrice}" /> --%>

											<tr>
												<td>
													<div class="tbl_cell w40">
														<input type="checkbox" name="fk_pnum" class="chkboxpnum"
															id="idx${status.index}" value="${cartvo.fk_pnum}"
															data-price="${cartvo.storeitem.saleprice}" />
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
																<p id="goodsNm">옵션 => [램
																	:${cartvo.storeitem.ramName}], [저정장치
																	:${cartvo.storeitem.storageName}], [운영체제
																	:${cartvo.storeitem.osName}]</p>
															</a>
														</div>
													</div>
												</td>
												<td>
													<div class="tbl_cell w110">
														<span class="cur_price" data-cur="${cartvo.storeitem.price}"><span class="tx_num">
															<fmt:formatNumber value="${cartvo.storeitem.price}" pattern="###,###" /></span>원</span>
													</div>
												</td>
												<td>
													<div class="tbl_cell w100">
														<div class="prd_cnt">
															<input type="number" value="${cartvo.oqty}">
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

												<td><input type="hidden" id="totalprice"
													value="${cartTotalPrice}" /></td>
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
									총 판매가 <span class="tx_num noDiscountTotal">
											<%-- <fmt:formatNumber value="${cartTotalPriceNoDiscount}" pattern="###,###" /> --%>
										  </span>원 
									
									<span class="tx_sign minus">-</span> 
									
									총 할인금액 <span class="tx_num discountTotal">
												<%-- <fmt:formatNumber value="${cartTotalDiscount}" pattern="###,###" /> --%>
											</span>원 
									
									<span class="tx_sign plus">+</span> 
									
									배송비 <span class="tx_num totalDelivery"></span>원
									
									<span class="tx_sign equal">=</span>
									 
									<span class="tx_total_price">
									총 결제금액 
										<span class="tx_price">
											<span class="tx_num totalPayment">
												<%-- <fmt:formatNumber value="${cartTotalPrice+2500}" pattern="###,###" /> --%>
											</span>원</span>
										</span>
								</div>
							</div>

							<div class="total_price_info">
								<div class="detail_price">
									<p>
										총 판매가
										<span>
											<span class="tx_num noDiscountTotal">
												<%-- <fmt:formatNumber value="${cartTotalPriceNoDiscount}" pattern="###,###" /> --%>
											</span>원
										</span>
									</p>
									<span class="tx_sign2 minus">-</span>
									<p class="tx_sale">
										총 할인금액<span><span class="tx_num discountTotal">
													<%-- <fmt:formatNumber value="${cartTotalDiscount}" pattern="###,###" /> --%>
												</span>원</span>
									</p>
									<span class="tx_sign2 plus">+</span>
									<p>
										배송비 <span><span class="tx_num totalDelivery"></span>원</span>
									</p>
								</div>
								<div class="sum_price">
									<span class="tx_text">배송비는 쿠폰할인금액에 따라 변경될 수 있습니다.</span> 
									총결제예상금액 <span class="tx_price"><span class="tx_num totalPayment">
											<%-- <fmt:formatNumber value="${cartTotalPrice + 2500}" pattern="###,###" /> --%>
									    </span>원</span>
								</div>
							</div>

							<div class="order_btn_area order_cart">
								<button type="button" class="btnOrangeW">계속쇼핑</button>
								<button type="button" class="btnOrange ordershopping"
									onClick="goOrder();">주문하기</button>
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