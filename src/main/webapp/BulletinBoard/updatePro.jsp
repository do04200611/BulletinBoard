<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="cs.dit.LoginDao" %>
<%@ page import="cs.dit.LoginDto" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  request.setCharacterEncoding("UTF-8");
  String BCODEParam = request.getParameter("BCODE");
  int BCODE = 0;
  if (StringUtils.isNotEmpty(BCODEParam) && StringUtils.isNumeric(BCODEParam)) {
      BCODE = Integer.parseInt(BCODEParam);
  }

  String SUBJECT = request.getParameter("SUBJECT");
  String CONTENT = request.getParameter("CONTENT");
  String WRITER = request.getParameter("WRITER");
  Date regDate = new Date(System.currentTimeMillis());

  LoginDto dto = new LoginDto();
  dto.setBCODE(BCODE); // DTO에 BCODE 설정
  dto.setSUBJECT(SUBJECT);
  dto.setCONTENT(CONTENT);
  dto.setWRITER(WRITER);
  dto.setREGDATE(new java.sql.Date(regDate.getTime()));

  LoginDao dao = LoginDao.getInstance();
  
  try {
      dao.loginChange(dto, "u"); // 수정된 코드를 적용
      out.println("<script>alert('수정되었습니다!'); location.href = 'list.jsp';</script>");
  } catch (Exception e) {
      out.println("<script>alert('Exception occurred: " + e.getMessage() + "');</script>");
  }
%>
