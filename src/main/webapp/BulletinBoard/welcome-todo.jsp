<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%=session.getAttribute("id") %>님반갑습니다!!
	<form action="logout-todo.jsp">
	<button>로그아웃</button>
	</form>
</body>
</html>