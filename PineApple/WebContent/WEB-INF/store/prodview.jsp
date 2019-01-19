<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctxPath = request.getContextPath(); %>

<!-- ***** head 시작 ***** -->	
<jsp:include page="../head.jsp"/>

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/styles/product_styles.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/styles/product_responsive.css">
<script src="<%= ctxPath%>/js/jquery-3.3.1.min.js"></script>
<script src="<%= ctxPath%>/styles/bootstrap4/popper.js"></script>
<script src="<%= ctxPath%>/styles/bootstrap4/bootstrap.min.js"></script>
<script src="<%= ctxPath%>/plugins/greensock/TweenMax.min.js"></script>
<script src="<%= ctxPath%>/plugins/greensock/TimelineMax.min.js"></script>
<script src="<%= ctxPath%>/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="<%= ctxPath%>/plugins/greensock/animation.gsap.min.js"></script>
<script src="<%= ctxPath%>/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="<%= ctxPath%>/plugins/easing/easing.js"></script>
<script src="<%= ctxPath%>/js/product_custom.js"></script>

<style>
.productView-middle-select{
	width: 100%;
    display: inline-block;	
	margin-bottom:30px;
}

.middle-select-tab{
	float:left;
	width:100%;
}

.middle-select-tab ul{
	padding:0;
	float:left;
	margin:0 5px;
	width:100%;
}

/*중간 탭*/
.middle-select-tab{
}

.middle-select-tab li{
	list-style:none;
	width:25%;
	padding:20px;
	margin:0;
	font-size:18px;
	font-weight:bold;
	text-align:center;
	float:left;
	cursor:pointer;
	border-top:2px solid #555555;
}

.shopTabFixed {
   position: fixed;
   top: 0px;
   width:1010px;
   z-index:10;
}

.middle-select-tab ul li{
	background:#f4f4f4;
	color:#717171;;
	border-bottom:1px solid #555555;
}

.tab-selected{
	border-left:1px solid #717171;
	border-right:1px solid #717171;
	background:white !important;
	border-bottom:1px solid #fff !important;
}


.productView-middle-declare{
	padding:100px 10px 0 10px;
	margin:40px 0;
}

.middle-declare-title{
	font-size:16px;
	font-weight:bold;
	margin-bottom:3px;
}

.middle-declare-content{
	width:100%;
}

.declare-table{
	width:100%;
}

.declare-table tr{
	border-bottom:1px solid #e0e0e0;
}

.declare-table th{
	width:15%;
	padding:10px 7px 10px 7px;
	background:#f4f4f4;
}

.declare-table td{
	width:30%;
	padding:10px 5px;
}

.productView-middle-preview, .productView-middle-ask{
	margin-bottom:40px;
	padding-top:100px;
}

.middle-preview-content{
	padding:0 10px; 
	text-align:center;
}

.middle-ask-content{
	border:1px solid #c9c9c9;
	padding:20px 40px;
	display:inline-block;
	width:100%;
}

.ask-content-top{
	display:inline-block;
	width:100%;
	margin-bottom:8px;
}

.ask-content-top-left{
	display:inline-block;
	width:75%;
	text-align:left;
	padding:0;
}

.ask-content-top-right{
	display:inline-block;
	width:20%;
	text-align:right;
	margin-top:5px;
	padding-left:110px;
}

.ask-content-title{
	font-size:20px;
	font-weight:bold;
	margin:0;
}

.ask-content-subTitle{
	color:#717171;
}

.ask-content-top-right input[type="button"]{
	padding:7px 10px;
	font-size:18px;
	font-weight:bold;
	color:#717171;
	border:2px solid #717171;
	border-radius:3px !important;
	background:#ffffff;
}

.ask-content-top-right input[type="button"]:hover{
	background:#eaeaea;
}

.ask-content-middle{
	border-top:1px solid #717171;
	padding-bottom:10px;
}

.ask-content-question{
	margin-top:20px;
	border-bottom:1px solid #c9c9c9;
	display:inline-block;
	width:100%;
	padding:0;
}

.question-left{
	display:inline-block;
	width:96%;
	text-align:left;
}

.question-right{
	display:inline-block;
	width:3%;
	text-align:right;
}

.question-mark, .answer-mark{
	padding:5px 10px;
	background:#83b14e;
	color:white;
	border-radius:3px !important;
	margin-right:5px;
}

.question-buttons input{
	border-radius:3px !important;
	background:#eee;
	padding:3px 5px;
	border:1px solid #717171;
}

.add-edit-form{
    margin:5px 0;
    width:800px;
}

.add-edit-form textarea{
	width: 80%;
    height: 100px;
    resize: none;
    margin-top: 5px;
    padding: 8px;
}

.question-kind{
	font-weight:bold;	
	margin-right:5px;
}

.ask-content-question img{
	width:3%;
	height:3%;
}

