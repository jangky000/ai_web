package dev.mvc.cate;

import java.util.List;

public class Categrp_Cate_VO_list {
  // 부모테이블 칼럼 저장
  // <select id="list_by_categrpno" resultMap="Categrp_Cate_VO_list_Map" parameterType="int">
  //categrp의 필드 -> 이 기법을 통해 메모리를 절약할 수 있음
 // 공통 요소를 VO에 반복 저장하지 않고 한번만 저장
 // 부모테이블의 레코드를 읽어와 저장
  /** 카테고리 그룹 번호 */
  private int categrpno;
  /**  카테고리 이름 */
  private String name;
  /** 출력 순서 */
  private int seqno;
  /** 출력 모드 */
  private String visible;
  /** 등록일 */
  private String rdate;
  
  // 자식테이블의 레코드를 리스트에 저장
  // <select id="list_seqno_asc_by_categrpno" resultType="CateVO" parameterType="int"> 
  /** 카테고리 목록 */
  private List<CateVO> cate_list;

  public int getCategrpno() {
    return categrpno;
  }

  public void setCategrpno(int categrpno) {
    this.categrpno = categrpno;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getSeqno() {
    return seqno;
  }

  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }

  public String getVisible() {
    return visible;
  }

  public void setVisible(String visible) {
    this.visible = visible;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  public List<CateVO> getCate_list() {
    return cate_list;
  }

  public void setCate_list(List<CateVO> cate_list) {
    this.cate_list = cate_list;
  }
  
}
