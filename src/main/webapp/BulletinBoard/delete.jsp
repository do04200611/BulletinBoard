<%@ page import="cs.dit.LoginDao" %>
<%@ page import="cs.dit.LoginDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%@ page import="java.net.*" %>

<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
    String BCODEParam = request.getParameter("BCODE");
    int BCODE;
    if (BCODEParam != null && !BCODEParam.isEmpty()) {
        BCODE = Integer.parseInt(BCODEParam);
        LoginDao dao = LoginDao.getInstance();
        LoginDto dto = dao.selectOne(BCODE); // 해당 BCODE에 대한 LoginDto 가져오기
        dao.loginChange(dto, "d"); // 삭제된 레코드에 대한 처리
    }
%>

<script type="text/javascript">
    alert("삭제되었습니다!");
    location.href = 'list.jsp';
</script>
