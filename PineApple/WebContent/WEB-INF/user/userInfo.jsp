<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>
    
<!-- ***** head 시작 ***** -->	
<jsp:include page="../head.jsp"/>

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/styles/userInfo_styles.css">

<!-- ***** header 시작 ***** -->
<jsp:include page="../header.jsp"/>

<body>

<!--========================= Content(col-lg-9) ==============================-->
<div class="container">	
	<div class="col-lg-9">
		<!-- navbar tap 시작 -->
		<ul class="nav nav-tabs navbar-collapse">
			<li class="nav-item"><a class="nav-link" href="" id="myInfoEdit" data-num="1"
				data-toggle="tab" data-target="#tabone">기본정보</a></li>
			<li class="nav-item"><a class="nav-link" href="" id="myPwdEdit"
				data-toggle="tab" data-target="#tabtwo">비밀번호 변경</a></li>

		</ul>
	 	<!-- navbar tap 끝 -->
	
	
		<div class="tab-content mt-2">
			
			
			<!-- tab one -->
			<div class="tab-pane active" id="tabone" role="tabpanel">
				<div class="tab_content">
		
						<div id="contentsWrap">
		<form name="form1" id="form1" method="post" action="">			
			<div id="contents">
				<div class="cont_header">
					<h1 class="h1_tit">회원정보 수정</h1>
					<p class="h_desc">회원님의 소중한 정보를 안전하게 관리하세요.</p>
				</div>
				<div class="cont_area">
					<div class="mypage_sec">
						<div class="member_info">
							<!-- 기본정보 -->
							<div class="table_header">
								<h3 class="h3_tit">기본정보</h3>
								<div class="info">						
									<a href="https://www.cjone.com/cjmweb/member/withdrawal.do?coopco_cd=7030&amp;brnd_cd=3000&amp;mcht_no=3000" class="btn btn_sm"><span class="arr">회원탈퇴</span></a>
								</div>
							</div>
							<div class="table_col">
								<table>
									<caption>회원기본정보 입력 표로 회원정보 이름, 아이디, 비밀번호, 비밀번호 확인, 생년월일, 휴대전화, 이메일을 나타냅니다.</caption>
									<colgroup>
										<col style="width:25%">
										<col>
									</colgroup>
									<tbody>
										<tr class="input">
											<th scope="row">이름</th>
											<td>
												<div class="input_group">
													<span id="hg_nm_area">이*연</span>
													<a href="#" class="btn btn_sm" id="lnChangeName"><span>이름변경</span></a>
												</div>
												<p class="msg_desc">개명으로 이름이 변경된 경우만 수정 가능합니다.</p>
											</td>
										</tr>
										<tr>
											<th scope="row">아이디</th>
											<td><span id="mbr_id_area">ls*****</span></td>
										</tr>
										<tr class="input new_pw hide" id="trPwdCheck" data-handler="trPwdCheck">
											<th scope="row">
												<label for="pwd_check">비밀번호 확인</label>
											</th>
											<td>
												<div class="input_group">										
													<span class="input_txt w250"><input type="password" class="text" placeholder="비밀번호를 재입력해주세요." maxlength="50" name="pwd_check" id="pwd_check"></span>
													<p id="msg_pwd_check" class="msg_info em hide">비밀번호와 비밀번호 확인이 일치하지 않습니다.</p>
												</div>
											</td>
										</tr>
										<tr class="input">
											<th scope="row">
												<label for="birth_yy">생년월일</label>
											</th>
											<td>
												<div class="birthday_select" id="birthday_select" style="display:none">
													<span class="select w120 hide" data-skin="form">
														<select id="birth_yy" name="birth_yy" title="생년월일 중 년 선택">
															[<option value="">년</option>, <option value="2018">2018</option>, <option value="2017">2017</option>, <option value="2016">2016</option>, <option value="2015">2015</option>, <option value="2014">2014</option>, <option value="2013">2013</option>, <option value="2012">2012</option>, <option value="2011">2011</option>, <option value="2010">2010</option>, <option value="2009">2009</option>, <option value="2008">2008</option>, <option value="2007">2007</option>, <option value="2006">2006</option>, <option value="2005">2005</option>, <option value="2004">2004</option>, <option value="2003">2003</option>, <option value="2002">2002</option>, <option value="2001">2001</option>, <option value="2000">2000</option>, <option value="1999">1999</option>, <option value="1998">1998</option>, <option value="1997">1997</option>, <option value="1996">1996</option>, <option value="1995">1995</option>, <option value="1994">1994</option>, <option value="1993">1993</option>, <option value="1992" selected="">1992</option>, <option value="1991">1991</option>, <option value="1990">1990</option>, <option value="1989">1989</option>, <option value="1988">1988</option>, <option value="1987">1987</option>, <option value="1986">1986</option>, <option value="1985">1985</option>, <option value="1984">1984</option>, <option value="1983">1983</option>, <option value="1982">1982</option>, <option value="1981">1981</option>, <option value="1980">1980</option>, <option value="1979">1979</option>, <option value="1978">1978</option>, <option value="1977">1977</option>, <option value="1976">1976</option>, <option value="1975">1975</option>, <option value="1974">1974</option>, <option value="1973">1973</option>, <option value="1972">1972</option>, <option value="1971">1971</option>, <option value="1970">1970</option>, <option value="1969">1969</option>, <option value="1968">1968</option>, <option value="1967">1967</option>, <option value="1966">1966</option>, <option value="1965">1965</option>, <option value="1964">1964</option>, <option value="1963">1963</option>, <option value="1962">1962</option>, <option value="1961">1961</option>, <option value="1960">1960</option>, <option value="1959">1959</option>, <option value="1958">1958</option>, <option value="1957">1957</option>, <option value="1956">1956</option>, <option value="1955">1955</option>, <option value="1954">1954</option>, <option value="1953">1953</option>, <option value="1952">1952</option>, <option value="1951">1951</option>, <option value="1950">1950</option>, <option value="1949">1949</option>, <option value="1948">1948</option>, <option value="1947">1947</option>, <option value="1946">1946</option>, <option value="1945">1945</option>, <option value="1944">1944</option>, <option value="1943">1943</option>, <option value="1942">1942</option>, <option value="1941">1941</option>, <option value="1940">1940</option>, <option value="1939">1939</option>, <option value="1938">1938</option>, <option value="1937">1937</option>, <option value="1936">1936</option>, <option value="1935">1935</option>, <option value="1934">1934</option>, <option value="1933">1933</option>, <option value="1932">1932</option>, <option value="1931">1931</option>, <option value="1930">1930</option>, <option value="1929">1929</option>, <option value="1928">1928</option>, <option value="1927">1927</option>, <option value="1926">1926</option>, <option value="1925">1925</option>, <option value="1924">1924</option>, <option value="1923">1923</option>, <option value="1922">1922</option>, <option value="1921">1921</option>, <option value="1920">1920</option>, <option value="1919">1919</option>, <option value="1918">1918</option>, <option value="1917">1917</option>, <option value="1916">1916</option>, <option value="1915">1915</option>, <option value="1914">1914</option>, <option value="1913">1913</option>, <option value="1912">1912</option>, <option value="1911">1911</option>, <option value="1910">1910</option>, <option value="1909">1909</option>, <option value="1908">1908</option>, <option value="1907">1907</option>, <option value="1906">1906</option>, <option value="1905">1905</option>, <option value="1904">1904</option>, <option value="1903">1903</option>, <option value="1902">1902</option>, <option value="1901">1901</option>, <option value="1900">1900</option>]
														</select>
													</span><div class="select_wrap w120" style="background-color:rgb(235,235,228)">	<div class="item_seleced"><a href="#1992" title="생년월일 중 년 선택 목록 열기" data-title="생년월일 중 년 선택">1992<span class="haze">선택됨</span></a></div>	<div class="item_list_wrap ">		<div class="item_list ui_scrollarea">			<ul class="ui_content"><li><a href="#"><span>년</span></a></li><li><a href="#2018"><span>2018</span></a></li><li><a href="#2017"><span>2017</span></a></li><li><a href="#2016"><span>2016</span></a></li><li><a href="#2015"><span>2015</span></a></li><li><a href="#2014"><span>2014</span></a></li><li><a href="#2013"><span>2013</span></a></li><li><a href="#2012"><span>2012</span></a></li><li><a href="#2011"><span>2011</span></a></li><li><a href="#2010"><span>2010</span></a></li><li><a href="#2009"><span>2009</span></a></li><li><a href="#2008"><span>2008</span></a></li><li><a href="#2007"><span>2007</span></a></li><li><a href="#2006"><span>2006</span></a></li><li><a href="#2005"><span>2005</span></a></li><li><a href="#2004"><span>2004</span></a></li><li><a href="#2003"><span>2003</span></a></li><li><a href="#2002"><span>2002</span></a></li><li><a href="#2001"><span>2001</span></a></li><li><a href="#2000"><span>2000</span></a></li><li><a href="#1999"><span>1999</span></a></li><li><a href="#1998"><span>1998</span></a></li><li><a href="#1997"><span>1997</span></a></li><li><a href="#1996"><span>1996</span></a></li><li><a href="#1995"><span>1995</span></a></li><li><a href="#1994"><span>1994</span></a></li><li><a href="#1993"><span>1993</span></a></li><li><a href="#1992" data-selected="true"><span>1992</span></a></li><li><a href="#1991"><span>1991</span></a></li><li><a href="#1990"><span>1990</span></a></li><li><a href="#1989"><span>1989</span></a></li><li><a href="#1988"><span>1988</span></a></li><li><a href="#1987"><span>1987</span></a></li><li><a href="#1986"><span>1986</span></a></li><li><a href="#1985"><span>1985</span></a></li><li><a href="#1984"><span>1984</span></a></li><li><a href="#1983"><span>1983</span></a></li><li><a href="#1982"><span>1982</span></a></li><li><a href="#1981"><span>1981</span></a></li><li><a href="#1980"><span>1980</span></a></li><li><a href="#1979"><span>1979</span></a></li><li><a href="#1978"><span>1978</span></a></li><li><a href="#1977"><span>1977</span></a></li><li><a href="#1976"><span>1976</span></a></li><li><a href="#1975"><span>1975</span></a></li><li><a href="#1974"><span>1974</span></a></li><li><a href="#1973"><span>1973</span></a></li><li><a href="#1972"><span>1972</span></a></li><li><a href="#1971"><span>1971</span></a></li><li><a href="#1970"><span>1970</span></a></li><li><a href="#1969"><span>1969</span></a></li><li><a href="#1968"><span>1968</span></a></li><li><a href="#1967"><span>1967</span></a></li><li><a href="#1966"><span>1966</span></a></li><li><a href="#1965"><span>1965</span></a></li><li><a href="#1964"><span>1964</span></a></li><li><a href="#1963"><span>1963</span></a></li><li><a href="#1962"><span>1962</span></a></li><li><a href="#1961"><span>1961</span></a></li><li><a href="#1960"><span>1960</span></a></li><li><a href="#1959"><span>1959</span></a></li><li><a href="#1958"><span>1958</span></a></li><li><a href="#1957"><span>1957</span></a></li><li><a href="#1956"><span>1956</span></a></li><li><a href="#1955"><span>1955</span></a></li><li><a href="#1954"><span>1954</span></a></li><li><a href="#1953"><span>1953</span></a></li><li><a href="#1952"><span>1952</span></a></li><li><a href="#1951"><span>1951</span></a></li><li><a href="#1950"><span>1950</span></a></li><li><a href="#1949"><span>1949</span></a></li><li><a href="#1948"><span>1948</span></a></li><li><a href="#1947"><span>1947</span></a></li><li><a href="#1946"><span>1946</span></a></li><li><a href="#1945"><span>1945</span></a></li><li><a href="#1944"><span>1944</span></a></li><li><a href="#1943"><span>1943</span></a></li><li><a href="#1942"><span>1942</span></a></li><li><a href="#1941"><span>1941</span></a></li><li><a href="#1940"><span>1940</span></a></li><li><a href="#1939"><span>1939</span></a></li><li><a href="#1938"><span>1938</span></a></li><li><a href="#1937"><span>1937</span></a></li><li><a href="#1936"><span>1936</span></a></li><li><a href="#1935"><span>1935</span></a></li><li><a href="#1934"><span>1934</span></a></li><li><a href="#1933"><span>1933</span></a></li><li><a href="#1932"><span>1932</span></a></li><li><a href="#1931"><span>1931</span></a></li><li><a href="#1930"><span>1930</span></a></li><li><a href="#1929"><span>1929</span></a></li><li><a href="#1928"><span>1928</span></a></li><li><a href="#1927"><span>1927</span></a></li><li><a href="#1926"><span>1926</span></a></li><li><a href="#1925"><span>1925</span></a></li><li><a href="#1924"><span>1924</span></a></li><li><a href="#1923"><span>1923</span></a></li><li><a href="#1922"><span>1922</span></a></li><li><a href="#1921"><span>1921</span></a></li><li><a href="#1920"><span>1920</span></a></li><li><a href="#1919"><span>1919</span></a></li><li><a href="#1918"><span>1918</span></a></li><li><a href="#1917"><span>1917</span></a></li><li><a href="#1916"><span>1916</span></a></li><li><a href="#1915"><span>1915</span></a></li><li><a href="#1914"><span>1914</span></a></li><li><a href="#1913"><span>1913</span></a></li><li><a href="#1912"><span>1912</span></a></li><li><a href="#1911"><span>1911</span></a></li><li><a href="#1910"><span>1910</span></a></li><li><a href="#1909"><span>1909</span></a></li><li><a href="#1908"><span>1908</span></a></li><li><a href="#1907"><span>1907</span></a></li><li><a href="#1906"><span>1906</span></a></li><li><a href="#1905"><span>1905</span></a></li><li><a href="#1904"><span>1904</span></a></li><li><a href="#1903"><span>1903</span></a></li><li><a href="#1902"><span>1902</span></a></li><li><a href="#1901"><span>1901</span></a></li><li><a href="#1900"><span>1900</span></a></li></ul>		</div>		<div class="scroll ui_scrollbar">			<span class="bg_top"></span>			<span class="bg bg_mid" style="display: none;"></span>			<span class="bg_btm"></span>		</div>	</div></div>
													<span class="symbol">년</span>
													<span class="select w70 hide" data-skin="form">
														<select id="birth_mm" name="birth_mm" title="생년월일 중 월 선택" class="narrow">
															 [<option value="">월</option>, <option value="01">01</option>, <option value="02">02</option>, <option value="03">03</option>, <option value="04">04</option>, <option value="05">05</option>, <option value="06" selected="">06</option>, <option value="07">07</option>, <option value="08">08</option>, <option value="09">09</option>, <option value="10">10</option>, <option value="11">11</option>, <option value="12">12</option>]
														</select>
													</span><div class="select_wrap w70" style="background-color:rgb(235,235,228)">	<div class="item_seleced"><a href="#06" title="생년월일 중 월 선택 목록 열기" data-title="생년월일 중 월 선택">06<span class="haze">선택됨</span></a></div>	<div class="item_list_wrap ">		<div class="item_list ui_scrollarea">			<ul class="ui_content"><li><a href="#"><span>월</span></a></li><li><a href="#01"><span>01</span></a></li><li><a href="#02"><span>02</span></a></li><li><a href="#03"><span>03</span></a></li><li><a href="#04"><span>04</span></a></li><li><a href="#05"><span>05</span></a></li><li><a href="#06" data-selected="true"><span>06</span></a></li><li><a href="#07"><span>07</span></a></li><li><a href="#08"><span>08</span></a></li><li><a href="#09"><span>09</span></a></li><li><a href="#10"><span>10</span></a></li><li><a href="#11"><span>11</span></a></li><li><a href="#12"><span>12</span></a></li></ul>		</div>		<div class="scroll ui_scrollbar">			<span class="bg_top"></span>			<span class="bg bg_mid" style="display: none;"></span>			<span class="bg_btm"></span>		</div>	</div></div>
													<span class="symbol">월</span>
													<span class="select w70 hide" data-skin="form">
														<select id="birth_dd" name="birth_dd" title="생년월일 중 일 선택" class="narrow">
															[<option value="">일</option>, <option value="01">01</option>, <option value="02">02</option>, <option value="03">03</option>, <option value="04" selected="">04</option>, <option value="05">05</option>, <option value="06">06</option>, <option value="07">07</option>, <option value="08">08</option>, <option value="09">09</option>, <option value="10">10</option>, <option value="11">11</option>, <option value="12">12</option>, <option value="13">13</option>, <option value="14">14</option>, <option value="15">15</option>, <option value="16">16</option>, <option value="17">17</option>, <option value="18">18</option>, <option value="19">19</option>, <option value="20">20</option>, <option value="21">21</option>, <option value="22">22</option>, <option value="23">23</option>, <option value="24">24</option>, <option value="25">25</option>, <option value="26">26</option>, <option value="27">27</option>, <option value="28">28</option>, <option value="29">29</option>, <option value="30">30</option>]
														</select>
													</span><div class="select_wrap w70" style="background-color:rgb(235,235,228)">	<div class="item_seleced"><a href="#04" title="생년월일 중 일 선택 목록 열기" data-title="생년월일 중 일 선택">04<span class="haze">선택됨</span></a></div>	<div class="item_list_wrap ">		<div class="item_list ui_scrollarea">			<ul class="ui_content"><li><a href="#"><span>일</span></a></li><li><a href="#01"><span>01</span></a></li><li><a href="#02"><span>02</span></a></li><li><a href="#03"><span>03</span></a></li><li><a href="#04" data-selected="true"><span>04</span></a></li><li><a href="#05"><span>05</span></a></li><li><a href="#06"><span>06</span></a></li><li><a href="#07"><span>07</span></a></li><li><a href="#08"><span>08</span></a></li><li><a href="#09"><span>09</span></a></li><li><a href="#10"><span>10</span></a></li><li><a href="#11"><span>11</span></a></li><li><a href="#12"><span>12</span></a></li><li><a href="#13"><span>13</span></a></li><li><a href="#14"><span>14</span></a></li><li><a href="#15"><span>15</span></a></li><li><a href="#16"><span>16</span></a></li><li><a href="#17"><span>17</span></a></li><li><a href="#18"><span>18</span></a></li><li><a href="#19"><span>19</span></a></li><li><a href="#20"><span>20</span></a></li><li><a href="#21"><span>21</span></a></li><li><a href="#22"><span>22</span></a></li><li><a href="#23"><span>23</span></a></li><li><a href="#24"><span>24</span></a></li><li><a href="#25"><span>25</span></a></li><li><a href="#26"><span>26</span></a></li><li><a href="#27"><span>27</span></a></li><li><a href="#28"><span>28</span></a></li><li><a href="#29"><span>29</span></a></li><li><a href="#30"><span>30</span></a></li></ul>		</div>		<div class="scroll ui_scrollbar">			<span class="bg_top"></span>			<span class="bg bg_mid" style="display: none;"></span>			<span class="bg_btm"></span>		</div>	</div></div>
													<span class="symbol">일</span>
													<a href="https://www.cjone.com/cjmweb/my-one/coupon.do?cpn_type_cd=15" class="btn btn_sm"><span class="arr">생일쿠폰 확인</span></a>
												</div>
												<div class="birthday_select" id="birthday_default" style="display:block">
													****<span class="symbol">년</span>
													**<span class="symbol">월</span>	
													**<span class="symbol">일</span>																									
												</div>
											</td>
										</tr>
										<tr class="input">
											<th scope="row">
												<label for="mob_no_1">휴대전화</label>
											</th>
											<td>
												<div class="phon_write" style="width:326px">
													<span class="select w100 hide" data-skin="form">
														<select name="mob_no_1" id="mob_no_1" title="휴대전화 앞자리 선택" disabled="disabled">
															<option value="">선택하세요</option>
															
																<option value="010" selected="selected">010
																</option>
															
																<option value="011">011
																</option>
															
																<option value="016">016
																</option>
															
																<option value="017">017
																</option>
															
																<option value="018">018
																</option>
															
																<option value="019">019
																</option>
															
																<option value="070">070
																</option>
															
																<option value="0130">0130
																</option>
															
																<option value="0303">0303
																</option>
															
																<option value="0502">0502
																</option>
															
																<option value="0504">0504
																</option>
															
																<option value="0505">0505
																</option>
															
																<option value="0506">0506
																</option>
																														
														</select>
													</span><div class="select_wrap w100" style="background-color:rgb(235,235,228)">	<div class="item_seleced"><a href="#010" title="휴대전화 앞자리 선택 목록 열기" data-title="휴대전화 앞자리 선택" class="">010
																<span class="haze">선택됨</span></a></div>	<div class="item_list_wrap ">		<div class="item_list ui_scrollarea">			<ul class="ui_content"><li><a href="#"><span>선택하세요</span></a></li><li><a href="#010" data-selected="true"><span>010
																</span></a></li><li><a href="#011"><span>011
																</span></a></li><li><a href="#016"><span>016
																</span></a></li><li><a href="#017"><span>017
																</span></a></li><li><a href="#018"><span>018
																</span></a></li><li><a href="#019"><span>019
																</span></a></li><li><a href="#070"><span>070
																</span></a></li><li><a href="#0130"><span>0130
																</span></a></li><li><a href="#0303"><span>0303
																</span></a></li><li><a href="#0502"><span>0502
																</span></a></li><li><a href="#0504"><span>0504
																</span></a></li><li><a href="#0505"><span>0505
																</span></a></li><li><a href="#0506"><span>0506
																</span></a></li></ul>		</div>		<div class="scroll ui_scrollbar">			<span class="bg_top"></span>			<span class="bg bg_mid" style="display: none;"></span>			<span class="bg_btm"></span>		</div>	</div></div>
													<span class="symbol">-</span>
													<span class="input_txt w100">
														<input type="text" class="text narrow" title="휴대전화 중간자리 입력" data-format="num" name="mob_no_2" id="mob_no_2" maxlength="4" value="****" disabled="disabled" autocomplete="off">
													</span>
													<span class="symbol">-</span>
													<span class="input_txt w100">												
														<input type="text" class="text narrow" title="휴대전화 끝자리 입력" data-format="num" name="mob_no_3" id="mob_no_3" maxlength="4" value="9264" disabled="disabled" autocomplete="off">
													</span>
												</div>
												<p class="msg_desc">주문 및 배송, 쿠폰, 이벤트 정보 등을 제공 받으실 수 있습니다.</p>
											</td>
										</tr>
										<tr class="input">
											<th scope="row">
												<label for="email_addr1">이메일</label>
											</th>
											<td>
												<div class="email_write" style="width:415px">
													<span class="input_txt w110" data-skin="form">
														<input type="text" class="text small" title="이메일 아이디 입력" placeholder="이메일 아이디" data-format="email" name="email_addr1" id="email_addr1" value="ls*******" disabled="disabled" autocomplete="off">
													</span>
													<span class="symbol">@</span>
													<span class="input_txt w110">
														<input type="text" class="text small" title="이메일 도메인 입력" placeholder="이메일 도메인" data-format="email" name="email_addr2" id="email_addr2" value="nate.com" disabled="disabled" autocomplete="off">
													</span>
													<span class="select w100 hide" data-skin="form">
													<select title="이메일 도메인 선택" data-control="emailSelector" name="email_addr_opt" id="email_addr_opt" disabled="disabled">
														
															<option value="0">직접입력</option>
														
															<option value="naver.com">네이버</option>
														
															<option value="hanmail.net">한메일</option>
														
															<option value="nate.com" selected="selected">네이트</option>
														
															<option value="gmail.com">지메일</option>
														
													</select>
													</span><div class="select_wrap w100" style="background-color:rgb(235,235,228)">	<div class="item_seleced"><a href="#nate.com" title="이메일 도메인 선택 목록 열기" data-title="이메일 도메인 선택">네이트<span class="haze">선택됨</span></a></div>	<div class="item_list_wrap ">		<div class="item_list ui_scrollarea">			<ul class="ui_content"><li><a href="#0"><span>직접입력</span></a></li><li><a href="#naver.com"><span>네이버</span></a></li><li><a href="#hanmail.net"><span>한메일</span></a></li><li><a href="#nate.com" data-selected="true"><span>네이트</span></a></li><li><a href="#gmail.com"><span>지메일</span></a></li></ul>		</div>		<div class="scroll ui_scrollbar">			<span class="bg_top"></span>			<span class="bg bg_mid" style="display: none;"></span>			<span class="bg_btm"></span>		</div>	</div></div>
												</div>
												<p class="msg_desc">이메일 주소 입력 시 사용 가능 특수 문자 : - . _</p>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- //기본정보 -->
						</div>
					</div>
				</div>
			</div>
		</form>
		</div>	
					
					
					
					
				</div>
			</div>
			<!-- // end of tab one -->
			
			<!-- tab two -->
			<div class="tab-pane" id="tabtwo" role="tabpanel">
				<div class="tab_content">
		
					이승연 빡세
				</div>
			</div>
			<!-- // end of tab two -->
			
		</div>
	</div>
</div>



<!-- ***** footer 시작 ***** -->
<jsp:include page="../footer.jsp"/>