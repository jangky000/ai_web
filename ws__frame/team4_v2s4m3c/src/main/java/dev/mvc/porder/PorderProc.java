package dev.mvc.porder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.porder.PorderProc")
public class PorderProc implements PorderProcInter{
  
  @Autowired
  private PorderDAOInter PorderDAO;

  public PorderProc(){
    System.out.println("--> PorderProc created.");
  }
  
  
}
