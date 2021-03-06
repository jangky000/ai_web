package dev.mvc.attachfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.cate.CateVO;

@Component("dev.mvc.attachfile.AttachfileProc")
public class AttachfileProc implements AttachfileProcInter {
  
  @Autowired
  private AttachfileDAOInter attachfileDAO;
  
  public AttachfileProc(){
    System.out.println("--> AttachfileProc created.");
  }

  @Override
  public int create(AttachfileVO attachfileVO) {
    int cnt = this.attachfileDAO.create(attachfileVO);
    return cnt;
  }

  @Override
  public List<AttachfileVO> list() {
    List<AttachfileVO> attachfileVO = null;
    attachfileVO = this.attachfileDAO.list();
    return attachfileVO;
  }
  
  @Override
  public AttachfileVO read(int attachfileno) {
    AttachfileVO attachfileVO = null;
    attachfileVO = this.attachfileDAO.read(attachfileno);
    return attachfileVO;
  }

  @Override
  public int delete(int attachfileno) {
    int cnt = this.attachfileDAO.delete(attachfileno);
    return cnt;
  }
  
}