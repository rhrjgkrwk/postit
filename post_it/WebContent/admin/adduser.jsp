<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//point를 입력했으면
	String result = "";
	if (request.getParameter("email")!=null) {
		String email = (String)request.getParameter("email");
		String password = (String)request.getParameter("password");
		String name = (String)request.getParameter("name");
		MemberVO vo = new MemberVO();
		vo.setEmail(email);
		vo.setPassword(password);
		vo.setName(name);
		
		boolean flag = new MemberDao().insertUser(vo);
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