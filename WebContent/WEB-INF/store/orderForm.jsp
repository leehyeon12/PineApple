<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<% String ctxPath = request.getContextPath(); %>
  
<!-- ***** head 시작 ***** -->	
<jsp:include page="../head.jsp"/>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%= ctxPath%>/styles/orderForm_styles.css" >
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- ***** header 시작 ***** -->
<jsp:include page="../header.jsp"/>

<div class="container" style="padding-bottom:20px;">
    <div>
       <span id="title">주문/결제</span>
    </div>
</div>         
         
         
         
<div class="container" style="width: 100%;">

<form name="orderForm" id="orderForm">	
			<!-- 주문자 정보 -->
			<h2 class="sub-title2 mgT20">주문자정보</h2><!-- 2017-02-21 수정 : mgT20 클래스 추가 -->
			<table class="tbl_inp_form">
				<caption></caption>
				<colgroup>
					<col style="width:170px">
					<col style="width:*">
				</colgroup>
				<tbody>
				<tr>
					<th scope="row">주문자명</th>
					<td><input type="text" id="ordManNm" name="ordManNm" value="주문자이름" class="inpH28" title="주문자명을 입력해주세요." this="주문자명은" style="width:200px"></td><!-- id와 label for를 맞춰주세요 (임시로 넣어둠) -->
				</tr>
				<tr>
					<th scope="row">휴대폰</th>
					<td>
						<select id="ordManCellSctNo" name="ordManCellSctNo" class="selH28" title="주문자 휴대폰 번호 앞자리를 선택해주세요." style="width:90px">
							<option value="">선택</option>

							<option value="010" selected="selected">010</option>

							<option value="011">011</option>

							<option value="016">016</option>

							<option value="017">017</option>

							<option value="018">018</option>

							<option value="019">019</option>

							<option value="02">02</option>

							<option value="031">031</option>

							<option value="032">032</option>

							<option value="033">033</option>

							<option value="041">041</option>

							<option value="042">042</option>

							<option value="043">043</option>

							<option value="044">044</option>

							<option value="051">051</option>

							<option value="052">052</option>

							<option value="053">053</option>

							<option value="054">054</option>

							<option value="055">055</option>

							<option value="061">061</option>

							<option value="062">062</option>

							<option value="063">063</option>

							<option value="064">064</option>

							<option value="070">070</option>

							<option value="080">080</option>

							<option value="0130">0130</option>

							<option value="0303">0303</option>

							<option value="0502">0502</option>

							<option value="0503">0503</option>

							<option value="0504">0504</option>

							<option value="0505">0505</option>

							<option value="0506">0506</option>

							<option value="0507">0507</option>

						</select>
						 - <input type="text" id="ordManCellTxnoNo" name="ordManCellTxnoNo" value="5555" class="inpH28" title="주문자 휴대폰 번호 가운데 자리를 입력해주세요." this="주문자 휴대폰 번호 가운데 자리는" style="width:90px">
						 - <input type="text" id="ordManCellEndNo" name="ordManCellEndNo" value="7777" class="inpH28" title="주문자 휴대폰 번호 마지막 4자리를 입력해주세요." this="주문자 휴대폰 번호 마지막 자리는" style="width:90px">
					</td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td>


						<input type="hidden" id="ordManEmailAddr" name="ordManEmailAddr" value="hongkd@nate.com" title="주문자 이메일 주소를 입력해주세요.">
						<input type="text" id="ordManEmailAddrId" value="lsy9264" class="inpH28" title="주문자 이메일 주소를 입력해주세요." this="주문자 이메일 주소는" style="width:120px"> 
						@ <input type="text" id="ordManEmailAddrDmn" value="nate.com" class="inpH28" title="이메일도메인을 입력해주세요." this="이메일도메인은" style="width:120px" disabled="">
						<select id="ordManEmailAddrDmn_select" class="selH28" title="주문자 이메일 주소 도메인을 선택해주세요." style="width:120px">
							<option value="">직접입력</option>

							<option value="hanmir.com">hanmir.com</option>

							<option value="naver.com">naver.com</option>

							<option value="hanmail.net">hanmail.net</option>

							<option value="nate.com" selected="selected">nate.com</option>

							<option value="yahoo.co.kr">yahoo.co.kr</option>

							<option value="gmail.com">gmail.com</option>

							<option value="hotmail.com">hotmail.com</option>

							<option value="empal.com">empal.com</option>

							<option value="paran.com">paran.com</option>

							<option value="lycos.co.kr">lycos.co.kr</option>

							<option value="freechal.com">freechal.com</option>

							<option value="hanafos.com">hanafos.com</option>

							<option value="korea.com">korea.com</option>

							<option value="dreamwiz.com">dreamwiz.com</option>

						</select>
					</td>
				</tr>
				</tbody>
			</table>
			<!--// 주문자 정보 -->
			
			<!-- 배송지 정보 -->
			<div class="title_wrap">
				<h2 class="sub-title2">배송지정보</h2>
			</div>
			<table class="tbl_inp_form important" id="dlvpInfo"><!-- 2017-01-18 클래스 추가 -->
				<caption></caption>
				<colgroup>
					<col style="width:170px">
					<col style="width:*">
				</colgroup>
				<tbody>
				<!--// 2017-01-18 추가 -->
				<tr type="exist" style="display: table-row;">
					<th scope="row">받는분</th>
					<td class="imp_data"><!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<input type="text" id="rmitNm_exist" name="rmitNm" value="홍길동" orgvalue="" class="inpH28" title="받는분 이름을 입력해주세요." style="width:200px" this="받는분 이름은">
					</td>
				</tr>
				<tr class="sumtr1" type="exist" style="display: table-row;">
					<th scope="row">연락처1</th>
					<td class="imp_data"><!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<select id="rmitCellSctNo_exist" name="rmitCellSctNo" class="selH28" title="연락처1 앞자리를 선택해주세요." style="width:90px" orgvalue="">
							<option value="">선택</option>

							<option value="010" selected="selected">010</option>

							<option value="011">011</option>

							<option value="016">016</option>

							<option value="017">017</option>

							<option value="018">018</option>

							<option value="019">019</option>

							<option value="02">02</option>

							<option value="031">031</option>

							<option value="032">032</option>

							<option value="033">033</option>

							<option value="041">041</option>

							<option value="042">042</option>

							<option value="043">043</option>

							<option value="044">044</option>

							<option value="051">051</option>

							<option value="052">052</option>

							<option value="053">053</option>

							<option value="054">054</option>

							<option value="055">055</option>

							<option value="061">061</option>

							<option value="062">062</option>

							<option value="063">063</option>

							<option value="064">064</option>

							<option value="070">070</option>

							<option value="080">080</option>

							<option value="0130">0130</option>

							<option value="0303">0303</option>

							<option value="0502">0502</option>

							<option value="0503">0503</option>

							<option value="0504">0504</option>

							<option value="0505">0505</option>

							<option value="0506">0506</option>

							<option value="0507">0507</option>

						</select>
						 - <input type="text" id="rmitCellTxnoNo_exist" name="rmitCellTxnoNo" value="7777" orgvalue="" class="inpH28" title="연락처1 가운데 자리를 입력해주세요." this="연락처1 가운데 자리는" style="width:90px">
						 - <input type="text" id="rmitCellEndNo_exist" name="rmitCellEndNo" value="5555" orgvalue="" class="inpH28" title="연락처1 마지막 4자리를 입력해주세요." this="연락처1 마지막 자리는" style="width:90px">
						 <!-- <span class="chk_area"><input type="checkbox" id="chkSafe_exist" name="chkSafe" value="123" /> <label for="chkSafe">안심번호 사용</label></span> -->
					</td>
				</tr>

				<tr type="exist" style="display: table-row;">
					<th scope="row">주소</th> 
					<td class="imp_data"><!-- 2017-01-25 수정 : 클래스 추가 -->
						<input type="text" id="stnmRmitPostNo_exist" name="rmitPostNo" value="00222" class="inpH28" title="우편번호를 검색해주세요." style="width:90px" readonly="readonly">
						<input type="hidden" id="rmitPostNo_exist" name="stnmRmitPostNo" value="142814" title="우편번호를 검색해주세요.">
						<button type="button" class="btnSmall wGreen w100" id="search-zipcode-pop_exist"><span>우편번호 찾기</span></button>
						<div class="addr_box">
							<input type="hidden" id="stnmRmitPostAddr_exist" name="stnmRmitPostAddr" value="서울시 종로구" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly">
							<input type="hidden" id="rmitBaseAddr_exist" name="rmitPostAddr" value="서울시 종로구" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly">
							<!-- 주소 입력 시 보여지는 부분 -->
							<p class="addr_new">
								<span class="tx_tit">도로명</span> : 
								<span class="tx_addr" id="stnmPostAddr_exist">서울시 종로구</span><!--  도로명주소를 넣어주세요 -->
							</p>
							<p class="addr_old">
								<span class="tx_tit">지번</span> : 
								<span class="tx_addr" id="baseAddr_exist">지번 입력</span><!--  지번주소를 넣어주세요 -->
							</p>
							<!--// 주소 입력 시 보여지는 부분 -->
						</div>
						<input type="text" id="tempRmitDtlAddr_exist" value="" class="inpH28" title="상세주소를 입력해주세요." style="width:500px; display: none;" this="상세 주소는">
						<input type="hidden" id="stnmRmitDtlAddr_exist" name="stnmRmitDtlAddr" value="79 1층" orgvalue="79 1층" class="inpH28" title="상세주소를 입력해주세요." style="width:500px" this="상세 주소는">
						<input type="hidden" id="rmitDtlAddr_exist" name="rmitDtlAddr" value="313-19 1층" orgvalue="313-19 1층" class="inpH28" title="상세주소를 입력해주세요." style="width:500px">
					</td>
				</tr>

				<!-- 2017-01-18 추가 (신규 배송지 선택 시) -->
				<tr type="new" style="display: none;">
					<th scope="row">배송지명</th>
					<td class="imp_data">
						<input type="text" id="dlvpNm_new" name="dlvpNm" value="" class="inpH28" title="배송지명을 입력해주세요." style="width:200px;" this="배송지명은" disabled="disabled">
					</td>
				</tr>
				<!--// 2017-01-18 추가 -->
				<tr type="new" style="display: none;">
					<th scope="row">받는분</th>
					<td class="imp_data"><!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<input type="text" id="rmitNm_new" name="rmitNm" value="" orgvalue="" class="inpH28" title="받는분 이름을 입력해주세요." style="width:200px" this="받는분 이름은" disabled="disabled">
						<span class="chk_area"><input type="checkbox" id="copyToDlvp_new" targetid="new" disabled="disabled"> <label for="copyToDlvp_new">주문자정보와 동일</label></span><!-- 2017-01-18 수정 : 위치변경 -->
					</td>
				</tr>
				<tr type="new" style="display: none;">
					<th scope="row">연락처1</th>
					<td class="imp_data"><!-- 2017-01-18 추가 : 필수입력사항 아이콘 추가 -->
						<select id="rmitCellSctNo_new" name="rmitCellSctNo" class="selH28" title="연락처1 앞자리를 선택해주세요." orgvalue="" style="width:90px" disabled="disabled">
							<option value="">선택</option>

							<option value="010">010</option>

							<option value="011">011</option>

							<option value="016">016</option>

							<option value="017">017</option>

							<option value="018">018</option>

							<option value="019">019</option>

							<option value="02">02</option>

							<option value="031">031</option>

							<option value="032">032</option>

							<option value="033">033</option>

							<option value="041">041</option>

							<option value="042">042</option>

							<option value="043">043</option>

							<option value="044">044</option>

							<option value="051">051</option>

							<option value="052">052</option>

							<option value="053">053</option>

							<option value="054">054</option>

							<option value="055">055</option>

							<option value="061">061</option>

							<option value="062">062</option>

							<option value="063">063</option>

							<option value="064">064</option>

							<option value="070">070</option>

							<option value="080">080</option>

							<option value="0130">0130</option>

							<option value="0303">0303</option>

							<option value="0502">0502</option>

							<option value="0503">0503</option>

							<option value="0504">0504</option>

							<option value="0505">0505</option>

							<option value="0506">0506</option>

							<option value="0507">0507</option>

						</select>
						 - <input type="text" id="rmitCellTxnoNo_new" name="rmitCellTxnoNo" value="" orgvalue="" class="inpH28" title="연락처1 가운데 자리를 입력해주세요." this="연락처1 가운데 자리는" style="width:90px" disabled="disabled">
						 - <input type="text" id="rmitCellEndNo_new" name="rmitCellEndNo" value="" orgvalue="" class="inpH28" title="연락처1 마지막 4자리를 입력해주세요." this="연락처1 마지막 자리는" style="width:90px" disabled="disabled">
					</td>
				</tr>
				<tr type="new" style="display: none;">
					<th scope="row">연락처2</th>
					<td>
						<select id="rmitTelRgnNo_new" name="rmitTelRgnNo" class="selH28" title="연락처2 앞자리를 선택해주세요." style="width:90px" disabled="disabled">
							<option value="">선택</option>

							<option value="010">010</option>

							<option value="011">011</option>

							<option value="016">016</option>

							<option value="017">017</option>

							<option value="018">018</option>

							<option value="019">019</option>

							<option value="02">02</option>

							<option value="031">031</option>

							<option value="032">032</option>

							<option value="033">033</option>

							<option value="041">041</option>

							<option value="042">042</option>

							<option value="043">043</option>

							<option value="044">044</option>

							<option value="051">051</option>

							<option value="052">052</option>

							<option value="053">053</option>

							<option value="054">054</option>

							<option value="055">055</option>

							<option value="061">061</option>

							<option value="062">062</option>

							<option value="063">063</option>

							<option value="064">064</option>

							<option value="070">070</option>

							<option value="080">080</option>

							<option value="0130">0130</option>

							<option value="0303">0303</option>

							<option value="0502">0502</option>

							<option value="0503">0503</option>

							<option value="0504">0504</option>

							<option value="0505">0505</option>

							<option value="0506">0506</option>

							<option value="0507">0507</option>

						</select>
						 - <input type="text" id="rmitTelTxnoNo_new" name="rmitTelTxnoNo" value="" class="inpH28" title="연락처2 가운데 자리를 입력해주세요." this="연락처2 가운데 자리는" style="width:90px" disabled="disabled">
						 - <input type="text" id="rmitTelEndNo_new" name="rmitTelEndNo" value="" class="inpH28" title="연락처2 마지막 4자리를 입력해주세요." this="연락처2 마지막 자리는" style="width:90px" disabled="disabled">
					</td>
				</tr>
				<tr type="new" style="display: none;">
					<th scope="row">주소</th>
					<td class="imp_data"><!-- 2017-01-25 수정 : 클래스 추가 -->
						<input type="text" id="stnmRmitPostNo_new" name="rmitPostNo" value="" class="inpH28" title="우편번호를 검색해주세요." style="width:90px" readonly="readonly" disabled="disabled">
						<input type="hidden" id="rmitPostNo_new" name="stnmRmitPostNo" value="" title="우편번호를 검색해주세요." disabled="disabled">
						<button type="button" class="btnSmall wGreen w100" id="search-zipcode-pop_new"><span>우편번호 찾기</span></button>
						<div class="addr_box">
							<input type="hidden" id="stnmRmitPostAddr_new" name="stnmRmitPostAddr" value="" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly" disabled="disabled">
							<input type="hidden" id="rmitBaseAddr_new" name="rmitPostAddr" value="" class="inpH28" title="우편번호를 검색해주세요." readonly="readonly" disabled="disabled">
							<!-- 주소 입력 시 보여지는 부분 -->
							<p class="addr_new">
								<span class="tx_tit">도로명</span> : 
								<span class="tx_addr" id="stnmPostAddr_new"></span><!--  도로명주소를 넣어주세요 -->
							</p>
							<p class="addr_old">
								<span class="tx_tit">지번</span> : 
								<span class="tx_addr" id="baseAddr_new"></span><!--  지번주소를 넣어주세요 -->
							</p>
							<!--// 주소 입력 시 보여지는 부분 -->
						</div>
						<input type="text" id="tempRmitDtlAddr_new" value="" class="inpH28" title="상세주소를 입력해주세요." style="width:500px; display: none;" this="상세 주소는" disabled="disabled">
						<input type="hidden" id="stnmRmitDtlAddr_new" name="stnmRmitDtlAddr" value="" class="inpH28" title="상세주소를 입력해주세요." style="width:500px" this="상세 주소는" disabled="disabled">
						<input type="hidden" id="rmitDtlAddr_new" name="rmitDtlAddr" value="" class="inpH28" title="상세주소를 입력해주세요." style="width:500px" disabled="disabled">
					</td>
				</tr>
				<tr>
					<th scope="row">택배배송 메시지</th>
					<td>
						<select id="mbrMemoCont" class="selH28" title="택배배송 메시지를 선택해주세요." style="width:350px">
							<option value="">배송메시지를 선택해주세요.</option>

							<option value="10">부재시 경비실에 맡겨주세요.</option>

							<option value="20">부재시 문앞에 놓아주세요.</option>

							<option value="30">파손의 위험이 있는 상품이오니,  배송 시 주의해주세요.</option>

							<option value="40">배송전에 연락주세요.</option>

							<option value="50">택배함에 넣어주세요.</option>

							<option value="99">배송 메시지 직접입력</option>

						</select>
						<input type="text" name="mbrMemoCont" value="" class="inpH28 mgT6" title="배송메시지를 입력해주세요." style="width:700px; display: none;">
					</td>
				</tr>
				</tbody>
			</table>
			<!--// 배송지 정보 -->
			
			<!-- 주문상품정보 -->
			<!-- <h2 class="sub-title2 underline">주문상품정보</h2> --><!-- 2017-01-24 수정 : 해당 타이틀 삭제 -->
 
			
			
			<h2 class="sub-title2">
				파인애플 배송상품
			
				 <em class="gift" id="giftNoti2" style="display: none;">* 증정품은 결제 시 확인하실 수 있습니다.</em>
			
			</h2><!-- 2017-01-24 수정 : 타이틀 마크업 수정 및 클래스명 변경 -->
			<table class="tbl_prd_list">
				<caption></caption>
				<colgroup>
					<col style="width:*">
					<col style="width:110px">
					<col style="width:100px">
					<!--
					2017-01-24 수정 : 삭제 
					<col style="width:120px" />
					-->
					<col style="width:110px">					
				</colgroup>
				<thead>
				<tr>
					<th scope="col">상품정보</th>
					<th scope="col">판매가</th>
					<th scope="col">수량</th>
					<!-- 
					2017-01-24 수정 : 배송정보 삭제
					<th scope="col">배송정보</th>
					-->
					<th scope="col">구매가</th><!-- 2017-01-24 수정 : 문구수정 -->
				</tr>
				</thead>
				<tbody>
				<tr>
			
		
					<input type="hidden" name="cartNo" value="44133383">
					<td colspan="5" dispcatno="1000002000300040011" stdcatno="060803" goodsno="A000000119640" itemno="001" entrno="C17500" brndcd="" tradeshpcd="1" staffdscntyn="Y"><!-- 2017-01-13 수정 -->
						<div class="tbl_cont_area">
							<div class="tbl_cell w700"><!-- 2017-01-24 수정 : 클래스명 변경 -->
								<div class="prd_info">
									<div class="prd_img">
										<img src="https://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0011/A00000011964001ko.jpg?l=ko" alt="장바구니 상품 임시 이미지" onerror="common.errorImg(this);">
									</div>
									<div class="prd_name">
		
										<span>드림웍스</span><!-- 2017-01-26 수정 : 브랜드명 분리 -->
										<p>[온라인단독] 쿵푸팬더의 후끈후끈 손난로 더블기획(10P+10P)</p>
									</div>
									<p class="prd_opt">
		
									</p>
									<p class="prd_flag">
		
		
		
									<span class="icon_flag sale">세일</span>
		
		
		
		
									</p>
								</div>
							</div>
							<div class="tbl_cell w110">
								<!-- <span class="org_price" style="display: none;"><span class="tx_num" id="normPrc_"></span>원</span> --><!-- 2017-01-24 수정 : 삭제 -->
								<span class="cur_price"><span class="tx_num">14,400</span>원</span>
							</div>
							<div class="tbl_cell w100">1</div>
							<!-- 2017-01-24 수정 : 삭제 
							<div class="tbl_cell w120">
								<p class="prd_delivery">
									<strong>
										무료배송
									</strong> 
									도서·산간 제외
								</p>
							</div>
							-->
							<div class="tbl_cell w110">
		
		
		
		
		
								<span class="org_price"><span class="tx_num" id="normPrc_A000000119640/001">14,400</span>원</span><!-- 2017-01-24 수정 : 추가 -->
								<span class="pur_price"><span class="tx_num" id="salePrc_A000000119640/001">11,900</span>원</span>
								<input type="hidden" id="orgNormPrc_A000000119640/001" value="14400">
								<input type="hidden" id="orgSalePrc_A000000119640/001" value="11900">
								<input type="hidden" id="imdtDscntAmt_A000000119640/001" value="0">
							</div>
						</div>
		
					</td>
				</tr>
				<!--// 1+1 행사 상품인 경우 -->
		
				</tbody>
			</table>
		
	
				
			

			<!--// 주문상품정보 -->

			<!-- 증정품 -->


			<input type="hidden" id="giftCount" value="0" orgvalue="0">
			<div id="giftCartNo"></div>
			<!--// 증정품 -->
			
			<!-- 쿠폰 및 포인트, 결제수단, 결제정보 -->
			<div class="order_payment_box">
				<div class="left_area">
					<input type="hidden" id="couponCnt" value="0">
					<!--// 쿠폰할인정보 -->
					
					<!-- 포인트사용 --><!-- 2017-01-18 수정 : 전액사용 버튼이 input 뒤로 위치 변경됨 -->
					<h2 class="sub-title2">포인트/기프트카드사용</h2>
					<table class="tbl_inp_form type2">
						<colgroup>
							<col style="width:170px">
							<col style="width:*">
						</colgroup>
						<input type="hidden" id="lastAplyPntInputName" value="">
						<tbody>
						
					
						<tr>
							<th scope="row"><span class="tx_num">PineApple</span> 포인트</th>
							<td>
								<div>
									<span class="inp_point_wrap">
										<input type="text" id="cjonePntAplyAmt" class="inpH28" title="사용하실 CJ ONE 포인트를 입력해주세요." style="width:100px" this="CJ ONE 포인트는 " minownamt="1000" unit="P" unitamt="10" minaplyamt="0"> 원 / <span id="cjonePnt_span" class="tx_num colorOrange"><span id="cjonePnt">11,281</span>P</span>
										<input type="hidden" name="cjonePntAplyAmt" value="0">
									</span> 
									<button type="button" class="btnSmall wGray3" id="cjonePnt_btn">전액사용</button>
									<p class="tx_point_info">PineApple 포인트는 최소 1,000P 이상 보유 시 10P 단위로 사용하실 수 있습니다.</p><!-- //2017-02-24 문구추가// -->
									 
								</div>
							</td>
						</tr>

					
						</tbody>
					</table>
					<!--// 포인트사용 -->
					
					<!-- 결제수단 선택 -->


					<div class="title_wrap" id="payMethod_div">
						<h2 class="sub-title2">결제수단 선택</h2>
					</div>
					<ul class="payment_info_form" id="payMethodList">
						<li class="bg_area"><!-- 2017-01-18 수정 : 클래스 추가 -->
							<span><input type="radio" id="payMethod_11" name="payMethod" value="11" cashreceipt="N" checked="checked"><label for="payMethod_11">신용카드</label></span>
							<span><input type="radio" id="payMethod_21" name="payMethod" value="21" cashreceipt="Y"><label for="payMethod_21">계좌이체</label></span>
							<span><input type="radio" id="payMethod_61" name="payMethod" value="61" cashreceipt="Y"><label for="payMethod_61">무통장입금</label></span>
							<span><input type="radio" id="payMethod_22" name="payMethod" value="22" cashreceipt="N"><label for="payMethod_22">휴대폰결제</label></span>
							<!-- 2017-01-18 수정 : 문화상품권/도서상품권 선택 삭제 -->
							<!-- 2017-02-14 수정 : 문화상품권/도서상품권 선택 재추가 --> 
							<span><input type="radio" id="payMethod_23" name="payMethod" value="23" cashreceipt="N"><label for="payMethod_23">문화상품권</label></span>
							<span><input type="radio" id="payMethod_24" name="payMethod" value="24" cashreceipt="Y"><label for="payMethod_24">도서상품권</label></span>
							<!-- 2017-04-18 추가 -->
							<span><input type="radio" id="payMethod_25" name="payMethod" value="25" cashreceipt="N"><label for="payMethod_25">PAYCO</label></span>
							<!-- //2017-04-18 추가 -->
							<span><input type="radio" id="payMethod_26" name="payMethod" value="26" cashreceipt="N"><label for="payMethod_26">카카오페이</label></span>
						</li>
						<!-- 신용카드 선택 시 -->
						<li paymethod="11" style="display: list-item;">							
							<table class="tbl_inp_form no_line">						
								<colgroup>
									<col style="width:170px">
									<col style="width:*">
								</colgroup>
								<tbody>
								<tr>
 									<td>
										<div id="cardDscnt_div">
											<input type="hidden" id="cardCouponIndex" value="" acqrcd="" orgacqrcd="">

										</div>
										<div id="cardcoPnt_div">

	
											<p class="tx_info" acqrcd="DIN" pntusestdamt="10000" pntnm="현대카드 M 포인트" salepointflg="S" staffyn="N" style="display: none;">
												<span class="mhy_card">현대카드 M포인트 10% 사용 가능(1만원 이상 결제시 최대 5천 포인트)</span>
											</p>
											<div id="DIN_pntInfoMsg" style="display: none;">
												<p class="tit">사용조건</p>

