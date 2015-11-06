<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.invalidate();	//세션을 무효화
	response.sendRedirect("MainDisplay.do?command=loginForm");
%>