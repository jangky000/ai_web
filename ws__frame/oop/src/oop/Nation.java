package oop;
 
public class Nation {
  String country;
  
  public String getNation(String code) {
    String str = "";

//    System.out.println("Spring".equals("��"));
//    System.out.println("Spring".equals("Spring"));
//    
//    if("Spring".equals("Spring")){
//      System.out.println("3���� ���Դϴ�.");
//    }
    if(code.equals("KOR")) {
      str = "�ѱ�";
    } else if(code.equals("CAN")) {
      str = "ĳ����";
    } else if(code.equals("VNM")){
      str = "��Ʈ��";
    } else {
      str = "������ ����";
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