<ol>
	<li>1만원 이상 결제시 사용 가능</li>
	<li>결제금액의 10% 사용 가능</li>
	<li>법인/체크/선불/기프트/CJ임직원카드 제외</li>
	<li>결제 건당 5,000 M포인트 한도</li>
	<li>10%에 대한 M포인트 부족 시 보유 포인트만큼 차감</li>
	<li>페이코/카카오페이 등 간편결제수단 적용시 사용 불가</li>
</ol>

<p class="tit">포인트 결제 후 부분취소 및 사용 포인트 조회 문의</p>

<ol>
	<li>포인트 환불정책 및 사용 포인트 조회는 현대카드 고객센터로 문의 부탁 드립니다.</li>
	<li>현대카드 고객센터 : 1577-6000</li>
</ol>

											</div>
	

										</div>
									</td>
								</tr>
							<tr id="pntUseYn_tr" style="display:none;">
									<th scope="row">카드포인트</th>
									<td>
										<div>
											<input type="checkbox" id="pntUseYn" name="pntUseYn" value="Y"> <label for="pntUseYn" id="cardcoPntNm"></label>
											<button type="button" class="mh_btn" data-rel="layer" data-target="mHPointInfo">사용안내</button>
										</div>
									</td>
								</tr>
								<!-- 2017-01-18 추가 : 카드 결제 안내 추가 -->
								<div style="padding: 36px 36px 0px 0px;">
									
										<ul class="info_dot_list type2">
					
										<li>PineApple&nbsp;KB 카드 제휴 할인은 국민앱카드 최신버전에서만 지원됩니다. 최신버전으로&nbsp;업데이트해주세요.</li>
									
										<li>무이자할부는 법인/개인사업자 기업카드, 체크, 기프트, 선불, 하이브리드, 은행계열카드는 제외됩니다.</li>
										<li>무이자할부는 카드사 사정에 따라 중단 또는 변경될 수 있으며 카드사 포인트/마일리지 적립 등의 혜택과 중복 적용되지 않습니다.</li>
				
											<li id="cardDscnt_N_li" style="display: none;"><strong>청구할인 대상이 아닌 상품이 포함되어 있거나 결제금액이 청구할인 대상 금액보다 적어 청구할인 적용이 불가합니다.</strong></li>
											<li id="cardDscnt_Y1_li" style="display: none;">법인/체크/기프트 카드는 청구할인 대상에서 제외될 수 있습니다.</li>
											<li id="cardDscnt_Y2_li" style="display: none;">일 최대 청구할인 한도에 따라 청구할인 예상금액은 달라질 수 있습니다.</li>
											<li>신용/체크카드 결제금액이 30만원 이상인 경우 공인인증서가 필요합니다.</li>
										</ul>
									
								</div>
						</tbody>
							</table>							
						</li>
						<!--// 신용카드 선택 시 -->
						<!-- 무통장입금 선택 시 -->
						<li paymethod="61" style="display: none;">							
							<table class="tbl_inp_form no_line">
								<caption>무통장입금 입력 안내</caption>
								<colgroup>
									<col style="width:170px">
									<col style="width:*">
								</colgroup>
								<tbody>
								<tr>
									<th scope="row">은행명</th>
									<td>
										<div>
											<select id="VirDepositBank" name="cjBnkCd" class="selH28" title="은행를 선택해주세요." style="width:300px" disabled="disabled">

												<option value="003" targetid="03">기업</option>

												<option value="004" targetid="06">국민</option>

												<option value="007" targetid="07">수협</option>

												<option value="011" targetid="11">농협</option>

												<option value="020" targetid="20">우리</option>

												<option value="031" targetid="31">대구</option>

												<option value="032" targetid="32">부산</option>

												<option value="039" targetid="39">경남</option>

												<option value="071" targetid="71">우체국</option>

												<option value="081" targetid="81">하나</option>

												<option value="088" targetid="88">신한</option>

											</select>
											<select name="bnkCd" style="display: none;" disabled="disabled">

													<option value="02">산업</option>

													<option value="03">기업</option>

													<option value="05">외환</option>

													<option value="06">국민</option>

													<option value="07">수협</option>

													<option value="11">농협</option>

													<option value="20">우리</option>

													<option value="23">SC제일</option>

													<option value="27">씨티</option>

													<option value="31">대구</option>

													<option value="32">부산</option>

													<option value="34">광주</option>

													<option value="35">제주</option>

													<option value="37">전북</option>

													<option value="39">경남</option>

													<option value="45">새마을금고</option>

													<option value="48">신협</option>

													<option value="71">우체국</option>

													<option value="81">하나</option>

													<option value="88">신한</option>

													<option value="S3">삼성증권</option>

													<option value="S6">한국투자증권</option>

													<option value="SG">한화증권</option>

											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">입금기한</th>
									<td>
										<div>
											2018.12.08
										</div>
									</td>
								</tr>
								<!--
								2017-01-18 수정 : 무통장 입금 시 휴대폰정보 입력 영역 삭제 
								<tr>
									<th scope="row">휴대폰</th>
									<td>
										<div>
											<select name=""  class="selH28" title="휴대폰 이동통신번호를 선택해주세요." style="width:90px">
												<option value="">010</option>
												<option value="">011</option>
												<option value="">016</option>
												<option value="">019</option>
											</select>
											 - <input type="text" name="" value="1234" class="inpH28" title="휴대폰 두번째자리를 입력해주세요." style="width:90px" />
											 - <input type="text" name="" value="5678" class="inpH28" title="휴대폰 마지막자리를 입력해주세요." style="width:90px" />
										</div>
									</td>
								</tr>
								 -->
								<tr>
									<th scope="row">입금자명</th>
									<td>
										<div>
											<input type="text" id="NameDepositor" name="morcManNm" value="이승연" class="inpH28" title="입금자명을 입력해주세요." style="width:200px" disabled="disabled">
										</div>
									</td>
								</tr>
								<!-- 2017-01-18 추가 : 무통장입금 결제안내 문구 추가 -->
								<tr>
									<td colspan="2">
										<ul class="info_dot_list type2">

	
		
			
				
					
						<li>은행별로 입금가능시간이 다를 수 있습니다.</li>

					
				
			
		
	

											<li>주문일 기준 다음날(24시간 이내)까지 입금이 되지 않으면 주문 취소 처리됩니다.</li>
										</ul>
									</td>
								</tr>
								<!--// 2017-01-18 추가 : 무통장입금 결제안내 문구 추가 -->
								</tbody>
							</table>							
						</li>
						<!--// 무통장입금 선택 시 -->
						<!-- 계좌이체 선택 시 -->
						<li paymethod="21" style="display: none;">							
							<table class="tbl_inp_form no_line">
								<caption>계좌이체 안내</caption>
								<colgroup>
									<col style="width:170px">
									<col style="width:*">
								</colgroup>
								<tbody>
								<tr>
									<th scope="row">결제안내</th>
									<td>
										<div>
											<!-- 2017-01-18 수정 : 버튼 삭제 및 하단 문구 수정 -->
											<ul class="info_dot_list type2">

												<li>계좌이체로 결제 완료시 본인 계좌에서 즉시 이체 처리됩니다.</li>
												<li>실시간 계좌이체는 은행별 이용시간이 다를 수 있습니다.</li>
											</ul>
											<!--
											<p class="mgT10"><button class="btnSmall wGray w100"><span>은행별 이용시간</span></button></p>
											 -->
										</div>
									</td>
								</tr>
								</tbody>
							</table>
						</li>
						<!--// 계좌이체 선택 시 -->
						<!-- 휴대폰결제 선택 시 -->
						<li paymethod="22" style="display: none;">							
							<table class="tbl_inp_form no_line">
								<caption>휴대폰결제 안내</caption>
								<colgroup>
									<col style="width:170px">
									<col style="width:*">
								</colgroup>
								<tbody>
								<tr>
									<th scope="row">결제안내</th>
									<td>
										<div>
											<ul class="info_dot_list type2">

												<li>휴대폰 결제는 50만원까지 결제가 가능합니다.</li>
												<li>한도문의는 모빌리언스(1600-0523), 다날(1566-3355)로 문의주시기 바랍니다.</li><!-- 2017-01-18 수정 : 문구수정 -->
											</ul>
										</div>
									</td>
								</tr>
								</tbody>
							</table>							
						</li>
						<!--// 휴대폰결제 선택 시 -->
						<!-- 문화상품권(컬쳐캐쉬) 선택 시 -->
						<li paymethod="23" style="display: none;">
							<div class="other_cash_box">
								<!-- 조회 전 -->
								<div class="cash_inquiry_area" id="cultureLandBeforeLogin">
									<p>보유하신 컬쳐캐쉬(문화상품권) 내역 조회 후 사용이 가능합니다.</p>
									<button class="btnSmall wGray2" type="button" data-rel="layer" data-target="cultureLandLoginPop" id="cultureLandLoginPop_btn">조회</button>
								</div>
								<!--// 조회 전 -->
								<!-- 조회 후 -->
								<div class="cash_inquiry_area" id="cultureLandAfterLogin" style="display: none;">
									<input type="hidden" id="cultureLandOwnCash" value="" disabled="disabled">
									<p>고객님의 보유하신 컬쳐캐쉬는 <span class="cash_price"><span class="tx_num" id="cultureLandOwnCash_span"></span>원</span>입니다.</p>
									<p class="tx_info">최종 결제금액을 확인하신 후, [결제하기] 버튼을 클릭하시면 결제가 완료됩니다.</p>									
									<button class="btnSmall wGray2" type="button" id="cultureLandInquire_btn">다시 조회</button>
								</div>
								<!--// 조회 후 -->
								<ul class="info_dot_list type2">

									<li>문화상품권을 컬쳐캐쉬로 충전 후 사용하실 수 있습니다.</li>
									<li>컬쳐캐쉬 충전 및 사용내역, 현금영수증은 컬쳐랜드 홈페이지에서 확인하실 수 있습니다.</li>
									<li>컬쳐캐쉬는 결제금액 전액으로만 사용이 가능합니다.</li>
								</ul>
							</div>					
						</li>
						<!--// 문화상품권(컬쳐캐쉬) 선택 시 -->
						<!-- 도서상품권(북앤라이프 캐쉬) 선택 시 -->
						<li paymethod="24" style="display: none;">
							<div class="other_cash_box">
								<!-- 조회 전 -->
								<div class="cash_inquiry_area" id="bookAndLifeBeforeLogin">
									<p>보유하신 북앤라이프 캐쉬(도서상품권) 내역 조회 후 사용이 가능합니다.</p>
									<button class="btnSmall wGray2" type="button" data-rel="layer" data-target="bookAndLifeLoginPop" id="bookAndLifeLoginPop_btn">조회</button>
								</div>
								<!--// 조회 전 -->
								<!-- 조회 후 -->
								<div class="cash_inquiry_area" id="bookAndLifeAfterLogin" style="display: none;">
									<input type="hidden" id="bookAndLifeOwnCash" value="" disabled="disabled">
									<p>
										고객님의 보유하신 북앤라이프 캐쉬는 <span class="cash_price"><span class="tx_num" id="bookAndLifeOwnCash_span"></span>원</span>입니다.
									</p>									
									<p class="tx_info">최종 결제금액을 확인하신 후, [결제하기] 버튼을 클릭하시면 결제가 완료됩니다.</p>
									<button class="btnSmall wGray2" type="button" id="bookAndLifeInquire_btn">다시 조회</button>
								</div>
								<!--// 조회 후 -->
								<ul class="info_dot_list type2">

									<li>도서상품권을 북앤라이프 캐쉬로 충전 후 사용하실 수 있습니다.</li>
									<li>북앤라이프 캐쉬 충전 및 사용내역은 북앤라이프 홈페이지에서 확인하실 수 있습니다.</li>
									<li>북앤라이프 캐쉬는 결제금액 전액으로만 사용이 가능합니다.</li>
								</ul>
							</div>
						</li>
						<!--// 도서상품권(북앤라이프 캐쉬) 선택 시 -->
						
						<!-- PAYCO 선택 시 2017-04-18 -->
						<li paymethod="25" style="display: none;">
							<div class="other_cash_box">
								<ul class="info_dot_list type2">

									<li>PAYCO는 NHN엔터테인먼트에서 제공하는 안전한 간편결제 서비스로 올리브영몰에서는 신용카드 결제가 가능합니다.</li>
									<li>신용카드 등록 시 휴대폰과 카드명의자가 동일해야합니다. (모든 신용/체크카드 가능)</li>
									<li>PAYCO로 결제 시, 제휴카드 할인(CJ카드, 임직원할인 포함)이 적용되지 않습니다.</li>
									<li>무이자할부는 PAYCO 결제창에서 확인하실 수 있습니다.</li>
								</ul>
							</div>
						</li>
						<!-- //PAYCO 선택 시 2017-04-18 -->
						<!-- KAKAOPAY 선택 시 2017-12-13 -->
						<li paymethod="26" style="display: none;">
							<div class="other_kakao_box">
								<ul class="info_dot_list type3">

	
		
			
				
					
						<p>카카오페이는 주식회사 카카오페이에서 제공하는 안전한 간편결제 서비스로 올리브영몰에서는 신용카드 결제가 가능합니다. </p><p>무이자할부는 카카오페이 모바일 결제창에서 선택하실 수 있습니다. </p><p>휴대폰과 카드명의자가 동일해야 결제 가능합니다.</p><p>카카오페이로 결제 시, 제휴카드 할인/적립(CJ카드, 임직원할인 포함)이 적용되지 않습니다.</p><p>결제 증빙내역은 카카오페이 홈페이지에서 확인 가능합니다.(카카오페이 홈 &gt; 설정 &gt; 결제내역)</p><p>카카오페이 고객센터 : 1644-7405</p>
					
				
			
		
	

								</ul>
							</div>
						</li>
						<!-- //KAKAOPAY 선택 시 2017-12-13 -->
						
					</ul>
					
					<!-- 현금영수증 신청 -->
					<div class="" id="cashReceipt" style="display: none;">
						<h2 class="sub-title2">현금영수증 신청</h2>
						<table class="tbl_inp_form type2" id="receipt_table">
							<caption>현금영수증 신청 입력 폼</caption>
							<colgroup>
								<col style="width:170px">
								<col style="width:*">
							</colgroup>
							<tbody>
							<tr>
								<th scope="row">현금영수증</th>
								<td>
									<div>
										<select id="crIssuCd" name="crIssuCd" class="selH28" title="현금영수증 신청여부를 선택해주세요." style="width:200px" disabled="">
											<option value="">신청안함</option>
											<option value="10">개인소득공제용</option>
											<option value="20">사업자지출증빙용</option>
										</select>
									</div>
								</td>
							</tr>
							
							<!-- 개인소득공제용신청 시 -->
							<tr crissucd="10" style="display: none;">
								<th scope="row">발급방법</th>
								<td>
									<div>
										<input type="radio" id="crIssuMeanSctCd_3" name="crIssuMeanSctCd" value="3" checked="checked" disabled=""> <label for="crIssuMeanSctCd_3">휴대폰</label>
										<input type="radio" id="crIssuMeanSctCd_5" name="crIssuMeanSctCd" value="5" disabled=""> <label for="crIssuMeanSctCd_5">현금영수증카드</label>
									</div>
								</td>
							</tr>
							<!-- 개인소득공제용 [휴대폰] 선택 시 -->
							<tr crissucd="10" crissumeansctcd="3" style="display: none;">
								<th scope="row">휴대폰</th>
								<td>
									<div>
										<select id="dispCashReceiptInfo11" class="selH28" title="현금영수증 휴대폰 앞자리를 선택해주세요." style="width:90px" disabled="">

													<option value="010" selected="selected">010</option>

													<option value="011">011</option>

													<option value="016">016</option>

													<option value="017">017</option>

													<option value="018">018</option>

													<option value="019">019</option>

													<option value="02">02</option>

													<option value="031">031</option>

													<option value="032">032</option>

													<option value="033">033</option>

													<option value="041">041</option>

													<option value="042">042</option>

													<option value="043">043</option>

													<option value="044">044</option>

													<option value="051">051</option>

													<option value="052">052</option>

													<option value="053">053</option>

													<option value="054">054</option>

													<option value="055">055</option>

													<option value="061">061</option>

													<option value="062">062</option>

													<option value="063">063</option>

													<option value="064">064</option>

													<option value="070">070</option>

													<option value="080">080</option>

													<option value="0130">0130</option>

													<option value="0303">0303</option>

													<option value="0502">0502</option>

													<option value="0503">0503</option>

													<option value="0504">0504</option>

													<option value="0505">0505</option>

													<option value="0506">0506</option>

													<option value="0507">0507</option>

												</select>
										 - <input type="text" id="dispCashReceiptInfo12" value="5337" class="inpH28" title="현금영수증 휴대폰 가운데 자리를 입력해주세요." this="현금영수증 휴대폰 가운데 자리는" style="width:90px" disabled="">
										 - <input type="text" id="dispCashReceiptInfo13" value="9264" class="inpH28" title="현금영수증 휴대폰 마지막 4자리수를 입력해주세요." this="현금영수증 휴대폰 마지막 자리는" style="width:90px" disabled="">
										 <input type="hidden" id="crPhoneNumber" name="crIssuMeanNo" value="01053379264" disabled="">
									</div>
								</td>
							</tr>
							<!--//개인소득공제용 [휴대폰] 선택 시 -->
							<!-- 개인소득공제용 [현금영수증카드] 선택 시 -->
							<tr crissucd="10" crissumeansctcd="5" style="display: none;">
								<th scope="row">현금영수증 카드번호</th>
								<td>
									<div>
										<input type="text" id="CashReceipts" name="crIssuMeanNo" class="inpH28" title="현금영수증 카드번호를 입력해주세요." this="현금영수증 카드번호는" style="width:300px" disabled="">
									</div>
								</td>
							</tr>
							<!--// 개인소득공제용 [현금영수증카드] 선택 시 -->
							<!--// 개인소득공제용신청 시 -->
							
							<!-- 사업자지출증빙용 시 -->
							<tr crissucd="20" style="display: none;">
								<th scope="row">사업자등록번호</th>
								<td>
									<div>
										<input type="hidden" name="crIssuMeanSctCd" value="2" disabled="">
										<input type="text" id="BusinessNumber" name="crIssuMeanNo" class="inpH28" title="현금영수증 사업자 등록번호를 입력해주세요." this="현금영수증 사업자 등록번호는" style="width:300px" disabled="">
									</div>
								</td>
							</tr>
							<!--// 사업자지출증빙용 시 -->
							</tbody>
						</table>
						<!--// 현금영수증 신청 -->
					</div>
				</div>
				 
				<div class="right_area">
					<!-- 최종 결제정보 -->
					<h2 class="sub-title2">최종 결제정보</h2>
					<!--// 최종 결제정보 -->
					<ul class="total_payment_box">
						<li>
							<span class="tx_tit">총 상품금액</span> 
							<span class="tx_cont"><span class="tx_num">11,900</span>원</span>
							<input type="hidden" name="goodsAmt" value="11900">
						</li>
						<li>
							<span class="tx_tit">쿠폰할인금액</span><!-- 2017-01-18 수정 : 문구수정 --> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="totDscntAmt_span">0</span>원</span>
							<input type="hidden" name="descentAmt" value="0">
							<input type="hidden" id="imdtDscntAmt" value="0">
						</li>
						
						<li class="line_top2">
							<span class="tx_tit">총 배송비</span> 
							<span class="tx_cont"><span class="tx_num" id="dlexPayAmt_span">2,500</span>원</span>
							<input type="hidden" name="dlexPayAmt" value="2500">
						</li>
						<li id="oyGiftCardAplyAmt_li" style="display: none;">
							<span class="tx_tit">올리브영 기프트카드</span> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="oyGiftCardAplyAmt_span">0</span>원</span>
						</li>
						<li id="cjGiftCardAplyAmt_li" style="display: none;">
							<span class="tx_tit">CJ 기프트카드</span> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="cjGiftCardAplyAmt_span">0</span>원</span>
						</li>
						<li>
							<span class="tx_tit"><span class="tx_num">PineApple</span> 포인트</span> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="cjonePntAplyAmt_span">0</span>원</span>
						</li>
						<!-- 임직원일 경우 -->
						<li id="cafeteriaPntAplyAmt_li" style="display: none;">
							<span class="tx_tit">카페테리아 포인트</span> 
							<span class="tx_cont colorOrange"><span class="tx_num c" id="cafeteriaPntAplyAmt_span">0</span>원</span>
						</li>
						<!--// 임직원일 경우 -->
						<li id="csmnAplyAmt_li" style="display: none;">
							<span class="tx_tit">예치금</span> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="csmnAplyAmt_span">0</span>원</span>
						</li>
						<li id="culturelandGiftAplyAmt_li" style="display: none;">
							<span class="tx_tit">컬쳐캐쉬</span> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="culturelandGiftAplyAmt_span">0</span>원</span>
						</li>
						<li id="bookGiftAplyAmt_li" style="display: none;">
							<span class="tx_tit">북앤라이프캐쉬</span> 
							<span class="tx_cont colorOrange"><span class="tx_num" id="bookGiftAplyAmt_span">0</span>원</span>
						</li>
						<li class="total">
							<span class="tx_tit">최종 결제금액</span> 
							<span class="tx_cont"><span class="tx_num" id="totPayAmt_sum_span">14,400</span>원</span>
							<input type="hidden" name="remainAmt" value="14400">
							<input type="hidden" name="ordPayAmt" value="14400">
							<input type="hidden" name="goodsNm" value="[온라인단독] 쿵푸팬더의 후끈후끈 손난로 더블기획(10P+10P)">
						</li>

						<li>
							<button class="btnPayment" id="btnPay" name="btnPay" type="button">결제하기<em id="giftNoti3" style="display: none;">(증정품은 결제 시 확인 가능합니다)</em></button>
							<input type="hidden" id="tempOrdNo" value="">
						</li>
					</ul>
					
				</div>
				
			</div>
			<!--// 쿠폰 및 포인트, 결제수단, 결제정보 -->
			</form>

</div>


<!-- ***** footer 시작 ***** -->
<jsp:include page="../footer.jsp"/>  