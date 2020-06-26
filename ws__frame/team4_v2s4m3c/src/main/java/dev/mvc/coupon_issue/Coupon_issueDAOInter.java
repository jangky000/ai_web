package dev.mvc.coupon_issue;

import java.util.List;

public interface Coupon_issueDAOInter {
  
  /**
   * <xmp>
   *  ���� �߱� ���: �߱� ������ �Ѵ� �̳� ���
   * <insert id="create" parameterType="Coupon_issueVO">
   * <xmp>
   * @return
   */
  public int create(Coupon_issueVO coupon_issueVO);

  /**
   * <xmp>
   *  ���� �߱� ���
   * <select id="list" resultType="Coupon_issueVO">
   * <xmp>
   * @return
   */
  public List<Coupon_issueVO> list();

  /**
   * <xmp>
   *  ���� �߱� ��ȸ
   * <select id="read" resultType="Coupon_issueVO" parameterType="int">
   * <xmp>
   * @return
   */
  public Coupon_issueVO read(int coupon_issueno);

  /**
   * ����
   */

  /**
   * <xmp>
   *  ���� �߱� ����: ���� ��� ����, ���� ���� -- I: issue �߱�, U: used ���Ϸ�
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int coupon_issueno);

}
