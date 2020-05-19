package dev.mvc.member;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
 
@Component("dev.mvc.member.MemberProc")
public class MemberProc implements MemberProcInter {
  
  @Autowired
  private MemberDAOInter memberDAO;
  
  public MemberProc(){
    System.out.println("--> MemberProc created.");
  }

  @Override
  public int checkID(String id) {
    int cnt = this.memberDAO.checkID(id); // id는 Unique로 설정되어 있다.
    return cnt;
  }
}