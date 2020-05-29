package dev.mvc.cate;

import java.util.List;

import dev.mvc.categrp.CategrpVO;

public interface CateDAOInter {

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
   * @param categrpno ī�װ��� �׷� ��ȣ, PK
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
  
  /**
   * <xmp>
   * ���� VO ��� join
   * <select id="list_join" resultType="Categrp_Cate_join">
   * </xmp>
   * @return
   */
  public List<Categrp_Cate_join> list_join();
  

  /**
   * <xmp>
   * categrpno �� cate ���: categrp + cate innner join, 1:��, ���� VO
   * <select id="list_join" resultType="Categrp_Cate_join" parameterType="int">
   * </xmp>
   * @param categrpno
   * @return
   */
  public List<Categrp_Cate_join> list_join_by_categrpno(int categrpno);
  
  /**
   * <xmp>
   * ��ü ī�װ��� ���
   * <resultMap type="Categrp_Cate_VO" id="Categrp_Cate_VO_Map">
   *                              ��                                                 ��
   *                        ������                                                 ����������
   *                        ��                     <select id="list_all" resultMap="Categrp_Cate_VO_Map">
   * public List<Categrp_Cate_VO> list_all();
   * id�� �ش��ϴ� Ÿ�� Categrp_Cate_VO�� ����Ʈ(�������̽�)�� ��ȯ
   * ��, �� ����: ȭ��ǥ
   * </xmp>
   * @return
   */
  public List<Categrp_Cate_VO> list_all();
  
  /**
   * <xmp>
   * categrpno ������ ���� �ش��ϴ� cate ��ϸ� ����
   * <resultMap type="Categrp_Cate_VO_list" id="Categrp_Cate_VO_list_Map">
   *                               ��                                               ��
   *                         ������                                               ����������������
   *                         ��    <select id="list_by_categrpno" resultMap="Categrp_Cate_VO_list_Map" 
   *                         ��                                               parameterType="int">
  *                          ��                     
   * public Categrp_Cate_VO list_by_categrpno();
   * </xmp>
   * @return
   */
  public Categrp_Cate_VO_list list_by_categrpno(int categrpno);
  

  /**
   * <xmp>
   * contents �߰��� ���� cate ���̺� �ۼ� ����
   * <update id="increaseCnt" parameterType="int">
   * </xmp>
   * @param cateno
   * @return
   */
  public int increaseCnt(int cateno);
  
  /**
   * <xmp>
   * contents �߰��� ���� cate ���̺� �ۼ� ����
   * <update id="decreaseCnt" parameterType="int">
   * </xmp>
   * @param cateno
   * @return
   */
  public int decreaseCnt(int cateno);
}







