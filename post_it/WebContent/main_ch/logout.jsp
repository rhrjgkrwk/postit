<%@page import="dao.MemberDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="jdk.nashorn.internal.ir.debug.JSONWriter"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
	session.removeAttribute("loginSession");
%>
