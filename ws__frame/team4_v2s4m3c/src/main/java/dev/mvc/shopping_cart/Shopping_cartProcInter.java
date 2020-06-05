package dev.mvc.shopping_cart;

import java.util.List;

public interface Shopping_cartProcInter {
  
  /**
   * <xmp>
   * ��ٱ��� ���
   * <insert id="create" parameterType="Shopping_cartVO">
   * <xmp>
   * @return
   */
  public int create(Shopping_cartVO shopping_cartVO);

  /**
   * <xmp>
   * ��ٱ��� ���
   * <select id="list" resultType="Shopping_cartVO">
   * <xmp>
   * @return
   */
  public List<Shopping_cartVO> list();

  /**
   * <xmp>
   * ��ٱ��� ��ȸ
   * <select id="read" resultType="Shopping_cartVO" parameterType="int">
   * <xmp>
   * @return
   */
  public Shopping_cartVO read(int shopping_cartno);

  /**
   * <xmp>
   * ��ٱ��� ��ǰ ���� ����
   * <update id="quantity_up" parameterType="int">
   * <xmp>
   * @return
   */
  public int quantity_up(int shopping_cartno);
  
  /**
   * <xmp>
   * ��ٱ��� ��ǰ ���� ����
   * <update id="quantity_down" parameterType="int">
   * <xmp>
   * @return
   */
  public int quantity_down(int shopping_cartno);
  
  /**
   * <xmp>
   * ��ٱ��� ����
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int shopping_cartno);
}
