package dev.mvc.attachfile;

import java.util.List;

public interface AttachfileProcInter {
  /**
   * 파일 등록  
   * @param attachfileVO
   * @return
   */
  public int create(AttachfileVO attachfileVO);

  /**
   * 전체 이미지 목록
   * @return
   */
  public List<AttachfileVO> list(); 
  
  /**
   * 조회
   * @param attachfileno
   * @return
   */
  public AttachfileVO read(int attachfileno);
  

  /**
   * 삭제
   * @param attachfileno
   * @return
   */
  public int delete(int attachfileno);
  
  /**
   * <xmp>
   * 컨텐츠에 해당하는 첨부파일 리스트
   * <select id="list_by_contentsno" resultType="AttachfileVO" parameterType="int">
   * </xmp>
   * @param contentsno
   * @return
   */
  public List<AttachfileVO> list_by_contentsno(int contentsno);
}
 