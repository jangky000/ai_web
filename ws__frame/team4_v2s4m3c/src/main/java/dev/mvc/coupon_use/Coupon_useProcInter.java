package dev.mvc.coupon_use;

import java.util.List;

public interface Coupon_useProcInter {
  /**
   * <xmp>
   *  ���� ��� ���
   * <insert id="create" parameterType="Coupon_useVO">
   * <xmp>
   * @return
   */
  public int create(Coupon_useVO coupon_useVO);

  /**
   * <xmp>
   *  ���� ��� ���
   * <select id="list" resultType="Coupon_useVO">
   * <xmp>
   * @return
   */
  public List<Coupon_useVO> list();

  /**
   * <xmp>
   *  ���� ��� ��ȸ
   * <select id="read" resultType="Coupon_useVO" parameterType="int">
   * <xmp>
   * @return
   */
  public Coupon_useVO read(int coupon_useno);

  /**
   * ����
   */

  /**
   * <xmp>
   *  ���� ��� ����: ���� ��� ����, ���º��� -- ���:U, ���:C
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int coupon_useno);
}
