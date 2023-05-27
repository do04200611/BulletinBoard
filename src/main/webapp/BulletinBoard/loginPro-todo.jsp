<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.net.ConnectException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cs.dit.LoginDao" %>
<%@page import="cs.dit.LoginDto" %>
    

<% 
	InitialContext initCtx = new InitialContext();
	Context ctx =  (Context)initCtx.lookup("java:comp/env");	
	DataSource ds = (DataSource)ctx.lookup("jdbc/gh");
	Connection con = ds.getConnection();
	String sql = "select * from login2";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
%>

	<!--  8.아닌 경우는 insertform으로 보내든지-->
	<script type="text/javascript">

		confirm("존재하지 않는 사용자입니다. 등록하시겠습니까?")==true){
			location.href="insertForm.jsp";
		}else {
			histroy.back();
		}
	</script>		
	
	
	
	
	<!--9. 아닌경우는 javascript로 존재하지 않는 사용자입니다.라는 메시지를 띄웁니다.  -->
	
<%-- <% }%>	 --%>
	
