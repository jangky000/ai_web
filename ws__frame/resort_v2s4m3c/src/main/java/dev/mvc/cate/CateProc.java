package dev.mvc.cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.categrp.CategrpVO;

@Component("dev.mvc.cate.CateProc")
public class CateProc implements CateProcInter {
  @Autowired
  private CateDAOInter cateDAO;
  
  @Override
  public int create(CateVO cateVO) {
    int cnt = this.cateDAO.create(cateVO);
    return cnt;
  }

  @Override
  public List<CateVO> list_seqno_asc() {
    List<CateVO> list = null;
    list = this.cateDAO.list_seqno_asc();
    return list;
  }

  @Override
  public CateVO read(int cateno) {
    CateVO cateVO = null;
    cateVO = this.cateDAO.read(cateno);
    
    return cateVO;
  }

  @Override
  public int update(CateVO cateVO) {
    int cnt = 0;
    cnt = this.cateDAO.update(cateVO);
    return cnt;
  }

  @Override
  public int delete(int cateno) {
    int cnt = 0;
    cnt = this.cateDAO.delete(cateno);
    return cnt;
  }

  @Override
  public int update_seqno_up(int cateno) {
    int cnt = 0;
    cnt = this.cateDAO.update_seqno_up(cateno);
    return cnt;
  }

  @Override
  public int update_seqno_down(int cateno) {
    int cnt = 0;
    cnt = this.cateDAO.update_seqno_down(cateno);
    return cnt;
  }

  @Override
  public int update_visible(CateVO cateVO) {
    int cnt = 0;
    if (cateVO.getVisible().toUpperCase().equals("Y")) {
      cateVO.setVisible("N");
    } else {
      cateVO.setVisible("Y");
    }
    cnt = this.cateDAO.update_visible(cateVO);
    return cnt;
  }
  

}



