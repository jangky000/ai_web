package dev.mvc.cate;

import java.util.List;

public interface CateProcInter {

  /**
   * 등록
   * @param cateVO
   * @return
   */
  public int create(CateVO cateVO);

  /**
   * 출력 순서별 목록
   * @return
   */
  public List<CateVO> list_seqno_asc();

  /**
   * 조회, 수정폼
   * @param categrpno 카테고리 그룹 번호, PK
   * @return
   */
  public CateVO read(int cateno);
  
  /**
   * 수정 
   * @param cateVO
   * @return
   */
  public int update(CateVO cateVO);

  /**
   * 삭제 처리
   * @param cateno
   * @return
   */
  public int delete(int cateno);
  
  /**
   * 우선순위 상향, up 10 ▷ 1
   * @param cateno
   * @return
   */
  public int update_seqno_up(int cateno);
  
  /**
   * 우선순위 하향, up 10 ▷ 1
   * @param cateno
   * @return
   */
  public int update_seqno_down(int cateno);
  
  /**
   * 출력 모드의 변경
   * @param cateVO
   * @return
   */
  public int update_visible(CateVO cateVO);
  
}





