package test;

public class Nation {
  public String getNation(String code) {
    String str = "";
    
    if (code.equals("KOR")) {
      str = "한국";
    } else if (code.equals("CAN")) {
      str = "캐나다";
    } else if (code.equals("VNM")) {
      str = "베트남";
    } else {
      str = "미지원 국가";
    }
    
    return str;
  }

  public int getGDP(String code) {
    int gdp = 0;
    
    if (code.equals("KOR")) {
      gdp = 31940;
    } else if (code.equals("CAN")) {
      gdp = 46420;
    } else if (code.equals("VNM")) {
      gdp = 2550;
    } else {
      gdp = 0;
    }
    
    return gdp;
  }
  
  public int getPop(String code) {
    int pop = 0;
    
    if (code.equals("KOR")) {
      pop = 51833175;
    } else if (code.equals("CAN")) {
      pop = 36954000;
    } else if (code.equals("VNM")) {
      pop = 96018519;
    } else {
      pop = 0;
    }
    
    return pop;
  }
  
}
