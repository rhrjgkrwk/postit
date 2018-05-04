<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Collections"%>
<%@page import="vo.PostVO"%>
<%@page import="dao.PostDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.awt.Toolkit"%>
<%@page import="java.awt.Dimension"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8>
<title>그리드</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="https://cdn.rawgit.com/vast-engineering/jquery-popup-overlay/1.7.13/jquery.popupoverlay.js"></script>
<link rel="stylesheet" href="../css/style.css">
<style type="text/css">
#popup {
	border: solid 1px black;
}

#popup{
  transition: all 0.3s;
}


</style>
<script type="text/javascript">
	$('document').ready(function() {
		function addPoint(email, point) {
			$.ajax({
				url : "postit.jsp", //요청할 주소.
				type : "post",
				datatype : "json",
				data : {
					"email" : email,
					"point" : point
				},
				//성공시 호출함수
				success : function(server_result) { //json 형태로 넘어온다.
					var temp = JSON.parse(server_result);
					if (temp.result == true) {
						alert("반영되었다.");
						getMemberList();
					} else {
						alert("반영되지 않았다.");
					}
				},
				//error 호출 함수
				error : function(e) {
					alert(e);
				},

				//연결 종료시 호출 함수
				complete : function() {

				}
			});//ajax end
		}

		function deleteMember(email, post_id) {
			$.ajax({
				url : "deletemember.jsp", //요청할 주소.
				type : "post",
				datatype : "json",
				data : {
					"post_id" : post_id,
					"email" : email
				},
				//성공시 호출함수
				success : function(server_result) { //json 형태로 넘어온다.
					var temp = JSON.parse(server_result);
					if (temp.result == true) {
						alert("반영되었다.");
						getMemberList();
					} else {
						alert("반영되지 않았다.");
					}
				},
				//error 호출 함수
				error : function(e) {
					alert(e.message);
				},

				//연결 종료시 호출 함수
				complete : function() {

				}
			});//ajax end		
		}

		$('div[class^="p-"]').popup({
			transition : 'all 0.3s',
			scrolllock : true
		});
		
		$('.postit').on('click', function() {
			var temp = $(this).attr('id');
			alert(temp);
			$('.p-'+temp).popup('show');
		});

	});
</script>
</head>
<body>

<!-- 	header -->
	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<div class="container">
		<%
			MemberDao memberDao = new MemberDao();
			ArrayList<PostVO> posts = new PostDao().getAllPosts(); //level 기준으로 정렬하자.
			Collections.sort(posts);

			for (PostVO post : posts) {
				MemberVO member = memberDao.getMemberByPostId(post.getPost_id());
				String name = member == null ? "" : member.getName();
				String email = member == null ? "" : member.getEmail();
		%>

		<div class='postit lv<%=post.getPost_level()%>' id="<%= post.getPost_id() %>">
			<table>
				<tr>
					<td class='lv<%=post.getPost_level()%>'><%=name%></td>
				</tr>
				<tr>
					<td><%=post.getPost_content()%></td>
				</tr>
			</table>
		</div>
		
		
		<div class="p-<%= post.getPost_id() %> post-popup">
			<p>
				sadjlgkajdsl;ajgl;ja;slkjglkjg
				adjlgkajdsl;ajgl;ja;slkjglkjg
				adjlgkajdsl;ajgl;ja;slkjglkjg
				adjlgkajdsl;ajgl;ja;slkjglkjg
				adjlgkajdsl;ajgl;ja;slkjglkjg
				adjlgkajdsl;ajgl;ja;slkjglkjg
				adjlgkajdsl;ajgl;ja;slkjglkjg
				adjlgkajdsl;ajgl;ja;slkjglkjg
				adjlgkajdsl;ajgl;ja;slkjglkjg
				
			</p>
			<input type="button" class="btn btn-danger" value="수정">
			
		</div>

		<%
			}
		%>
<!-- [name^="value"] -->
	</div>
</body>
</html>