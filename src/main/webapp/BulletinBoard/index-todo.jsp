<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- df -->
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
	<title>사용자 관리</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>	
</head>
<body>
	<div class="jumbotron text-center" style="margin-bottom:0">
	  <h2>사용자 관리</h2>
		<hr>
		<input class="btn btn-primary" type="button" onclick="location.href='list.jsp'" value="사용자 목록보기">
		<input class="btn btn-primary" type="button" onclick="location.href='insertForm.jsp'" value="게시글 작성">
		<input class="btn btn-primary" type="button" onclick="location.href='loginForm-todo.jsp'" value="로그인">
	</div>
	
</body>
</html>
