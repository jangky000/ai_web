package dev.mvc.shopping_cart;

import java.util.List;

public interface Shopping_cartProcInter {
  
  /**
   * <xmp>
   * 장바구니 등록
   * <insert id="create" parameterType="Shopping_cartVO">
   * <xmp>
   * @return
   */
  public int create(Shopping_cartVO shopping_cartVO);

  /**
   * <xmp>
   * 장바구니 목록
   * <select id="list" resultType="Shopping_cartVO">
   * <xmp>
   * @return
   */
  public List<Shopping_cartVO> list();

  /**
   * <xmp>
   * 장바구니 조회
   * <select id="read" resultType="Shopping_cartVO" parameterType="int">
   * <xmp>
   * @return
   */
  public Shopping_cartVO read(int shopping_cartno);

  /**
   * <xmp>
   * 장바구니 상품 개수 증가
   * <update id="quantity_up" parameterType="int">
   * <xmp>
   * @return
   */
  public int quantity_up(int shopping_cartno);
  
  /**
   * <xmp>
   * 장바구니 상품 개수 감소
   * <update id="quantity_down" parameterType="int">
   * <xmp>
   * @return
   */
  public int quantity_down(int shopping_cartno);
  
  /**
   * <xmp>
   * 장바구니 삭제
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int shopping_cartno);
}
