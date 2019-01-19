<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ***** head 시작 ***** -->	
<jsp:include page="../head.jsp"/>

<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" >
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="styles/shop_styles.css">
<link rel="stylesheet" type="text/css" href="styles/shop_responsive.css">
<link rel="stylesheet" href="styles/rSlider.min.css">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="js/rSlider.min.js"></script>

<style>
	.active {
		color: orange;
	}
</style>

<script>
	$(document).ready(function() {

		$(".categories").on("click", function() {
			if ($(this).attr("class") == "categories active") {
				$(this).removeClass("active");
				
			} else {
				$(this).addClass("active");
				//console.log($(this).attr("class"));
			}

		});
		
		
		$(".color").on("click", function() {

			if ($(this).attr("class") == "color active") {
				$(this).removeClass("active");
				$(this).css("border","1px solid black");
				
			} else {
				$(this).addClass("active");
				$(this).css("border","1px solid Lime");
				//console.log($(this).attr("class"));
			}
		});
		
		
		
		$(".brand").on("click", function() {

			if ($(this).attr("class") == "brand active") {
				$(this).removeClass("active");
				
			} else {
				$(this).addClass("active");
				//console.log($(this).attr("class"));
			}
		})

		

		
	});
	
	 (function () {
         'use strict';

         var init = function () {                

             var slider = new rSlider({
                 target: '#slider',
                 values: [0, 10, 20, 30, 40, 50, 60, 70,80,90,100],     
                 range: true,
                 set: [30, 60],
                 width:    180,
                 scale:    false,
                 labels: false,

                 onChange: function (vals) {
                    // console.log(vals);
                 }
             });
         };
         window.onload = init;
     })();

	function goSearch() {
		
		var categories = "";
		$(".categories").each(function(){
			var classes = $(this).attr("class");
			
			if(classes == "categories active"){
				categories += $(this).val() +",";
			}
		});
		$("#category").val(categories.substring(0,categories.length-1));
		console.log("category:"+categories.substring(0,categories.length-1));
		
		//카테고리코드(ex]100000),카테고리코드,카테고리코드 으로 들어가니까 java단에서 받아서 분리시켜줄 필요가 있음
	
		var colors = "";
		$(".color").each(function(){
			var classes = $(this).attr("class");
			//console.log("classes:"+classes);
			if(classes == "color active"){
				colors += $(this).attr("value") +",";
			}
		});
		$("#color").val(colors.substring(0,colors.length-1));
		console.log("color: "+colors.substring(0,colors.length-1));
		//컬러코드,컬러코드,컬러코드 으로 들어가니까 java단에서 받아서 분리시켜줄 필요가 있음
		
		var companies = "";
		$(".brand").each(function(){
			var classes = $(this).attr("class");
			
			if(classes == "brand active"){
				companies += $(this).text() +",";
			}
		});
		$("#company").val(companies.substring(0,companies.length-1));
		console.log("company:"+companies.substring(0,companies.length-1));
		//회사명,회사명,회사명 으로 들어가니까 java단에서 받아서 분리시켜줄 필요가 있음
	
		console.log("price:"+$("#slider").val());
		//가격최소값,가격최대값 으로 나온다. ex) 30,60
		
		var str = $("#slider").val();
		var res=str.split(",");
		$("#minPrice").val(res[0]);
		$("#maxPrice").val(res[1]);
		console.log("minprice:"+$("#minPrice").val());
		console.log("maxprice:"+$("#maxPrice").val());
		//가격 최소값 minPrice, 가격 최대값 maxPrice input태그로 으로 나눠서 넣어놓았으므로 
		//java 단에서 받을때 minPrice, maxPrice 로 받으면 됨
		
		
		
		/* var frm = document.sidebar;
		frm.method="GET";
		frm.action ="";
		frm.submit(); */
		
		$.ajax({
			
			url:""
			
			
		});
	}
	
	
</script>

<!-- ***** header 시작 ***** -->
<jsp:include page="../header.jsp"/>


<!-- Home -->
<div class="home">
	<div class="home_background parallax-window" data-parallax="scroll"
		data-image-src="images/shop_background.jpg"></div>
	<div class="home_overlay"></div>
	<div
		class="home_content d-flex flex-column align-items-center justify-content-center">
		<h2 class="home_title">Computer & Laptop</h2>
	</div>
</div>

<!-- Shop -->

