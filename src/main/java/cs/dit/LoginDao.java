package cs.dit;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;

/**==============================*
 * 작성자 : kimga
 * 작성일 : 2023. 5. 10.
 * 파일명 : LoginDao.java
 *프로그램 설명 :
   -INSERTlogin(): login 테이블에 접근하여 CRUD기능 처리
   - list 
 *==============================**/

/**
 * @author kimga
 *
 */

public class LoginDao {
	private Connection getConnection() throws Exception {
  

		// 1. JNDI를 이용하기 위한 객체 생성
		Context initCtx = new InitialContext();
		// 2. 등록된 네이밍 서비스로부터 등록된 자원을 가져옴
		Context envCtx = (Context) initCtx.lookup("java:comp/env");

		// 3. 자원들 중 원하는 jdbc/gildongdb 자원을 찾아내어 데이터 소스를 가져온다.
		DataSource ds = (DataSource) envCtx.lookup("jdbc/gh");

		// 4. 커넥션 얻어옴
		Connection con = ds.getConnection();
		
		return con;
	}

	private void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	public void insertPro(LoginDto dto) throws Exception {
		String sql = "INSERT INTO dbcp(SUBJECT, CONTENT, WRITER, REGDATE) VALUES(?, ?, ?, ?)";
		try (
			Connection con = getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql);	
		)
		{
		pstmt.setString(1, dto.getSUBJECT());
		pstmt.setString(2, dto.getCONTENT());
		pstmt.setString(3, dto.getWRITER());
		pstmt.setDate(4, dto.getREGDATE());

		pstmt.executeUpdate(); 
		}catch (Exception e) {
			e.printStackTrace();
		}
		// TODO: handle exception
		
	}
	

	public ArrayList<LoginDto> list() {
	    String sql = "SELECT * FROM dbcp";
	    ArrayList<LoginDto> dtos = new ArrayList<LoginDto>();

	    try (Connection con = getConnection();
	         Statement stmt = con.createStatement();
	         ResultSet rs = stmt.executeQuery(sql)) {

	        while (rs.next()) {
	            LoginDto dto = new LoginDto();
	            dto.setBCODE(rs.getInt("BCODE"));
	            dto.setSUBJECT(rs.getString("SUBJECT"));
	            dto.setCONTENT(rs.getString("CONTENT"));
	            dto.setWRITER(rs.getString("WRITER"));
	            dto.setREGDATE(rs.getDate("REGDATE"));
	            dtos.add(dto);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return dtos;
	}

	// 1.접근 제어자
	// 2.반환 데이터 타입
	// 3. 입력 매개변수
	public LoginDto selectOne(Integer BCODE) {
	    String sql = "SELECT * FROM dbcp WHERE BCODE=?";
	    LoginDto dto = new LoginDto();

	    try (Connection con = getConnection(); 
	         PreparedStatement psmt = con.prepareStatement(sql);) {
	    	psmt.setInt(1, BCODE); // id를 BCODE 대신에 SUBJECT에 대입

	        try (ResultSet rs = psmt.executeQuery();) {
	            if (rs.next()) { // rs.next() 호출 추가
	                dto.setBCODE(rs.getInt("BCODE"));
	                dto.setSUBJECT(rs.getString("SUBJECT"));
	                dto.setCONTENT(rs.getString("CONTENT"));
	                dto.setWRITER(rs.getString("WRITER"));
	                dto.setREGDATE(rs.getDate("REGDATE"));
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return dto;
	}



	
	public void delete(int bcode) {
	    String sql = "DELETE FROM dbcp WHERE BCODE=?";
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql)) {
	        pstmt.setInt(1, bcode);
	        pstmt.executeUpdate();
	        pstmt.close();
	    } catch (Exception e) {
	        System.out.println(e.toString());
	    }
	}

	public void update(int bcode, LoginDto dto) {
		int result = 0;
	    String sql = "UPDATE dbcp SET SUBJECT=?, CONTENT=?, WRITER=?, REGDATE =?  WHERE BCODE=?";
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql)) {
	        pstmt.setString(1, dto.getSUBJECT());
	        pstmt.setString(2, dto.getCONTENT());
	        pstmt.setString(3, dto.getWRITER());
	        pstmt.setInt(4, dto.getBCODE());
	        pstmt.setDate(5, dto.getREGDATE());
	      result =  pstmt.executeUpdate();
	      pstmt.close();
	    } catch (Exception e) {
	       System.out.println(e.toString());
	    }
	}


	
/* pstmt.executeUpdate();*/

	}
	






