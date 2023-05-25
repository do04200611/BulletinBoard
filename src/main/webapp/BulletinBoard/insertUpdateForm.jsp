<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.net.ConnectException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
	String id = request.getParameter("id");
	String name = "";
	String pwd = "";
	String action = "insertPro.jsp";
	
	if(id !=null){
		Class.forName("org.mariadb.jdbc.Driver");
		String url ="jdbc:mariadb://localhost:3306/gildongdb";
		String user ="root";
		String passwd ="1111";
		Connection con = DriverManager.getConnection(url, user, passwd);
		
		String sql = "select * from login where id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			name = rs.getString("name");
			pwd = rs.getString("pwd");
			action = "updatePro.jsp";
		}
	}else{
		id="";
	}
%> --%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 입력</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<%
	String id = request.getParameter("id");
	String name = "";
	String pwd = "";
	String action = "insertPro.jsp";
	if(id !=null){
		InitialContext initCtx = new InitialContext();
		
		Context ctx =  (Context)initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource)ctx.lookup("jdbc/root");
		
		Connection con = ds.getConnection();
		
		out.println("연결 성공!!");
		
		String sql = "select * from login2";
	    Statement stmt = con.createStatement();
	    
	    
	    ResultSet rs = stmt.executeQuery(sql);
	 if(rs.next()){
			name = rs.getString("name");
			pwd = rs.getString("pwd");
			action = "updatePro.jsp";
		}
	}else{
		id="";
	}
%>		    
</head>
<body>
	<div class="container">
		<br>
		<h2 class="text-center font-weight-bold">사용자 입력</h2>
		<hr/>
		
		<form action="<%=action %>" method="post">
		  <div class="form-group">
	      <label for="id">ID:</label>
	      <input type="text" class="form-control" id="id" name="id" value="<%=id%>">
	    </div>
	    <div class="form-group">
	      <label for="name">NAME:</label>
	      <input type="text" class="form-control" id="name" name="name" value="<%=name%>">
	    </div>
	    <div class="form-group">
	      <label for="pwd">PASSWORD:</label>
	      <input type="password" class="form-control" id="pwd" name="pwd" value="<%=pwd%>">
	    </div>
	    <br>
	    <div class="text-center">
	    		<input type="submit" value="변경" class="btn btn-secondary">  
					<input type="button" value="삭제" class="btn btn-secondary" onclick="location.href='delete.jsp?id=<%=id%>'">
					<input type="button" value="목록" class="btn btn-secondary" onclick="location.href='list.jsp'">
			</div>
		</form>
	</div>
</body>
</html>
