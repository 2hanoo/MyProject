<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 모바일 웹 페이지 설정 -->
<link rel="stylesheet" type="text/css"
	href="/Project_Recipe/include/css/board.css" />
<!-- 모바일 웹 페이지 설정 끝 -->
<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
<script type="text/javascript"
	src="/Project_Recipe/include/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="/Project_Recipe/include/js/board.js"></script>
<script type="text/javascript">
	var butChk = 0; //수정 버튼과 삭제버튼을 구별하기 위한 변수
	$(function(){
		$("#pwdChk").hide();
		/* 수정 버튼 클릭시 처리 이벤트 */
		$("#updateForm").click(function(){
			$("#pwdChk").show();
			$("#msg").text("작성시 입력한 비밀번호를 입력해주세요.").css("color","#000099");
			butChk=1;
		});
		/* 삭제 버튼 클릭 시 처리 이벤트 */
		$("#boardDelete").click(function(){
			$("#pwdChk").show();
			$("#msg").text("작성시 입력한 비밀번호를 입력해주세요.").css("color","#000099");
			butChk=2;
		});
		/* 비밀 번호 확인 버튼 클릭 시 처리 이벤트 */
		$("#pwdBut").click(function(){
			pwdConfirm();
		});
		
		/* 목록버튼 클릭시 처리 이벤트 */
		$("#boardList").click(function(){
			location.href="/Project_Recipe/board/recipeList.do";
		});

		/* 추천버튼 클릭시 처리 이벤트 */
		$("#boardLike").click(function(){
			location.href="/Project_Recipe/board/recipeList.do";
		});

		/* 인쇄버튼 클릭시 처리 이벤트 */
		$("#boardPrint").click(function(){
			location.href="/Project_Recipe/board/recipeList.do";
		});
	});
	
	function pwdConfirm(){
		if(!chkSubmit($('#b_pwd'),"비밀번호를")) return;
		else{
			$.ajax({
				url : "/Project_Recipe/board/pwdCheck.do", //전송 url
				type : "POST", //전송시 method 방식
				data : $("#f_pwd").serialize(),//폼 전체 데이터 전송
				dataType : "text",
				error : function(){ //실행시 오류가 발생하였을 경우
					alert('시스템 오류 입니다. 관리자에게 문의 하세요');
				},
				success : function(resultData){ //정상적으로 실행 되었을 경우
					var goUrl="";//이동할 경로를 저장할 변수
					if(resultData==0){//일치하지 않는경우
						$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color" , "red");
						$("#b_pwd").select();
					}else if(resultData==1){//일치할 경우
						$("#msg").text("");
					if(butChk==1){
						goUrl = "/Project_Recipe/board/recipeUpdate.do";
					}else if(butChk==2){
						goUrl = "/Project_Recipe/board/delete.do";
					}
					$("#f_data").attr("action",goUrl);
					$("#f_data").submit();
					}
				}
			}); /* ajax 함수 종료 */
		}
	}
</script>

	<div id="boardTit">
		<h3>레시피 게시판</h3>
	</div>
	<form name="f_data" id="f_data" method="POST">
		<input type="hidden" name="num" id="num" value="${recipeDetail.num}">
	</form>
	<div id="boardDetail">
	<!-- ======================== 게시물 정보 보여주기 시작 ============================== -->
		<div id="boardDetail_top">
			<table>
				<colgroup>
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="25%" />
				</colgroup>
				<tbody>
				<tr>
					<td class="ac">제  목</td>
					<td colspan="5">${recipeDetail.b_title} (추천수 : ${recipeDetail.b_like} )</td>
				</tr>
				<tr>
					<td class="ac">작성자</td>
					<td>${recipeDetail.nickname}</td>
					<td class="ac">조회수</td>
					<td>${recipeDetail.readcnt}</td>
					<td class="ac">작성일자</td>
					<td>${recipeDetail.writeday}</td>
				</tr>
				</tbody>
			</table>
		</div>
		<!-- =========================컨텐츠 화면=============================== -->		
		<div id="boardDetail_mid">
			<table>
				<colgroup>
					<col width="30%" />
					<col width="70%" />
				</colgroup>
				<tr>
					<td class="ac">사 진</td>
					<td class="ac">요리 설명 / 재료</td>
				</tr>
				<tr>
					<td><div id="thumbnail"><img src="/Project_Recipe/include/upload/${recipeDetail.thumbnail}" width="200" height="200"></div></td>
					<td>${recipeDetail.b_content}</td>
				</tr>
				<c:forEach var="recipeContent" items="${recipeContent}">
				<tr>
					<td>
						<img src="/Project_Recipe/include/upload/${recipeContent.image}" width="200" height="200"></td>
					<td>${recipeContent.content}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<!-- =========================컨텐츠 화면 끝 ============================= -->		
	</div>
	<!-- ======================== 게시물 정보 보여주기 끝============================== -->
	<!-- =============================버튼조작부================================== -->
	<div id="boardPwdBut">
		<table>
			<tr>
				<td id="btd1">
					<div id="pwdChk">
						<form name="f_pwd" id="f_pwd">
							<input type="hidden" name="num" id="num" value="${recipeDetail.num}" />
							<label for="b_pwd" id="l_pwd">비밀번호 : </label> 
							<input type="password" name="b_pwd" id="b_pwd" /> 
							<input type="button" id="pwdBut" value="확인" /> <span id="msg"></span>
						</form>
					</div>
				</td>
				<td id="btd2">
					<input type="button" value="추천" id="boardLike"> 
					<input type="button" value="인쇄" id="boardPrint"> 
					<input type="button" value="수정" id="updateForm">
					<input type="button" value="삭제" id="boardDelete"> 
					<input type="button" value="목록" id="boardList">
				</td>
			</tr>
		</table>
	</div>
	<!-- =============================버튼조작부================================== -->
