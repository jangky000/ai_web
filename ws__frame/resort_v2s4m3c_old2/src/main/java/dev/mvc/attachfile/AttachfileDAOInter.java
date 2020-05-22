package dev.mvc.attachfile;

import java.util.List;

import dev.mvc.cate.CateVO;

public interface AttachfileDAOInter {
  
  /**
   * 입력
   * @param attachfileVO
   * @return
   */
  public int create(AttachfileVO attachfileVO);

  /**
   * 전체 목록
   * @return List<AttachfileVO>
   */
  public List<AttachfileVO> list();
  
  /**
   * 조회
   * @param attachfileno
   * @return
   */
  public AttachfileVO read(int attachfileno);

  /**
   * 삭제 처리
   * @param attachfileno
   * @return
   */
  public int delete(int attachfileno);
}