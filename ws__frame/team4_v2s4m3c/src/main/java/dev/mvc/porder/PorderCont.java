package dev.mvc.porder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class PorderCont {
  
  @Autowired
  @Qualifier("dev.mvc.porder.PorderProc")
  private PorderProcInter PorderProc;

  public PorderCont() {
    System.out.println("--> PorderCont created.");
  }
  
}
