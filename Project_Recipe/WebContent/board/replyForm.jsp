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
	href="/mvc2Board/include/css/board.css" />
<!-- 모바일 웹 페이지 설정 끝 -->
<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
<script type="text/javascript"
	src="/mvc2Board/include/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/mvc2Board/include/js/board.js"></script>
<script type="text/javascript">
	$(function() {
		/* 저장 버튼 클릭시 처리 이벤트 */
		$("#boardInsert").click(function() {
			//입력값 체크
			if (!chkSubmit($('#author'), "이름을"))
				return;
			else if (!chkSubmit($('#title'), "제목을"))
				return;
			else if (!chkSubmit($('#content'), "작성할 내용을"))
				return;
			else if (!chkSubmit($('#passwd'), "비밀번호를"))
				return;
			else {
				$("#f_replyForm").attr("method", "POST");
				$("#f_replyForm").attr("action", "/mvc2Board/board/reply.do");
				$("#f_replyForm").submit();
			}
		});
		/* 목록버튼 클릭시 처리 이벤트 */
		$("#boardList").click(function() {
			location.href = "/mvc2Board/board/list.do";
		});
	});
</script>
</head>
<body>
	<div id="boardTit">
		<h3>글쓰기</h3>
		</div>
		<div id="boardBut">
			<input type="button" value="저장" class="but" id="boardInsert">
			<input type="button" value="목록" class="but" id="boardList">
		</div>
		<form id="f_replyForm" name="f_replyForm">
			<input type="hidden" name="num" value="${detail.num}"> <input
				type="hidden" name="repRoot" value="${detail.repRoot}"> <input
				type="hidden" name="repStep" value="${detail.repStep}"> <input
				type="hidden" name="repIndent" value="${detail.repIndent}">
			<table id="boardWrite">
				<tr>
					<td colspan="2">원래 글 번호 ${detail.num}&nbsp;(조회수 :
						${detail.readcnt})</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="author" id="author"></td>
				</tr>
				<tr>
					<td>글제목</td>
					<td><input type="text" name="title" id="title"
						value="[답변] ${detail.title}"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" id="content" rows="10" cols="70">기존글내용${detail.content}>>>>>>>>>>>>>>></textarea></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="passwd" id="passwd"></td>
				</tr>
			</table>
		</form>
</body>
</html>
