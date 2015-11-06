<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="/Project_Recipe/include/css/board.css" />
<!-- ����� �� ������ ���� �� -->
<!--[if lt IE 9]><script src="../js/html5shiv.js"></script> <![endif]-->
<script type="text/javascript"
	src="/Project_Recipe/include/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(function() {
		//�˻� �� �˻� ���� �˻� �ܾ� ���
		if("<c:out value='${data.keyword}'/>"!=""){
			$('#keyword').val("<c:out value='${data.keyword}'/>");
			$('#search').val("<c:out value='${data.search}'/>");
		}
		
		//���������� ������ ���ڵ� �� ��ȸ �� ������ ���� ���ؼ� ����
		if("<c:out value='${data.pageSize}'/>"!=""){
			$('#pageSize').val("<c:out value='${data.pageSize}'/>");
		}		
		
		//���������� ������ ���ڵ� �� ����ɶ� ���� ó�� �̺�Ʈ
		$("#pageSize").change(function(){
			goPage(1);
		});
		
		/*�۾��� ��ư Ŭ�� �� ó�� �̺�Ʈ */
		$("#recipeInsert").click(function() {			
			$.ajax({
			url : "/Project_Recipe/board/recipeInsert.do", //���� url
			type : "POST", //���۽� method ���
			dataType : "text",
			error : function() { //����� ������ �߻��Ͽ��� ���
				alert('�ý��� ���� �Դϴ�. �����ڿ��� ���� �ϼ���');
			},
			success : function(resultData) { //���������� ���� �Ǿ��� ���
				$("#boardbody").html(resultData)
			}
		})
	});

		// �������� �̵�  �̺�Ʈ
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
		
		
		/* �˻� ����� ����� ������ ó�� �̺�Ʈ */
		$("#search").change(function(){
			if($("#search").val()=="all"){
				$("#keyword").val("��ü ������ �˻�");
			}else if($("keyword").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		/* �˻� ��ư Ŭ�� �� ó�� �̺�Ʈ */		
		$("#searchData").click(function() {
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}else{
				if(!chkSubmit($('#keyword'),"�˻��")) return;
			}
			goPage(1);
		});
	});
	/* ���� �� �˻� �� �������� ó�� �Լ� */
	function goPage(page){
		$("#page").val(page);
		$("#f_search").attr("method","get");
		$("#f_search").attr("action","/Project_Recipe/board/recipeList.do");
		$("#f_search").submit();
	}
	
</script>
	<div id="boardTit">
	<h3 align="center">������ �Խ���</h3>
	</div>
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="b_num" id="b_num">
	</form>
		<div id="boardContainer">
	<%-- ================= �˻� ��� ���� ================= --%>
		<div id="boardSearch">
			<form id="f_search" name="f_search">
				<input type = "hidden" id="page" name="page" value = "${data.page}" />
				<table summary="�˻�">
					<tr>
						<td id="btd1">
							<label>�˻� ����</label>
							<select id = "search" name = "search" >
								<option value="all">��ü</option>
								<option value="title">����</option>
								<option value="content">����</option>
								<option value="author">�ۼ���</option>
							</select>
							<input type="text" name ="keyword" id="keyword" value="�˻�� �Է��ϼ���" />
							<input type="button" value="�˻�" id="searchData" />
						</td>
						<td id="btd2">�� ��������
							<select id = "pageSize" name = "pageSize" >
								<option value="2">2��</option>
								<option value="3">3��</option>
								<option value="5">5��</option>
								<option value="7">7��</option>
								<option value="10">10��</option>
							</select>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<%-- =============== �˻���� ���� ================= --%>
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
								<td align="left"><span class="goDetail">${dto.b_title} [��õ�� : ${dto.b_like} ]<br>
										${dto.b_content}</span></td>
								<td>${dto.id}<br>${dto.writeday}<br>${dto.readcnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" align="center">��ϵ� �Խù��� �������� �ʽ��ϴ�.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<div id="boardBut">
			<input type="button" value="�۾���" id="recipeInsert">
		</div>
	</div>
