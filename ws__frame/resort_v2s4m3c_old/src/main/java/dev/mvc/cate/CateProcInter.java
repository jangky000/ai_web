package dev.mvc.cate;

import java.util.List;

public interface CateProcInter {
  /**
   * ī�װ��� �Է�
   * @param cateVO
   * @return �Է� ���ڵ� ����
   */
  public int create(CateVO cateVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list_cateno_asc" resultType="CateVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<CateVO> list_seqno_asc();
  
  /**
   * ��ȸ + ������(form �±�)
   * <xmp>
   *   <select id="read" resultType="CateVO" parameterType="int">
   * </xmp>  
   * @param cateno
   * @return �� ���� ���ڵ�
   */
  public CateVO read(int cateno);
 
  /**
   * ���� ó��
   * <xmp>
   *   <update id="update" parameterType="CateVO"> 
   * </xmp>
   * @param cateVO
   * @return ó���� ���ڵ� ����
   */
  public int update(CateVO cateVO);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="update" parameterType="int"> 
   * </xmp>
   * @param cateno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int cateno);
  
  /**
   * �켱���� ����, 10 �� 1
   * @param cateno
   * @return ó���� ���ڵ� ����
   */
  public int update_seqno_up(int cateno);
  
  /**
   * �켱���� ����, 1 �� 10
   * @param cateno
   * @return ó���� ���ڵ� ����
   */
  public int update_seqno_down(int cateno);
  
  /**
   * ��� ��� ����
   * @param cateVO
   * @return
   */
  public int update_visible(CateVO cateVO);
}