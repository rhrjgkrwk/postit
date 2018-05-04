<%@page import="dao.PostDao"%>
<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	MemberVO memberVO=null;
	int level;
	String result="{\"result\": false}";
	if (session.getAttribute("ss") != null && request.getParameter("level") != null) {
		boolean flag = false;
		memberVO = ((MemberVO) session.getAttribute("ss"));
		level = Integer.parseInt(request.getParameter("level").substring(2));
			
		if(level==2 && memberVO.getPoint()>=1000){
			flag = new PostDao().updatePostLevel(memberVO.getPost_id(), level);
			if(flag){
				flag = new MemberDao().addPoint(memberVO.getEmail(), -1000);
			}
		}else if(level==3 && memberVO.getPoint()>=5000){
			flag = new PostDao().updatePostLevel(memberVO.getPost_id(), level);
			if(flag){
				flag = new MemberDao().addPoint(memberVO.getEmail(), -5000);
			}
		}else if(level==4 && memberVO.getPoint()>=50000){
			flag = new PostDao().updatePostLevel(memberVO.getPost_id(), level);
			if(flag){
				flag = new MemberDao().addPoint(memberVO.getEmail(), -50000);
			}
		}else if(level==5 && memberVO.getPoint()>=100000){
			flag = new PostDao().updatePostLevel(memberVO.getPost_id(), level);
			if(flag){
				flag = new MemberDao().addPoint(memberVO.getEmail(), -100000);
			}
		}else{
			flag=false;
		}
		
		if (flag) {
			result = "{\"result\": true}";
		} 
	}
%>
<%=result%>