<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/Project_Recipe/include/css/board.css" />
<!-- 모바일 웹 페이지 설정 끝 -->
<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
<script type="text/javascript"
	src="/Project_Recipe/include/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/Project_Recipe/include/js/board.js"></script>
<script type="text/javascript">
	$(function() {
		/* 저장 버튼 클릭시 처리 이벤트 */
		$("#boardInsert").click(
				function() {
					//입력값 체크
					if (!chkSubmit($('#b_title'), "제목을"))
						return;
					else if (!chkSubmit($('#b_content'), "작성할 내용을"))
						return;
					else if (!chkSubmit($('#b_pwd'), "비밀번호를"))
						return;
					else {
						$("#f_writeForm").attr("method", "POST");
						$("#f_writeForm").attr("action",
								"/Project_Recipe/board/insert.do");
						$("#f_writeForm").submit();
					}
				});
		/* 목록버튼 클릭시 처리 이벤트 */
		$("#boardList").click(function() {
			$.ajax({
				url : "/Project_Recipe/board/recipeList.do", //전송 url
				type : "POST", //전송시 method 방식
				/* 				data : $("#f_pwd").serialize(),//폼 전체 데이터 전송 */

				dataType : "text",
				error : function() { //실행시 오류가 발생하였을 경우
					alert('시스템 오류 입니다. 관리자에게 문의 하세요');
				},
				success : function(resultData) { //정상적으로 실행 되었을 경우
					$("#boardbody").html(resultData)
				}
			})
		});
	});
</script>
<div id="boardTit">
	<h3>글쓰기</h3> 
</div>
<form id="f_writeForm" name="f_writeFrom">
	<table id="boardWrite">
		<colgroup>
			<col width="20%" />
			<col width="30%" />
			<col width="20%" />
			<col width="30%" />
		</colgroup>
		<tr>
			<td>글제목</td>
			<td colspan="2"><input type="text" name="b_title" id="b_title"></td>
			<td><select name="cg_num" id="cg_num">
					<option value="0">훔쳐온 레시피</option>
					<option value="1">나의 레시피</option>
			</select>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="num" id="num"></td>
			<td>비밀번호</td>
			<td><input type="password" name="b_pwd" id="b_pwd"></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="3"><textarea name="b_content" id="b_content" rows="10" cols="70"></textarea></td>
		</tr>

	</table>
</form>
<div id="boardBut">
	<input type="button" value="저장" class="but" id="boardInsert"> <input
		type="button" value="목록" class="but" id="boardList">
</div>
