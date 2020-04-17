package nation.web.mail_app1c;

//�ڹ� �ҽ� �����ϸ� import �ڵ����� ����
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Out;

import nation.web.tool.DBClose;
import nation.web.tool.DBOpen;

public class MailDAO {
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
  public MailDAO() {
    this.dbopen = new DBOpen(); // ��ü ����
    this.dbclose = new DBClose();
  }
  
  public MailDAO(String my_ip) {
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
  public int create(MailVO noticeVO) {
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      //SQL�� �տ� �� ĭ ���� ����� + ' ; '�����
      sql.append(" INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate, url1, url2, youtube, cnt)");
      sql.append(" VALUES (mail_seq.nextval, ?, ?, ?, ?, sysdate, ?, ?, ?, 0)"); // '?'�� ?������ �Ǵ�, ���ڿ��� single quatation ���� ���
      
      //StringBuffer�� ���ڿ��� ��ȯ
      pstmt = con.prepareStatement(sql.toString());
      
      pstmt.setString(1, noticeVO.getTitle());
      pstmt.setString(2, noticeVO.getContent());
      pstmt.setString(3, noticeVO.getMail_from());
      pstmt.setString(4, noticeVO.getMail_to());
      pstmt.setString(5, noticeVO.getUrl1());
      pstmt.setString(6, noticeVO.getUrl2());
      pstmt.setString(7, noticeVO.getYoutube());
      
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
      rs = pstmt.executeQuery(); // SELECT�� ����: executeQuery() : return ResultSet Ÿ��
      
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
      System.out.println("SQL ���� �� ���� �߻�");
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
      rs = pstmt.executeQuery(); // SELECT�� ����: executeQuery() : return ResultSet Ÿ��
      
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
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace();
    } finally {
      this.dbclose.close(rs, con, pstmt);
    }
    
    return list;
  }
  
  /**
   * 1���� ���ڵ� ��ȸ
   * @param noticeno ���ڵ� ��ȣ PK
   * @return 1���� ���ڵ�(NoticeVO)
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
      
      rs = pstmt.executeQuery(); // SELECT�� ����: executeQuery() : return ResultSet Ÿ��
      
      if(rs.next() == true) {
        //���ڵ尡 ���� ���� ��ü�� ����� ���� �� ����.
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
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace();
    } finally {
      this.dbclose.close(rs, con, pstmt);
    }
    
    return mailVO;
  }
  
  /**
   * �н����� �˻�
   * @param noticeno PK
   * @param passwd �н�����
   * @return true �н����� ��ġ
   */
  /*public boolean passwdCheck(int mailno, String passwd) {
    boolean sw = false; // sw�� switch�� ����?
    
    try {
      con = this.dbopen.getConnection();

      // �н����� �˻�
      sql = new StringBuffer();
      //SQL�� �տ� �� ĭ ���� ����� + ' ; '�����
      sql.append(" SELECT COUNT(*) AS passwd_cnt");
      sql.append(" FROM notice"); 
      sql.append(" WHERE noticeno=? AND passwd=?"); 

      //StringBuffer�� ���ڿ��� ��ȯ
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, noticeno);
      pstmt.setString(2, passwd);

      rs = pstmt.executeQuery();
      rs.next(); // ù��° ���ڵ�� �̵�

      if(rs.getInt("passwd_cnt") == 1){ // �н����� ��ġ
        sw = true;
      } else {
        sw = false;
      }
    } catch (SQLException e) {
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace(); // ���ܰ� �߻��ϱ������ ���� ���� ���
    } finally {
      this.dbclose.close(con, pstmt);
    }
    
    return sw;
  }
  */
  /**
   * ����
   * @param noticeVO ������ ����
   * @return ������ ���ڵ� ���� 0 or 1
   */
  public int update( MailVO mailVO ) {
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" UPDATE mail_app");
      sql.append(" SET title=?, content=?, url1=?, url2=?, youtube=?"); 
      sql.append(" WHERE mailno=?");           
      //StringBuffer�� ���ڿ��� ��ȯ
      pstmt = con.prepareStatement(sql.toString());
      
      pstmt.setString(1, mailVO.getTitle());
      pstmt.setString(2, mailVO.getContent());
      pstmt.setString(3, mailVO.getUrl1());
      pstmt.setString(4, mailVO.getUrl2());
      pstmt.setString(5, mailVO.getYoutube());
      pstmt.setInt(6, mailVO.getMailno());
      
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE�� ����
      
    } catch (SQLException e) {
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace(); // ���ܰ� �߻��ϱ������ ���� ���� ���
    } finally {
      this.dbclose.close(con, pstmt);
    }
    return count;
  }
  /**
   * ����
   * @param noticeno ������ PK
   * @return ������ ���ڵ� ����
   */
  public int delete(int mailno) {
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" DELETE FROM mail_app");
      sql.append(" WHERE mailno=?");           
      //StringBuffer�� ���ڿ��� ��ȯ
      pstmt = con.prepareStatement(sql.toString());
      
      pstmt.setInt(1, mailno);
      
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE�� ����
      
    } catch (SQLException e) {
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace(); // ���ܰ� �߻��ϱ������ ���� ���� ���
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
      //StringBuffer�� ���ڿ��� ��ȯ
      pstmt = con.prepareStatement(sql.toString());

      pstmt.setInt(1, mailno);

      
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE�� ����
      
    } catch (SQLException e) {
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace(); // ���ܰ� �߻��ϱ������ ���� ���� ���
    } finally {
      this.dbclose.close(con, pstmt);
    }
    return count;
  }
  
  
}