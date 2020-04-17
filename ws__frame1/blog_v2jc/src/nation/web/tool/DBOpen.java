package nation.web.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBOpen {
  public Connection getConnection() {
    Connection con = null;
    
    // MYSQL
    // String className = "org.gjt.mm.mysql.Driver"; // MySQL ���� Driver 
    // String url = "jdbc:mysql://172.16.12.4:3306/javadb?useUnicode=true&characterEncoding=euckr"; //�����ͺ��̽� javadb ���

    //Oracle, jdbc ����
    String className = "oracle.jdbc.driver.OracleDriver"; // Oracle ���� Driver 
    
    String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"; //XE -> soldesk ������ �޶��� �� �ִ�.
    String user = "ai6"; 
    String password = "1234";
    
    try {
      Class.forName(className); //memory�� Ŭ���� �ε�
      con = DriverManager.getConnection(url, user, password ); // DBMS ����
    } catch (ClassNotFoundException e) {
      // ClassNotFoundException // ��ü���� ����ó���� ���ִ� ���� ����
      e.printStackTrace();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return con;
  }
  
//  public static void main(String[] args) {
//    DBOpen dbopen = new DBOpen();
//    Connection con = dbopen.getConnection();
//    System.out.println(con.hashCode());
//
//  }
  
}