<%@ page import="cs.dit.LoginDao" %>
<%@ page import="cs.dit.LoginDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
    
<%	
	
    String SUBJECT = request.getParameter("SUBJECT");
    String CONTENT = request.getParameter("CONTENT");
    String WRITER = request.getParameter("WRITER");
    Timestamp regDate = new Timestamp(System.currentTimeMillis());
    	
    LoginDto dto = new LoginDto(SUBJECT, CONTENT, WRITER, new java.sql.Date(regDate.getTime()));
    LoginDao dao = new LoginDao();
    	
    dao.loginChange(dto, "u");
%>		    
	
<script>
    let ans = alert("수정되었습니다!");
    if (!ans){
        location.href='list.jsp';
    }
</script>
