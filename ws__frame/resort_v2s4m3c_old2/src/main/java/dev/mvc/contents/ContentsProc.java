package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.categrp.CategrpDAOInter;
import dev.mvc.tool.Tool;

@Component("dev.mvc.contents.ContentsProc")
public class ContentsProc implements ContentsProcInter {
  @Autowired  // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private ContentsDAOInter contentsDAO;
  
  @Override
  public int create(ContentsVO contentsVO) {
    int cnt = 0;
    cnt = this.contentsDAO.create(contentsVO);
    return cnt;
  }

  @Override
  public List<ContentsVO> list_all() {
    List<ContentsVO> list = this.contentsDAO.list_all();
    return list;
  }
  
  @Override
  public List<ContentsVO> list(int cateno) {
    List<ContentsVO> list = this.contentsDAO.list(cateno);
    return list;
  }

  @Override
  public ContentsVO read(int contentsno) {
    ContentsVO contentsVO = this.contentsDAO.read(contentsno);
    
    System.out.println(contentsVO.toString());
    
//    if(contentsVO.getWeb() == null) {
//      System.out.println("web null입니다.");
//    }
    
    // VO에서 private String web = "";  -> web 공백입니다 출력
    // VO에서 private String web; -> 에러 발생
    // 그래서 equal로 비교하면 안된다.
//   if(contentsVO.getWeb().equals("")) {
//     System.out.println("web 공백입니다.");
//   }
    
    
//    String content = contentsVO.getContent();
//    content = Tool.convertChar(content);
//    contentsVO.setContent(content);
    
    String title = contentsVO.getTitle();
    title = Tool.convertChar(title);
    contentsVO.setTitle(title);
    
    return contentsVO;
  }

  @Override
  public ContentsVO update(int contentsno) {
    ContentsVO contentsVO = this.contentsDAO.read(contentsno);
    
    return contentsVO;
  }
  
  @Override
  public int update(ContentsVO contentsVO) {
    int cnt = this.contentsDAO.update(contentsVO);
    return cnt;
  }

  @Override
  public int passwd_check(HashMap hashMap) {
    int passwd_cnt = this.contentsDAO.passwd_check(hashMap);
    return passwd_cnt;
  }
  
  @Override
  public int delete(int contentsno) {
    int cnt = this.contentsDAO.delete(contentsno);
    return cnt;
  }

  @Override
  public int total_count() {
    int cnt = this.contentsDAO.total_count();
    return cnt;
  }

  @Override
  public List<Cate_Contents_VO> cate_contents_memberno_list(int memberno) {
    List<Cate_Contents_VO> list = this.contentsDAO.cate_contents_memberno_list(memberno);
    return list;
  }

  @Override
  public int map(HashMap hashMap) {
    int cnt = this.contentsDAO.map(hashMap);
    return cnt;
  }

}




