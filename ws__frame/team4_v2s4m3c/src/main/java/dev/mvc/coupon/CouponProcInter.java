package dev.mvc.coupon;

import java.util.List;

public interface CouponProcInter {
  
  /**
   * <xmp>
   *  쿠폰 등록
   * <insert id="create" parameterType="CouponVO">
   * <xmp>
   * @return
   */
  public int create(CouponVO couponVO);

  /**
   * <xmp>
   *  쿠폰 목록
   * <select id="list" resultType="CouponVO">
   * <xmp>
   * @return
   */
  public List<CouponVO> list();

  /**
   * <xmp>
   *  쿠폰 조회
   * <select id="read" resultType="CouponVO" parameterType="int">
   * <xmp>
   * @return
   */
  public CouponVO read(int couponno);

  /**
   * 수정
   */

  /**
   * <xmp>
   *  쿠폰 삭제: 삭제 안함 -> 재고가 0이면 발급 불가
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int couponno);
  
}
