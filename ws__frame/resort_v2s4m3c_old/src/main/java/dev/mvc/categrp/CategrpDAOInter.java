package dev.mvc.categrp;

import java.util.List;

// MyBATIS�� <mapper namespace="dev.mvc.categrp.CategrpDAOInter">�� ���� 
// ���̹�Ƽ���� ����
public interface CategrpDAOInter {
  // ���ۿ� ���� �޼ҵ���� MyBATIS�� XML ���Ͼ��� id�� �����ؾ��մϴ�.
  
  /**
   * ���
   * <xmp>
   * <insert id="create" parameterType="CategrpVO">
   * </xmp>
   * @param categrpVO
   * @return ��ϵ� ���ڵ� ����
   */
  public int create(CategrpVO categrpVO);
 
  /**
   * ���
   * <xmp>
   * <select id="list_categrpno_asc" resultType="CategrpVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<CategrpVO> list_categrpno_asc();
  // List�� ArrayList�� �������̽�
  
  /**
   * ���
   * <xmp>
   * <select id="list_seqno_asc" resultType="CategrpVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<CategrpVO> list_seqno_asc();
  // List�� ArrayList�� �������̽�
  
  /**
   * ��ȸ + ������(form �±�)
   * <xmp>
   *   <select id="read" resultType="CategrpVO" parameterType="int">
   * </xmp>  
   * @param categrpno
   * @return �� ���� ���ڵ�
   */
  public CategrpVO read(int categrpno);
 
  /**
   * ���� ó��
   * <xmp>
   *   <update id="update" parameterType="CategrpVO"> 
   * </xmp>
   * @param categrpVO
   * @return ó���� ���ڵ� ����
   */
  public int update(CategrpVO categrpVO);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="update" parameterType="int"> 
   * </xmp>
   * @param categrpno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int categrpno);
  
  /**
   * �켱���� ����, 10 �� 1
   * @param categrpno
   * @return ó���� ���ڵ� ����
   */
  public int update_seqno_up(int categrpno);
  
  /**
   * �켱���� ����, 1 �� 10
   * @param categrpno
   * @return ó���� ���ڵ� ����
   */
  public int update_seqno_down(int categrpno);
  
  /**
   * ��� ��� ����
   * @param categrpVO
   * @return
   */
  public int update_visible(CategrpVO categrpVO);
  
  
}