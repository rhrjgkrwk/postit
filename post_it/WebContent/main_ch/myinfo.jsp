<%@page import="vo.PostVO"%>
<%@page import="dao.PostDao"%>
<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8>
<title>my info</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<div id="myinfo-container"> 

	<!-- 헤더는 따로 작성 후 include -->

	<%-- <jsp:include page="header.jsp"></jsp:include> --%>


	<%
		
		PostVO postVO = null;
		MemberVO memberVO =null;
		if(session.getAttribute("loginSession") == null){// 		session. 로그인 정보 없으면 redirect
	%>
		<jsp:forward page="main.jsp"></jsp:forward>
	<%
		}
		else{// 로그인 정보가 있으면 postVO를 가져온다.
			memberVO = (MemberVO)session.getAttribute("loginSession");
			postVO = new PostDao().getPost(memberVO.getPost_id());
		}
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<div id="myinfo-nav-container">
		<ul id="myinfo-navlist" class="navbar-nav navbar-center">
			<li class=""><h2><a href="#myinfo">My Info</a></h2></li>
			<li class=""><h2><a href="#upgrade">Upgrade</a></h2></li>
			<li class=""><h2><a href="#chargepoint">Charge Point</a></h2></li>
		</ul>
	</div>
	
	<br>
	<div id="myinfo" class="table-container">
		<h2>My info</h2>
		<div>
			<table class="table table-striped">
				<tr>
					<td>이메일 :</td>
					<td><%= memberVO.getEmail() %></td>
					<td></td>
				</tr>
				<tr>
					<td>이름 :</td>
					<td><%= memberVO.getName()%></td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input id="passworda" class="form-control" type="password">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>비밀번호 확인 :</td>
					<td><input id="re-password" class="form-control"
						type="password"></td>
					<td><input id="password-change" class="btn btn-danger"
						type="button" value="변경"></td>
				</tr>
				<tr>
					<td>내 포인트 :</td>
					<td><%= memberVO.getPoint()%></td>
					<td></td>
				</tr>
				<tr>
					<td>Level :</td>
					<td><%=postVO.getPost_level() %></td>
					<td></td>
				</tr>
				<tr>
					<td>Color :</td>
					<td style="background-color: <%=postVO.getPost_color() %>;"><%=postVO.getPost_color() %></td>
					<td></td>
				</tr>
			</table>
			<p>oking to dig deeper.Everyday, massive amounts of data are
				generated in every part of our lives. That makes data fluency an
				indispensable skill to help you succeed - no matter what industry
				you’re in. At DataCamp, we’re here to help, whether you're just
				getting started or are looking to dig deeper.</p>
		</div>
	</div>
	<div id="upgrade" class="table-container">
		<h2>Upgrade Post size</h2>
		<div>
			<table class="table table-striped">
				<tr>
					<th>level</th>
					<th>price</th>
					<th>신청</th>
				</tr>
				<tr>
					<td>1</td>
					<td>무료</td>
					<td>
<!-- 						<input id="lv1" class="btn btn-danger upgrade-level" type="button" value="신청"> -->
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td>1000p</td>
					<td><input id="lv2" name="1000" class="btn btn-danger upgrade-level" type="button" value="신청">
					</td>
				</tr>
				<tr>
					<td>3</td>
					<td>5000p</td>
					<td><input id="lv3" name="5000" class="btn btn-danger upgrade-level" type="button" value="신청">
					</td>
				</tr>
				<tr>
					<td>4</td>
					<td>50000p</td>
					<td><input id="lv4" name="50000" class="btn btn-danger upgrade-level" type="button" value="신청">
					</td>
				</tr>
				<tr>
					<td>5</td>
					<td>100000p</td>
					<td><input id="lv5" name="100000" class="btn btn-danger upgrade-level" type="button" value="신청">
					</td>
				</tr>
			</table>
			<p>Everyday, massive amounts of data are generated in every part
				of our lives. That makes data fluency an indispensable skill to help
				you succeed - no matter what industry you’re in. At DataCamp, we’re
				here to help, whether you're just getting started or are looking to
				dig deeper.Everyday, massive amounts of data are generated in every
				part of our lives. That makes data fluency an indispensable skill to
				help you succeed - no matter what industry you’re in. At DataCamp,
				we’re here to help, whether you're just getting started or are
				looking to dig deeper.</p>
		</div>
	</div>

	<div id="chargepoint" class="table-container">
		<h2>Charge Point</h2>
		<div>
			<p>
			관리자에게 직접 문의하세요. 
			
			<a href="mailto:rhrjgkrwk@gmail.com">rhrjgkrwk@gmail.com</a>
			
			Everyday, massive amounts of data are generated in every part
				of our lives. That makes data fluency an indispensable skill to help
				you succeed - no matter what industry you’re in. At DataCamp, we’re
				here to help, whether you're just getting started or are looking to
				dig deeper.Everyday, massive amounts of data are generated in every
				part of our lives. That makes data fluency an indispensable skill to
				help you succeed - no matter what industry you’re in. At DataCamp,
				we’re here to help, whether you're just getting started or are
				looking to dig deeper.</p>
		</div>
	</div>
	
	
	
	</div>
	
	
</body>

<script type="text/javascript">
	$('document').ready(function() {
		$('#password-change').on('click', passwordChange);
		$('.upgrade-level').on('click', upgrageLevel);
		
		function passwordChange() {
			if ($('#passworda').val() == $('#re-password').val()) {
				//ajax
				$.ajax({
					url : "passwordchange.jsp", //요청할 주소.
					type : "post",
					datatype : "json",
					data : {
						"password" : $('#passworda').val(),
					},
					//성공시 호출함수
					success : function(server_result) { //json 형태로 넘어온다.
						var temp = JSON.parse(server_result);
						if (temp.result == true) {
							alert("변경 완료.");
						} else {
							alert("변경 실패");
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
			} else {
				alert("비밀번호가 서로 다르다.");
			}
		}
		
		
		function upgrageLevel() {
			if ( parseInt($(this).attr('name')) <= <%= memberVO.getPoint() %>) {
				//ajax
				$.ajax({
					url : "upgradelevel.jsp", //요청할 주소.
					type : "post",
					datatype : "json",
					data : {
						"level" : $(this).attr('id'),
					},
					//성공시 호출함수
					success : function(server_result) { //json 형태로 넘어온다.
						var temp = JSON.parse(server_result);
						if (temp.result == true) {
							alert("변경 완료.");
							
						} else {
							alert("변경 실패");
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
			} else {
				alert("포인트 부족!!!!!!!!! 포인트를 구매해보자!");
			}
		}
		
		
	});
</script>

</html>