package dev.mvc.categrp;
 
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
 
@Component("dev.mvc.categrp.CategrpProc") // servlet-context.xml 빈 등록, 클래스를 컴포넌트로 지정
public class CategrpProc implements CategrpProcInter {
  
  @Autowired // DI, Spring framework가 자동 구현한 DAO가 자동 할당됨
  private CategrpDAOInter categrpDAO;
  // private CategrpDAOInter categrpDAO = new CategrpDAO();를 자동화

  @Override
  public int create(CategrpVO categrpVO) {
    int cnt = 0;
    cnt = categrpDAO.create(categrpVO);
    return cnt;
  }
  @Override
  public List<CategrpVO> list_categrpno_asc() {
    List<CategrpVO> list = null;
    list = this.categrpDAO.list_categrpno_asc();
    return list;
  }

  @Override
  public CategrpVO read(int categrpno) {
    CategrpVO categrpVO = null;
    categrpVO = this.categrpDAO.read(categrpno);
    return categrpVO;
  }
  
  @Override
  public int update(CategrpVO categrpVO) {
    int cnt = this.categrpDAO.update(categrpVO);
    return cnt;
  }

}