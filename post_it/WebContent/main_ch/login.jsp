<%@page import="dao.MemberDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="jdk.nashorn.internal.ir.debug.JSONWriter"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	/*.MemberDao.pstmt
	dao.MemberDao.rs
	dao.MemberDao.addPoint(String, int)
	dao.MemberDao.changePassword(String, String)
	dao.MemberDao.deleteUser(String, int)
	dao.MemberDao.getAllInfo()
	dao.MemberDao.getAllMember()
	dao.MemberDao.getMemberByEmail(String)
	dao.MemberDao.insertUser(MemberVO)
	dao.MemberDao.isDuplicate(String)
	dao.MemberDao.updatePassword(String, String)
	lo
	
	/post_it/src/dao/PostDao.java
	dao.PostDao
	dao.PostDao.pstmt
	dao.PostDao.rs
	dao.PostDao.addNewPost()
	dao.PostDao.deletePost(int)
	dao.PostDao.getAllPosts()
	dao.PostDao.getPost(int)
	dao.PostDao.getTotalCount()
	dao.PostDao.updatePost(PostVO)
	dao.PostDao.updatePostColor(int, String)
	dao.PostDao.updatePostLevel(int, int) 
	*/
	//    위에서 필요한 클래스의 객체를 생성하고 필요한 메소드를 가져와 사용한다.
	//    ex.    new MemberDao().loginCheck(id, password); - 디비의 정보와 일치하는지 확인후 boolean을 리턴.
	//    if(new MemberDao().loginCheck(id, password))   - 이런 식으로 사용하면 될 것 같다.
	//    {
	//    조건문 안에서 세션을 생성하도록 하자!
	//    로그인 성공했다면 아래 코드처럼 true/false를 json으로 전송해서 요청을 보낸 페이지 쪽에서 로그인 결광를 알 수 있도록 하자!
	//    }

	String email = request.getParameter("email");
	String password = request.getParameter("password");
	System.out.println(email);
	MemberDao dao = new MemberDao();
	//아래 조건문에서 디비에서 가져온 id pw와 사용자가 입력한 id pw를 대조한다. 

	String auth = "";
	if (dao.loginCheck(email, password)) {
		auth = "{\"auth\": true}";
		session.setAttribute("loginSession", dao.getMemberByEmail(email));
	} else {
		auth = "{\"auth\": false}";

	}
	//자바 객체를 JSON으로 맹글어보자.!!
%>
<%=auth%>