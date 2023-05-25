<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.net.ConnectException" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="cs.dit.LoginDao" %>
<%@ page import="cs.dit.LoginDto" %>
<%
Integer bcode = null;
String SUBJECT = "";
String CONTENT = "";
String WRITER = "";
Date REGDATE = null; // Initialize with null value

String bcodeParam = request.getParameter("BCODE");
if (bcodeParam != null && !bcodeParam.isEmpty()) {
  bcode = Integer.parseInt(bcodeParam);
  LoginDto dto = new LoginDto();
  LoginDao dao = new LoginDao(); // Make sure to instantiate the dao object

  dto = dao.selectOne(bcode);

  if (dto != null) {
    SUBJECT = dto.getSUBJECT();
    CONTENT = dto.getCONTENT();
    WRITER = dto.getWRITER();
    REGDATE = dto.getREGDATE();
  }
}
%>

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
    <hr/>

    <form action="updatePro.jsp" method="post">
      <div class="form-group">
        <label for="bcode">bcode:</label>
        <input type="text" class="form-control" id="bcode" name="bcode" value="<%= bcode %>">
      </div>

      <div class="form-group">
        <label for="SUBJECT">SUBJECT:</label>
        <input type="text" class="form-control" id="SUBJECT" name="SUBJECT" value="<%= SUBJECT %>">
      </div> 

      <div class="form-group">
        <label for="CONTENT">CONTENT:</label>
        <input type="text" class="form-control" id="CONTENT" name="CONTENT" value="<%= CONTENT %>">
      </div>

      <div class="form-group">
        <label for="WRITER">WRITER:</label>
        <input type="text" class="form-control" id="WRITER" name="WRITER" value="<%= WRITER %>">
      </div>

      <div class="form-group">
        <label for="REGDATE">REGDATE:</label>
        <input type="date" class="form-control" id="REGDATE" name="REGDATE" value="<%= (REGDATE != null) ? REGDATE.toString() : "" %>">
      </div>

      <br>
      <div class="text-center">
        <input type="submit" value="변경" class="btn btn-secondary">  
        <input type="button" value="삭제" class="btn btn-secondary" onclick="location.href='delete.jsp?id=<%= bcode %>'">
        <input type="button" value="목록" class="btn btn-secondary" onclick="location.href='list.jsp'">
      </div>
    </form>
  </div>
</body>
</html>
