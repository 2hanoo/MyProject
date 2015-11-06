<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="/Project_Recipe/include/css/board.css" />
<!-- 모바일 웹 페이지 설정 끝 -->
<!--[if lt IE 9]><script src="../js/html5shiv.js"></script> <![endif]-->
<script type="text/javascript"
	src="/Project_Recipe/include/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(function() {
		//검색 후 검색 대상과 검색 단어 출력
		if("<c:out value='${data.keyword}'/>"!=""){
			$('#keyword').val("<c:out value='${data.keyword}'/>");
			$('#search').val("<c:out value='${data.search}'/>");
		}
		
		//한페이지에 보여줄 레코드 수 조회 후 선택해 놓기 위해서 설정
		if("<c:out value='${data.pageSize}'/>"!=""){
			$('#pageSize').val("<c:out value='${data.pageSize}'/>");
		}		
		
		//한페이지에 보여줄 레코드 수 변경될때 마다 처리 이벤트
		$("#pageSize").change(function(){
			goPage(1);
		});
		
		/*글쓰기 버튼 클릭 시 처리 이벤트 */
		$("#recipeInsert").click(function() {			
			$.ajax({
			url : "/Project_Recipe/board/recipeInsert.do", //전송 url
			type : "POST", //전송시 method 방식
			dataType : "text",
			error : function() { //실행시 오류가 발생하였을 경우
				alert('시스템 오류 입니다. 관리자에게 문의 하세요');
			},
			success : function(resultData) { //정상적으로 실행 되었을 경우
				$("#boardbody").html(resultData)
			}
		})
	});

		// 상세페이지 이동  이벤트
		$(".goDetail").click(function() {
			var num = $(this).parent().parent().children().eq(0).html();
			$("#num").val(num);
			console.log(num);

			$("#detailForm").attr({
				"method" : "post",
				"action" : "/Project_Recipe/board/recipeDetail.do"
			});
			$("#detailForm").submit();
		});
		if("<c:out value='${data.keyword}'/>"!=""){
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");
		}
		
		
		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function(){
			if($("#search").val()=="all"){
				$("#keyword").val("전체 데이터 검색");
			}else if($("keyword").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		/* 검색 버튼 클릭 시 처리 이벤트 */		
		$("#searchData").click(function() {
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}else{
				if(!chkSubmit($('#keyword'),"검색어를")) return;
			}
			goPage(1);
		});
	});
	/* 정렬 및 검색 시 실질적인 처리 함수 */
	function goPage(page){
		$("#page").val(page);
		$("#f_search").attr("method","get");
		$("#f_search").attr("action","/Project_Recipe/board/recipeList.do");
		$("#f_search").submit();
	}
	
</script>
	<div id="boardTit">
	<h3 align="center">레시피 게시판</h3>
	</div>
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="b_num" id="b_num">
	</form>
		<div id="boardContainer">
	<%-- ================= 검색 기능 시작 ================= --%>
		<div id="boardSearch">
			<form id="f_search" name="f_search">
				<input type = "hidden" id="page" name="page" value = "${data.page}" />
				<table summary="검색">
					<tr>
						<td id="btd1">
							<label>검색 조건</label>
							<select id = "search" name = "search" >
								<option value="all">전체</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="author">작성자</option>
							</select>
							<input type="text" name ="keyword" id="keyword" value="검색어를 입력하세요" />
							<input type="button" value="검색" id="searchData" />
						</td>
						<td id="btd2">한 페이지에
							<select id = "pageSize" name = "pageSize" >
								<option value="2">2줄</option>
								<option value="3">3줄</option>
								<option value="5">5줄</option>
								<option value="7">7줄</option>
								<option value="10">10줄</option>
							</select>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<%-- =============== 검색기능 종료 ================= --%>
		<div id=boardlist>
			<table>
				<colgroup>
					<col width="3%" />
					<col width="20%" />
					<col width="57%" />
					<col width="20%" />
				</colgroup>
				<c:choose>
					<c:when test="${not empty recipeList}">
						<c:forEach var="dto" items="${recipeList}">
							<tr align="center">
								<td>${dto.b_num}</td>
								<td><div id=thumbnail><img src="/Project_Recipe/include/upload/${dto.thumbnail}" width="200" height="200"></div></td>
								<td align="left"><span class="goDetail">${dto.b_title} [추천수 : ${dto.b_like} ]<br>
										${dto.b_content}</span></td>
								<td>${dto.id}<br>${dto.writeday}<br>${dto.readcnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" align="center">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<div id="boardBut">
			<input type="button" value="글쓰기" id="recipeInsert">
		</div>
	</div>
