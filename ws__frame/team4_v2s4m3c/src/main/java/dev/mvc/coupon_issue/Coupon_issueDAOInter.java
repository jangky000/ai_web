package dev.mvc.coupon_issue;

import java.util.List;

public interface Coupon_issueDAOInter {
  
  /**
   * <xmp>
   *  쿠폰 발급 등록: 발급 기준일 한달 이내 사용
   * <insert id="create" parameterType="Coupon_issueVO">
   * <xmp>
   * @return
   */
  public int create(Coupon_issueVO coupon_issueVO);

  /**
   * <xmp>
   *  쿠폰 발급 목록
   * <select id="list" resultType="Coupon_issueVO">
   * <xmp>
   * @return
   */
  public List<Coupon_issueVO> list();

  /**
   * <xmp>
   *  쿠폰 발급 조회
   * <select id="read" resultType="Coupon_issueVO" parameterType="int">
   * <xmp>
   * @return
   */
  public Coupon_issueVO read(int coupon_issueno);

  /**
   * 수정
   */

  /**
   * <xmp>
   *  쿠폰 발급 삭제: 삭제 사용 안함, 상태 변경 -- I: issue 발급, U: used 사용완료
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int coupon_issueno);

}
