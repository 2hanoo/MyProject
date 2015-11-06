<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>해먹어요 print.jsp</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="./image/icon.png" />
<link rel="apple-touch-icon" href="./image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
		<script src="./js/html5shiv.js"></script>
		<![endif]-->
<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	/* function printArea() {
	 window.print();
	 }
	 window.onbeforeprint = beforePrint;

	 window.onafterprint = afterPrint;
	 <script type="text/JavaScript">
	 //화면이 로드 되면서 바로 인쇄옵션창이 나타나게 한다    
	 */
	window.onload = function() {
		window.print();
	}
</script>
<style type="text/css">
#tfmain {
	width: 900px;
	margin: 10% auto;
	align: center;
}
</style>
</head>
<body id="testbody">
	<form name="f_data" id="f_data" method="POST">
		<input type="hidden" name="num" id="num" value="${recipeDetail.num}">
	</form>
	<form id="tfmain">
		<div align=center>
			<h1>해먹을꺼예요</h1>
			<table>
				<tr>
					<td>#{b_title}</td>
				</tr>
				<tr>
					<td>#{nickname}</td>
				</tr>
			</table>
			<hr>
			<table class="tg" height="500" width="100%" border="2">
				<tr height=8% align=center>
					<td>#{b_title}</td>
					<td>조리방법</td>
				</tr>
				<tr align=center>
					<td>#{image}</td>
					<td>#{content}</td>
				</tr>
			</table>
		</div>
		<!-- 		<div id="button" align="right"> -->
		<!-- <a  href="http://localhost:9000/PTest/go/print.jsp" onclick="window.print();">
	<input type="button" name = "go" value="인쇄"></a> -->
		<!-- 		</div> -->
	</form>
</body>
</html>







