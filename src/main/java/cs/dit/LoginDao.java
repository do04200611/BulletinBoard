package cs.dit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LoginDao {
    private static LoginDao instance;

    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/gh");
        return ds.getConnection();
    }

    public static LoginDao getInstance() {
        if (instance == null) {
            instance = new LoginDao();
        }
        return instance;
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
        try (Connection con = getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setString(1, dto.getSUBJECT());
            pstmt.setString(2, dto.getCONTENT());
            pstmt.setString(3, dto.getWRITER());
            pstmt.setDate(4, dto.getREGDATE());

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<LoginDto> list() {
    	
        String sql = "SELECT * FROM dbcp";
        ArrayList<LoginDto> dtos = new ArrayList<LoginDto>();

        try (Connection con = getConnection(); Statement stmt = con.createStatement();
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

    public LoginDto selectOne(Integer BCODE) {
        String sql = "SELECT * FROM dbcp WHERE BCODE=?";
        LoginDto dto = new LoginDto();

        try (Connection con = getConnection(); PreparedStatement psmt = con.prepareStatement(sql);) {
            psmt.setInt(1, BCODE);

            try (ResultSet rs = psmt.executeQuery();) {
                if (rs.next()) {
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

    public int delete(int BCODE) throws Exception {
        int cnt = 0;
        String sql = "DELETE FROM dbcp WHERE BCODE = ?";
        Connection con = null;
        PreparedStatement pstmt = null;
        
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, BCODE);
            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (con != null)
                    con.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return cnt;
    }



    public void update(int BCODE, LoginDto dto) {
        int result = 0;
        String sql = "UPDATE dbcp SET SUBJECT=?, CONTENT=?, WRITER=?, REGDATE=? WHERE BCODE=?";
        try (Connection con = getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, dto.getSUBJECT());
            pstmt.setString(2, dto.getCONTENT());
            pstmt.setString(3, dto.getWRITER());
            pstmt.setDate(4, dto.getREGDATE());
            pstmt.setInt(5, dto.getBCODE());
            
            result = pstmt.executeUpdate(); // 수정 쿼리 실행
            
            pstmt.close();
        } catch (SQLException e) {
            System.out.println("SQL Exception occurred: " + e.getMessage());
            // 예외 처리에 따라 적절한 조치를 취할 수 있습니다.
            // 예를 들어, 로깅, 에러 메시지 출력, 트랜잭션 롤백 등을 수행할 수 있습니다.
        } catch (Exception e) {
            System.out.println("Exception occurred: " + e.getMessage());
            // 예외 처리에 따라 적절한 조치를 취할 수 있습니다.
        }
    }
   
	}

}
