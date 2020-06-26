package dev.mvc.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.coupon.CouponProc")
public class CouponProc implements CouponProcInter{
  
  @Autowired
  private CouponDAOInter couponDAO;

  public CouponProc(){
    System.out.println("--> CouponProc created.");
  }

  @Override
  public int create(CouponVO couponVO) {
    int cnt = this.couponDAO.create(couponVO);
    return cnt;
  }

  @Override
  public List<CouponVO> list() {
    List<CouponVO> list = this.couponDAO.list();
    return list;
  }

  @Override
  public CouponVO read(int couponno) {
    CouponVO couponVO = this.couponDAO.read(couponno);
    return couponVO;
  }

  @Override
  public int delete(int couponno) {
    int cnt = this.couponDAO.delete(couponno);
    return cnt;
  }
  
  
}
