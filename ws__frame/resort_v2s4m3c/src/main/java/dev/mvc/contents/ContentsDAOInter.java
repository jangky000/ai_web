package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

public interface ContentsDAOInter {
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
   * <xmp>
   * cateno별 목록
   * <select id="list" resultType="ContentsVO" parameterType="int">
   * </xmp>
   * @param cateno
   * @return
   */
  public List<ContentsVO> list(int cateno);
  
  /**
   * 조회
   * @param contentsno
   * @return
   */
  public ContentsVO read(int contentsno);
  
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
   * 삭제
   * @param contentsno
   * @return
   */
  public int delete(int contentsno);
  
  /**
   * <xmp>
   * 전체 게시글 개수
   * <select id="total_count" resultType="int">
   * </xmp>
   * @return
   */
  public int total_count();
}





