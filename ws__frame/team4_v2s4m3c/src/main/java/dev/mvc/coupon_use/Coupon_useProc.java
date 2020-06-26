package dev.mvc.coupon_use;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.coupon_use.Coupon_useProc")
public class Coupon_useProc implements Coupon_useProcInter{
  
  @Autowired
  private Coupon_useDAOInter coupon_useDAO;

  public Coupon_useProc(){
    System.out.println("--> Coupon_useProc created.");
  }

  @Override
  public int create(Coupon_useVO coupon_useVO) {
    int cnt = this.coupon_useDAO.create(coupon_useVO);
    return cnt;
  }

  @Override
  public List<Coupon_useVO> list() {
    List<Coupon_useVO> list  = this.coupon_useDAO.list();
    return list;
  }

  @Override
  public Coupon_useVO read(int coupon_useno) {
    Coupon_useVO coupon_useVO = this.coupon_useDAO.read(coupon_useno);
    return coupon_useVO;
  }

  @Override
  public int delete(int coupon_useno) {
    int cnt = this.coupon_useDAO.delete(coupon_useno);
    return cnt;
  }
  
  
}
