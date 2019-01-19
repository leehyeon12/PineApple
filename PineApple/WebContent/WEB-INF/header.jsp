<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% String ctxPath = request.getContextPath(); %>

<script src="<%= ctxPath%>/js/jquery-3.3.1.min.js"></script>
<script src="<%= ctxPath%>/styles/bootstrap4/popper.js"></script>
<script src="<%= ctxPath%>/styles/bootstrap4/bootstrap.min.js"></script>
<script src="<%= ctxPath%>/plugins/greensock/TweenMax.min.js"></script>
<script src="<%= ctxPath%>/plugins/greensock/TimelineMax.min.js"></script>
<script src="<%= ctxPath%>/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="<%= ctxPath%>/plugins/greensock/animation.gsap.min.js"></script>
<script src="<%= ctxPath%>/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="<%= ctxPath%>/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="<%= ctxPath%>/plugins/slick-1.8.0/slick.js"></script>
<script src="<%= ctxPath%>/plugins/easing/easing.js"></script>
<script src="<%= ctxPath%>/js/custom.js"></script>

</head>

<body>
 <div class="super_container">	

  <!-- ***** header ***** -->	
  <header class="header">

   <!-- Top Bar -->
   <div class="top_bar">
    <div class="container">
     <div class="row">
      <div class="col d-flex flex-row">
	   <div class="top_bar_content ml-auto">
	    <div class="top_bar_user">
	   	
	    <!-- 로그인하지 않은 상태 -->				 
	    <c:if test="${loginuser == null}">
		 <div class="user_icon"><img src="<%= ctxPath%>/images/user.svg"></div>
		 <div class="header_after"><a href="<%= ctxPath%>/login.do">로그인</a></div>
		 <div class="header_after"><a href="<%= ctxPath%>/userRegister.do">회원가입</a></div>
		 <div><a href="#">고객센터</a></div>
	    </c:if>

	    <!-- 일반회원 -->
	    <c:if test="${loginuser != null && loginuser.uAuth == 0 && loginuser.status == 0}">
		 <div class="user_icon"><img src="images/user.svg" alt=""></div>
		 <div class="header_after">${loginuser.userid}님 환영합니다.</div>
		 <div class="header_after"><a href="<%= ctxPath%>/userInfo.do">마이페이지</a></div>
		 <div class="header_after"><a href="<%= ctxPath%>/logout.do">로그아웃</a></div>
		 <div><a href="#">고객센터</a></div>
	    </c:if>
	   
	    <!-- 관리자로 로그인 -->
	    <c:if test="${loginuser != null && loginuser.uAuth == 5 && loginuser.status == 0}">
		 <div class="user_icon" style="margin-right:12px;"><img src="<%= ctxPath%>/images/admin_icon.png" style="width:35px;" alt=""></div>
		 <div class="header_after"><a href="<%= ctxPath%>/login.do">관리자[${loginuser.userid}]로 로그인 중...</a></div>
		 <div class="header_after"><a href="<%= ctxPath%>/adminIndex.do">관리자페이지</a></div>
		 <div><a href="<%= ctxPath%>/logout.do">로그아웃</a></div>
	    </c:if>
	   
	    </div>
	   </div>
	  </div>
	 </div>
    </div>		
   </div>

   <!-- Header Main -->
   <div class="header_main">
	<div class="container">
     <div class="row">

	  <!-- Logo -->
	  <div class="col-lg-2 col-sm-3 col-3 order-1">
	   <div class="logo_container">
		<div class="logo"><a href="<%= ctxPath%>/index.do">PineApple</a></div>
	   </div>
	  </div>

	  <!-- Search -->
	  <div class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
	   <div class="header_search">
		<div class="header_search_content">
		 <div class="header_search_form_container">
		  <form action="#" class="header_search_form clearfix">
		   <input type="search" class="header_search_input" required="required" placeholder="Search for products...">
			<div class="custom_dropdown">
			 <div class="custom_dropdown_list">
			  <span class="custom_dropdown_placeholder clc" >전체</span>
			  <i class="fas fa-chevron-down"></i>
			  <ul class="custom_list clc">
			   <li><a class="clc" href="#">전체</a></li>
			   <li><a class="clc" href="#">데스크탑</a></li>
			   <li><a class="clc" href="#">노트북</a></li>
			   <li><a class="clc" href="#">주변기기</a></li>
			  </ul>
			 </div>
			</div>
		    <button type="submit" class="header_search_button trans_300" value="Submit"><img src="<%= ctxPath%>/images/search.png"></button>
		   </form>
		  </div>
		</div>
	   </div>
	  </div>

	  <!-- Wishlist -->
	   <div class="col-lg-4 col-9 order-lg-3 order-2 text-lg-left text-right">
		<div class="wishlist_cart d-flex flex-row align-items-center justify-content-end">
						
		 <!-- Cart -->
		 <div class="cart">
		  <div class="cart_container d-flex flex-row align-items-center justify-content-end">
		   <div class="">
			<img src="<%= ctxPath%>/images/cart.png" style="width: 35px;margin-right: 5px;padding-bottom: 5px;" alt="장바구니">
		   </div>
		   <div class="">
			<div class="cart_text"><a href="<%= ctxPath%>/cartList.do">장바구니</a></div>
		   </div>
		  </div>
		 </div>
		</div>
	   </div>
	  </div>
	 </div>
	</div>
	
	<!-- Main Navigation -->
	<nav class="main_nav">
	 <div class="container">
	  <div class="row">
	   <div class="col">
		<div class="main_nav_content d-flex flex-row">
		
		<!-- Categories Menu -->
		<div class="cat_menu_container">
		 <div class="cat_menu_title d-flex flex-row align-items-center justify-content-start">
		  <div class="cat_burger"><span></span><span></span><span></span></div>
		  <div class="cat_menu_text">카테고리</div>
		 </div>

		 <ul class="cat_menu">
		  <li><a href="<%= ctxPath%>/prodList.do">컴퓨터 <i class="fas fa-chevron-right ml-auto"></i></a></li>
		  <li><a href="#">노트북<i class="fas fa-chevron-right"></i></a></li>
		  <li><a href="#">모니터<i class="fas fa-chevron-right"></i></a></li>
		  <li><a href="#">주변기기<i class="fas fa-chevron-right"></i></a></li>
		 </ul>
		</div>
		
		<!-- Main Nav Menu -->
		<div class="main_nav_menu ml-auto">
		 <ul class="standard_dropdown main_nav_dropdown">				
		  <li class="hassubs">
		   <a href="#">베스트 셀러<i class=""></i></a>
		  </li>
		  <li class="hassubs">
		   <a href="#">HIT 상품<i class=""></i></a>
		  </li>
		  <li><a href="">NEW 제품<i class=""></i></a></li>
		  <li class="hassubs">
		   <a href="#">전체<i class=""></i></a>
		  </li>
		  <li><a href="">제품 리뷰<i class=""></i></a></li>
		 </ul>
	    </div>

		<!-- Menu Trigger -->
		 <div class="menu_trigger_container ml-auto">
		  <div class="menu_trigger d-flex flex-row align-items-center justify-content-end">
		   <div class="menu_burger">
			<div class="menu_trigger_text">menu</div>
			<div class="cat_burger menu_burger_inner"><span></span><span></span><span></span></div>
		   </div>
		  </div>
         </div>
	    </div>
	   </div>
	  </div>
	 </div>
	</nav>
	
	<!-- Menu -->
	<div class="page_menu">
	 <div class="container">
	  <div class="row">
	   <div class="col">	
	    <div class="page_menu_content">
		 <div class="page_menu_search">
		  <form action="#">
		   <input type="search" required="required" class="page_menu_search_input" placeholder="Search for products...">
		  </form>
		 </div>
		<ul class="page_menu_nav">
		 <li class="page_menu_item">
		  <a href="#">베스트 셀러<i class="fa fa-angle-down"></i></a>
		 </li>
		 <li class="page_menu_item">
		  <a href="#">HIT 상품<i class="fa fa-angle-down"></i></a>
		 </li>
		 <li class="page_menu_item">
		  <a href="#">NEW 제품<i class="fa fa-angle-down"></i></a>
		 </li>
		 <li class="page_menu_item">
		  <a href="#">제품 리뷰<i class="fa fa-angle-down"></i></a>
		 </li>
		 <li class="page_menu_item"><a href="blog.html">고객 문의<i class="fa fa-angle-down"></i></a></li>
		</ul>
	   </div>
	  </div>
	 </div>
	</div>
   </div>
  
  </header>