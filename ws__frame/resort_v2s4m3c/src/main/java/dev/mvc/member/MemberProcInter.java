package dev.mvc.member;

public interface MemberProcInter {

  /**
   * 아이디 중복 체크
   * @param id
   * @return 0: 중복 아님, 1: 중복
   */
  public int checkID(String id);
}
