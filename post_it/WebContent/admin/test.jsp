<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="vo.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
	<%
// 		PostDao pdao = new PostDao();
// 		pdao.addNewPost();
// 		pdao.addNewPost();
// 		pdao.addNewPost();
// 		pdao.addNewPost();
// 		pdao.addNewPost();

		/* 
		
		ArrayList<PostVO> list = pdao.getAllPosts();
		for (PostVO vo : list) {
			out.print(vo.toString()+"<br>");
		}
		
		 */
		MemberDao mdao = new MemberDao();
		HashMap<MemberVO, PostVO> map = mdao.getAllInfo();
		for (MemberVO vo : map.keySet()) {
			out.print(vo.toString() +" : "+ map.get(vo).toString());
		}
	%>
</body>
</html>