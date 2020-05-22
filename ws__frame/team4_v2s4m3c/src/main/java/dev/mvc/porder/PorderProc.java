package dev.mvc.porder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.porder.PorderProc")
public class PorderProc implements PorderProcInter{
  
  @Autowired
  private PorderDAOInter PorderDAO;

  public PorderProc(){
    System.out.println("--> PorderProc created.");
  }

  @Override
  public int create(PorderVO porderVO) {
    int cnt = this.PorderDAO.create(porderVO);
    return cnt;
  }

  @Override
  public List<PorderVO> list() {
    List<PorderVO> list = this.PorderDAO.list();
    return list;
  }

  @Override
  public PorderVO read(int porderno) {
    PorderVO porderVO = this.PorderDAO.read(porderno);
    return porderVO;
  }

  @Override
  public int update(PorderVO porderVO) {
    int cnt = this.PorderDAO.update(porderVO);
    return cnt;
  }

  @Override
  public int delete(int porderno) {
    int cnt = this.PorderDAO.delete(porderno);
    return cnt;
  }

}
