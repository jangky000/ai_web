package beans;
 
public class SungjukVOUse {
 
  public static void main(String[] args) {
    // ��ü ����
    SungjukVO sungjukVO = new SungjukVO();
    
    // setter ȣ��
    // sungjukVO.name = "������" // The field SungjukVO.name is not visible
    sungjukVO.setName("�մ���");
    sungjukVO.setTot(80);
    sungjukVO.setAvg(70);
    
    // getter ȣ��
    String name = sungjukVO.getName();
    int tot = sungjukVO.getTot();
    int avg = sungjukVO.getAvg();
    
    System.out.println("����: " + name);
    System.out.println("����: " + tot);
    System.out.println("���: "+ avg);
  }
 
}