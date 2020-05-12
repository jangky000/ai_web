package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

public interface ContentsProcInter {
  /**
   * 등록 처리
   * @param contentsVO
   * @return
   */
  public int create(ContentsVO contentsVO);

  /**
   * 전체 목록 
   * @return
   */
  public List<ContentsVO> list_all();

  /**
   * 조회
   * @param contentsno
   * @return
   */
  public ContentsVO read(int contentsno);
  
  /**
   * 수정 폼
   * @param contentsVO
   * @return
   */
  public ContentsVO update(int contentsno);
  
  /**
   * 수정 처리
   * @param contentsVO
   * @return
   */
  public int update(ContentsVO contentsVO);
  
  /**
   * 패스워드 검사
   * @param map
   * @return 일치 시 1
   */
  public int passwd_check(HashMap hashMap);
  
  /**
   * 삭제 처리
   * @param contentsno
   * @return
   */
  public int delete(int contentsno);
  
}




