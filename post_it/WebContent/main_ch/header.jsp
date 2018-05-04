<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdn.rawgit.com/vast-engineering/jquery-popup-overlay/1.7.13/jquery.popupoverlay.js"></script>
<link rel="stylesheet" href="../css/style.css">

<style type="text/css">
</style>

<script type="text/javascript">
	$('document').ready(function() {
		$('#loginpopup').popup({
			transition : 'all 0.3s',
			scrolllock : true
		});

		
	$('#login-popup-btn').on('click', function() {
			$('#loginpopup').popup('show');
		});

		$('#logoutpopup').popup({
			transition : 'all 0.3s',
			scrolllock : true
		});

		$('#logout-popup-btn').on('click', function() {
			logoutAjax();
			$('#logoutpopup').popup('show');
		});

		$("#login-btn").on('click', loginAjax);
		//requestAjax(1); 1페이지
		//on end

		function loginAjax() {
			//function requestAjax(page){

			$.ajax({
				url : "login.jsp",
				type : 'post',
				//data:{'id':$("#id").val() ,'pw': $("#pw").val() },
				data : {
					"email" : $('#email').val(),
					"password" : $('#password').val()
				},

				//data:{'pagenum':page},
				//fm이라는 form 에 들어가있는거를 name에 들어간 속성을 value로 처리해줌'
				dataType : 'text',

				success : function(server_result) {
					var server_json = JSON.parse(server_result);
					if (server_json.auth == true) {
						alert("성공");/* 성공시? 메인화면에 아디랑 비번이 박혀있어야한다!? */
						location.reload();
					} else {
						alert("실패");
						$('#password').val("");
					}
				},

				error : function(e) {
					alert(e);
				},
				complete : function() {
				}
			});//ajax-end
		}//requestAjax-end

		function logoutAjax() {
			//function requestAjax(page){

			$.ajax({
				url : "logout.jsp",
				type : 'post',
				//data:{'pagenum':page},
				//fm이라는 form 에 들어가있는거를 name에 들어간 속성을 value로 처리해줌'
				dataType : 'text',

				success : function(server_result) {
					//위에문장 성립X? 실행 X
					alert("로그아웃된다.");
					location.reload();
				},

				error : function(e) {
					alert(e);
				},
				complete : function() {
				}
			});//ajax-end
		}//requestAjax-end
	});
</script>
</head>

<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<ul class="nav navbar-right navbar-nav">
				<%
					//세션이 있으면 아래 내용을 뿌려준다.
							if (session.getAttribute("loginSession") != null) {
				%>
				<li class="nav"><a id="main" href="main.jsp" class="btn">main</a></li>
				<li class="nav"><a id="myinfo" href="myinfo.jsp" class="btn">my
						info</a></li>
				<li class="nav"><a id="logout-popup-btn" class="btn">log
						out</a></li>


				<%
					} //세션이 없으면 아래 내용을 뿌려준다.
					else {
				%>
				<li class="nav-right"><a id="login-popup-btn" class="btn">
						log in </a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>


	<!-- 	로그인 팝업 -->
	<div id="loginpopup">
		<h2>Log in</h2>
		<input class="form-control" type=text id="email" name="email"
			placeholder="email"><br> <input class="form-control"
			type="password" id="password" name="password" placeholder="password">
		<br> <input class="btn btn-danger" type="button" id="login-btn"
			value="sign in"> <input class="btn btn-success" type="button"
			value="register">
	</div>



	<!-- 로그아웃팝업 -->
	<div id="logoutpopup">
		<div id="logoutpopup-message">로그아웃 되었습니다.</div>
	</div>



</body>
</html>