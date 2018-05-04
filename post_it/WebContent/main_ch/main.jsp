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
<link rel="stylesheet" href="index.css">
<link rel="stylesheet" href="basic.css">

<script type="text/javascript">
	$('document').ready(function() {
		function generateRandomDiv() {
			var sum = 0;
			var idx = 0;
			//alert($('.container').width()*$('.container').width());
			var divList = [];

			while ($('.container').width() * $('.container').width() >= sum) {
				idx++;
				var rn = Math.ceil(Math.random() * 4); //random lv generator
				var tg = "<div class='lv"+rn+"'>idx" + idx + "</div>";

				var tmp = {
					lv : rn,
					idx : idx,
					tg : tg,
					toString : function() {
						return rn + " " + idx + " " + " " + tg;
					}
				}
				divList.push(tmp);

				// 				sum+=$('.lv'+rn).width()*$('.lv'+rn).height();
				sum += 10000;
			}

			alert(divList.length);
			divList.sort(function(a, b) {
				return a.lv < b.lv ? 1 : a.lv > b.lv ? -1 : 0;
			});

			for (var i = 0; i < divList.length; i++) {
				//alert(divList[i]);
				$('.container').append(divList[i].tg);
			}

		};
		//generateRandomDiv();
	});
</script>
</head>
<body>
	<div id="header">test</div>
	<br>
	<div class="container">
		<%
			MemberDao memberDao = new MemberDao();
			ArrayList<PostVO> posts = new PostDao().getAllPosts(); //level 기준으로 정렬하자.
			Collections.sort(posts);
			
			for (PostVO post : posts) {
				MemberVO member = memberDao.getMemberByPostId(post.getPost_id());
				String name = member==null?"T.T":member.getName();
		%>
		<div class='lv<%=post.getPost_level()%>'>
				<table>
				 	<tr>
				 		<td class='lv<%=post.getPost_level()%>'><%=name%></td>
				 	</tr>	
					<tr>
						<td><%=post.getPost_content()%></td>
					</tr>
				</table>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>