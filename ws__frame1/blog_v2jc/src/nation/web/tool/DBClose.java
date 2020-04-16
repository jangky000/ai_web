package nation.web.tool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBClose {
  public void close(Connection con, PreparedStatement pstmt) {
    try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
    try{ if (con != null){ con.close(); } }catch(Exception e){ }
  }
  
  // 오버로딩
  public void close(ResultSet rs, Connection con, PreparedStatement pstmt) {
    try{ if (rs != null){ rs.close(); } }catch(Exception e){ }
    try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
    try{ if (con != null){ con.close(); } }catch(Exception e){ }
  }

}
