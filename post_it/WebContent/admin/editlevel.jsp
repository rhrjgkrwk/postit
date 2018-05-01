<%@page import="dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//point를 입력했으면
	String result = "";
	if (request.getParameter("level")!=null) {
		int post_id = Integer.parseInt((String)request.getParameter("post_id"));
		int level = Integer.parseInt((String)request.getParameter("level"));
		boolean flag = new PostDao().updatePostLevel(post_id, level);
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