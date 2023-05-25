<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="cs.dit.LoginDao" %>
<%@ page import="cs.dit.LoginDto" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%
  String bcodeParam = request.getParameter("bcode");
  int bcode = 0;
  if (StringUtils.isNotEmpty(bcodeParam) && StringUtils.isNumeric(bcodeParam)) {
    bcode = Integer.parseInt(bcodeParam);
  }

  String SUBJECT = request.getParameter("SUBJECT");
  String CONTENT = request.getParameter("CONTENT");
  String WRITER = request.getParameter("WRITER");
  Timestamp regDate = new Timestamp(System.currentTimeMillis());

  LoginDto dto = new LoginDto();
  dto.setBCODE(bcode); // Set the bcode in the DTO
  dto.setSUBJECT(SUBJECT);
  dto.setCONTENT(CONTENT);
  dto.setWRITER(WRITER);
  dto.setREGDATE(new java.sql.Date(regDate.getTime()));

  LoginDao dao = new LoginDao();
  dao.update(bcode, dto); // Pass the bcode and the DTO to the update method
%>		    

<script>
  alert("수정되었습니다!");
  location.href = 'list.jsp';
</script>
