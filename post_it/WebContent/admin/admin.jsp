<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8>
<title>admin page</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/style.css">


<script type="text/javascript">
	$('document')
			.ready(
					function() {
						function addPoint(email, point) {
							$.ajax({
								url : "addpoint.jsp", //요청할 주소.
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
						;

						function editLevel(post_id, level) {
							$.ajax({
								url : "editlevel.jsp", //요청할 주소.
								type : "post",
								datatype : "json",
								data : {
									"post_id" : post_id,
									"level" : level
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
						;

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
						};
						
						function addUser(email, password, name) {
							$.ajax({
								url : "adduser.jsp", //요청할 주소.
								type : "post",
								datatype : "json",
								data : {
									"password" : password,
									"email" : email,
									"name" : name
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
									getMemberList();
								}
							});//ajax end		
						};
						

						function getMemberList() {
							// 		{} - 자바스트립트 객체 형태
							$
									.ajax({
										url : "getallInfo.jsp", //요청할 주소.
										type : "post",
										datatype : "json",
										//성공시 호출함수
										success : function(server_result) { //json 형태로 넘어온다.
											//#result 태그 내부에 결과를 출력하겟다.
											//eval(server_result); -- deprecated
											//auth = "{\"auth\": false}";
											var temp = JSON
													.parse(server_result);
											// JSON parser 를 사용해서 json 형태의 결과를 파싱한다.

											var result = "<tr><th>email</th><th>name</th><th>point</th><th>post id</th><th>content</th><th>level</th><th>color</th><th>add</th><th>edit level</th><th>expel</th></tr>";

											for (var i = 0; i < temp.length; i++) {
												result += "<tr>";
												result += "<td>"
														+ temp[i].email
														+ "</td>";
												result += "<td>" + temp[i].name
														+ "</td>";
												result += "<td>"
														+ temp[i].point
														+ "</td>";
												result += "<td>"
														+ temp[i].post_id
														+ "</td>";
												result += "<td>"
														+ temp[i].post_content
														+ "</td>";
												result += "<td>"
														+ temp[i].post_level
														+ "</td>";
												result += "<td style='background-color:"+temp[i].post_color+"'>"
														+ temp[i].post_color
														+ "</td>";
												//point 수정
												result += "<td class='addpoint'><input name='inputpoint' type='text' class='input-sm' placeholder='input point'>";
												result += "<input name='"+temp[i].email+"' type='button' class='btn btn-danger addbtn' value='add'></td>";

												//level 수정
												result += "<td class='editlevel'>";
												result += "<select>";
												result += "<option>1</option>";
												result += "<option>2</option>";
												result += "<option>3</option>";
												result += "<option>4</option>";
												result += "<option>5</option>";
												result += "</select>";
												result += "<input name='"+temp[i].post_id+"' type='button' class='btn btn-danger editbtn' value='edit'></td>";

												// 제명
												result += "<td><input id='delete' name='"+temp[i].email+" "+temp[i].post_id+"' type='button' class='btn btn-danger deletebtn' value='delete'></td>";
												result += "</tr>";

											}
											$('#infolist').html(result);
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

						$('#adduser').on('click', function(){
							var email = $('#newemail').val();
							var password = $('#newpw').val();
							var name = $('#newname').val();
							addUser(email, password, name);
						});

						$('#infolist').on('click', '.addbtn', function() {
							var email = $(this).attr('name');
							//alert(email + $(this).prev().val());
							addPoint(email, $(this).prev().val());
						});

						$('#infolist').on('click', '.editbtn', function() {
							var post_id = $(this).attr('name');
							//alert(email + $(this).prev().val());
							editLevel(post_id, $(this).prev().val());
						});

						$('#infolist').on('click', '.deletebtn', function() {
							var confirmation = confirm("정말 삭제?");
							if (confirmation==true) {
								var temp = $(this).attr('name').split(" ");
								var email = temp[0];
								var post_id = temp[1];
								//alert(email + $(this).prev().val());
								deleteMember(email, post_id);
							}
						});

						
						
						getMemberList();
						
						
						
					});
</script>
</head>
<body>
	<%
		String id = (String) request.getParameter("id");
		String pw = (String) request.getParameter("pw");

		if (id == null || pw == null || !id.equals("admin") || !pw.equals("admin")) {
			//admin 로그인 실패.
			response.sendRedirect("adminlogin.html");
		} else {
			//성공
	%>
	<h1>Info List</h1>
	<table class="table table-striped" >
		<tr>
			<td><input id="newemail" type="text" class="form-control" placeholder="id"></td>
			<td><input id="newpw" type="password" class="form-control" placeholder="pw"></td>
			<td><input id="newname" type="text" class="form-control" placeholder="name"></td>
			<td><input id="adduser" type="button" class="btn btn-danger" value="add"></td>
		</tr>
	</table>
	<table class="table table-striped" id="infolist">

	</table>
	<%
		}
	%>
</body>
</html>