<%@ page import="cs.dit.LoginDao" %>
<%@ page import="cs.dit.LoginDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%@page import="java.net.*" %>

<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
    String bcodeParam = request.getParameter("BCODE");
    if (bcodeParam != null && !bcodeParam.isEmpty()) {
        int bcode = Integer.parseInt(bcodeParam);
        LoginDao dao = new LoginDao();
        dao.delete(bcode);
    }
%>

<script type="text/javascript">
    alert("삭제되었습니다!");
    location.href = 'list.jsp';
</script>
