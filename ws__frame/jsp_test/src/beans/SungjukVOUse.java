package beans;
 
public class SungjukVOUse {
 
  public static void main(String[] args) {
    // °´Ã¼ »ı¼º
    SungjukVO sungjukVO = new SungjukVO();
    
    // setter È£Ãâ
    // sungjukVO.name = "ÁÖÁöÈÆ" // The field SungjukVO.name is not visible
    sungjukVO.setName("¿Õ´«ÀÌ");
    sungjukVO.setTot(80);
    sungjukVO.setAvg(70);
    
    // getter È£Ãâ
    String name = sungjukVO.getName();
    int tot = sungjukVO.getTot();
    int avg = sungjukVO.getAvg();
    
    System.out.println("¼º¸í: " + name);
    System.out.println("ÃÑÁ¡: " + tot);
    System.out.println("Æò±Õ: "+ avg);
  }
 
}