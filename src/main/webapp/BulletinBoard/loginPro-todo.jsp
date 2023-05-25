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
    

<%-- <%
	/*1.한글 처리
	Select id, password
	from login db
	*/
	request.setCharacterEncoding("utf-8");
	//2. 폼에서 id,pwd를 전달 받는다.
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//3. DB등록
	Class.forName("org.mariadb.jdbc.Driver");
	//4. 커넥션 만들기
	String url = "jdbc:mariadb://localhost:3306/gildongdb";
	String user = "root";
	String passwd	= "1111";
	
	Connection con = DriverManager.getConnection(url, user, passwd);
	
	//5. SQL문으로 DB에 질의()
	String sql = "select id from login where id=? and pwd=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);	
	//6.질의 결과 확인
	ResultSet rs = pstmt.executeQuery();
	//7.사용자가 유효한 경우
	if (rs.next()){
		session.setAttribute("id",id);
		response.sendRedirect("welcome-todo.jsp");
	}else{
		//out.println();
%> --%>
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
	
