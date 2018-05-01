<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//point를 입력했으면
	MemberDao dao = new MemberDao();
	String result = "";
	if (request.getParameter("email")!=null) {
		String email = (String)request.getParameter("email");
		int post_id = Integer.parseInt((String)request.getParameter("post_id"));
		boolean flag = dao.deleteUser(email, post_id);
		if(flag){
			result = "{\"result\": true}";
		}
		else {
			result = "{\"result\": false}";
		}
	} 
	//자바 객체를 JSON으로 맹글어보자.!!
%>
<%=result%>