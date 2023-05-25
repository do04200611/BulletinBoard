<%@ page import="cs.dit.LoginDao" %>
<%@ page import="cs.dit.LoginDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
    
<%		
	String bcode = request.getParameter("bcode");
	LoginDao dao = new LoginDao();
	dao.delete(Integer.parseInt(bcode));
%>

<script type="text/javascript">
	let ans = alert("삭제되었습니다!");
	if(!ans){
		location.href ='list.jsp';
	}
</script>
