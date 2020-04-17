package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MovieDAO {
  //DBMS 개발시 반복적으로 사용되는 공통 소스
  //MyBatis와  JPA에서는 자동화 되어 있음
  //import 중 com.mysql.jdbc가 아닌 'java.sql'을 import
  Connection con = null;              // DBMS 연결
  PreparedStatement pstmt = null; // SQL 실행
  ResultSet rs = null;                   // SELECT 결과를 저장
  StringBuffer sql = null;              // SQL 문장
  int count = 0;                         // 처리된 레코드 갯수

  String className = "org.gjt.mm.mysql.Driver"; // MySQL 연결 Driver 
  //데이터베이스 javadb 사용
  String url = "jdbc:mysql://localhost:3306/javadb?useUnicode=true&characterEncoding=euckr"; 
  String user = "root"; 
  String password = "1234";
  
  //create 메소드
  public void create() {
    //네트워크 설정에 예외처리가 필수
    try {
      Class.forName(className); // memory로 클래스를 로딩함, 객체는 생성하지 않음.
      con = DriverManager.getConnection(url, user, password ); // MySQL 연결
      
      sql = new StringBuffer();
      //SQL문 앞에 한 칸 공백 만들기 + ; 지우기, append는 return을 따로 하지 않는다.
      sql.append(" INSERT INTO  movie(title, score, actor, rdate)");
      sql.append(" VALUES('김씨네 편의점(드라마, 2016)', 9.9, '이선형', NOW())");
      
      //StringBuffer를 문자열로 변환
      pstmt = con.prepareStatement(sql.toString());
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE를 실행
      
      if(count == 1) {
        System.out.println("처리 성공");
      } else {
        System.out.println("처리 실패");
      }
      
      
    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace(); // 예외가 발생하기까지의 실행 과정 출력
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC 드라이버가 없습니다.");
      e.printStackTrace();
    } finally {
//      try{ if (rs != null){ rs.close(); } }catch(Exception e){ }
      // 따로 에러 출력하지 않고 연결 종료
      try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
      try{ if (con != null){ con.close(); } }catch(Exception e){ }
    }
    

  }

  /**
   * 등록<br>
   * <pre>
   * 예)
   * movieDAO.create("월터의 상상은 현실이 된다(영화, 2018)", 7.9, "벤 스틸러");
   * </pre>
   * @param title 영화명/드라마명
   * @param score 평점
   * @param actor 주연
   */
  public void create(String title, double score, String actor) {
    //네트워크 설정에 예외처리가 필수
    try {
      Class.forName(className); // memory로 클래스를 로딩함, 객체는 생성하지 않음.
      con = DriverManager.getConnection(url, user, password ); // MySQL 연결
      
      sql = new StringBuffer();
      //SQL문 앞에 한 칸 공백 만들기 + ; 지우기
      sql.append(" INSERT INTO  movie(title, score, actor, rdate)");
      sql.append(" VALUES(?, ?, ?, NOW())"); // '?'는 ?값으로 판단, 문자열도 single quatation 없이 사용
      
      //StringBuffer를 문자열로 변환
      pstmt = con.prepareStatement(sql.toString());
      
      pstmt.setString(1, title);
      pstmt.setDouble(2, score);
      pstmt.setString(3, actor);
      
      //pstmt 바인딩 후에 실행
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE를 실행
      
      if(count == 1) {
        System.out.println("처리 성공");
      } else {
        System.out.println("처리 실패");
      }
      
      
    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace(); // 예외가 발생하기까지의 실행 과정 출력
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC 드라이버가 없습니다.");
      e.printStackTrace();
    } finally {
//      try{ if (rs != null){ rs.close(); } }catch(Exception e){ }
      // 따로 에러 출력하지 않고 연결 종료
      try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
      try{ if (con != null){ con.close(); } }catch(Exception e){ }
    }
   
  }
  
  /**
   * 전체 목록
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
      
      rs = pstmt.executeQuery(); // SELECT문 실행: executeQuery() : return ResultSet 타입
      
      while(true) {
        if(rs.next() == true) { // 첫번째 레코드 -> 마지막 레코드로 이동
          //1. 배틀스타 갤럭티카(미드, 2004): 제이미 밤버 9.9 2018-08-28
          System.out.print(rs.getInt("movieno") + ". ");
          System.out.print(rs.getString("title") + ": ");
          System.out.print(rs.getString("actor") + " ");
          System.out.print(rs.getDouble("score") + " ");
          System.out.println(rs.getString("rdate").substring(0,10)); //getDate()는 자바에서 지원하는 날짜 형식이지만 잘 사용하지 않음
          System.out.println("---------------------------------");
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

  /**
   * 조회
   * @param movieno 영화 번호
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
      rs = pstmt.executeQuery(); // SELECT문 실행: executeQuery() : return ResultSet 타입


      if(rs.next() == true) { // 첫번째 레코드 -> 마지막 레코드로 이동
        //1. 배틀스타 갤럭티카(미드, 2004): 제이미 밤버 9.9 2018-08-28
        System.out.print(rs.getInt("movieno") + ". ");
        System.out.print(rs.getString("title") + ": ");
        System.out.print(rs.getString("actor") + " ");
        System.out.print(rs.getDouble("score") + " ");
        System.out.println(rs.getString("rdate").substring(0,10)); //getDate()는 자바에서 지원하는 날짜 형식이지만 잘 사용하지 않음
        System.out.println("---------------------------------");
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

  //자체 메소드 실행
  public void test() {
    this.read(1);
  }

  /**
   * 수정<br>
   * <pre>
   * 예)
   * movieDAO.update(1, "포레스트 검프(영화, 1994)", 10.0, "톰 행크스");
   * </pre>
   * @param movieno 영화번호
   * @param title 영화명/드라마명
   * @param score 평점
   * @param actor 주연
   */
  public void update(int movieno, String title, double score, String actor) {
    //네트워크 설정에 예외처리가 필수
    try {
      Class.forName(className); // memory로 클래스를 로딩함, 객체는 생성하지 않음.
      con = DriverManager.getConnection(url, user, password ); // MySQL 연결

      sql = new StringBuffer();
      //SQL문 앞에 한 칸 공백 만들기 + ; 지우기
      sql.append(" UPDATE movie");
      sql.append(" SET title = ?, score=?, actor=?");
      sql.append(" WHERE movieno = ?");

      //StringBuffer를 문자열로 변환
      pstmt = con.prepareStatement(sql.toString());

      pstmt.setString(1, title);
      pstmt.setDouble(2, score);
      pstmt.setString(3, actor);
      pstmt.setInt(4, movieno);

      //pstmt 바인딩 후에 실행
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE를 실행

      if(count == 1) {
        System.out.println("처리 성공");
      } else {
        System.out.println("처리 실패");
      }


    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace(); // 예외가 발생하기까지의 실행 과정 출력
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC 드라이버가 없습니다.");
      e.printStackTrace();
    } finally {
      //          try{ if (rs != null){ rs.close(); } }catch(Exception e){ }
      // 따로 에러 출력하지 않고 연결 종료
      try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
      try{ if (con != null){ con.close(); } }catch(Exception e){ }
    }

  }



  /**
   * 삭제<br>
   * <pre>
   * 예)
   * movieDAO.delete(10);
   * </pre>
   * @param movieno 영화번호
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
        System.out.println("처리 성공");
      } else {
        System.out.println("처리 실패");
      }
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
  }



    
    
    
    
    

}
