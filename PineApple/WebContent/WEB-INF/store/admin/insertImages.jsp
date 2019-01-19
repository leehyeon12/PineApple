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
		$(".fileSearch").hide();
 		var i = 0;
		$("#add_row").click(function() {
			i++;
			$(".tbl-img").append("<tr id='addr"+i+"'>"+$(".imgRow").html()+"</tr>");
			$("#addr"+i).find(".idx").empty().html(i+1);
			console.log(i);
		});
		
		$("#delete_row").click(function() {
			if(i<1) {
				alert("삭제불가");
				return ;
			}
			$("#tbl-img").find("#addr"+i).remove();
			i--;
			console.log(i);
		});
		
		$(document).on("click", ".btnFile", function() {
			$(this).parent().parent().find(".fileSearch").trigger("click");
		});
		
		$(document).on("change", ".fileSearch", function() {
			var pimages = $(this).val();
			$(this).parent().parent().find(".pimages").val(pimages);
		});

/* 		var i = 0;
		
		$("#add_row").on("click", function() {
			i++;
			$(".tbl-img").append("<tr id='addr"+i+"'>"+$(".imgRow").html()+"</tr>");
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
							<th class="text-center">이미지파일 경로</th>
							<th class="text-center">파일찾기</th>
						</tr>
					</thead>
					
					<tbody class="tbl-img" id="tbl-img">
						<tr id='addr0' class="imgRow">
							<td><span class="idx">1</span></td>
							<td><input type="text" name='pimage'
								placeholder='경로명' class="form-control pimages" value="" /></td>
							<td><button type="button" class="btnFile form-control btn btn-dark" 
								style="background-color: #000000;" ><span style="font-weight: bold; color: #ffffff;">첨부</span></button>
								<input type="file" class="fileSearch" value=""/></td>
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