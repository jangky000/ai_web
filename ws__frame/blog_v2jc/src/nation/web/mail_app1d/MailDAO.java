package nation.web.mail_app1d;

//자바 소스 복사하면 import 자동으로 생성
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Out;

import nation.web.tool.DBClose;
import nation.web.tool.DBOpen;

public class MailDAO {
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
  public MailDAO() {
    this.dbopen = new DBOpen(); // 객체 생성
    this.dbclose = new DBClose();
  }
  
  public MailDAO(String my_ip) {
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
  public int create(MailVO noticeVO) {
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      //SQL문 앞에 한 칸 공백 만들기 + ' ; '지우기
      sql.append(" INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate, url1, url2, youtube, cnt)");
      sql.append(" VALUES (mail_seq.nextval, ?, ?, ?, ?, sysdate, ?, ?, ?, 0)"); // '?'는 ?값으로 판단, 문자열도 single quatation 없이 사용
      
      //StringBuffer를 문자열로 변환
      pstmt = con.prepareStatement(sql.toString());
      
      pstmt.setString(1, noticeVO.getTitle());
      pstmt.setString(2, noticeVO.getContent());
      pstmt.setString(3, noticeVO.getMail_from());
      pstmt.setString(4, noticeVO.getMail_to());
      pstmt.setString(5, noticeVO.getUrl1());
      pstmt.setString(6, noticeVO.getUrl2());
      pstmt.setString(7, noticeVO.getYoutube());
      
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
  public ArrayList<MailVO> list_receive(){
    ArrayList<MailVO> list = new ArrayList<MailVO>();
    
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" SELECT mailno, title, content, mail_from, mail_to, rdate, cnt");
      sql.append(" FROM mail_app"); 
      sql.append(" WHERE mail_to = ?"); 
      sql.append(" ORDER BY mailno DESC");
     
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, this.my_ip);
      rs = pstmt.executeQuery(); // SELECT문 실행: executeQuery() : return ResultSet 타입
      
      int n = 0;
      while(true) {
        if(rs.next() == true) {
          MailVO mailVO = new MailVO();
          
          mailVO.setMailno(rs.getInt("mailno"));
          mailVO.setTitle(rs.getString("title"));
          mailVO.setContent(rs.getString("content"));
          mailVO.setMail_from( rs.getString("mail_from"));
          mailVO.setMail_to( rs.getString("mail_to"));
          mailVO.setRdate(rs.getString("rdate"));
          mailVO.setCnt(rs.getInt("cnt"));
          
          list.add(mailVO);
        }
        else {
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
  
  public ArrayList<MailVO> list_send(){
    ArrayList<MailVO> list = new ArrayList<MailVO>();
    //NoticeVO vo = new NoticeVO();
    
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" SELECT mailno, title, content, mail_from, mail_to, rdate, cnt");
      sql.append(" FROM mail_app"); 
      sql.append(" WHERE mail_from = ?"); 
      sql.append(" ORDER BY mailno DESC");
     
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, this.my_ip);
      rs = pstmt.executeQuery(); // SELECT문 실행: executeQuery() : return ResultSet 타입
      
      int n = 0;
      while(true) {
        if(rs.next() == true) {
          MailVO mailVO = new MailVO();
          
          mailVO.setMailno(rs.getInt("mailno"));
          mailVO.setTitle(rs.getString("title"));
          mailVO.setContent(rs.getString("content"));
          mailVO.setMail_from( rs.getString("mail_from"));
          mailVO.setMail_to( rs.getString("mail_to"));
          mailVO.setRdate(rs.getString("rdate"));
          mailVO.setCnt(rs.getInt("cnt"));
          
          list.add(mailVO);
        }
        else {
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
  
  /**
   * 1건의 레코드 조회
   * @param noticeno 레코드 번호 PK
   * @return 1건의 레코드(NoticeVO)
   */
  public MailVO read(int mailno) {
    MailVO mailVO = null;
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" SELECT mailno, title, content, mail_from, mail_to, rdate, url1, url2, youtube, cnt");
      sql.append(" FROM mail_app");
      sql.append(" WHERE mailno = ?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, mailno);
      
      rs = pstmt.executeQuery(); // SELECT문 실행: executeQuery() : return ResultSet 타입
      
      if(rs.next() == true) {
        //레코드가 있을 때만 객체를 만드는 것이 더 좋다.
        mailVO = new MailVO();
        
        mailVO.setMailno(rs.getInt("mailno"));
        mailVO.setTitle(rs.getString("title"));
        mailVO.setContent(rs.getString("content"));
        mailVO.setMail_from( rs.getString("mail_from"));
        mailVO.setMail_to( rs.getString("mail_to"));
        mailVO.setRdate(rs.getString("rdate"));
        mailVO.setUrl1(rs.getString("url1"));
        mailVO.setUrl2(rs.getString("url2"));
        mailVO.setYoutube(rs.getString("youtube"));
        mailVO.setCnt(rs.getInt("cnt"));
      }

    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace();
    } finally {
      this.dbclose.close(rs, con, pstmt);
    }
    
    return mailVO;
  }
  
  /**
   * 패스워드 검사
   * @param noticeno PK
   * @param passwd 패스워드
   * @return true 패스워드 일치
   */
  /*public boolean passwdCheck(int mailno, String passwd) {
    boolean sw = false; // sw는 switch의 약자?
    
    try {
      con = this.dbopen.getConnection();

      // 패스워드 검사
      sql = new StringBuffer();
      //SQL문 앞에 한 칸 공백 만들기 + ' ; '지우기
      sql.append(" SELECT COUNT(*) AS passwd_cnt");
      sql.append(" FROM notice"); 
      sql.append(" WHERE noticeno=? AND passwd=?"); 

      //StringBuffer를 문자열로 변환
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, noticeno);
      pstmt.setString(2, passwd);

      rs = pstmt.executeQuery();
      rs.next(); // 첫번째 레코드로 이동

      if(rs.getInt("passwd_cnt") == 1){ // 패스워드 일치
        sw = true;
      } else {
        sw = false;
      }
    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace(); // 예외가 발생하기까지의 실행 과정 출력
    } finally {
      this.dbclose.close(con, pstmt);
    }
    
    return sw;
  }
  */
  /**
   * 수정
   * @param noticeVO 수정할 내용
   * @return 수정된 레코드 개수 0 or 1
   */
  public int update( MailVO mailVO ) {
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" UPDATE mail_app");
      sql.append(" SET title=?, content=?, url1=?, url2=?, youtube=?"); 
      sql.append(" WHERE mailno=?");           
      //StringBuffer를 문자열로 변환
      pstmt = con.prepareStatement(sql.toString());
      
      pstmt.setString(1, mailVO.getTitle());
      pstmt.setString(2, mailVO.getContent());
      pstmt.setString(3, mailVO.getUrl1());
      pstmt.setString(4, mailVO.getUrl2());
      pstmt.setString(5, mailVO.getYoutube());
      pstmt.setInt(6, mailVO.getMailno());
      
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE를 실행
      
    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace(); // 예외가 발생하기까지의 실행 과정 출력
    } finally {
      this.dbclose.close(con, pstmt);
    }
    return count;
  }
  /**
   * 삭제
   * @param noticeno 삭제할 PK
   * @return 삭제된 레코드 개수
   */
  public int delete(int mailno) {
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" DELETE FROM mail_app");
      sql.append(" WHERE mailno=?");           
      //StringBuffer를 문자열로 변환
      pstmt = con.prepareStatement(sql.toString());
      
      pstmt.setInt(1, mailno);
      
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE를 실행
      
    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace(); // 예외가 발생하기까지의 실행 과정 출력
    } finally {
      this.dbclose.close(con, pstmt);
    }
    return count;
  }
  
  public int cnt_update(int mailno) {
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" UPDATE mail_app");
      sql.append(" SET cnt=cnt+1");
      sql.append(" WHERE mailno=?");           
      //StringBuffer를 문자열로 변환
      pstmt = con.prepareStatement(sql.toString());

      pstmt.setInt(1, mailno);

      
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE를 실행
      
    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace(); // 예외가 발생하기까지의 실행 과정 출력
    } finally {
      this.dbclose.close(con, pstmt);
    }
    return count;
  }
  
  
}
