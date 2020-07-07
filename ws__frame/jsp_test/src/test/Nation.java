package test;

public class Nation {
  public String getNation(String code) {
    String str = "";
    
    if (code.equals("KOR")) {
      str = "�ѱ�";
    } else if (code.equals("CAN")) {
      str = "ĳ����";
    } else if (code.equals("VNM")) {
      str = "��Ʈ��";
    } else {
      str = "������ ����";
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
