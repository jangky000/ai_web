package dev.mvc.cate;

import java.util.List;

public interface CateDAOInter {

  /**
   * 카테고리 입력
   * @param cateVO
   * @return 입력 레코드 개수
   */
  public int create(CateVO cateVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list_seqno_asc" resultType="CateVO">
   * </xmp> 
   * @return 레코드 목록
   */
  public List<CateVO> list_seqno_asc();

  
  /**
   * 조회 + 수정폼(form 태그)
   * <xmp>
   *   <select id="read" resultType="CateVO" parameterType="int">
   * </xmp>  
   * @param cateno
   * @return 한 건의 레코드
   */
  public CateVO read(int cateno);
 
  /**
   * 수정 처리
   * <xmp>
   *   <update id="update" parameterType="CateVO"> 
   * </xmp>
   * @param cateVO
   * @return 처리된 레코드 개수
   */
  public int update(CateVO cateVO);
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="update" parameterType="int"> 
   * </xmp>
   * @param cateno
   * @return 처리된 레코드 갯수
   */
  public int delete(int cateno);
  
  /**
   * 우선순위 상향, 10 ▷ 1
   * @param cateno
   * @return 처리된 레코드 개수
   */
  public int update_seqno_up(int cateno);
  
  /**
   * 우선순위 하향, 1 ▷ 10
   * @param cateno
   * @return 처리된 레코드 개수
   */
  public int update_seqno_down(int cateno);
  
  /**
   * 출력 모드 변경
   * @param cateVO
   * @return
   */
  public int update_visible(CateVO cateVO);
  
}
