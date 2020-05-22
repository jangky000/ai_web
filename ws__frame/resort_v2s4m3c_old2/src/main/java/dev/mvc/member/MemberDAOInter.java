package dev.mvc.member;

import java.util.HashMap;
import java.util.List;

public interface MemberDAOInter {

  /**
   * ���̵� �ߺ� üũ
   * @param id
   * @return 0: �ߺ� �ƴ�, 1: �ߺ�
   */
  public int checkID(String id);
  
  /**
   * ȸ�� ����
   * <xmp>
   * <insert id="create" parameterType="MemberVO">
   * </xmp>
   * @param memberVO
   * @return
   */
  public int create(MemberVO memberVO);
  
  
  /**
   * <xmp>
   * ȸ�� ��ü ���
   * <select id="list" resultType="MemberVO">
   * </xmp>
   * @return
   */
  public List<MemberVO> list();
  
  
  /**
   * <xmp>
   * memberno PK�� user1 ��� ���� ����
   * <select id="read" resultType="MemberVO" parameterType="int">
   * </xmp>
   * @param memberno
   * @return
   */
  public MemberVO read(int memberno);
  
  /**
   * <xmp>
   * id�� user1 ��� ���� ����
   * <select id="readById" resultType="MemberVO" parameterType="String">
   * </xmp>
   * @param id
   * @return
   */
  public MemberVO readById(String id);
  
  
  /**
   * <xmp>
   * ȸ�� ���� ���� ó��
   * <update id="update" parameterType="MemberVO">
   * </xmp>
   * @param memberVO
   * @return
   */
 public int update(MemberVO memberVO);

 /**
  * ȸ�� ���� ����
  * <xmp>
  *  <delete id="delete" parameterType="int">
  * </xmp>
  * @param memberno
  * @return
  */
 public int delete(int memberno);
 
 /**
  * <xmp>
  * ��й�ȣ üũ
  * <select id="passwd_check" resultType="int" parameterType="HashMap">
  * </xmp>
  * @param map
  * @return
  */
 public int passwd_check(HashMap<Object, Object> map);
 

 /**
  * <xmp>
  * ��й�ȣ ������Ʈ
  * <update id="passwd_update" parameterType="HashMap">
  * </xmp>
  * @param map
  * @return
  */
 public int passwd_update(HashMap<Object, Object> map);
 
 
}
