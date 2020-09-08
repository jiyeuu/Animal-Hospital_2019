<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
//CmmUtil이라는 클래스 파일에  NVL이라는 메소드가 있는데
	String userId = CmmUtil.nvl((String)session.getAttribute("userId"));
	String userName = CmmUtil.nvl((String)session.getAttribute("userName"));
	String userSeq = CmmUtil.nvl((String)session.getAttribute("userSeq"));
%>
    