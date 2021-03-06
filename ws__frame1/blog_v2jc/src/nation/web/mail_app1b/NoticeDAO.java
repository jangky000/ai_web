package nation.web.mail_app1b;

//자바 소스 복사하면 import 자동으로 생성
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import nation.web.tool.DBClose;
import nation.web.tool.DBOpen;

public class NoticeDAO {
  Connection con = null;              // DBMS 연결
  PreparedStatement pstmt = null; // SQL 실행
  ResultSet rs = null;                   // SELECT 결과를 저장
  StringBuffer sql = null;              // SQL 문장
  int count = 0;                         // 처리된 레코드 갯수
  
  // 필드 선언만
  DBOpen dbopen = null;
  DBClose dbclose = null;
  
  //ip
  String my_ip = null;
  
  // 기본 생성자
  public NoticeDAO() {
    this.dbopen = new DBOpen(); // 객체 생성
    this.dbclose = new DBClose();
  }
  
  public NoticeDAO(String my_ip) {
    this.dbopen = new DBOpen(); // 객체 생성
    this.dbclose = new DBClose();
    this.my_ip = my_ip;
  }
  
  /**
   * 등록
   * @param noticeVO
   * @return 등록된 레코드 개수
   */
  //call by reference로 한번에 여러 정보를 받음
  public int create(NoticeVO noticeVO) {
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      //SQL문 앞에 한 칸 공백 만들기 + ' ; '지우기
      sql.append(" INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate )");
      sql.append(" VALUES (mail_seq.nextval, ?, ?, ?, ?, sysdate)"); // '?'는 ?값으로 판단, 문자열도 single quatation 없이 사용
      
      //StringBuffer를 문자열로 변환
      pstmt = con.prepareStatement(sql.toString());
      
      pstmt.setString(1, noticeVO.getTitle());
      pstmt.setString(2, noticeVO.getContent());
      pstmt.setString(3, noticeVO.getMail_from());
      pstmt.setString(4, noticeVO.getMail_to());
      
      //pstmt 바인딩 후에 실행
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE를 실행
      
    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace(); // 예외가 발생하기까지의 실행 과정 출력
    } finally {
      this.dbclose.close(con, pstmt);
    }
    return count;
  }
  
  // 목록은 ArrayList를 사용하여 개발
  public ArrayList<NoticeVO> list_receive(){
    ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
    //NoticeVO vo = new NoticeVO();
    
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" SELECT mailno, title, content, mail_from, mail_to, rdate");
      sql.append(" FROM mail_app"); 
      sql.append(" WHERE mail_to = ?"); 
      sql.append(" ORDER BY mailno DESC");
     
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, this.my_ip);
      rs = pstmt.executeQuery(); // SELECT문 실행: executeQuery() : return ResultSet 타입
      
      int n = 0;
      while(true) {
        if(rs.next() == true) {
          NoticeVO noticeVO = new NoticeVO();
          
          noticeVO.setMailno(rs.getInt("mailno"));
          noticeVO.setTitle(rs.getString("title"));
          noticeVO.setContent(rs.getString("content"));
          noticeVO.setMail_from( rs.getString("mail_from"));
          noticeVO.setMail_to( rs.getString("mail_to"));
          noticeVO.setRdate(rs.getString("rdate"));
          
          list.add(noticeVO);
        }
        else {
          //System.out.println(rs.getInt("mailno"));
          break;
        }
      }
      
    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace();
    } finally {
      this.dbclose.close(rs, con, pstmt);
    }
    
    return list;
  }
  
  public ArrayList<NoticeVO> list_send(){
    ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
    //NoticeVO vo = new NoticeVO();
    
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" SELECT mailno, title, content, mail_from, mail_to, rdate");
      sql.append(" FROM mail_app"); 
      sql.append(" WHERE mail_from = ?"); 
      sql.append(" ORDER BY mailno DESC");
     
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, this.my_ip);
      rs = pstmt.executeQuery(); // SELECT문 실행: executeQuery() : return ResultSet 타입
      
      int n = 0;
      while(true) {
        if(rs.next() == true) {
          NoticeVO noticeVO = new NoticeVO();
          
          noticeVO.setMailno(rs.getInt("mailno"));
          noticeVO.setTitle(rs.getString("title"));
          noticeVO.setContent(rs.getString("content"));
          noticeVO.setMail_from( rs.getString("mail_from"));
          noticeVO.setMail_to( rs.getString("mail_to"));
          noticeVO.setRdate(rs.getString("rdate"));
          
          list.add(noticeVO);
        }
        else {
          //System.out.println(rs.getInt("mailno"));
          break;
        }
      }
      
    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace();
    } finally {
      this.dbclose.close(rs, con, pstmt);
    }
    
    return list;
  }
  
}
