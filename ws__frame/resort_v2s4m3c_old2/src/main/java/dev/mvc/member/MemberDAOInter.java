package dev.mvc.member;

import java.util.HashMap;
import java.util.List;

public interface MemberDAOInter {

  /**
   * 아이디 중복 체크
   * @param id
   * @return 0: 중복 아님, 1: 중복
   */
  public int checkID(String id);
  
  /**
   * 회원 가입
   * <xmp>
   * <insert id="create" parameterType="MemberVO">
   * </xmp>
   * @param memberVO
   * @return
   */
  public int create(MemberVO memberVO);
  
  
  /**
   * <xmp>
   * 회원 전체 목록
   * <select id="list" resultType="MemberVO">
   * </xmp>
   * @return
   */
  public List<MemberVO> list();
  
  
  /**
   * <xmp>
   * memberno PK로 user1 사원 정보 보기
   * <select id="read" resultType="MemberVO" parameterType="int">
   * </xmp>
   * @param memberno
   * @return
   */
  public MemberVO read(int memberno);
  
  /**
   * <xmp>
   * id로 user1 사원 정보 보기
   * <select id="readById" resultType="MemberVO" parameterType="String">
   * </xmp>
   * @param id
   * @return
   */
  public MemberVO readById(String id);
  
  
  /**
   * <xmp>
   * 회원 정보 수정 처리
   * <update id="update" parameterType="MemberVO">
   * </xmp>
   * @param memberVO
   * @return
   */
 public int update(MemberVO memberVO);

 /**
  * 회원 정보 삭제
  * <xmp>
  *  <delete id="delete" parameterType="int">
  * </xmp>
  * @param memberno
  * @return
  */
 public int delete(int memberno);
 
 /**
  * <xmp>
  * 비밀번호 체크
  * <select id="passwd_check" resultType="int" parameterType="HashMap">
  * </xmp>
  * @param map
  * @return
  */
 public int passwd_check(HashMap<Object, Object> map);
 

 /**
  * <xmp>
  * 비밀번호 업데이트
  * <update id="passwd_update" parameterType="HashMap">
  * </xmp>
  * @param map
  * @return
  */
 public int passwd_update(HashMap<Object, Object> map);
 
 
}