.ask-content-answer{
	margin-top:5px;
	display:inline-block;
	width:100%;
	padding:0;
	border-bottom:1px solid #717171;
}

.answer-left{
	display:inline-block;
	width:4%;
	height:100%;
	text-align:left;
	padding:0 0 0 5px;
}

.answer-right{
	display:inline-block;
	width:80%;
	text-align:left;
	margin-top:10px;
}

.answer-mark{
	background:#E89C0C;
}

.ask-content-answer img{
	width:60%;
	height:40%;
	opacity:0.8;
}

.ask-content-end{
	margin-top:5px;
	text-align:center;
	font-size:17px;
}

.ask-content-end b font{
	color:#83b14e;
}

.ask-content-end a{
	color:#717171;
}

.ask-content-end a:hover{
	color:#83b14e;
}

.productView-middle-brand{
	padding-top:100px;
	margin-bottom:40px;
	border-bottom:1px solid #c9c9c9;
}

.brand-info-title{
	margin-bottom:10px;
}

.brand-info-title p{
	text-align:center;
	line-height:28px;
}

.brand-info-ENTitle{
	font-size:30px;
	font-weight:bold;
	font-style:italic;
	color:#555555;
	margin:0;
}

.brand-info-KRTitle{
	font-size:18px;
	color:#555555;
	margin-bottom:5px;
	padding-bottom:5px;
	border-bottom:1px solid #717171;
}

.brand-info-content{
	padding:0 20px;
	text-align:center;
}

.brand-info img{
	width:150px;
	height:150px;
	border-radius:75px !important;
	border:2px solid #c9c9c9;
	margin-top:25px;
	padding:20px;
}

.brand-info-name{
	margin:10px 0;
}

.brand-info-name a{
	font-size:28px;
	color:#555555;
	font-weight:bold;
	margin:10px 0;
}

.brand-info-name a:hover{
	text-decoration:none;
	color:#717171;
}

.classified-brand-product{
	margin:20px 0 10px 0;
	padding:10px 40px;
	background:#e3e3e3;
	border-radius:3px !important;
}

.classified-brand-product p{
	font-size:15px;
}

.brand-products{
	display:inline-block;
	width:100%;
	margin-bottom:20px;
}

.brand-product{
	background:white;
	width:28%;
	padding:10px;
	margin-right:10px;
	display:inline-block;
}

.brand-product img{
	width:180px;
	height:230px;
	margin-bottom:5px;
}

.brand-product ul, .brand-add-product ul{
	padding:0;
	margin:0;
}

.brand-product li, .brand-add-product li{
	list-style:none;
	margin-bottom:3px;
}

.brand-product-name, .brand-product-price{
	font-size:15px;
}

.brand-product-name a:hover, .middle-select-tab ul li a:hover{
	color:#717171;
}

.brand-add-product{
	width:10%;
	height:100%;
	display:inline-block;
	padding-left:10px;
}

.brand-product-go img{
	width:30px;
	height:30px;
	margin-bottom:5px;
	cursor:pointer;
}

.brand-product-name p{
	margin:0;
}

.middle-guide-shipping-info, .middle-guide-cancle-info, .middle-guide-refund-info{
	margin-bottom:30px;
}

.guide-title{
	font-size:20px;
	font-weight:bold;
	margin-bottom:5px;
}

.guide-content li{
	list-style:decimal;
}

.guide-content li.guide-addition{
	list-style:none;
	color:#9d9d9d;
	font-size:11px;
}

</style>

