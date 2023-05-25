<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*" %>
<%@page import="cs.dit.LoginDao" %>
<%@page import="cs.dit.LoginDto" %>
<% 	
Integer bcode = Integer.parseInt(request.getParameter("BCODE"));

LoginDto dto = new LoginDto();
LoginDao dao = new LoginDao();
out.println(bcode);
// 수정된 코드
dto = dao.selectOne(bcode); // bcode 변수 사용

%>	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 정보 변경</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<br>
		<h2 class="text-center font-weight-bold">사용자 정보 변경</h2>
		<hr/>
		<form action="updatePro.jsp" method="post">
	    <div class="form-group">
	      <label for="BCODE">숫자:</label>
	      <input type="text" class="form-control" id="BCODE" name="BCODE" value="<%=dto.getBCODE()%>" readonly>
	    </div>
	    <div class="form-group">
	      <label for="SUBJECT">제목:</label>
	      <input type="text" class="form-control" id="SUBJECT" name="SUBJECT" value="<%=dto.getSUBJECT()%>">
	    </div>
	    <div class="form-group">
	      <label for="CONTENT">내용:</label>
	      <input type="text" class="form-control" id="CONTENT" name="CONTENT" value="<%=dto.getCONTENT()%>">
	    </div>
	     <div class="form-group">
	      <label for="WRITER">작성자:</label>
	      <input type="text" class="form-control" id="WRITER" name="WRITER" value="<%=dto.getWRITER()%>">
	    </div>
	    <div class="form-group">
	      <label for="REGDATE">작성일:</label>
	     
