<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//point를 입력했으면
	MemberDao dao = new MemberDao();
	String result = "";
	if (request.getParameter("inputpoint")!=null) {
		String email = (String)request.getParameter("email");
		int point = Integer.parseInt((String)request.getParameter("inputpoint"));
		boolean flag = dao.addPoint(email, point);
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