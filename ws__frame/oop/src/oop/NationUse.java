package oop;

public class NationUse {

  public static void main(String[] args) {
    Nation nation = new Nation();
     
    String country = nation.getNation("KOR");
    // String country = "ÇÑ±¹";      
    System.out.println(country);
    
    country = nation.getNation("CAN");
    System.out.println(country);

    country = nation.getNation("VNM");
    System.out.println(country);
    
    country = nation.getNation("CHN");
    System.out.println(country);
    
    System.out.println("-----------------------");
    
    int gdp = nation.getGDP("KOR");
    System.out.println(gdp);
    
    gdp = nation.getGDP("CAN");
    System.out.println(gdp);
    
    gdp = nation.getGDP("VNM");
    System.out.println(gdp);
    
    System.out.println("-----------------------");
    
    int pop = nation.getPop("KOR");
    System.out.println("KOR: " + pop);
    
    pop = nation.getPop("CAN");
    System.out.println("CAN: " + pop);
    
    pop = nation.getPop("VNM");
    System.out.println("VNM: " + pop);
    
  }

}