<script>
$(document).ready(function(){
	$(".accordion_banner .accordion_sub").hide();
	$(".accordion_banner .accordion_title").click(function() {
		if ($(this).next("div").is(":visible")) {
			$(this).next("div").slideUp("fast");
		} else {
			$(".accordion_banner .accordion_sub").slideUp("fast");
			$(this).next("div").slideToggle("fast");
		}
	});

	$("#go-ask-write").click(function(event){
		$("#product_board_form").modal();
	});

	
	//shopProductView tab fixed
	var bannerOffset = $('.productView-middle-declare').position();
	var askPosition = $('#select-tab-ask').offset().top;
	var brandPosition = $('#select-tab-brand').offset().top;
	$(window).scroll(function(){ 
		if($(document).scrollTop() > bannerOffset.top) {
			$('.productView-middle-select').addClass('shopTabFixed');
		} else {
			$('.productView-middle-select').removeClass('shopTabFixed');
		}
	});

	//tab 누르면 이동
	$('.middle-select-tab > ul > li').click(function(){
		var scrollPosition = $('#select-tab-'+$(this).attr('data-target')).offset().top;
		$('html,body').animate({scrollTop : scrollPosition}, 'fast');
	});
	
	//탭 색깔
	$(window).on('scroll', function() {
		$('.scorll-target').each(function() {
			if($(window).scrollTop() > ($(this).offset().top)-10) {
				var id = $(this).attr('id');
				$('.middle-select-tab ul li').removeClass('tab-selected');
				$('.select-tab-'+$(this).attr('data-selected')).addClass('tab-selected');
			}
		});
	});

	//찜하기
	//좋아요, 스크랩 누르면 사진 변화
	var flag = 0;
	$(document).on('click','.wish',function(event){
		event.preventDefault();
		var like = document.getElementById('like');
		
		if(flag == 1){
			//좋아요 해제
			alert('찜하기 해제!');
			like.src = '../assets/img/shop/not_wish.png';
			flag = 0;
			return false;
		}

		alert('찜하기 완료!');
		like.src = '../assets/img/shop/wish.png';
		flag = 1;
	});
	
	//문의하기 modal 로그인체크 + 유효성체크 
	$('#pbWrite_form').submit(function(){
		var user_id = document.getElementById('user_id').value;
		if(user_id == ''){
			alert('로그인 후 이용해주세요!');
			return false;
		}else{
			var select = $('#select-ask-kind option:selected').val();
			var lock = document.getElementById('ask-lock');
		    
			if(select == "unselect") {
				alert("문의 유형을 선택해주세요!");
			    return false;
			}
			
			if($('#product-ask-content').val() == ""){
				alert("문의 내용을 입력해주세요!");
			    return false;
			}
		}
	});
	
	//비밀글 none-click
	$('.ask-question-and-answer').click(function(){
		if($('#private-content-'+$(this).attr('data-private')).hasClass('private-content') == true){
			$('#private-'+$(this).attr('data-private')).hide();
		}
	});
	
	//=============== 상품문의 Admin
	//답변등록
	$('.answer-add').click(function(event){
		var num = $(this).attr('data-private');
		if($('#pbr_content_'+num).val()==''){
			alert('답변 내용을 입력하세요');
			$('#pbr_content_'+num).focus();
			return false;
		}
		var pbr_id = document.getElementById('pbr_id_'+num).value;
		var pbr_head = document.getElementById('pbr_head_'+num).value;
		var pbr_content = document.getElementById('pbr_content_'+num).value;
		var p_num = document.getElementById('pbr_p_num_'+num).value;
		var brand_num = document.getElementById('pbr_brand_num_'+num).value;
		
		//등록
		$.ajax({
			type:'post',
			data:{
				p_num:p_num,
				brand_num:brand_num,
				pbr_id:pbr_id,
				pbr_head:pbr_head,
				pbr_content:pbr_content
			},
			url:'writePBReply.do',
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=='logout'){
					alert('로그인 해야 작성할 수 있습니다.');
				}else if(data.result=='AdminLogin'){
					alert('관리자만 작성할 수 있습니다.');
				}else if(data.result=='success'){
					alert('답변이 완료되었습니다!');
					location.replace("/Hwahea/shop/shopProductView.do?p_num="+p_num+"&brand_num="+brand_num);
				}else{
					alert('등록시 오류 발생');
				}
			},
			error:function(){
				alert('등록시 네트워크 오류 발생!');
			}
		});
		//기본 이벤트 제거
		event.preventDefault();
	});
	
	//textarea에 내용 입력시 글자수 체크
	$(document).on('keyup','textarea',function(){
		//입력한 글자수를 수함
		var inputLength = $(this).val().length;
		
		if(inputLength>300){ //400자를 넘어선 경우
			$(this).val($(this).val().substring(0,400));
		}else{ //400자 이하인 경우
			var remain = 400-inputLength;
			remain += '/400';
			if($(this).attr('id')=='re_content'){
				//등록 폼 글자수 
				$('.add-edit-form .letter-count').text(remain);
			}else{
				//수정 폼 글자수
				$('.add-edit-form .letter-count').text(remain);
			}
		}
	});
	
	//구매하기 클릭
	$('input.item-buy').click(function(){
		var user_id = document.getElementById('user_id').value;
		if(user_id == ''){
			alert('로그인 후 이용해주세요!');
			return false;
		}else{
			var quantity = document.getElementById('quantity').value;
			var p_num = document.getElementById('orderProduct').value;
			location.href="/Hwahea/shop/orderProduct.do?p_num="+p_num+"&quantity="+quantity;		
		}
	});
	
	//장바구니 등록
	$('input#item-cart').click(function(event){
		var quantity = document.getElementById('quantity').value;
		var cart_product = document.getElementById('orderProduct').value;
		var price = document.getElementById('orderPrice').value;
		var cart_price = Math.floor(price);
		//등록
		$.ajax({
			type:'post',
			data:{
				quantity:quantity,
				cart_product:cart_product,
				cart_price:cart_price
			},
			url:'addCart.do',
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=='logout'){
					alert('로그인 후 이용해 주세요!');
				}else if(data.result=='success'){
					var save_confirm = function ()
					{
						if (confirm('장바구니 등록이 완료되었습니다! 쇼핑을 계속하시겠습니까?')) {
							return false;
						} else {
							location.href="/Hwahea/shop/orderProduct.do?";
						}
					}
				}else{
					alert('장바구니 등록시 오류 발생');
				}
			},
			error:function(){
				alert('등록시 네트워크 오류 발생!');
			}
		});
		//기본 이벤트 제거
		event.preventDefault();
	});
	
});
</script>

