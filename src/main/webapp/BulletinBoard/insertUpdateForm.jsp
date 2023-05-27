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

Integer BCODE = null;
String SUBJECT = "";
String CONTENT = "";
String WRITER = "";
Date REGDATE = null; // Initialize with null value

String BCODEParam = request.getParameter("BCODE");
if (BCODEParam != null && !BCODEParam.isEmpty()) {
	BCODE = Integer.parseInt(BCODEParam);
  LoginDto dto = new LoginDto();
  LoginDao dao = new LoginDao(); // Make sure to instantiate the dao object
  out.println(BCODE);
  
  dto = dao.selectOne(BCODE);

  if (dto != null) {
    SUBJECT = dto.getSUBJECT();
    CONTENT = dto.getCONTENT();
    WRITER = dto.getWRITER();
    REGDATE = dto.getREGDATE();
  }
}
//Date 형식의 날짜를 문자열로 변환하여 입력 받음
String REGDATEParam = request.getParameter("REGDATE");
if (REGDATEParam != null && !REGDATEParam.isEmpty()) {
 try {
     REGDATE = Date.valueOf(REGDATEParam);
 } catch (IllegalArgumentException e) {
     // 잘못된 형식의 날짜 입력 처리
     e.printStackTrace();
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
  <script rc="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
  <div class="container">
    <br>
    <h2 class="text-center font-weight-bold">사용자 입력</h2>
    <hr/>

    <form action="updatePro.jsp" method="post">
      <div class="form-group">
        <label for="BCODE">BCODE:</label>
        <input type="text" class="form-control" id="BCODE" name="BCODE" value="<%= BCODE %>">
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
        <input type="submit" value="변경" class="btn btn-secondary" onclick="location.href='updatePro.jsp?BCODE=<%= BCODE %>'">  
        <input type="button" value="삭제" class="btn btn-secondary" onclick="location.href='delete.jsp?BCODE=<%= BCODE %>'">
        <input type="button" value="목록" class="btn btn-secondary" onclick="location.href='list.jsp'">
      </div>
    </form>
  </div>
</body>
</html>
