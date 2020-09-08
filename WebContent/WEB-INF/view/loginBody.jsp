<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="session.jsp" %>
<%
	userId = getInitParameter("userId");
%>
<% if(userId==""){ %>
<div>====================로그인 시작=================</div>
<form action="/userLogin.do" method="POST">
	<div style="background-color: aqua; display: flex">
		<div>아이디</div>	
		<input type="text" name="userId">
		<div>비밀번호</div>	
		<input type="text" name="userPassword" >
		<button class="btn btn-primary" type="submit">로그인</button>
	</div>
</form>

<div style="cursor: pointer; background-color: red; width: 50% height 50%;" onclick="location.href='/userReg.do'">회원 가입 페이지로 이동하기</div>
<div>====================로그인 끝=================</div>
<%} else {%>
<div>====================로그인 성공=================</div>
	<div style="background-color: red; display: flex"> 
		<div><%=userName %>님 안녕하세요</div>
		<button onclick="location.href='/logout.do'" class="btn btn-primary">로그아웃</button>
	</div>
<div>====================로그인 성공=================</div>	
<%} %>
