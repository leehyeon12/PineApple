<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$(".colorSearch").hide();
 		var i = 0;
		$("#add_row").click(function() {
			i++;
			$(".tbl-color").append("<tr id='addr"+i+"'>"+$(".colorRow").html()+"</tr>");
			$("#addr"+i).find(".idx").empty().html(i+1);
			console.log(i);
		});
		
		$("#delete_row").click(function() {
			if(i<1) {
				alert("삭제불가");
				return ;
			}
			$("#tbl-color").find("#addr"+i).remove();
			i--;
			console.log(i);
		});
		
		$(document).on("click", ".btnColor", function() {
			$(this).parent().parent().find(".colorSearch").trigger("click");
		});
		
		$(document).on("change", ".colorSearch", function() {
			var colors = $(".colorSearch").val();
			console.log(colors);
			$(this).parent().parent().find(".colorcode").val(colors);
		});

/* 		var i = 0;
		
		$("#add_row").on("click", function() {
			i++;
			$(".tbl-color").append("<tr id='addr"+i+"'>"+$(".colorRow").html()+"</tr>");
		});// end of add_row on

		$("#delete_row").on("click", function() {
			
			if(i<1) {
				alert("삭제불가");
				return ;
			}
			$("#addr" + i).remove();
			i--;
		}); */

	});// end of document ready
	
	// 체크박스 모두선택 및 모두해제 되기 위한 함수
	function allCheckBox() {
		var check = $("#allCheck").is(':checked');
		/*
			$(selector).is(':checked') 사용법
			- 체크박스 선택자가 선택되는 경우를 true, 체크해제되는 경우를 false를 나타낸다.
		*/
		
		$(".imgCheck").prop('checked', check);
	}// end of allCheckBox

</script>
<title>이미지 추가</title>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12">
				<table class="table table-bordered table-hover" id="tab_logic">
				
					<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">색깔입력</th>
							<th class="text-center">파일찾기</th>
						</tr>
					</thead>
					
					<tbody class="tbl-color" id="tbl-color">
						<tr id='addr0' class="colorRow">
							<td><span class="idx">1</span></td>
							<td><input type="text" name='colors'
								placeholder='색상코드' class="form-control colorcode" value="" /></td>
							<td><button type="button" class="btnColor form-control btn btn-dark" 
								style="background-color: #000000;" ><span style="font-weight: bold; color: #ffffff;">첨부</span></button>
								<input type="color" class="colorSearch"/></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12">
				<button id="add_row" class="btn btn-default pull-left" >Add Row</button>
				<button id='delete_row' class="pull-right btn btn-default" >Delete Row</button>
			</div>
		</div>

	</div>
</body>
</html>