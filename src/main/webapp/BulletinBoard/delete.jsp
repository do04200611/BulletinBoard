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
        int cnt = dao.delete(BCODE);
        if (cnt == 0) {
            // 삭제된 레코드가 없는 경우에 대한 처리
        } else {
            // 삭제된 레코드가 있는 경우에 대한 처리
        }
    }
%>

<script type="text/javascript">
    alert("삭제되었습니다!");
    location.href = 'list.jsp';
</script>