<!-- ***** header 시작 ***** -->
<jsp:include page="../header.jsp"/>

<%-- contents start --%>
<!-- Single Product -->
<div class="single_product">
	<div class="container">
		<div class="row">

			<!-- Images -->
			<div class="col-lg-2 order-lg-1 order-2">
				<ul class="image_list">
					<li data-image="images/single_4.jpg"><img
						src="images/single_4.jpg" alt=""></li>
					<li data-image="images/single_2.jpg"><img
						src="images/single_2.jpg" alt=""></li>
					<li data-image="images/single_3.jpg"><img
						src="images/single_3.jpg" alt=""></li>
				</ul>
			</div>

			<!-- Selected Image -->
			<div class="col-lg-5 order-lg-2 order-1">
				<div class="image_selected">
					<img src="images/${productDetail[0].image1}" alt="">
				</div>
			</div>

			<!-- Description -->
			<div class="col-lg-5 order-3">
				<div class="product_description">
					<div class="product_category">${productDetail[0].categoryCode_fk}</div>
					<div class="product_name">${productDetail[0].name}</div>

					<div class="product_text">
						<p>
							<%--제품설명 들어가는 칸 --%>
							<%-- ${productDetail.content} --%>

						</p>
					</div>
				</div>
				<br /> <br />
				<form>

					<div style="margin-left: 30px; border: 0px solid gray;">
						<div>
							<h4 style="display: inline; margin: 4px;"> <label   
								for="sel0"><small>수량</small>&nbsp;: </label> 
							</h4> <input class="form-control"
								style="margin-left: 5px; width: 65px; display: inline-block;"
								type="number" name="quantity" id="sel0" min="1" max="99"
								value="1" />
							<div class="section">
								<h4 class="title-attr" style="margin-top: 15px;">
									<small>COLOR</small>
								</h4>
								<div >
								<%-- 색깔을 DB에 입력할땐 무조건 7자리 코드 + 색깔명으로 입력할것 --%>
									<div class="attr color" style="width: 25px; background:#5a5a5a;"></div>
									<div class="attr color" style="width: 25px; background:#ffffff;"></div>
								</div>
								<input type="hidden" name="color" id="color" value=""/>  
							</div>

							
						</div>

						<div style="margin-top: 10px;">
							<div class="section" style="padding-bottom: 5px;">
								<h4 class="title-attr">
									<small>RAM</small>
								</h4>
								<div>
									<div class="attr2 ram" >8 GB</div>
									<div class="attr2 ram" >16 GB</div>
									<div class="attr2 ram" >32 GB</div>
									<input type="hidden" name="ram" id="ram" value="" />
								</div>
							</div>
						
							<div class="section" style="padding-bottom: 5px; margin-top:4px;">
								<h4 class="title-attr" >
									<small>DISK</small>
								</h4>
								<div>
									<h6 class="title-attr" style="margin-right:10px;"><small>HDD</small></h6>
									<div class="attr2 HDD">512 GB</div> 
									<div class="attr2 HDD">1 TB</div><h4 style="font-weight: lighter; margin-right:5px;">/</h4>
									<h6 class="title-attr" style="margin-right:10px;"><small>SSD</small></h6>
									<div class="attr2 SSD">256 GB</div>
									<div class="attr2 SSD">512 GB</div>
									<input type="hidden" name="disk" value="" id="disk"/>
								</div>
							</div>
							
						</div>

					</div>

					<div class="button_container" style="margin-left: 24px;">
						<button type="button" class="button cart_button">Add to
							Cart</button>
						<button type="button" class="button cart_button">Purchase</button>
					</div>

				</form>

			</div>

		</div>
		<%-- end class=col-lg-5 order-3 --%>

		<%-- 상세스펙 시작--%>
		<div class="container" style="margin-left:0px;">
			<div class="productView-middle-select">
				<div class="middle-select-tab">
					<ul>
						<li class="select-tab-intro tab-selected" data-target="intro">상품 소개</li>
						<li class="select-tab-ask"  data-target="info">상품 정보</li>
						<li class="select-tab-brand" data-target="ask">상품 문의</li>
						<li class="select-tab-brand" data-target="review">상품 리뷰</li>
					</ul>
				</div>
			</div>
		<%-- 상세스펙 끝 --%>
		<div class="productView-middle-declare scorll-target" 
					id="select-tab-intro" data-selected="intro">
			<div class="middle-declare-title">필수 표기정보</div>
			<div class="middle-declare-content">
				<table class="declare-table">
					<tr>
						<th>제품명</th>
						<td>맥북 프로 레티나 2018년형</td>
						<th>제조사</th>
						<td>애플</td>
					</tr>
					<tr>
						<th>화면크기</th>
						<td>15인치</td>
						<th>운영체제</th>
						<td>Macintosh(매킨토시)</td>
					</tr>
					<tr>
						<th>CPU</th>
						<td>intel i7</td>
						<th>RAM</th>
						<td>8GB</td>
					</tr>
					<tr>
						<th>저장장치</th>
						<td colspan="3">SSD 256GB</td>
					</tr>
					<tr>
						<th>품질보증기준</th>
						<td>본 제품 이상 시, 공정거래위원회 고시 '소비자분쟁해결기준'에 의거 보상합니다.</td>
						<th>소비자상담관련<br>전화번호</th>
						<td>1577-1577</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="productView-middle-preview">
			<span class="middle-preview-content">
				상품 설명 Content상품 설명 Content상품 설명 Content상품 설명 Content<br>
				상품 설명 Content상품 설명 Content상품 설명 Content상품 설명 Content<br>
				상품 설명 Content상품 설명 Content상품 설명 Content상품 설명 Content<br>
				상품 설명 Content상품 설명 Content상품 설명 Content상품 설명 Content<br>
				상품 설명 Content상품 설명 Content상품 설명 Content상품 설명 Content<br>
				상품 설명 Content상품 설명 Content상품 설명 Content상품 설명 Content<br>
			</span>
		</div>
		<div class="productView-middle-brand scorll-target" 
					id="select-tab-brand" data-selected="info">
			<div class="brand-info-title">
				<p class="brand-info-ENTitle">PRODUCT INFORMATION</p>
				<p class="brand-info-KRTitle">브랜드 정보 및 교환/반품 안내</p>
			</div>
			<div class="brand-info-content">
				<!-- New Product -->
				<div class="viewed">
					<div class="container">
						<div class="row">
							<div class="col">
								<div class="viewed_title_container">
									<h3 class="viewed_title">지금 구매가능한 상품</h3>
									<div class="viewed_nav_container">
										<div class="viewed_nav viewed_prev">
											<i class="fas fa-chevron-left"></i>
										</div>
										<div class="viewed_nav viewed_next">
											<i class="fas fa-chevron-right"></i>
										</div>
									</div>
								</div>
				
								<div class="viewed_slider_container">
				
									<!-- Recently Viewed Slider -->
				
									<div class="owl-carousel owl-theme viewed_slider">
				
										<!-- Recently Viewed Item -->
										<div class="owl-item">
											<div
												class="viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
												<div class="viewed_image">
													<img src="images/view_1.jpg" alt="">
												</div>
												<div class="viewed_content text-center">
													<div class="viewed_price">
														$225<span>$300</span>
													</div>
													<div class="viewed_name">
														<a href="#">Beoplay H7</a>
													</div>
												</div>
												<ul class="item_marks">
													<li class="item_mark item_discount">-25%</li>
													<li class="item_mark item_new">new</li>
												</ul>
											</div>
										</div>
				
										<!-- Recently Viewed Item -->
										<div class="owl-item">
											<div
												class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
												<div class="viewed_image">
													<img src="images/view_2.jpg" alt="">
												</div>
												<div class="viewed_content text-center">
													<div class="viewed_price">$379</div>
													<div class="viewed_name">
														<a href="#">LUNA Smartphone</a>
													</div>
												</div>
												<ul class="item_marks">
													<li class="item_mark item_discount">-25%</li>
													<li class="item_mark item_new">new</li>
												</ul>
											</div>
										</div>
				
										<!-- Recently Viewed Item -->
										<div class="owl-item">
											<div
												class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
												<div class="viewed_image">
													<img src="images/view_3.jpg" alt="">
												</div>
												<div class="viewed_content text-center">
													<div class="viewed_price">$225</div>
													<div class="viewed_name">
														<a href="#">Samsung J730F...</a>
													</div>
												</div>
												<ul class="item_marks">
													<li class="item_mark item_discount">-25%</li>
													<li class="item_mark item_new">new</li>
												</ul>
											</div>
										</div>
				
										<!-- Recently Viewed Item -->
										<div class="owl-item">
											<div
												class="viewed_item is_new d-flex flex-column align-items-center justify-content-center text-center">
												<div class="viewed_image">
													<img src="images/view_4.jpg" alt="">
												</div>
												<div class="viewed_content text-center">
													<div class="viewed_price">$379</div>
													<div class="viewed_name">
														<a href="#">Huawei MediaPad...</a>
													</div>
												</div>
												<ul class="item_marks">
													<li class="item_mark item_discount">-25%</li>
													<li class="item_mark item_new">new</li>
												</ul>
											</div>
										</div>
				
										<!-- Recently Viewed Item -->
										<div class="owl-item">
											<div
												class="viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
												<div class="viewed_image">
													<img src="images/view_5.jpg" alt="">
												</div>
												<div class="viewed_content text-center">
													<div class="viewed_price">
														$225<span>$300</span>
													</div>
													<div class="viewed_name">
														<a href="#">Sony PS4 Slim</a>
													</div>
												</div>
												<ul class="item_marks">
													<li class="item_mark item_discount">-25%</li>
													<li class="item_mark item_new">new</li>
												</ul>
											</div>
										</div>
				
										<!-- Recently Viewed Item -->
										<div class="owl-item">
											<div
												class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
												<div class="viewed_image">
													<img src="images/view_6.jpg" alt="">
												</div>
												<div class="viewed_content text-center">
													<div class="viewed_price">$375</div>
													<div class="viewed_name">
														<a href="#">Speedlink...</a>
													</div>
												</div>
												<ul class="item_marks">
													<li class="item_mark item_discount">-25%</li>
													<li class="item_mark item_new">new</li>
												</ul>
											</div>
										</div>
									</div>
				
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="productView-middle-guide">
			<div class="middle-guide-shipping-info">
				<div class="guide-title">배송 정보</div>
				<div class="guide-content">
					<ul>
						<li>배송방식 : 택배배송</li>
						<li>배송비용 : 기본 2,500원. 15,000원 이상 구매 시 배송비용이 없습니다.</li>
						<li>배송예정일 : 결제완료 후 1~3일 후 출고됩니다. 단, 상품의 재고 상황 및 운송업체 사정에 따라 배송이 지연될 수 있습니다.</li>
						<li class="guide-addition">* 제주도를 포함한 도서산간 지역은 추가 배송일과 추가 배송비 입금 요청이 있을 수 있습니다.</li>
					</ul>
				</div>
			</div>
			<div class="middle-guide-cancle-info">
				<div class="guide-title">취소/교환</div>
				<div class="guide-content">
					<ul>
						<li>주문취소 : 상품 출고 이전까지만 가능하며, 출고 이후는 환불 규정에 따라 처리됩니다.</li>
						<li>상품교환 : 기 구매한 상품을 반품/환불 요청 후 새 상품을 재구매해주셔야 합니다.</li>
					</ul>
				</div>
			</div>
			<div class="middle-guide-refund-info">
				<div class="guide-title">반품/환불</div>
				<div class="guide-content">
					<ul>
						<li>환불 가능 기한 : 단순변심에 의한 사유는 상품 수령일(배송완료일)로부터 7일 이내.</li>
						<li>환불 가능 조건 : 재판매가 가능한 상품 및 포장상태로 반품. (개봉 시 환불 불가)</li>
						<li>반품 배송비 : 단순 변심에 의한 환불은 고객이 부담, 상품 불량 및 오배송에 의한 환불은 판매자 부담</li>
						<li>환불 시 반품 배송지 주소 : 서울특별시 중구 남대문로 120 대일빌딩 2층, 3층 </li>
						<li>교환/환불 및 기타문의는 고객센터 혹은 상품문의 게시판으로 문의해주세요.</li>
						<li>단, 상품상세설명에 별도로 기입된 환불 기준이 있을 경우 그 기준이 우선합니다.</li>
						<li class="guide-addition">* 미성년자가 체결한 계약은 법정대리인이 동의하지 않는 경우 본인 또는 법정대리인이 취소할 수 있습니다.</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="productView-middle-ask scorll-target" 
					id="select-tab-ask" data-selected="ask">
			<div class="middle-ask-content">
				<div class="col-md-12 ask-content-top">
					<div class="col-md-8 ask-content-top-left">
						<p class="ask-content-title">상품 문의</p>
						<p class="ask-content-subTitle">문의하신 내용은 판매자가 확인 후 친절히
							답변해드려요 :)</p>
					</div>
					<div class="col-md-4 ask-content-top-right">
						<input id="go-ask-write" type="button" value="문의하기">
					</div>
				</div>
				<div class="col-md-12 ask-content-middle">
				<c:forEach var="ask" items="${boardList}">									
				<c:if test="${user_auth != 5}">
					<div class="col-md-12 ask-question-and-answer accordion_banner"  data-private="${ask.pb_num}" >
						<div class="col-md-12 ask-content-question accordion_title">
							<div class="col-md-8 question-left">
								<p style="margin-bottom: 15px;">
									<c:if test="${ask.pbr_content eq null}"><span class="question-mark" style="background:#E89C0C;">답변대기</span></c:if>
									<c:if test="${ask.pbr_content ne null}"><span class="question-mark">질문</span></c:if> 
									<span class="question-date">
									<fmt:formatDate value="${ask.pb_dateTime}" pattern="yy.MM.dd HH:mm:ss"/></span> | 
									<span class="question-nickName">${ask.pb_id} 님</span>
									<c:if test="${user_id == ask.pb_id}">
										<span class="question-buttons" style="margin-left:5px;">
											<input type="button" value="삭제" class="question-remove" onclick="location.href='#'">
										</span>	
									</c:if>
								</p>
								<c:if test="${ask.pb_lock==0 || (ask.pb_lock==1&&(ask.pb_id==user_id))}">
								<p>
									<span class="question-kind">[${ask.pb_kind}]</span> <span
										class="question-content">${ask.pb_content} </span> 
								</p>
								</c:if>
								<c:if test="${ask.pb_lock==1 && (ask.pb_id!=user_id)}">
									<p id="private-content-${ask.pb_num}" class="private-content">
									<span class="question-kind">[PRIVATE]</span> <span
										class="question-content">비밀글입니다. </span> <img
										src="${pageContext.request.contextPath}/assets/img/shop/board-lock.png">
									</p>
								</c:if>
							</div>
							<img class="question-right"
								src="${pageContext.request.contextPath}/assets/img/shop/down-arrow.png">
						</div>
						<div class="col-md-12 ask-content-answer accordion_sub private-${ask.pbr_head}" id="private-${ask.pbr_head}">
							<div class="col-md-2 answer-left">
								<img
									src="${pageContext.request.contextPath}/assets/img/shop/answer-point.png">
							</div>
							<div class="answer-right">
								<c:if test="${ask.pbr_content eq null}">
									<p style="margin-bottom: 15px;" >
										<span class="answer-mark" style="background:#aaa;">WAITING</span>
									</p>
									<p class="answer-content">답변 대기중 입니다.</p>
								</c:if>
								<c:if test="${ask.pbr_content ne null}">
									<p style="margin-bottom: 15px;">
										<span class="answer-mark">답변완료</span> <span
										class="answer-date"><fmt:formatDate value="${ask.pbr_dateTime}" pattern="yy.MM.dd HH:mm:ss"/></span>
									</p>
									<p class="answer-content">${ask.pbr_content}</p>
								</c:if>
							</div>
						</div>
					</div>
					</c:if>
					<c:if test="${user_auth == 5}">
						<div class="col-md-12 ask-question-and-answer accordion_banner" data-private="${ask.pb_num}" >
						<div class="col-md-12 ask-content-question accordion_title">
							<div class="col-md-8 question-left">
								<p style="margin-bottom: 15px;">
									<c:if test="${ask.pbr_content eq null}"><span class="question-mark" style="background:#E89C0C;">답변대기</span></c:if>
									<c:if test="${ask.pbr_content ne null}"><span class="question-mark">질문</span></c:if>  <span
										class="question-date"><fmt:formatDate value="${ask.pb_dateTime}" pattern="yy.MM.dd HH:mm:ss"/></span> | <span
										class="question-nickName">${ask.pb_id} 님</span>
										<span class="question-buttons" style="margin-left:5px;">
											<input type="button" value="삭제" class="question-remove" onclick="location.href='#'">
										</span>	
								</p>
								<p>
									<span class="question-kind">[<c:if test="${ask.pb_lock==1 && (ask.pb_id!=user_id)}">비밀글:</c:if>${ask.pb_kind}]</span>
								<span class="question-content">${ask.pb_content} </span> 
								</p>
							</div>
							<img class="question-right"
								src="${pageContext.request.contextPath}/assets/img/shop/down-arrow.png">
						</div>
						<div class="col-md-12 ask-content-answer accordion_sub private-${ask.pbr_head}" id="private-${ask.pbr_head}">
							<div class="col-md-2 answer-left">
								<img
									src="${pageContext.request.contextPath}/assets/img/shop/answer-point.png">
							</div>
							<div class="answer-right">
								<c:if test="${ask.pbr_content eq null}">
									<input type="hidden" id="pbr_p_num_${ask.pb_num}" name="pbr_p_num_${ask.pb_num}" value="${product.p_num}">
									<input type="hidden" id="pbr_brand_num_${ask.pb_num}" name="pbr_brand_num_${ask.pb_num}"  value="${product.brand_num}">
									<input type="hidden" id="pbr_id_${ask.pb_num}" name="pbr_id_${ask.pb_num}"  value="${user_id}">
									<input type="hidden" id="pbr_head_${ask.pb_num}" name="pbr_head_${ask.pb_num}"  value="${ask.pb_num}">
									<span class="answer-mark" style="background:#aaa;">WAITING</span>
									<p class="add-edit-form">
										<textarea id="pbr_content_${ask.pb_num}" name="pbr_content_${ask.pb_num}" placeholder="답변 대기중인 문의글입니다."></textarea>
										<span class="letter-count">400/400</span>
									</p>
									<p style="margin-bottom: 15px;" class="question-buttons">
										<input type="button" value="답변등록" class="answer-add" data-private="${ask.pb_num}">
										<input type="button" value="수정" class="answer-edit" onclick="location.href='#'" data-private="${ask.pb_num}" >
									</p>
								</c:if>
								<c:if test="${ask.pbr_content ne null}">
									<p style="margin-bottom: 15px;" class="question-buttons">
										<span class="answer-mark">답변완료</span> <span
										class="answer-date"><fmt:formatDate value="${ask.pbr_dateTime}" pattern="yy.MM.dd HH:mm:ss"/></span>
										<c:if test="${user_id == 'admin'}">
											<input type="button" value="수정" class="question-remove" onclick="location.href='#'">
										</c:if>
									</p>
									<p class="answer-content">${ask.pbr_content}</p>
								</c:if>
							</div>
						</div>
					</div>
					</c:if>
					</c:forEach>
				</div>
				<div class="col-md-12 ask-content-end">
					${pagingHtml}
				</div>
			</div>
		</div>
		
		
		
		<%-- 리뷰 페이지 --%>

		<table class="table table-hover "
			style="margin-top: 130px; text-align: center;">
			<thead class="container-fluid">
				<tr class="row">
					<th style="color: #0e8ce4;" class="col-md-1">리뷰번호</th>
					<th style="color: #0e8ce4;" class="col-md-2">제품명</th>
					<th style="color: #0e8ce4;" class="col-md-4"
						style="margin-left:10px;">리뷰제목</th>
					<th style="color: #0e8ce4;" class="col-md-1">작성자</th>
					<th style="color: #0e8ce4;" class="col-md-3">리뷰작성일</th>
					<th style="color: #0e8ce4;" class="col-md-1">조회수</th>
				</tr>
			</thead>

			<tbody class="container-fluid">
				<tr class="row">
					<td class="td" class="col-md-1"></td>
					<td class="td name" class="col-md-2"></td>
					<%--  자바스크립트에서 페이지이동은 location.href="이동해야할 페이지명"; 으로 한다. --%>
					<td class="td" class="col-md-4"></td>
					<td class="td" class="col-md-1"></td>
					<td class="td" class="col-md-3"></td>
					<td class="td" class="col-md-1"></td>
				</tr>


			</tbody>

			<%-- 페이징 처리용 --%>
			<tfoot class="container-fluid">
				<tr class="row">
					<td class="col-md-3"></td>
					<td class="col-md-5">페이지</td>
					<td class="col-md-4" style="color: #0e8ce4;">현재[<span
						style="color: #FF6347;">${currentShowPageNo}</span>]페이지 /
						총[${totalPage}]페이지 &nbsp; 회원수 : 총 ${totaluserCount}명
					</td>
				</tr>
			</tfoot>

		</table>
		<%-- 리뷰페이지 끝 --%>
	</div>

