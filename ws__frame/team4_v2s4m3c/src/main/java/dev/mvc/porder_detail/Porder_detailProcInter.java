package dev.mvc.porder_detail;

import java.util.List;

public interface Porder_detailProcInter {
  
  /**
   * <xmp>
   * 주문 내역 등록
   * <insert id="create" parameterType="Porder_detailVO">
   * <xmp>
   * @return
   */
  public int create(Porder_detailVO porder_detailVO);

  /**
   * <xmp>
   * 주문 내역 목록
   * <select id="list" resultType="Porder_detailVO">
   * <xmp>
   * @return
   */
  public List<Porder_detailVO> list();

  /**
   * <xmp>
   *  주문no별 주문 상세 내역 리스트
   * <select id="list_by_porderno" resultType="Porder_detailVO" parameterType="int">
   * <xmp>
   * @return
   */
  public List<Porder_detailVO> list_by_porderno(int porderno);
  
  /**
   * <xmp>
   * 주문 조회
   * <select id="read" resultType="PorderVO" parameterType="int">
   * <xmp>
   * @return
   */
  public Porder_detailVO read(int porder_detailno);

  /**
   * <xmp>
   * 주문 수정
   * <update id="update" parameterType="PorderVO">
   * <xmp>
   * @return
   */
  public int update(Porder_detailVO porder_detailVO);

  /**
   * <xmp>
   * 주문 삭제
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int porder_detailno);
}
