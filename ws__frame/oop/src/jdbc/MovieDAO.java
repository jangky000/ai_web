package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MovieDAO {
  //DBMS ���߽� �ݺ������� ���Ǵ� ���� �ҽ�
  //MyBatis��  JPA������ �ڵ�ȭ �Ǿ� ����
  //import �� com.mysql.jdbc�� �ƴ� 'java.sql'�� import
  Connection con = null;              // DBMS ����
  PreparedStatement pstmt = null; // SQL ����
  ResultSet rs = null;                   // SELECT ����� ����
  StringBuffer sql = null;              // SQL ����
  int count = 0;                         // ó���� ���ڵ� ����

  String className = "org.gjt.mm.mysql.Driver"; // MySQL ���� Driver 
  //�����ͺ��̽� javadb ���
  String url = "jdbc:mysql://localhost:3306/javadb?useUnicode=true&characterEncoding=euckr"; 
  String user = "root"; 
  String password = "1234";
  
  //create �޼ҵ�
  public void create() {
    //��Ʈ��ũ ������ ����ó���� �ʼ�
    try {
      Class.forName(className); // memory�� Ŭ������ �ε���, ��ü�� �������� ����.
      con = DriverManager.getConnection(url, user, password ); // MySQL ����
      
      sql = new StringBuffer();
      //SQL�� �տ� �� ĭ ���� ����� + ; �����, append�� return�� ���� ���� �ʴ´�.
      sql.append(" INSERT INTO  movie(title, score, actor, rdate)");
      sql.append(" VALUES('�达�� ������(���, 2016)', 9.9, '�̼���', NOW())");
      
      //StringBuffer�� ���ڿ��� ��ȯ
      pstmt = con.prepareStatement(sql.toString());
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE�� ����
      
      if(count == 1) {
        System.out.println("ó�� ����");
      } else {
        System.out.println("ó�� ����");
      }
      
      
    } catch (SQLException e) {
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace(); // ���ܰ� �߻��ϱ������ ���� ���� ���
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC ����̹��� �����ϴ�.");
      e.printStackTrace();
    } finally {
//      try{ if (rs != null){ rs.close(); } }catch(Exception e){ }
      // ���� ���� ������� �ʰ� ���� ����
      try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
      try{ if (con != null){ con.close(); } }catch(Exception e){ }
    }
    

  }

  /**
   * ���<br>
   * <pre>
   * ��)
   * movieDAO.create("������ ����� ������ �ȴ�(��ȭ, 2018)", 7.9, "�� ��ƿ��");
   * </pre>
   * @param title ��ȭ��/��󸶸�
   * @param score ����
   * @param actor �ֿ�
   */
  public void create(String title, double score, String actor) {
    //��Ʈ��ũ ������ ����ó���� �ʼ�
    try {
      Class.forName(className); // memory�� Ŭ������ �ε���, ��ü�� �������� ����.
      con = DriverManager.getConnection(url, user, password ); // MySQL ����
      
      sql = new StringBuffer();
      //SQL�� �տ� �� ĭ ���� ����� + ; �����
      sql.append(" INSERT INTO  movie(title, score, actor, rdate)");
      sql.append(" VALUES(?, ?, ?, NOW())"); // '?'�� ?������ �Ǵ�, ���ڿ��� single quatation ���� ���
      
      //StringBuffer�� ���ڿ��� ��ȯ
      pstmt = con.prepareStatement(sql.toString());
      
      pstmt.setString(1, title);
      pstmt.setDouble(2, score);
      pstmt.setString(3, actor);
      
      //pstmt ���ε� �Ŀ� ����
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE�� ����
      
      if(count == 1) {
        System.out.println("ó�� ����");
      } else {
        System.out.println("ó�� ����");
      }
      
      
    } catch (SQLException e) {
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace(); // ���ܰ� �߻��ϱ������ ���� ���� ���
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC ����̹��� �����ϴ�.");
      e.printStackTrace();
    } finally {
//      try{ if (rs != null){ rs.close(); } }catch(Exception e){ }
      // ���� ���� ������� �ʰ� ���� ����
      try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
      try{ if (con != null){ con.close(); } }catch(Exception e){ }
    }
   
  }
  
  /**
   * ��ü ���
   */
  public void list() {
    try {
      Class.forName(className);
      con = DriverManager.getConnection(url, user, password );
      
      sql = new StringBuffer();
      sql.append(" SELECT movieno, title, score, actor, rdate");
      sql.append(" FROM movie"); 
      sql.append(" ORDER BY movieno ASC");
     
      pstmt = con.prepareStatement(sql.toString());
      
      rs = pstmt.executeQuery(); // SELECT�� ����: executeQuery() : return ResultSet Ÿ��
      
      while(true) {
        if(rs.next() == true) { // ù��° ���ڵ� -> ������ ���ڵ�� �̵�
          //1. ��Ʋ��Ÿ ����Ƽī(�̵�, 2004): ���̹� ��� 9.9 2018-08-28
          System.out.print(rs.getInt("movieno") + ". ");
          System.out.print(rs.getString("title") + ": ");
          System.out.print(rs.getString("actor") + " ");
          System.out.print(rs.getDouble("score") + " ");
          System.out.println(rs.getString("rdate").substring(0,10)); //getDate()�� �ڹٿ��� �����ϴ� ��¥ ���������� �� ������� ����
          System.out.println("---------------------------------");
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

  /**
   * ��ȸ
   * @param movieno ��ȭ ��ȣ
   */
  public void read(int movieno) {
    try {
      Class.forName(className);
      con = DriverManager.getConnection(url, user, password );

      sql = new StringBuffer();
      sql.append(" SELECT movieno, title, score, actor, rdate");
      sql.append(" FROM movie"); 
      sql.append(" WHERE movieno = ?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, movieno);
      rs = pstmt.executeQuery(); // SELECT�� ����: executeQuery() : return ResultSet Ÿ��


      if(rs.next() == true) { // ù��° ���ڵ� -> ������ ���ڵ�� �̵�
        //1. ��Ʋ��Ÿ ����Ƽī(�̵�, 2004): ���̹� ��� 9.9 2018-08-28
        System.out.print(rs.getInt("movieno") + ". ");
        System.out.print(rs.getString("title") + ": ");
        System.out.print(rs.getString("actor") + " ");
        System.out.print(rs.getDouble("score") + " ");
        System.out.println(rs.getString("rdate").substring(0,10)); //getDate()�� �ڹٿ��� �����ϴ� ��¥ ���������� �� ������� ����
        System.out.println("---------------------------------");
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

  //��ü �޼ҵ� ����
  public void test() {
    this.read(1);
  }

  /**
   * ����<br>
   * <pre>
   * ��)
   * movieDAO.update(1, "������Ʈ ����(��ȭ, 1994)", 10.0, "�� ��ũ��");
   * </pre>
   * @param movieno ��ȭ��ȣ
   * @param title ��ȭ��/��󸶸�
   * @param score ����
   * @param actor �ֿ�
   */
  public void update(int movieno, String title, double score, String actor) {
    //��Ʈ��ũ ������ ����ó���� �ʼ�
    try {
      Class.forName(className); // memory�� Ŭ������ �ε���, ��ü�� �������� ����.
      con = DriverManager.getConnection(url, user, password ); // MySQL ����

      sql = new StringBuffer();
      //SQL�� �տ� �� ĭ ���� ����� + ; �����
      sql.append(" UPDATE movie");
      sql.append(" SET title = ?, score=?, actor=?");
      sql.append(" WHERE movieno = ?");

      //StringBuffer�� ���ڿ��� ��ȯ
      pstmt = con.prepareStatement(sql.toString());

      pstmt.setString(1, title);
      pstmt.setDouble(2, score);
      pstmt.setString(3, actor);
      pstmt.setInt(4, movieno);

      //pstmt ���ε� �Ŀ� ����
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE�� ����

      if(count == 1) {
        System.out.println("ó�� ����");
      } else {
        System.out.println("ó�� ����");
      }


    } catch (SQLException e) {
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace(); // ���ܰ� �߻��ϱ������ ���� ���� ���
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC ����̹��� �����ϴ�.");
      e.printStackTrace();
    } finally {
      //          try{ if (rs != null){ rs.close(); } }catch(Exception e){ }
      // ���� ���� ������� �ʰ� ���� ����
      try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
      try{ if (con != null){ con.close(); } }catch(Exception e){ }
    }

  }



  /**
   * ����<br>
   * <pre>
   * ��)
   * movieDAO.delete(10);
   * </pre>
   * @param movieno ��ȭ��ȣ
   */
  public void delete(int movieno) {
    try {
      Class.forName(className);
      con = DriverManager.getConnection(url, user, password );

      sql = new StringBuffer();
      sql.append(" DELETE FROM movie");
      sql.append(" WHERE movieno = ?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, movieno);
      
      count = pstmt.executeUpdate();

      if(count == 1) {
        System.out.println("ó�� ����");
      } else {
        System.out.println("ó�� ����");
      }
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
  }



    
    
    
    
    

}
