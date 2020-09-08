<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String res = CmmUtil.nvl((String)request.getAttribute("res"), "0");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 수집</title>
</head>
<body>
한국폴리텍 강서캠퍼스 홈페이지에서 <%=res %>개의 식단 정보가 수집되었습니다.
</body>
</html>