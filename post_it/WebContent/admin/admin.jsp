<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8>
<title>admin page</title>
</head>
<script type="text/javascript">
$('document').ready(function(){
	
	
	function addPoint(point){
		$.ajax({
			url : "getallInfo.jsp", //요청할 주소.
			type : "post",
			datatype : "json",
			//성공시 호출함수
			success : function(server_result) { //json 형태로 넘어온다.
				
			},
			//error 호출 함수
			error : function(e) {
				alert(e);
			},

			//연결 종료시 호출 함수
			complete : function() {
				getMemberList();
			}
		});//ajax end
	};
	function deleteMember(email){
		$.ajax({
			url : "deletemember.jsp", //요청할 주소.
			type : "post",
			datatype : "json",
			//성공시 호출함수
			success : function(server_result) { //json 형태로 넘어온다.
				
			},
			//error 호출 함수
			error : function(e) {
				alert(e);
			},

			//연결 종료시 호출 함수
			complete : function() {
				getMemberList();
			}
		});//ajax end		
	};
	
	
	function getMemberList() {
		// 		{} - 자바스트립트 객체 형태
		$.ajax({
			url : "getallInfo.jsp", //요청할 주소.
			type : "post",
			datatype : "json",
			//성공시 호출함수
			success : function(server_result) { //json 형태로 넘어온다.
				//#result 태그 내부에 결과를 출력하겟다.
				//eval(server_result); -- deprecated
				//auth = "{\"auth\": false}";
				var temp = JSON.parse(server_result);
				// JSON parser 를 사용해서 json 형태의 결과를 파싱한다.
				var result ="";

				for (var i = 0; i < temp.length; i++) {
					result += "<tr>";
					result += "<td>" + temp[i].email + "</td>";
					result += "<td>" + temp[i].name + "</td>";
					result += "<td>" + temp[i].point + "</td>";
					result += "<td>" + temp[i].post_id + "</td>";					
					result += "<td>" + temp[i].post_content + "</td>";
					result += "<td>" + temp[i].post_level + "</td>";
					result += "<td>" + temp[i].post_color + "</td>";
					result += "<td><input id='"+temp[i]+"'name='inputpoint' type='text' class='form-control' placeholder='input point'>";
					result += "<input type='button' class='btn btn-danger' value='add'></td>";
					result += "<td><input id='delete' type='button' class='btn btn-danger' value='delete'></td>";
					result += "</tr>";
				}
				$('#infolist').append(result);
			},
			//error 호출 함수
			error : function(e) {
				alert(e);
			},

			//연결 종료시 호출 함수
			complete : function() {
				//alert("서버 통신 완료");
			}
		});//ajax end
	}
	
	getMemberList();
	
	
	
	
});
</script>
<body>
	<%
		String id = (String) request.getParameter("id");
		String pw = (String) request.getParameter("pw");
		if (!id.equals("admin") || !pw.equals("admin")) {
			//admin 로그인 실패.
			response.sendRedirect("adminlogin.html");
		} else {
			//성공
	%>
	<h1>Info List</h1>
	<table class="table table-striped" id="infolist">
	</table>
	
	<%} %>
</body>
</html>