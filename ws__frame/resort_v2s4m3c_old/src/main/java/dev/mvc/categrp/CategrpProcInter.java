package dev.mvc.categrp;

import java.util.List;

public interface CategrpProcInter {
  /**
   * 등록
   * <xmp>
   * <insert id="create" parameterType="CategrpVO">
   * </xmp>
   * @param categrpVO
   * @return 등록된 레코드 개수
   */
  public int create(CategrpVO categrpVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list_categrpno_asc" resultType="CategrpVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<CategrpVO> list_categrpno_asc();
  
  /**
   * 목록
   * <xmp>
   * <select id="list_seqno_asc" resultType="CategrpVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<CategrpVO> list_seqno_asc();
  
  /**
   * 조회 + 수정폼(form 태그)
   * <xmp>
   *   <select id="read" resultType="CategrpVO" parameterType="int">
   * </xmp>  
   * @param categrpno
   * @return 한 건의 레코드
   */
  public CategrpVO read(int categrpno);
  
  /**
   * 수정 처리
   * <xmp>
   *   <update id="update" parameterType="CategrpVO"> 
   * </xmp>
   * @param categrpVO
   * @return 처리된 레코드 갯수
   */
  public int update(CategrpVO categrpVO);
  
  /**
   * 우선순위 상향, 10 ▷ 1
   * @param categrpno
   * @return 처리된 레코드 개수
   */
  public int update_seqno_up(int categrpno);
  
  /**
   * 우선순위 하향, 1 ▷ 10
   * @param categrpno
   * @return 처리된 레코드 개수
   */
  public int update_seqno_down(int categrpno);
  
  /**
   * 출력 모드 변경
   * @param categrpVO
   * @return
   */
  public int update_visible(CategrpVO categrpVO);
  
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="update" parameterType="int"> 
   * </xmp>
   * @param categrpno
   * @return 처리된 레코드 갯수
   */
  public int delete(int categrpno);
}
