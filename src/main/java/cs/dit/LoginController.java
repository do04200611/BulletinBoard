package cs.dit;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.View;

/**
 * Servlet implementation class HelloServelet
 */
@WebServlet("*.do")
public class LoginController extends HttpServlet  {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		System.out.println(uri);
		
		String viewPage = null;
		
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.indexOf(".do"));
		System.out.println(uri.lastIndexOf("/"));
		System.out.println(com);
		
		
		if(com.equals("list")&& com != null) {
			LoginDao dao = new LoginDao(); 
			  ArrayList<LoginDto> dtos = dao.list();
			  request.setAttribute("dtos", dtos);
			  viewPage="/BulletinBoard/list.do";
		}if(com.equals("insertForm")&& com != null) {
			viewPage ="/BulletinBoard/insertForm.jsp";
		}if(com.equals("insert")&& com != null) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String  pwd= request.getParameter("pwd");
			
//			LoginDto dto = new LoginDto(id,name, pwd);
//			LoginDao dao = new LoginDao();
//			dao.insertLogin(dto);
//			viewPage ="/BulletinBoard/list.do";
			
		}
	  
	  
	  RequestDispatcher rd = request.getRequestDispatcher("/BulletinBoard/list.jsp");
	  rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
