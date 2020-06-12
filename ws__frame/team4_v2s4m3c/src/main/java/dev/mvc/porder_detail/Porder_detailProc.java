package dev.mvc.porder_detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.porder_detail.Porder_detailProc")
public class Porder_detailProc implements Porder_detailProcInter{
  
  @Autowired
  private Porder_detailDAOInter porder_detailDAO;

  public Porder_detailProc(){
    System.out.println("--> Porder_detailProc created.");
  }

  @Override
  public int create(Porder_detailVO porder_detailVO) {
    int cnt = this.porder_detailDAO.create(porder_detailVO);
    return cnt;
  }

  @Override
  public List<Porder_detailVO> list() {
    List<Porder_detailVO> list = this.porder_detailDAO.list();
    return list;
  }
  
  @Override
  public List<Porder_detailVO> list_by_porderno(int porderno) {
    List<Porder_detailVO> list = this.porder_detailDAO.list_by_porderno(porderno);
    return list;
  }

  @Override
  public Porder_detailVO read(int porder_detailno) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public int update(Porder_detailVO porder_detailVO) {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public int delete(int porder_detailno) {
    // TODO Auto-generated method stub
    return 0;
  }



  

}
