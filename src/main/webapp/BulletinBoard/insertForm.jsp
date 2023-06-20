<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>   
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 입력</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
</head>
<body>
	
	<div class="container">
		<br>
		<h2 class="text-center font-weight-bold">사용자 입력</h2>
		<hr>
		<form action="insert.do" method="post">
	    <div class="form-group">
	      <label for="SUBJECT">제목:</label>
	      <input type="text" class="form-control" id="SUBJECT" name="SUBJECT">
	    </div>
	    <div class="form-group">
	      <label for="CONTENT">내용:</label>
	      <input type="text" class="form-control" id="CONTENT" name="CONTENT">
	    </div>
	     <div class="form-group">
	      <label for="WRITER">작성자:</label>
	      <input type="text" class="form-control" id="WRITER" name="WRITER">
	    </div>
	    <div class="form-group">
	      <label for="REGDATE">작성일:</label>
	      <input type="date" class="form-control" id="REGDATE" name="REGDATE">
	    </div>
	    <br>
	    <div class="text-center">
				<button  type="submit" class="btn btn-secondary">등록</button>
			</div>
		</form>
	</div>
</body>
</html>


