<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="vo.PostVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.PostDao"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	MemberDao memberDao = new MemberDao();
	PostDao postDao = new PostDao();
	HashMap<MemberVO, PostVO> allInfo = new HashMap<>();
	JSONArray ja = new JSONArray();
	
	for(MemberVO memberVo : allInfo.keySet()){
		//여기에서 JSON으로 만들자..
		
		JSONObject jo = new JSONObject();
		PostVO postVo = allInfo.get(memberVo);
		jo.put("email", memberVo.getEmail());
		jo.put("name", memberVo.getName());
		jo.put("point", memberVo.getPoint());
		jo.put("post_id", memberVo.getPost_id());
		jo.put("post_content", postVo.getPost_content());
		jo.put("post_level", postVo.getPost_level());
		jo.put("post_color", postVo.getPost_color());
		ja.add(jo);
	}
%>
<%=ja.toJSONString() %>
