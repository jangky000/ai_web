package dev.mvc.cate;

import java.util.List;

public interface CateProcInter {

  /**
   * ���
   * @param cateVO
   * @return
   */
  public int create(CateVO cateVO);

  /**
   * ��� ������ ���
   * @return
   */
  public List<CateVO> list_seqno_asc();

  /**
   * ��ȸ, ������
   * @param categrpno ī�װ� �׷� ��ȣ, PK
   * @return
   */
  public CateVO read(int cateno);
  
  /**
   * ���� 
   * @param cateVO
   * @return
   */
  public int update(CateVO cateVO);

  /**
   * ���� ó��
   * @param cateno
   * @return
   */
  public int delete(int cateno);
  
  /**
   * �켱���� ����, up 10 �� 1
   * @param cateno
   * @return
   */
  public int update_seqno_up(int cateno);
  
  /**
   * �켱���� ����, up 10 �� 1
   * @param cateno
   * @return
   */
  public int update_seqno_down(int cateno);
  
  /**
   * ��� ����� ����
   * @param cateVO
   * @return
   */
  public int update_visible(CateVO cateVO);
  
}





