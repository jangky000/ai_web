package dev.mvc.shopping_cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.porder.Shopping_cartProc")
public class Shopping_cartProc implements Shopping_cartProcInter{
  
  @Autowired
  private Shopping_cartDAOInter Shopping_cartDAO;

  public Shopping_cartProc(){
    System.out.println("--> Shopping_cartProc created.");
  }

  @Override
  public int create(Shopping_cartVO shopping_cartVO) {
    int cnt = this.Shopping_cartDAO.create(shopping_cartVO);
    return cnt;
  }

  @Override
  public List<Shopping_cartVO> list() {
    List<Shopping_cartVO> list = this.Shopping_cartDAO.list();
    return list;
  }

  @Override
  public List<Shopping_cartVO> list_by_selected_shopping_cartno(int[] shopping_cartInt) {
    List<Shopping_cartVO> list = this.Shopping_cartDAO.list_by_selected_shopping_cartno(shopping_cartInt);
    return list;
  }
  
  @Override
  public Shopping_cartVO read(int shopping_cartno) {
    Shopping_cartVO shopping_cartVO = this.Shopping_cartDAO.read(shopping_cartno);
    return shopping_cartVO;
  }

  @Override
  public int quantity_up(int shopping_cartno) {
    int cnt = this.Shopping_cartDAO.quantity_up(shopping_cartno);
    return cnt;
  }

  @Override
  public int quantity_down(int shopping_cartno) {
    int cnt = this.Shopping_cartDAO.quantity_down(shopping_cartno);
    return cnt;
  }

  @Override
  public int delete(int shopping_cartno) {
    int cnt = this.Shopping_cartDAO.delete(shopping_cartno);
    return cnt;
  }
  

}
