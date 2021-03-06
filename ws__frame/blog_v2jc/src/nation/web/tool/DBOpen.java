package nation.web.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBOpen {
  public Connection getConnection() {
    Connection con = null;
    
    // MYSQL
    // String className = "org.gjt.mm.mysql.Driver"; // MySQL 연결 Driver 
    // String url = "jdbc:mysql://172.16.12.4:3306/javadb?useUnicode=true&characterEncoding=euckr"; //데이터베이스 javadb 사용

    //Oracle, jdbc 연결
    String className = "oracle.jdbc.driver.OracleDriver"; // Oracle 연결 Driver 
    
    String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"; //XE -> soldesk 등으로 달라질 수 있다.
    String user = "ai6"; 
    String password = "1234";
    
    try {
      Class.forName(className); //memory로 클래스 로딩
      con = DriverManager.getConnection(url, user, password ); // DBMS 연결
    } catch (ClassNotFoundException e) {
      // ClassNotFoundException // 구체적인 예외처리를 해주는 것이 좋음
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
