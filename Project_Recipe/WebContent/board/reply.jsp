<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>글쓰기</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="stylesheet" type="text/css"
	href="/mvc2Board/include/css/reply.css" />
<!-- 모바일 웹 페이지 설정 끝 -->
<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
<script type="text/javascript"
	src="/mvc2Board/include/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/mvc2Board/include/js/board.js"></script>
<script type="text/javascript">
	$(function() {
		/* 기본 덧글 목록 불러오기 */
		var num = "${detail.num}";
		listAll(num)
		/* 글입력을 위한 Ajax 연동처리*/
		$("#replyInsert").click(function() {
			//작성자 이름에 대한 입력 여부 검사
			if (!chkSubmit($("#r_name"), "이름을"))
				return;
			else if (!chkSubmit($("#r_pwd"), "비밀번호을"))
				return;
			else if (!chkSubmit($("#r_content"), "내용을"))
				return;
			else {
				var insertUrl = "/mvc2Board/replies/replyInsert.re";

				/*글 저장을 위한 POST방식의 Ajax 연동처리 */
				$.ajax({
					url : insertUrl, //전송 url
					type : "post", //전송 시 method 방식
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify({
						num : num,
						r_name : $("#r_name").val(),
						r_pwd : $("#r_pwd").val(),
						r_content : $("#r_content").val(),
					}),
					error : function() { //실행시 오류가 발생하였을 경우
						alert('시스템 오류 입니다. 관리자에게 문의하세요');
					},
					success : function(result) {
						if (result == "SUCCESS") {
							alert("댓글 등록이 완료되었습니다.");
							dataReset();
							listAll(num);
						}
					}
				});
			}
		});
				
		$(document).on("click",".update_form",function() {
			$(".reset_btn").click();
			var conText = $(this).parents("li").children().eq(1).html();
			console.log("conText : " + conText);

			$(this).parents("li").find("input[type='button']").hide();
			var conArea = $(this).parents("li").children().eq(1);

			conArea.html("");	
			var data="<textarea name = 'content' id = 'content'>"+ conText + "</textarea>";
					data+="<input type = 'button' class='update_btn' value='수정완료'>";
					data+="<input type = 'button' class='reset_btn' value='수정취소'>";
					conArea.html(data);
			});

		/* 초기화 버튼 */
		$(document).on("click", ".reset_btn", function() {
			var conText = $(this).parents("li").find("textarea").html();
			$(this).parents("li").find("input[type='button']").show();
			var conArea = $(this).parents("li").children().eq(1);
			conArea.html(conText);
		});
		
		/* 글 수정을 위한 Ajax 연동 처리 */
		$(document).on("click", ".update_btn", function(){
			var r_num = $(this).parents("li").attr("data-num");
			var r_content = $("#content").val();
			if(!chkSubmit($("#content"),"댓글 내용을")) return;
			else {
				$.ajax({
					url : "/mvc2Board/replies/replyUpdate.re", //전송 url
					type : "post", //전송 시 method 방식
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify({
						r_num : r_num,
						r_content : r_content}),
					success : function(result) {
						console.log("result : " + result);
						if (result == "SUCCESS") {
							alert("수정이 완료되었습니다.");
							listAll(num);
						}
					}
				});				
			}
		});
		/* 글 삭제을 위한 Ajax 연동 처리 */
		$(document).on("click", ".delete_form", function(){
			var r_num = $(this).parents("li").attr("data-num");
			console.log("r_num : " + r_num);
			
			if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
				$.ajax({
					url : "/mvc2Board/replies/replyDelete.re", //전송 url
					type : "post", //전송 시 method 방식
					dataType : "text",
					data : "r_num="+r_num,
					success : function(result) {
						console.log("result : " + result);
						if(result == 'SUCCESS'){
							alert("삭제 되었습니다.");
							listAll(num);
						}
					}
				});
			}
		});
	});

	/* 댓글 목록을 보여주는 함수 */
	function listAll(num) {
		$("#comment_list").html("");

		var url = "/mvc2Board/replies/list.re?num=" + num;
		$.getJSON(url, function(data) {
			console.log(data.length);

			$(data).each(function() {
				var r_num = this.r_num;
				var r_name = this.r_name;
				var r_content = this.r_content;
				var r_date = this.r_date;
				addNewItem(r_num, r_name, r_content, r_date);
			});
		}).fail(function() {
			alert("덧글 목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요");
		});
	}
	/* 새로운 글을 화면에 추가하기 위한 함수 */
	function addNewItem(r_num, r_name, r_content, r_date) {
		//새로운 글이 추가 될 li 태그 객체
		var new_li = $("<li>");
		new_li.attr("data-num", r_num);
		new_li.addClass("comment_item");

		//작성자 정보가 지정될 <p> 태그
		var writer_p = $("<p>");
		writer_p.addClass("writer");

		//작성자 정보의 이름
		var name_span = $("<span>");
		name_span.addClass("name");
		name_span.html(r_name + "님");

		//작성일시
		var date_span = $("<span>");
		date_span.html(" / " + r_date + " ");

		//수정하기 버튼
		var up_input = $("<input>");
		up_input.attr({
			"type" : "button",
			"value" : "수정하기"
		});
		up_input.addClass("update_form");

		//삭제하기 버튼
		var del_input = $("<input>");
		del_input.attr({
			"type" : "button",
			"value" : "삭제하기"
		});
		del_input.addClass("delete_form");

		//내용
		var content_p = $("<p>");
		content_p.addClass("con");
		content_p.html(r_content);

		//조립하기
		writer_p.append(name_span).append(date_span).append(up_input).append(
				del_input)
		new_li.append(writer_p).append(content_p);
		$("#comment_list").append(new_li);
	}

	function dataReset() {
		$("#r_name").val("");
		$("#r_pwd").val("");
		$("#r_content").val("");
	}
</script>
</head>
<body>
	<div id="replyContainer">
		<h1></h1>
		<div id="comment_write">
			<form id="comment_form">
				<div>
					<label for="r_name">작성자</label> <input type="text" name="r_name"
						id="r_name" /> <label for="r_pwd">비밀번호</label> <input
						type="password" name="r_pwd" id="r_pwd" /> <input type="button"
						id="replyInsert" value="저장하기" />
				</div>
				<div>
					<label for="r_content">덧글 내용</label>
					<textarea name="r_content" id="r_content"></textarea>
				</div>
			</form>
		</div>
		<ul id="comment_list">
			<!-- 여기에 동적 생성 요소가 들어감 -->
		</ul>
	</div>
</body>
</html>
