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

�̸��� <%=name %>�̰� ���̴�<%=age %>�Դϴ�.

</body>
</html>