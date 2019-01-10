<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<!-- ***** head 시작 ***** -->
<jsp:include page="head.jsp"/>

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/styles/responsive.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/styles/admin_styles.css">

<!-- ***** header 시작 ***** -->
<jsp:include page="header.jsp"/>

<div class="container" style="padding-bottom:60px;">
         <div>
            <span id="title">ADMIN PAGE</span>
         </div>
         <div style="text-align: center; width: 100%;">
            <span id="mypage_content">
               <ul id="mypage_main_info">
                  <li>관리자님 환영합니다!</li>
               </ul>
            </span>
         </div>
         
         <div>
            <div id="myshopMain">
         <div class="shopMain profile">
            <h3><a href="<%= ctxPath%>/admin/userList.do">profile</a></h3>
            <p><a href="<%= ctxPath%>/admin/userList.do"><span>회원관리<br>--------------------</span>고객들의 개인 정보를<br>관리하는 공간입니다.<br/></a></p>
         </div><div class="shopMain menu">
            <h3><a href="<%= ctxPath%>/admin/productRegister.do">menu</a></h3>
            <p><a href="<%= ctxPath%>/admin/productRegister.do"><span>메뉴관리<br>--------------------</span>혼밥남녀 메뉴를<br>관리하는 공간입니다.<br/></a></p>
         </div>
         <div class="shopMain order">
             <h3><a href="<%= ctxPath%>/order/orderList.do">order</a></h3>
             <p><a href="<%= ctxPath%>/order/orderList.do"><span>주문 관리<br>--------------------</span>고객들의 주문내역을<br> 확인하실 수 있습니다. </a></p>
         </div>
         <div class="shopMain board">
            <h3><a href="<%= ctxPath%>/board/admin_notice.do">board</a></h3>
            <p><a href="<%= ctxPath%>/board/admin_notice.do"><span>게시글 관리<br>--------------------</span>고객들의 이용후기, 이벤트, 공지사항을<br>관리하는 공간입니다.<br/></a></p>
         </div>
      </div>

         </div>
      </div>
      
<!-- ***** footer 시작 ***** -->
<jsp:include page="footer.jsp"/>