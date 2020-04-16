package oop;
 
public class Nation {
  String country;
  
  public String getNation(String code) {
    String str = "";

//    System.out.println("Spring".equals("봄"));
//    System.out.println("Spring".equals("Spring"));
//    
//    if("Spring".equals("Spring")){
//      System.out.println("3월은 봄입니다.");
//    }
    if(code.equals("KOR")) {
      str = "한국";
    } else if(code.equals("CAN")) {
      str = "캐나다";
    } else if(code.equals("VNM")){
      str = "베트남";
    } else {
      str = "미지원 국가";
    }
    
    
    return str;
  }
  
  public int getGDP(String code) {
    int gdp = -1;
    if(code.equals("KOR")) {
      gdp = 31940;
    } else if(code.equals("CAN")) {
      gdp = 46420;
    } else if(code.equals("VNM")){
      gdp = 2550;
    }
    return gdp;
  }
  
  public int getPop(String code) {
    int pop = -1;
    
    if(code.equals("KOR")) {
      pop = 51833175;
    } else if(code.equals("CAN")) {
      pop = 36954000;
    } else if(code.equals("VNM")){
      pop = 96018519;
    }
    
    return pop;
  }
}