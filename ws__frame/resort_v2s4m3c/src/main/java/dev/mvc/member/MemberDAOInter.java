package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MemberDAOInter {
  
  /**
   * 아이디 중복 체크 
   * @param id
   * @return 0: 중복 아님, 1: 중복
   */
  public int checkID(String id);
  
  /**
   * 회원 가입
   * @param memberVO
   * @return
   */
  public int create(MemberVO memberVO);
  
  /**
   * 회원 전체 목록
   * @return
   */
  public List<MemberVO> list();
  
  /**
   * 회원 조회
   * @param memberno
   * @return
   */
  public MemberVO read(int memberno);
  
  /**
   * 수정 처리
   * @param memberVO
   * @return
   */
  public int update(MemberVO memberVO);
  
  /**
   * 회원 삭제 처리
   * @param memberno
   * @return
   */
  public int delete(int memberno);

  /**
   * 패스워드 검사
   * @param map
   * @return 0: 일치하지 않음, 1: 일치함
   */
  public int passwd_check(HashMap<Object, Object> map);
  
  /**
   * 패스워드 변경
   * @param map
   * @return 변경된 패스워드 갯수
   */
  public int passwd_update(HashMap<Object, Object> map);
  
  /**
   * <xmp>
   * 로그인 처리
   * Map은 HashMap을 가지고 있다.
   * <select id="login" resultType="int" parameterType="Map">
   * </xmp>
   * @param map
   * @return
   */
  public int login(Map<Object, Object> map);
  
  /**
   * <xmp>
   * id를 이용한 회원 정보 조회
   * <select id="readById" resultType="MemberVO" parameterType="String">
   * </xmp>
   * @param map
   * @return
   */
  public MemberVO readById(String id);
}








