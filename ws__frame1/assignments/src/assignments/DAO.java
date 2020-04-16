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
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace();
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC ����̹��� �����ϴ�.");
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
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace();
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC ����̹��� �����ϴ�.");
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
        System.out.println("�ش��ϴ� ������ �����ϴ�.");
      }

    } catch (SQLException e) {
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace();
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC ����̹��� �����ϴ�.");
      e.printStackTrace();
    } finally {
      try{ if (rs != null){ rs.close(); } }catch(Exception e){ } // �������� ���� �� �޸� ���� ���ɼ�
      try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
      try{ if (con != null){ con.close(); } }catch(Exception e){ }
    }
  }
  
  public int update(int mailno, String title, String mail_to, String content) {
    try {
      Class.forName(className); // memory�� Ŭ������ �ε���, ��ü�� �������� ����.
      con = DriverManager.getConnection(url, user, password ); // MySQL ����

      sql = new StringBuffer();
      //SQL�� �տ� �� ĭ ���� ����� + ; �����
      sql.append(" UPDATE mail");
      sql.append(" SET title = ?, mail_to=?, content=?");
      sql.append(" WHERE mailno = ?");

      //StringBuffer�� ���ڿ��� ��ȯ
      pstmt = con.prepareStatement(sql.toString());

      pstmt.setString(1, title);
      pstmt.setString(2, mail_to);
      pstmt.setString(3, content);
      pstmt.setInt(4, mailno);

      //pstmt ���ε� �Ŀ� ����
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE�� ����

    } catch (SQLException e) {
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace(); // ���ܰ� �߻��ϱ������ ���� ���� ���
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC ����̹��� �����ϴ�.");
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
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace();
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC ����̹��� �����ϴ�.");
      e.printStackTrace();
    } finally {
      try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
      try{ if (con != null){ con.close(); } }catch(Exception e){ }
    }
    return count;
  }
  
}
