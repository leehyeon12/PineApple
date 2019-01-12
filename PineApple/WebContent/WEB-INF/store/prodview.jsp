<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
		.spec th{padding:4px;
				 font-size:12px;LETTER-SPACING: -1px;FONT-FAMILY: 돋움;
				 width:25%;
				 height:38px;
				 background:#b3e0ff;
				 text-align: center;}
			 
		.spec td{
			padding:4px;font-size:12px;LETTER-SPACING: -1px;FONT-FAMILY: 돋움;
			width:75%;
			height:38px;
			background:white;
			text-align:left;
		}
		div.section > div {width:100%;display:inline-flex;}
		div.section > div > input {margin:0;padding-left:5px;font-size:10px;padding-right:5px;max-width:18%;text-align:center;}
		.attr,.attr2{cursor:pointer;margin-right:5px;height:20px;font-size:13px;padding:2px;border:1px solid gray;border-radius:2px;}
		.active{ border:1px solid orange;}
	
	</style>
	
	<script>
		$(document).ready(function(){
		    //-- Click on detail
		    $("ul.menu-items > li").on("click",function(){
		        $("ul.menu-items > li").removeClass("active");
		        $(this).addClass("active");
		    })
		
		    $(".attr.color").on("click",function(){
		        $(".attr.color").removeClass("active");
		        $(this).addClass("active");
		        if($(this).is(".color")){
		        	var color = $(this).attr('style');
		        	color = color.substring(color.indexOf('#'),color.length-1);
		        	$("#color").val(color);
		        }
		       
		    })
		    $(".attr2.ram").on("click",function(){
		
		        $(".attr2.ram").removeClass("active");
		        $(this).addClass("active");
		       
		        if($(this).is(".ram")){
		        	var ram = $(this).text();
		        	$("#ram").val(ram);
		        	console.log("ram:"+ram);	
		        }
		    })
		     $(".attr2.HDD, .attr2.SSD").on("click",function(){
		
		        $(".attr2.HDD, .attr2.SSD").removeClass("active");
		        $(this).addClass("active");
		       
		        if($(this).is(".HDD")){
		        	var disk = $(this).text();
		        	$("#disk").val("HDD"+disk);
		        	console.log("disk:"+disk);
		        }else{
		        	var disk = $(this).text();
		        	$("#disk").val("SSD"+disk);
		        	console.log("disk:"+disk);
		        }
		    })
		
		    //-- Click on QUANTITY
		    $(".btn-minus").on("click",function(){
		        var now = $(".section > div > input").val();
		        if ($.isNumeric(now)){
		            if (parseInt(now) -1 > 0){ now--;}
		            $(".section > div > input").val(now);
		        }else{
		            $(".section > div > input").val("1");
		        }
		    })            
		    $(".btn-plus").on("click",function(){
		        var now = $(".section > div > input").val();
		        if ($.isNumeric(now)){
		            $(".section > div > input").val(parseInt(now)+1);
		        }else{
		            $(".section > div > input").val("1");
		        }
		    })                        
		}) 
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
								${productDetail[0].content}
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
	
	
			<%-- /.row --%>
	
			
			<%-- 상세스펙 시작--%>
			<div class="container" style="margin-left:0px;">
				<h3 class="product_name clearfix" valign="bottom" style=" font-weight:bold; margin-top:30px;  ">상세스펙</h3>
				<div class="row clearfix">
					
					
						<table class="col-md-6 col-sm-6 mb-6 spec" style="border-top:1px solid #0099ff; border-bottom:1px solid #1aa3ff">
							<tr>
								<th>제품명</th>
								<td>이거</td>
							</tr>
							<tr>
								<th>CPU</th>
								<td>저거</td>
							</tr>
							<tr>
								<th>메인보드</th>
								<td>그거</td>
							</tr>
							<tr>
								<th>파워</th>
								<td>이건?</td>
							</tr>
							<tr>
								<th>케이스</th>
								<td>요것!</td>
							</tr>
							<tr>
								<th>운영체제</th>
								<td>윈도우일까?</td>
							</tr>
	
						</table>
					
				</div>
			</div>
			<%-- 상세스펙 끝 --%>
			
			<div class="container">
				<div class="row clearfix">
	
					<!-- Related Projects Row -->
					<h3 class="my-4">Related Projects</h3>
	
					<div class="row">
	
						<div class="col-md-3 col-sm-6 mb-4">
							<a href="#"> <img class="img-fluid"
								src="http://placehold.it/500x300" alt="">
							</a>
						</div>
	
						<div class="col-md-3 col-sm-6 mb-4">
							<a href="#"> <img class="img-fluid"
								src="http://placehold.it/500x300" alt="">
							</a>
						</div>
	
						<div class="col-md-3 col-sm-6 mb-4">
							<a href="#"> <img class="img-fluid"
								src="http://placehold.it/500x300" alt="">
							</a>
						</div>
	
						<div class="col-md-3 col-sm-6 mb-4">
							<a href="#"> <img class="img-fluid"
								src="http://placehold.it/500x300" alt="">
							</a>
						</div>
	
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