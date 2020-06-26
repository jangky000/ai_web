package dev.mvc.coupon_issue;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.coupon_issue.Coupon_issueProc")
public class Coupon_issueProc implements Coupon_issueProcInter{
  
  @Autowired
  private Coupon_issueDAOInter coupon_issueDAO;

  public Coupon_issueProc(){
    System.out.println("--> Coupon_issueProc created.");
  }

  @Override
  public int create(Coupon_issueVO coupon_issueVO) {
    int cnt = this.coupon_issueDAO.create(coupon_issueVO);
    return cnt;
  }

  @Override
  public List<Coupon_issueVO> list() {
    List<Coupon_issueVO> list = this.coupon_issueDAO.list();
    return list;
  }

  @Override
  public Coupon_issueVO read(int coupon_issueno) {
    Coupon_issueVO coupon_issueVO = this.coupon_issueDAO.read(coupon_issueno);
    return coupon_issueVO;
  }

  @Override
  public int delete(int coupon_issueno) {
    int cnt = this.coupon_issueDAO.delete(coupon_issueno);
    return cnt;
  }

  
}