<div class="shop">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">

				<!-- Shop Sidebar -->
				<div class="shop_sidebar">
					<form name="sidebar">
						<div class="sidebar_section">
							<div class="sidebar_title">Categories</div>
							<ul class="sidebar_categories">
								<li class="categories" value="100000" style="cursor: pointer;">Computers</li>
								<li class="categories" value="200000" style="cursor: pointer;">Laptops</li>
								<li class="categories" value="300000" style="cursor: pointer;">Monitor</li>
								<li class="categories" value="400000" style="cursor: pointer;">Gadget</li>
							</ul>
							<input type="hidden" name="category" id="category" />
						</div>
						<div class="sidebar_section filter_by_section">
							<div class="sidebar_title">Filter By</div>
							<div class="sidebar_subtitle">Price</div>
							<div class="filter_price">
								<br/>
							
								<div class="slider-container">
									<input type="text" name="price" id="slider" class="slider" value=""/>
									<input type="hidden" name="minPrice" id="minPrice"/>
									<input type="hidden" name="maxPrice" id="maxPrice"/>
        						</div>
							</div>
						</div>
						<div class="sidebar_section">
							<div class="sidebar_subtitle color_subtitle">Color</div>
							<ul class="colors_list">
								<li class="color" value="#000000" style="background: #000000; border: solid 1px #000000;"><a style="cursor:pointer;"></a></li>
								<li class="color" value="#999999" style="background: #999999; border: solid 1px #000000;"><a style="cursor:pointer;"></a></li>
								<li class="color" value="#0e8ce4" style="background: #0e8ce4; border: solid 1px #000000;"><a style="cursor:pointer;"></a></li>
								<li class="color" value="#df3b3b" style="background: #df3b3b; border: solid 1px #000000;"><a style="cursor:pointer;"></a></li>
								<li class="color" value="#ffffff" style="background: #ffffff; border: solid 1px #000000;"><a style="cursor:pointer;"></a></li>
							</ul>
							<input type="hidden" id="color" name="color" />
						</div>
						
						<div class="sidebar_section">
							<div class="sidebar_subtitle brands_subtitle">Brands</div>
							<ul class="brands_list">
								<li class="brand" style="cursor:pointer;">Apple</li>
								<li class="brand" style="cursor:pointer;">Beoplay</li>
								<li class="brand" style="cursor:pointer;">Google</li>
								<li class="brand" style="cursor:pointer;">Meizu</li>
								<li class="brand" style="cursor:pointer;">OnePlus</li>
								<li class="brand" style="cursor:pointer;">Samsung</li>
								<li class="brand" style="cursor:pointer;">Sony</li>
								<li class="brand" style="cursor:pointer;">Xiaomi</li>
							</ul>
							<input type="hidden" id="company" name="company"/>
						</div>
						<div id="div_btnFind" align="center">
							<button type="button" class="btn btn-success" id="btnFind"
								onClick="goSearch();"
								style="background-color: #3385ff; cursor: pointer;">찾기</button>
						</div>
					</form>
				</div>

			</div>

			<div class="col-lg-9">

				<!-- Shop Content -->

				<div class="shop_content">
					<div class="shop_bar clearfix">
						<div class="shop_product_count">
							<span>186</span> products found
						</div>
						<div class="shop_sorting">
							<span>Sort by:</span>
							<ul>
								<li><span class="sorting_text">highest rated<i
										class="fas fa-chevron-down"></span></i>
									<ul>
										<li class="shop_sorting_button"
											data-isotope-option='{ "sortBy": "original-order" }'>highest
											rated</li>
										<li class="shop_sorting_button"
											data-isotope-option='{ "sortBy": "name" }'>name</li>
										<li class="shop_sorting_button"
											data-isotope-option='{ "sortBy": "price" }'>price</li>
									</ul></li>
							</ul>
						</div>
					</div>
					<c:forEach var="svo" items="${productList}">
						<div style="margin-top: 20px;">
							<div class="row">
								<div class="col-md-5">
									<a href="prodView.do?idx=${svo.idx}"><img class="img-fluid rounded mb-3 mb-md-0"
										src="/SEMI/images/${svo.image1}" alt=""
										style="width: 300px; height: 200px;">
									</a>
								</div>
								<div class="col-md-7">
								<a href="prodView.do?idx=${svo.idx}">
									<h3>${svo.name}</h3>
								</a>
									<p>${svo.content}</p>
									<h5>${svo.price}</h5>
									<p>${pvo.saleprice}</p>
									<a class="btn btn-primary" href="#">장바구니</a> <a
										class="btn btn-primary" href="#">구매하기</a>
								</div>
							</div>
						</div>
					</c:forEach>
					
					<!-- Shop Page Navigation -->

					<div class="shop_page_nav d-flex flex-row">
						<div
							class="page_prev d-flex flex-column align-items-center justify-content-center">
							<i class="fas fa-chevron-left"></i>
						</div>
						<ul class="page_nav d-flex flex-row">
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">...</a></li>
							<li><a href="#">21</a></li>
						</ul>
						<div
							class="page_next d-flex flex-column align-items-center justify-content-center">
							<i class="fas fa-chevron-right"></i>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
</div>

<!-- Recently Viewed -->

<div class="viewed">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="viewed_title_container">
					<h3 class="viewed_title">Recently Viewed</h3>
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

<!-- Brands -->

<div class="brands">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="brands_slider_container">

					<!-- Brands Slider -->

					<div class="owl-carousel owl-theme brands_slider">

						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="images/brands_1.jpg" alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="images/brands_2.jpg" alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="images/brands_3.jpg" alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="images/brands_4.jpg" alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="images/brands_5.jpg" alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="images/brands_6.jpg" alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="images/brands_7.jpg" alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="images/brands_8.jpg" alt="">
							</div>
						</div>

					</div>

					<!-- Brands Slider Navigation -->
					<div class="brands_nav brands_prev">
						<i class="fas fa-chevron-left"></i>
					</div>
					<div class="brands_nav brands_next">
						<i class="fas fa-chevron-right"></i>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
				
<!-- ***** footer 시작 ***** -->
<jsp:include page="../footer.jsp"/>
