package nation.web.mail_app1b;

//�ڹ� �ҽ� �����ϸ� import �ڵ����� ����
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import nation.web.tool.DBClose;
import nation.web.tool.DBOpen;

public class NoticeDAO {
  Connection con = null;              // DBMS ����
  PreparedStatement pstmt = null; // SQL ����
  ResultSet rs = null;                   // SELECT ����� ����
  StringBuffer sql = null;              // SQL ����
  int count = 0;                         // ó���� ���ڵ� ����
  
  // �ʵ� ����
  DBOpen dbopen = null;
  DBClose dbclose = null;
  
  //ip
  String my_ip = null;
  
  // �⺻ ������
  public NoticeDAO() {
    this.dbopen = new DBOpen(); // ��ü ����
    this.dbclose = new DBClose();
  }
  
  public NoticeDAO(String my_ip) {
    this.dbopen = new DBOpen(); // ��ü ����
    this.dbclose = new DBClose();
    this.my_ip = my_ip;
  }
  
  /**
   * ���
   * @param noticeVO
   * @return ��ϵ� ���ڵ� ����
   */
  //call by reference�� �ѹ��� ���� ������ ����
  public int create(NoticeVO noticeVO) {
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      //SQL�� �տ� �� ĭ ���� ����� + ' ; '�����
      sql.append(" INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate )");
      sql.append(" VALUES (mail_seq.nextval, ?, ?, ?, ?, sysdate)"); // '?'�� ?������ �Ǵ�, ���ڿ��� single quatation ���� ���
      
      //StringBuffer�� ���ڿ��� ��ȯ
      pstmt = con.prepareStatement(sql.toString());
      
      pstmt.setString(1, noticeVO.getTitle());
      pstmt.setString(2, noticeVO.getContent());
      pstmt.setString(3, noticeVO.getMail_from());
      pstmt.setString(4, noticeVO.getMail_to());
      
      //pstmt ���ε� �Ŀ� ����
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE�� ����
      
    } catch (SQLException e) {
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace(); // ���ܰ� �߻��ϱ������ ���� ���� ���
    } finally {
      this.dbclose.close(con, pstmt);
    }
    return count;
  }
  
  // ����� ArrayList�� ����Ͽ� ����
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
      rs = pstmt.executeQuery(); // SELECT�� ����: executeQuery() : return ResultSet Ÿ��
      
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
      System.out.println("SQL ���� �� ���� �߻�");
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
      rs = pstmt.executeQuery(); // SELECT�� ����: executeQuery() : return ResultSet Ÿ��
      
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
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace();
    } finally {
      this.dbclose.close(rs, con, pstmt);
    }
    
    return list;
  }
  
}