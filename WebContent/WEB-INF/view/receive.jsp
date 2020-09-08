<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	String name = (String)request.getAttribute("name");
	String age = (String)request.getAttribute("age");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

이름은 <%=name %>이고 나이는<%=age %>입니다.

</body>
</html>