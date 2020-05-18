package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

public interface ContentsDAOInter {
  /**
   * ��� ó��
   * @param contentsVO
   * @return
   */
  public int create(ContentsVO contentsVO);
  
  /**
   * ��ü ��� 
   * @return
   */
  public List<ContentsVO> list_all();

  /**
   * <xmp>
   * cateno�� ���
   * <select id="list" resultType="ContentsVO" parameterType="int">
   * </xmp>
   * @param cateno
   * @return
   */
  public List<ContentsVO> list(int cateno);
  
  /**
   * ��ȸ
   * @param contentsno
   * @return
   */
  public ContentsVO read(int contentsno);
  
  /**
   * ���� ó��
   * @param contentsVO
   * @return
   */
  public int update(ContentsVO contentsVO);

  /**
   * �н����� �˻�
   * @param map
   * @return ��ġ �� 1
   */
  public int passwd_check(HashMap hashMap);
  
  /**
   * ����
   * @param contentsno
   * @return
   */
  public int delete(int contentsno);
  
  /**
   * <xmp>
   * ��ü �Խñ� ����
   * <select id="total_count" resultType="int">
   * </xmp>
   * @return
   */
  public int total_count();
}




