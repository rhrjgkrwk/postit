<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String email="";
	String newPassword="";
	String result="{\"result\": false}";
	if (session.getAttribute("ss") != null && request.getParameter("password") != null) {
		email = ((MemberVO) session.getAttribute("ss")).getEmail();
		newPassword = (String) request.getParameter("password");
		MemberDao dao = new MemberDao();
		boolean flag = new MemberDao().changePassword(email, newPassword);
		if (flag) {
			result = "{\"result\": true}";
		} 
	}
%>
<%=result%>