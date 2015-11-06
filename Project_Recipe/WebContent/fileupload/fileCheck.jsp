<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String filename = request.getParameter("filename");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>파일 업로드 확인 및 다운로드 : fileCheck.jsp</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="./image/icon.png" />
<link rel="apple-touch-icon" href="./image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
	<script src="./js/html5shiv.js"></script>
<![endif]-->
</head>
<body>
		<label>파일명1 : </label>
		<a href="/Project_Recipe/include/upload/<%=filename %>"><%=filename %></a><br />
		<img src="/Project_Recipe/include/upload/<%=filename %>" /></p>
</body>
</html>