<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
	
	<!-- ***** footer ***** -->	
	<footer class="footer">
		<div class="container">
			<div class="row">

				<div class="col-lg-3 footer_col">
					<div class="footer_column footer_contact">
						<div class="logo_container">
							<div class="logo"><a href="<%= ctxPath%>/index.do">PineApple</a></div>
						</div>
						<div class="footer_contact_text">
							<p>서울 중구 남대문로 120 대일빌딩 3층</p>
						</div>
						<div class="footer_social">
							<ul>
								<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
								<li><a href="#"><i class="fab fa-twitter"></i></a></li>
								<li><a href="#"><i class="fab fa-youtube"></i></a></li>
								<li><a href="#"><i class="fab fa-google"></i></a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-2 offset-lg-2">
					<div class="footer_column">
						<div class="footer_title">바로가기</div>
						<ul class="footer_list">
							<li><a href="#">데스크탑</a></li>
							<li><a href="#">노트북</a></li>
							<li><a href="#">모니터</a></li>
							<li><a href="#">주변기기</a></li>
						</ul>
					</div>
				</div>

				<div class="col-lg-2">
					<div class="footer_column">
						<div class="footer_title">빨리찾기</div>
						<ul class="footer_list footer_list_2">
							<li><a href="#">베스트 셀러<i class=""></i></a></li>
							<li><a href="#">HIT 상품<i class=""></i></a></li>
							<li><a href="">NEW 제품<i class=""></i></a></li>
						</ul>
					</div>
				</div>

				<div class="col-lg-2">
					<div class="footer_column">
						<div class="footer_title">고객기능</div>
						<ul class="footer_list">
							<li><a href="<%= ctxPath%>/login.do">로그인</a></li>
							<li><a href="<%= ctxPath%>/userRegister.do">회원가입</a></li>
							<li><a href="<%= ctxPath%>/cartList.do">장바구니</a></li>
							<li><a href="#">리뷰</a></li>
							<li><a href="#">고객센터</a></li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</footer>

	<!-- Copyright -->
	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col">
					
					<div class="copyright_container d-flex flex-sm-row flex-column align-items-center justify-content-start">
						<div class="copyright_content"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</div>
						<div class="logos ml-sm-auto">
							<ul class="logos_list">
								<li><a href="#"><img src="<%= ctxPath%>/images/logos_1.png"></a></li>
								<li><a href="#"><img src="<%= ctxPath%>/images/logos_2.png"></a></li>
								<li><a href="#"><img src="<%= ctxPath%>/images/logos_3.png"></a></li>
								<li><a href="#"><img src="<%= ctxPath%>/images/logos_4.png"></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


</body>

</html>