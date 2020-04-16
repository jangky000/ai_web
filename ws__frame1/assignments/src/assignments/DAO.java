package assignments;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO {
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  StringBuffer sql = null;
  int count = 0;
  
  String className = "org.gjt.mm.mysql.Driver";
  String url = "jdbc:mysql://172.16.12.4:3306/javadb?useUnicode=true&characterEncoding=euckr";
  String user = "root";
  String password = "1234";
  
  public void insert(String title, String mail_from, String mail_to, String content){
    try {
      Class.forName(className);
      con = DriverManager.getConnection(url, user, password);
      
      sql = new StringBuffer();
      sql.append(" INSERT INTO mail(title, mail_from, mail_to, content, mail_date)");
      sql.append(" VALUES(?, ?, ?, ?, NOW())");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, title);
      pstmt.setString(2, mail_from);
      pstmt.setString(3, mail_to);
      pstmt.setString(4, content);
      
      
      count = pstmt.executeUpdate();
      
    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
    } finally {
      // try {if(rs != null) {rs.close();}} catch (SQLException e) {e.printStackTrace();}
      try {if(pstmt != null){pstmt.close();}} catch (SQLException e) {e.printStackTrace();}
      try {if(con != null){con.close();}} catch (SQLException e) {e.printStackTrace();}
    }
    
  }

  public void list() {
    try {
      Class.forName(className);
      con = DriverManager.getConnection(url, user, password );
      
      sql = new StringBuffer();
      sql.append(" SELECT mailno, title, mail_from, mail_to, mail_date");
      sql.append(" FROM mail"); 
      sql.append(" WHERE mail_to = 'me'");
      sql.append(" ORDER BY mailno ASC");
     
      pstmt = con.prepareStatement(sql.toString());
      
      rs = pstmt.executeQuery(); 
      
      while(true) {
        if(rs.next() == true) {
          System.out.print(rs.getInt("mailno") + ". ");
          System.out.print(rs.getString("title") + ": ");
          System.out.print(rs.getString("mail_from") + " ");
          System.out.print(rs.getString("mail_to") + " ");
          System.out.println(rs.getString("mail_date"));
        }
        else {
          break;
        }
      }
      
    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace();
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC 드라이버가 없습니다.");
      e.printStackTrace();
    } finally {
      try{ if (rs != null){ rs.close(); } }catch(Exception e){ }
      try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
      try{ if (con != null){ con.close(); } }catch(Exception e){ }
    }
  }
  
  public void list(String from_me) {
    try {
      Class.forName(className);
      con = DriverManager.getConnection(url, user, password );
      
      sql = new StringBuffer();
      sql.append(" SELECT mailno, title, mail_from, mail_to, mail_date");
      sql.append(" FROM mail"); 
      sql.append(" WHERE mail_from = 'me'");
      sql.append(" ORDER BY mailno ASC");
     
      pstmt = con.prepareStatement(sql.toString());
      
      rs = pstmt.executeQuery(); 
      
      while(true) {
        if(rs.next() == true) {
          System.out.print(rs.getInt("mailno") + ". ");
          System.out.print(rs.getString("title") + ": ");
          System.out.print(rs.getString("mail_from") + " ");
          System.out.print(rs.getString("mail_to") + " ");
          System.out.println(rs.getString("mail_date"));
        }
        else {
          break;
        }
      }
      
    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace();
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC 드라이버가 없습니다.");
      e.printStackTrace();
    } finally {
      try{ if (rs != null){ rs.close(); } }catch(Exception e){ }
      try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
      try{ if (con != null){ con.close(); } }catch(Exception e){ }
    }
  }
  
  public void read(int mailno) {
    try {
      Class.forName(className);
      con = DriverManager.getConnection(url, user, password );

      sql = new StringBuffer();
      sql.append(" SELECT mailno, title, mail_from, mail_to, mail_date, content");
      sql.append(" FROM mail"); 
      sql.append(" WHERE mailno = ?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, mailno);
      rs = pstmt.executeQuery();


      if(rs.next() == true) {
        System.out.print(rs.getInt("mailno") + ". ");
        System.out.println(rs.getString("title"));
        System.out.println("from: " + rs.getString("mail_from"));
        System.out.println("to: " + rs.getString("mail_to"));
        System.out.println("date: " + rs.getString("mail_date")); 
        System.out.println(rs.getString("content"));
      } else {
        System.out.println("해당하는 메일이 없습니다.");
      }

    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace();
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC 드라이버가 없습니다.");
      e.printStackTrace();
    } finally {
      try{ if (rs != null){ rs.close(); } }catch(Exception e){ } // 해제하지 않을 시 메모리 누수 가능성
      try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
      try{ if (con != null){ con.close(); } }catch(Exception e){ }
    }
  }
  
  public int update(int mailno, String title, String mail_to, String content) {
    try {
      Class.forName(className); // memory로 클래스를 로딩함, 객체는 생성하지 않음.
      con = DriverManager.getConnection(url, user, password ); // MySQL 연결

      sql = new StringBuffer();
      //SQL문 앞에 한 칸 공백 만들기 + ; 지우기
      sql.append(" UPDATE mail");
      sql.append(" SET title = ?, mail_to=?, content=?");
      sql.append(" WHERE mailno = ?");

      //StringBuffer를 문자열로 변환
      pstmt = con.prepareStatement(sql.toString());

      pstmt.setString(1, title);
      pstmt.setString(2, mail_to);
      pstmt.setString(3, content);
      pstmt.setInt(4, mailno);

      //pstmt 바인딩 후에 실행
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE를 실행

    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace(); // 예외가 발생하기까지의 실행 과정 출력
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC 드라이버가 없습니다.");
      e.printStackTrace();
    } finally {
      try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
      try{ if (con != null){ con.close(); } }catch(Exception e){ }
    }
    return count;
  }

  public int delete(int mailno) {
    try {
      Class.forName(className);
      con = DriverManager.getConnection(url, user, password );

      sql = new StringBuffer();
      sql.append(" DELETE FROM mail");
      sql.append(" WHERE mailno = ?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, mailno);
      
      count = pstmt.executeUpdate();

    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace();
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC 드라이버가 없습니다.");
      e.printStackTrace();
    } finally {
      try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
      try{ if (con != null){ con.close(); } }catch(Exception e){ }
    }
    return count;
  }
  
}
