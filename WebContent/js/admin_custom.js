$(document).ready(function() {
	
	//관리자 메뉴 아코디언
	$(".accordion_banner .accordion_sub").hide();
	
	$(document).on('click','.accordion_banner .accordion_title',function() {
        if($(this).next("div").is(":visible")){
        	$(this).next("div").slideUp("fast");
        } else {
            $(".accordion_banner .accordion_sub").slideUp("fast");
            $(this).next("div").slideToggle("fast");
        }
    });
	// 첫 커밋
	//상품 상세보기 hover
	$('.prod-hover').addClass('prod-none');

	$('.prod-box').hover(function(){
		var num = $('.prod-box').index(this);
		$('.prod-box a').eq(num).removeClass('prod-none');
	},function(){
		$('.prod-hover').addClass('prod-none');
	});
	
	//색상 선택 모달, 행 더블클릭시
	$(".chooseThis").on("dblClick",function(){
		var colorCode = $(this).text();
		alert($(this).text());
	});
}); 

function initButton(){
	//색상 선택 버튼 클릭시
	/*$("#colorRegist").on("click",function(){
		if(confirm("색상을 선택하시겠습니까?")){
			$("#pColor", parent.document).val(this);
		}
	});*/
	
}

//유저상세정보 모달
function userInfoPop(idx){
	//기존 내용 초기화
	$("#umodal-append").empty();
	
	$.ajax({
		type:"POST",
		data:{userIdx:idx},
		url:"userDetail.do",
		dataType:"text",
		cache:false,
		timeout:30000,
		success:function(data){
			var json = data;
			var item = JSON.parse(json)[0];
			
			console.log(JSON.parse(json)[0]);

			var temp_html = "";
			
			temp_html += '		<div class="modal-body">';
			temp_html += '		<div class="popup"><h3>회원 상세보기</h3></div>';
			temp_html += '			<table id="classTable" class="table table-bordered popTable2">';
			temp_html += '        <tbody>';
			temp_html += '           <tr>';
			temp_html += '             <th>회원아이디</th>';
			temp_html += '             <td>'+item.userid+'</td>';
			temp_html += '           </tr>';
			temp_html += '             <th>회원명</th>';
			temp_html += '             <td>'+item.name+'</td>';
			temp_html += '           </tr>';
			temp_html += '             <th>성별</th>';
			temp_html += '             <td>'+item.gender+'</td>';
			temp_html += '           </tr>';
			temp_html += '             <th>이메일</th>';
			temp_html += '             <td>'+item.email+'</td>';
			temp_html += '           </tr>';
			temp_html += '             <th>휴대전화</th>';
			temp_html += '             <td>'+item.phone+'</td>';
			temp_html += '           </tr>';
			temp_html += '             <th>주소</th>';
			temp_html += '             <td>'+item.addr+'</td>';
			temp_html += '           </tr>';
			temp_html += '             <th>상세주소</th>';
			temp_html += '             <td>'+item.addrDetail+'</td>';
			temp_html += '           </tr>';
			temp_html += '             <th>생년월일</th>';
			temp_html += '             <td>'+item.birth+'</td>';
			temp_html += '           </tr>';
			temp_html += '             <th>누적 포인트</th>';
			temp_html += ' 	           <td>'+item.sumTotalPoint+' 포인트</td>';
			temp_html += '           </tr>';
			temp_html += '             <th>누적 구매금액</th>';
			temp_html += ' 	           <td>'+item.sumPurchasePrice+' 원</td>';
			temp_html += '           </tr>';
			temp_html += '             <th>가입일</th>';
			temp_html += ' 	           <td>'+item.registDate+'</td>';
			temp_html += '           </tr>';
			temp_html += '             <th>회원 상태</th>';
			temp_html += ' 	           <td>'+item.status+'</td>';
			temp_html += '           </tr>';
			temp_html += ' 	        </tbody>';
			temp_html += '	      </table>';
			temp_html += '	   </div>';
			
			$("#umodal-append").append(temp_html);
			
		},
		error:function(){
			alert("error!");
		}
	});
}

//색상 선택 모달
function colorChoice(){
	//기존 내용 초기화
	$("#cmodal-append").empty();
	
	var temp_html = "";
	temp_html += "<div class='popup'><h3>색상 선택표</h3></div>";
	temp_html += "<span style='right:0;font-size:10px;color:#c9c7c7;'>&#8251;색상명을 더블클릭 하시면 색상을 선택할 수 있습니다.</span>";
	temp_html += "<table class='popTable1'>";
	temp_html += "	<thead>";
	temp_html += "		<tr><th>색상</th>";
	temp_html += "			<th>색상명</th>";
	temp_html += "		</tr></thead>";
	temp_html += "	<tbody>";
	temp_html += "		<tr><td style='background:black;'></td>";
	temp_html += "			<td class='color-code'><span class='chooseThis'>#000000</span></td>";
	temp_html += "		</tr>";
	temp_html += "		<tr><td style='background:white;'></td>";
	temp_html += "			<td class='color-code'>#fff</td>";
	temp_html += "		</tr>";
	temp_html += "		<tr><td style='background:red;'></td>";
	temp_html += "			<td class='color-code'>#red코드</td>";
	temp_html += "		</tr>";
	temp_html += "		<tr><td style='background:blue;'></td>";
	temp_html += "			<td class='color-code'>#blue코드</td>";
	temp_html += "		</tr>";
	temp_html += "		<tr><td style='background:orange;'></td>";
	temp_html += "			<td class='color-code'>#orange코드</td>";
	temp_html += "		</tr>";
	temp_html += "		<tr><td style='background:yellow;'></td>";
	temp_html += "			<td class='color-code'>#yellow코드</td>";
	temp_html += "		</tr>";
	temp_html += "		<tr><td style='background:purple;'></td>";
	temp_html += "			<td class='color-code'>#purple코드</td>";
	temp_html += "		</tr></tbody></table>";
	temp_html += "<div style='margin-top:5px;text-align:center;'>";
	temp_html += "	<button class='registerBtn' id='colorRegist' onclick=''>등록</button>";
	temp_html += "	<button class='closeBtn' data-dismiss='modal'>닫기</button>";
	temp_html += "</div>";
	
	$("#cmodal-append").append(temp_html);
}