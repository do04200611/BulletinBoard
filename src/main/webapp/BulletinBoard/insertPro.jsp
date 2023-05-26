<%
/* ================================
 * 파일명 :
 * 작성자 : 김강현
 * 프로그램 설명 :
 * 변경이력 :
 *
 *===============================*/
 %>
<%@page import="cs.dit.LoginDao" %>  
<%@page import="cs.dit.LoginDto" %>  
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
    request.setCharacterEncoding("utf-8");

    String SUBJECT = request.getParameter("SUBJECT");
    String CONTENT = request.getParameter("CONTENT");
    String WRITER = request.getParameter("WRITER");
    String REGDATE = request.getParameter("REGDATE");
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date regDate = null;

    try {
        regDate = dateFormat.parse(REGDATE);
    } catch (ParseException e) {
        e.printStackTrace();
    }

    java.sql.Date sqlRegDate = null;
    if (regDate != null) {
        sqlRegDate = new java.sql.Date(regDate.getTime());
    }

    LoginDto dto = new LoginDto();
    dto.setSUBJECT(SUBJECT);
    dto.setCONTENT(CONTENT);
    dto.setWRITER(WRITER);
    dto.setREGDATE(sqlRegDate);

    LoginDao dao = new LoginDao();
    dao.insertPro(dto);

    response.sendRedirect("list.jsp");
%>
