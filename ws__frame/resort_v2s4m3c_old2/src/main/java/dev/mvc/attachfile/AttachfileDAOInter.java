package dev.mvc.attachfile;

import java.util.List;

import dev.mvc.cate.CateVO;

public interface AttachfileDAOInter {
  
  /**
   * �Է�
   * @param attachfileVO
   * @return
   */
  public int create(AttachfileVO attachfileVO);

  /**
   * ��ü ���
   * @return List<AttachfileVO>
   */
  public List<AttachfileVO> list();
  
  /**
   * ��ȸ
   * @param attachfileno
   * @return
   */
  public AttachfileVO read(int attachfileno);

  /**
   * ���� ó��
   * @param attachfileno
   * @return
   */
  public int delete(int attachfileno);
}