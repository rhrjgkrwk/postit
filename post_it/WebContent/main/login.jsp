<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
 id <input type="text" name="id" ><br>
 pw <input type="text" name="pw"><br>
 <input type="submit" value="LOG IN">
 <input type="button" value="Register">
 </form>
	<%
		/* String auth="";
		String time=new SimpleDateFormat("yyyy년도 MM월  dd일 HH시 mm분 ss초").format(new Date());
		auth="{\"auth\" :true, \"logintime\": \""+time +"\" }";  

		 로그인 ->   DB에서 이메일 check, 패스워드 비교   ->
		->맞음?     로그인됨....
		->틀림?	  다시 로그인시켜!     를 모르는게 함정.....	 */
				
		//위에서 입력받은 아이디가 있니?		
				
				
				
		MemberVO vo = (MemberVO) request.getAttribute("vo");
		
	
		
	
	
	%>
</body>
</html>