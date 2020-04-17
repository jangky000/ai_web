package nation.web.notice1c;

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
  
  // �⺻ ������
  public NoticeDAO() {
    this.dbopen = new DBOpen(); // ��ü ����
    this.dbclose = new DBClose();
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
      sql.append(" INSERT INTO notice(noticeno, title, content, rname, passwd, rdate )");
      sql.append(" VALUES (notice_seq.nextval, ?, ?, ?, ?, sysdate)"); // '?'�� ?������ �Ǵ�, ���ڿ��� single quatation ���� ���
      
      //StringBuffer�� ���ڿ��� ��ȯ
      pstmt = con.prepareStatement(sql.toString());
      
      pstmt.setString(1, noticeVO.getTitle());
      pstmt.setString(2, noticeVO.getContent());
      pstmt.setString(3, noticeVO.getRname());
      pstmt.setString(4, noticeVO.getPasswd());
      
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
   * ���
   * @return VO ���(ArrayList<NoticeVO>)
   */
  // ����� ArrayList�� ����Ͽ� ����
  public ArrayList<NoticeVO> list(){
    ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
    //NoticeVO vo = new NoticeVO();
    
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" SELECT noticeno, title, content, rname, passwd, rdate");
      sql.append(" FROM notice"); 
      sql.append(" ORDER BY noticeno DESC");
     
      pstmt = con.prepareStatement(sql.toString());
      
      rs = pstmt.executeQuery(); // SELECT�� ����: executeQuery() : return ResultSet Ÿ��
      
      int n = 0;
      while(true) {
        if(rs.next() == true) {
          NoticeVO noticeVO = new NoticeVO();
          
          noticeVO.setNoticeno(rs.getInt("noticeno"));
          noticeVO.setTitle(rs.getString("title"));
          noticeVO.setContent(rs.getString("content"));
          noticeVO.setRname( rs.getString("rname"));
          noticeVO.setPasswd( rs.getString("passwd"));
          noticeVO.setRdate(rs.getString("rdate"));
          
          list.add(noticeVO);
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
  public NoticeVO read(int noticeno) {
    NoticeVO noticeVO = null;
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" SELECT noticeno, title, content, rname, passwd, rdate");
      sql.append(" FROM notice"); 
      sql.append(" WHERE noticeno=?");
     
      pstmt = con.prepareStatement(sql.toString());
      
      pstmt.setInt(1, noticeno);
      
      rs = pstmt.executeQuery(); // SELECT�� ����: executeQuery() : return ResultSet Ÿ��
      
      if(rs.next() == true) {
        //���ڵ尡 ���� ���� ��ü�� ����� ���� �� ����.
        noticeVO = new NoticeVO();
        
        noticeVO.setNoticeno(rs.getInt("noticeno"));
        noticeVO.setTitle(rs.getString("title"));
        noticeVO.setContent(rs.getString("content"));
        noticeVO.setRname( rs.getString("rname"));
        noticeVO.setPasswd( rs.getString("passwd"));
        noticeVO.setRdate(rs.getString("rdate"));
      }

    } catch (SQLException e) {
      System.out.println("SQL ���� �� ���� �߻�");
      e.printStackTrace();
    } finally {
      this.dbclose.close(rs, con, pstmt);
    }
    
    return noticeVO;
  }
  
  /**
   * �н����� �˻�
   * @param noticeno PK
   * @param passwd �н�����
   * @return true �н����� ��ġ
   */
  public boolean passwdCheck(int noticeno, String passwd) {
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
  
  /**
   * ����
   * @param noticeVO ������ ����
   * @return ������ ���ڵ� ���� 0 or 1
   */
  public int update( NoticeVO noticeVO ) {
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" UPDATE notice");
      sql.append(" SET title=?, content=?, rname=?"); 
      sql.append(" WHERE noticeno=?"); 
      
      //StringBuffer�� ���ڿ��� ��ȯ
      pstmt = con.prepareStatement(sql.toString());
      
      pstmt.setString(1, noticeVO.getTitle());
      pstmt.setString(2, noticeVO.getContent());
      pstmt.setString(3, noticeVO.getRname());
      pstmt.setInt(4, noticeVO.getNoticeno());
      
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
  public int delete(int noticeno) {
    try {
      con = this.dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" DELETE FROM notice");
      sql.append(" WHERE noticeno=?");

      //StringBuffer�� ���ڿ��� ��ȯ
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, noticeno);
      
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