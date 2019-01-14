<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- ***** head 시작 ***** -->   
<jsp:include page="../head.jsp"/>


<link rel="stylesheet" type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="styles/cart_styles.css">
<link rel="stylesheet" type="text/css" href="styles/cart_responsive.css">
<style>
input[type="submit"], button {
    border: 0;
    padding: 0;
    box-shadow: none;
    cursor: pointer;
}

.hide {display:none;}
 
.title_box {
   overflow: hidden;
   height: 105px;
   margin-bottom: 40px;
   border-radius: 5px;
   z-index: 0;
   background: #e4f1fc url(https://www.oliveyoung.co.kr/pc-static-root/image/top/bg_benefit_top.png) no-repeat 50% 0;
}

.title_box h1 {
    float: left;
    padding: 37px 0 0;
    font-size: 40px;
    color: #000;
    line-height: 40px;
}

.title_box h1 > span {
    display: inline-block;
    width: 36px;
    height: 36px;
    line-height: 36px;
    font-size: 16px;
    color: #fff;
    background: #ff2828;
    border-radius: 18px;
    text-align: center;
    vertical-align: 10px;
}

.tx_num {
    letter-spacing: -0.02em !important;
    font-weight: 700;
}

.title_box .step_list {
    float: right;
}

.title_box .step_list > li.on {
    color: #000;
    background: url(https://www.oliveyoung.co.kr/pc-static-root/image/comm/bg_step_on.png) no-repeat 100% 50%;
}

.title_box .step_list > li {
    float: left;
    height: 120px;
    padding: 0 30px 0 20px;
    line-height: 120px;
    text-align: center;
    font-size: 24px;
    color: #8b8176;
    background: url(https://www.oliveyoung.co.kr/pc-static-root/image/comm/bg_step.png) no-repeat 100% 50%;
    white-space: nowrap;
}

.title_box .step_list > li .step_num {
    display: inline-block;
    margin-right: 5px;
    font-size: 20px;
    color: #8b8176;
    vertical-align: top;
}

.title_box .step_list > li.last {
    background: none;
    padding-right: 0;
}

.title_box .step_list > li .step_num:before {
    content: '0';
}

.title_box .step_list:after {
    content: '';
    display: block;
    clear: both;
}

.tbl_prd_list {
    width: 100%;
}

.tbl_prd_list thead th {
    height: 40px;
    border-top: 2px solid #d6d6d6;
    border-bottom: 1px solid #ccc;
    background: #fafafa;
}

th {
    font-weight: bold;
    text-align: center;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

input {
    width: 100%;
    height: 38px;
    margin: 0;
    padding: 0;
    border: 1px solid #d0d0d0;
    color: #888;
    background: none;
    border-radius: 5px;
    border-radius: 5px;
    -ms-border-radius: 5px;
    -webkit-border-radius: 5px;
    -o-border-radius: 5px;
    -moz-border-radius: 5px;
    /* outline: none; */
    box-shadow: none;
    -webkit-appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    letter-spacing: 0.5px;
    vertical-align: top;
}

.tbl_prd_list tbody td {
    border-bottom: 1px solid #e6e6e6;
    text-align: center;
}

.tbl_prd_list .tbl_cont_area {
    display: table-row;
}

.tbl_prd_list .tbl_cont_area .tbl_cell {
    display: table-cell;
    vertical-align: middle;
}

.tbl_prd_list .tbl_cont_area .tbl_cell.w150 {
    width: 150px;
    border-left: 1px solid #e6e6e6;
}

.tbl_prd_list thead th input[type="checkbox"], .tbl_prd_list tbody td input[type="checkbox"] {
    width: 12px;
    height: 12px;
    margin: 0 auto;
    background: none;
    -webkit-appearance: checkbox;
    -webkit-appearance: checkbox;
    vertical-align: middle;
}

.tbl_prd_list tbody td .prd_delivery {
    color: #666;
    font-size: 12px;
}

.tbl_prd_list tbody td .prd_delivery strong {
    display: block;
    color: #222;
    font-size: 14px;
}

.tbl_prd_list tbody td .prd_delivery .ex {
    display: block;
    color: #666;
    font-size: 12px;
    font-weight: normal;
}

.tbl_prd_list tbody td .prd_info {
    display: inline;
    position: relative;
    height: 145px;
    padding: 30px 30px 30px 110px;
    border-left: 0;
    text-align: left;
    vertical-align: middle;
}

.tbl_prd_list tbody td .prd_info .prd_img {
    position: absolute;
    top: 50%;
    left: 0;
    width: 125px;
    height: 85px;
    margin-top: -42px;
    text-align: center;
}

#cart_prodImg {
    width: auto !important;
    max-width: 85px;
    height: auto !important;
    max-height: 85px;
}

.tbl_prd_list tbody td .prd_info .prd_name {
    display: inline-block;
    margin-bottom: 5px;
    padding-top: 25px;
    padding-bottom: 10px;
}

.tbl_prd_list tbody td .prd_info .prd_name > span {
    display: block;
    margin-bottom: 4px;
    color: #777;
    font-weight: 700;
}

.tbl_prd_list tbody td .prd_info .prd_name > p {
    overflow: hidden;
    max-height: 36px;
    -webkit-box-orient: vertical;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    word-break: normal;
    font-size: 14px;
    line-height: 18px;
    color: #000;
}

.tbl_prd_list tbody td .prd_info .prd_opt {
    margin-bottom: 5px;
    color: #888;
    font-size: 12px;
    font-weight: 700;
}

.prd_flag {
    overflow: hidden;
}

.tbl_prd_list tbody td .prd_cnt {
    width: 60px;
    margin: 0 auto;
}

.tbl_prd_list tbody td .org_price {
    display: block;
    font-size: 12px;
    color: #b5b5b5;
    text-decoration: line-through;
}

.tbl_prd_list tbody td .pur_price {
    display: block;
    color: #0e8ce4;
    font-weight: 700;
}

.tbl_prd_list tbody td .cur_price {
    display: block;
    color: #222;
    font-weight: 700;
}

.tbl_prd_list tbody td .prd_cnt+button {
    width: 60px;
    margin: 5px 0 0;
}

.tbl_prd_list tbody td .prd_cnt select {
    width: 60px;
    height: 28px;
    padding: 0 0 0 10px;
    border-color: #ccc;
    font-size: 12px;
}

.btnSmall {
    height: 28px;
    padding: 0 5px;
    font-size: 12px !important;
    line-height: 28px;
    border-radius: 5px;
}

.btnSmall > span {
    display: inline-block;
    min-width: 40px;
}

.tbl_prd_list tbody td .btn_group .btnSmall {
    width: 109px;
    margin-bottom: 5px;
}

.tbl_prd_list tbody td .btn_group .btnSmall.delete {
    padding-left: 18px;
    background: url(https://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_btn_del.png) no-repeat 35px 8px;
}

.btnMedium.wGreen, .btnSmall.wGreen {
    border: 1px solid #0e8ce4;
    color: #0e8ce4;
    background: #fff;
}

.btnMedium.wGray, .btnSmall.wGray {
    border: 1px solid #aaa;
    color: #666;
    background: #fff;
}

a {
    color: #666;
    text-decoration: none;
}

.basket_price_info {
    overflow: hidden;
    margin: 10px 0 0;
}

.basket_price_info .btn_area {
    float: left;
    width: 300px;
}

.btnSmall.type2 {
    padding: 0 15px;
}

.basket_price_info .sum_price {
    float: right;
    width: 700px;
    margin: 5px 0 0;
    color: #222;
    line-height: 18px;
    text-align: right;
}

.basket_price_info .sum_price .tx_num {
    margin-right: 1px;
}

.basket_price_info .sum_price .tx_sign {
    margin: 0 5px;
}

.tx_sign.minus {
    background-position: 0 50%;
}

.tx_sign.plus {
    background-position: -20px 50%;
}

.tx_sign.equal {
    background-position: -40px 50%;
}

.tx_sign2.minus {
    background-position: 0 0;
}

.tx_sign2.plus {
    background-position: -30px 0;
}

.tx_sign2 {
    display: inline-block;
    width: 30px;
    height: 30px;
    background: url(https://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_sign_cal2.png) no-repeat 0 0;
    text-indent: -9999px;
    overflow: hidden;
}

.basket_price_info .sum_price .tx_total_price {
    font-size: 16px;
}

.basket_price_info .sum_price .tx_total_price .tx_price {
    color: #0e8ce4;
}

.basket_price_info .sum_price .tx_total_price .tx_num {
    font-size: 18px;
}

.tx_sign {
    display: inline-block;
    width: 10px;
    height: 10px;
    background: url(https://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_sign_cal.png) no-repeat 0 0;
    text-indent: -9999px;
    overflow: hidden;
    text-align: left;
}

.total_price_info {
    margin: 60px 0 0;
    border-top: 2px solid #0e8ce4;
    border-bottom: 1px solid #e6e6e6;
}

.total_price_info .detail_price {
    position: relative;
    overflow: hidden;
    width: 100%;
    height: 110px;
    font-weight: 700;
}

.total_price_info .detail_price > p:first-child {
    border-left: 1px solid #efefef;
}

.total_price_info .detail_price > p {
    float: left;
    width: 340px;
    height: 110px;
    padding: 20px 0 0;
    text-align: center;
    font-size: 16px;
    color: #666;
    border-right: 1px solid #efefef;
}

.total_price_info .detail_price .tx_sign2 {
    position: absolute;
    margin: -15px 0 0 -15px;
}

.total_price_info .detail_price .tx_sign2.plus {
    top: 50%;
    left: 680px;
}

.total_price_info .detail_price .tx_sign2.minus {
    top: 50%;
    left: 340px;
}



.total_price_info .detail_price > p > span {
    display: block;
    color: #222;
    margin-top: 10px;
}

.total_price_info .detail_price > p.tx_sale > span {
    color: #0e8ce4;
}

.total_price_info .detail_price > p > span {
    display: block;
    color: #222;
    margin-top: 10px;
}

.total_price_info .detail_price > p .tx_num {
    font-size: 24px;
    margin-right: 2px;
    vertical-align: -2px;
}

.total_price_info .sum_price {
    height: 80px;
    padding: 30px 30px 0;
    text-align: right;
    background: #f6f6f6;
    border-top: 2px solid #d6d6d6;
    font-size: 22px;
    color: #222;
    font-weight: 700;
    position: relative;
}

.total_price_info .sum_price .tx_text {
    position: absolute;
    top: 50%;
    left: 30px;
    height: 30px;
    margin-top: -11px;
    color: #888;
    font-size: 14px;
    line-height: 22px;
}

.total_price_info .sum_price .tx_num {
    margin-left: 10px;
    font-size: 26px;
    margin-right: 2px;
    vertical-align: -2px;
}

.total_price_info .sum_price .tx_text:before {
    content: '';
    display: inline-block;
    width: 22px;
    height: 22px;
    margin: 0 7px 2px 0;
    background: url(https://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_arrow_01.gif) no-repeat;
    vertical-align: middle;
}

.total_price_info .sum_price .tx_price {
    color: #ff2828;
    font-size: 16px;
}

.order_btn_area {
    margin: 30px 0 0;
    text-align: center;
}

.order_btn_area.order_cart button {
    width: 180px;
}

.order_btn_area button {
    width: 130px;
    font-size: 16px;
}

.btnOrangeW, a.btnOrangeW {
    width: 100%;
    height: 50px;
    background-color: #fff;
    border: 1px solid #0e8ce4;
    padding: 11px 0 9px;
    font-size: 16px;
    line-height: 28px;
    color: #0e8ce4;
    border-radius: 5px;
}

.btnOrange, a.btnOrange {
    width: 100%;
    height: 50px;
    background-color: #0e8ce4;
    padding: 11px 0 9px;
    font-size: 18px;
    line-height: 30px;
   border-radius: 5px;
}

.order_btn_area button+button {
    margin-left: 7px;
}

.order_btn_area button {
    width: 130px;
    font-size: 16px;
}

.cart_comment {
    margin-top: 30px;
    padding: 20px 0;
    border-top: 1px solid #CCC;
}

.cart_comment p {
    font-size: 12px;
    color: #888;
    text-align: center;
    font-weight: 700;
}





</style>
<!-- ***** header 시작 ***** -->
<jsp:include page="../header.jsp"/>

<body>
<!-- Cart -->

   <div class="cart_section">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 ">
               <div class="cart_container">
                  <div class="title_box">
                     <h1>장바구니 
                        <span class="tx_num">1</span>
                     </h1>
                     <ul class="step_list">
                        <li class="on"><span class="hide">현재단계</span><span class="step_num tx_num">1</span> 장바구니</li><!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
                        <li><span class="step_num tx_num">2</span> 주문/결제</li>
                        <li class="last"><span class="step_num tx_num">3 </span> 주문완료</li>
                     </ul>
                  </div>
                  
                  <table class="tbl_prd_list">
                     <colgroup>
                        <col style="width:40px">
                        <col style="width:*">
                        <col style="width:110px">
                        <col style="width:100px">
                        <col style="width:110px">               
                        <col style="width:120px"><!-- 2017-01-13 수정 -->
                        <col style="width:150px">
                     </colgroup>
                     <thead>
                     <tr>
                        <th scope="col"><input type="checkbox" id="inp_allRe1" name="" value=""></th>
                        <th scope="col">상품정보</th>
                        <th scope="col">판매가</th>
                        <th scope="col">수량</th>
                        <th scope="col">구매가</th>               
                        <th scope="col">배송정보</th>
                        <th scope="col">선택</th>               
                     </tr>
                     </thead>
                     <tbody>
                     
                     
                     
                  <c:forEach var="cartvo" items="cartList"> 
                        <tr>
                           <td>
                              <div class="tbl_cell w40">
                                 <input type="checkbox" checked="checked" id="inp_prd_chk1" name="s_checkbox1">
                              </div>
                           </td>
                           <td>
                              <div class="tbl_cell w390">
                                 <a class="prd_img" href="#" style="position: absolute; padding-top: 10px;">   
                                    <img class="completed-seq-lazyload" id="cart_prodImg" alt="상품이미지" src="https://image.oliveyoung.co.kr/uploads/images/goods/220/10/0000/0001/A00000001332201ko.jpg?l=ko">
                                 </a>
                                 <div class="prd_info">
                                    <a class="prd_name" href="">
                                       <span id="brandNm">${cartvo.brName} </span>
                                       <p id="goodsNm">옵션 => [램 : ${cartvo.ramName}], [저정장치 : ${cartvo.storageName}], [운영체제 : ${cartvo.osName}]</p>
                                    </a>
                                 </div>
                              </div>
                           </td>
                           <td>
                              <div class="tbl_cell w110">
                                 <span class="cur_price"><span class="tx_num">${cartvo.price}</span>원</span>
                              </div>
                           </td>
                           <td>
                              <div class="tbl_cell w100">
                                 <div class="prd_cnt">
                                    <select class="amount" name="s_amount">
                                       <option value="1" selected="selected">1</option>
                                       <option value="2">2</option>
                                       <option value="3">3</option>
                                       <option value="4">4</option>
                                       <option value="5">5</option>
                                       <option value="6">6</option>
                                       <option value="7">7</option>
                                       <option value="8">8</option>
                                       <option value="9">9</option>
                                       <option value="10">10</option>
                                       <option value="10+">10+</option>
                                    </select>               
                                 </div>
                                 <button type="button" class="btnSmall wGray" style="display: none;" name="btnQtyMod"><span>변경</span></button>
                              </div>
                           </td>
                           <td>
                              <div class="tbl_cell w110">
                                 <span class="org_price">
                                 </span>
                                 <span class="pur_price"><span class="tx_num">19,800</span>원</span>
                              </div>
                           </td>
                           <td>
                              <div class="tbl_cell w120  ">
                                 <p class="prd_delivery">
                                 <strong id="deliStrongText">
                                    2,500
                                    <span class="ex">도서·산간 제외</span>   
                                 </strong>
                                 </p>
                              </div>
                           </td>
                           <td>
                              <div class="tbl_cell w150">
                                 <div class="btn_group">
                                    <button type="button" class="btnSmall wGreen" name="btn_buy"><span>바로구매</span></button><br/>
                                    <button type="button" class="btnSmall wGray delete" name="btnDelete"><span>삭제</span></button><!-- 버튼 공간(스페이스바)없이 붙여주세요. -->
                                 </div>
                              </div>
                           </td>
                        </tr>
                        </c:forEach>   
                     
                     
                     
                     
                     
                     
                     
                     
                        <tr>
                           <td>
                              <div class="tbl_cell w40">
                                 <input type="checkbox" checked="checked" id="inp_prd_chk1" name="s_checkbox1">
                              </div>
                           </td>
                           <td>
                              <div class="tbl_cell w390">
                                 <a class="prd_img" href="#" style="position: absolute; padding-top: 10px;">   
                                    <img class="completed-seq-lazyload" id="cart_prodImg" alt="상품이미지" src="https://image.oliveyoung.co.kr/uploads/images/goods/220/10/0000/0001/A00000001332201ko.jpg?l=ko">
                                 </a>
                                 <div class="prd_info">
                                    <a class="prd_name" href="">
                                       <span id="brandNm">더블유드레스룸 </span>
                                       <p id="goodsNm">W.DRESSROOM 네추럴 소이 캔들 No.272 로즈부케 200g </p>
                                    </a>
                                 </div>
                              </div>
                           </td>
                           <td>
                              <div class="tbl_cell w110">
                                 <span class="cur_price"><span class="tx_num">19,800</span>원</span>
                              </div>
                           </td>
                           <td>
                              <div class="tbl_cell w100">
                                 <div class="prd_cnt">
                                    <select class="amount" name="s_amount">
                                       <option value="1" selected="selected">1</option>
                                       <option value="2">2</option>
                                       <option value="3">3</option>
                                       <option value="4">4</option>
                                       <option value="5">5</option>
                                       <option value="6">6</option>
                                       <option value="7">7</option>
                                       <option value="8">8</option>
                                       <option value="9">9</option>
                                       <option value="10">10</option>
                                       <option value="10+">10+</option>
                                    </select>               
                                 </div>
                                 <button type="button" class="btnSmall wGray" style="display: none;" name="btnQtyMod"><span>변경</span></button>
                              </div>
                           </td>
                           <td>
                              <div class="tbl_cell w110">
                                 <span class="org_price">
                                 </span>
                                 <span class="pur_price"><span class="tx_num">19,800</span>원</span>
                              </div>
                           </td>
                           <td>
                              <div class="tbl_cell w120  ">
                                 <p class="prd_delivery">
                                 <strong id="deliStrongText">
                                    2,500
                                    <span class="ex">도서·산간 제외</span>   
                                 </strong>
                                 </p>
                              </div>
                           </td>
                           <td>
                              <div class="tbl_cell w150">
                                 <div class="btn_group">
                                    <button type="button" class="btnSmall wGreen" name="btn_buy"><span>바로구매</span></button><br/>
                                    <button type="button" class="btnSmall wGray delete" name="btnDelete"><span>삭제</span></button><!-- 버튼 공간(스페이스바)없이 붙여주세요. -->
                                 </div>
                              </div>
                           </td>
                        </tr>
                        
                     </tbody>
                  </table>
                           
                  <div class="basket_price_info">
                     <div class="btn_area">
                        <button type="button" class="btnSmall wGray type2" id="partDelBtn1" name="partDelBtn"><span>선택상품 삭제</span></button> 
                        <button type="button" class="btnSmall wGray type2" id="soldOutDelBtn1" name="soldOutDelBtn"><span>품절상품 삭제</span></button>
                     </div>
                     <div class="sum_price">총 판매가 <span class="tx_num">19,800</span>원 <span class="tx_sign minus">-</span> 총 할인금액 <span class="tx_num">0</span>원 <span class="tx_sign plus">+</span> 배송비 <span class="tx_num">2,500</span>원 <span class="tx_sign equal">=</span> <span class="tx_total_price">총 결제금액 <span class="tx_price"><span class="tx_num">22,300</span>원</span></span></div>
                  </div>
                  
                  <div class="total_price_info">
                     <div class="detail_price">
                        <p>총 판매가<span><span class="tx_num">19,800</span>원</span></p>
                        <span class="tx_sign2 minus">-</span>
                        <p class="tx_sale">총 할인금액<span><span class="tx_num">0</span>원</span></p>
                        <span class="tx_sign2 plus">+</span>
                        <p>배송비 <span><span class="tx_num">2,500</span>원</span></p>
                     </div>   
                     <div class="sum_price">
                        <span class="tx_text">배송비는 쿠폰할인금액에 따라 변경될 수 있습니다.</span>
                        총 결제예상금액 <span class="tx_price"><span class="tx_num">22,300</span>원</span></div>   
                  </div>
                  
                  <div class="order_btn_area order_cart">
                     <button type="button" class="btnOrangeW" name="partOrderBtn">선택주문</button>
                     <button type="button" class="btnOrange" name="allOrderBtn">전체주문</button>
                  </div>
                  
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
<jsp:include page="../footer.jsp"/>