</div>


<!-- New Product -->

<div class="viewed">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="viewed_title_container">
					<h3 class="viewed_title">New Product</h3>
					<div class="viewed_nav_container">
						<div class="viewed_nav viewed_prev">
							<i class="fas fa-chevron-left"></i>
						</div>
						<div class="viewed_nav viewed_next">
							<i class="fas fa-chevron-right"></i>
						</div>
					</div>
				</div>

				<div class="viewed_slider_container">

					<!-- Recently Viewed Slider -->

					<div class="owl-carousel owl-theme viewed_slider">

						<!-- Recently Viewed Item -->
						<div class="owl-item">
							<div
								class="viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="images/view_1.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">
										$225<span>$300</span>
									</div>
									<div class="viewed_name">
										<a href="#">Beoplay H7</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>

						<!-- Recently Viewed Item -->
						<div class="owl-item">
							<div
								class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="images/view_2.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">$379</div>
									<div class="viewed_name">
										<a href="#">LUNA Smartphone</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>

						<!-- Recently Viewed Item -->
						<div class="owl-item">
							<div
								class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="images/view_3.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">$225</div>
									<div class="viewed_name">
										<a href="#">Samsung J730F...</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>

						<!-- Recently Viewed Item -->
						<div class="owl-item">
							<div
								class="viewed_item is_new d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="images/view_4.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">$379</div>
									<div class="viewed_name">
										<a href="#">Huawei MediaPad...</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>

						<!-- Recently Viewed Item -->
						<div class="owl-item">
							<div
								class="viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="images/view_5.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">
										$225<span>$300</span>
									</div>
									<div class="viewed_name">
										<a href="#">Sony PS4 Slim</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>

						<!-- Recently Viewed Item -->
						<div class="owl-item">
							<div
								class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="images/view_6.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">$375</div>
									<div class="viewed_name">
										<a href="#">Speedlink...</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
<!-- contents end-->


<!-- ***** footer 시작 ***** -->
<jsp:include page="../footer.jsp"/>