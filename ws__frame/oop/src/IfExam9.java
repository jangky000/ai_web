
public class IfExam9 {

  public static void main(String[] args) {
    String cpu = args[0];
    int memory = Integer.parseInt(args[1]);
    String ssd = args[2];
    
    int cpu_price = 0;
    int memory_price = 0;
    int ssd_price = 0;
    int extra_price = 370000;
    int tot = 0;
    
    if(cpu.equals("i3") == true) {
      cpu_price = 100000;
    } else if(cpu.equals("i5") == true) {
      cpu_price = 150000 ;
    } else if(cpu.equals("i7") == true) {
      cpu_price = 200000 ;
    }
    System.out.println("CPU:" + cpu  + " " + cpu_price + "��");
    
    memory_price = memory*10000;
    System.out.println("RAM:" + memory  + "G " + memory_price + "��");
    
    if( ssd.equals("128SSD") || ssd.equals("128ssd") ) {
      ssd_price = 100000; 
    } else if( ssd.equals("256SSD") || ssd.equals("256ssd") ) {
      ssd_price = 150000; 
    } else if( ssd.equals("512SSD") || ssd.equals("512ssd") ) {
      ssd_price = 200000; 
    }
    System.out.println("SSD:" + ssd  + " " + ssd_price + "��");
    
    System.out.println("��Ÿ���: " + extra_price + "��");
    
    System.out.println("------------------------");
    tot = cpu_price + memory_price + ssd_price + extra_price;
    System.out.println("���� �ݾ�: " + tot + "��");
    
    if(tot >= 700000) System.out.println("���� �ݾ�: " + (int)(tot*0.95) + "��");
      
  }

}
