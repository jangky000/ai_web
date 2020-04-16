
public class IfExam8 {

  public static void main(String[] args) {
    String cpu = args[0];
    int memory = Integer.parseInt(args[1]);
    String ssd = args[2];
    
    int cpu_price = 0;
    int memory_price = 0;
    int ssd_price = 0;
    int total = 0;
    
    if(cpu.equals("i3")) {
      cpu_price = 100000;
    } else if(cpu.equals("i5")) {
      cpu_price = 150000 ;
    } else if(cpu.equals("i7")) {
      cpu_price = 200000 ;
    }
    
    memory_price = memory*10000;
    
    if( ssd.equals("128SSD") || ssd.equals("128ssd") ) {
      ssd_price = 100000; 
    } else if( ssd.equals("256SSD") || ssd.equals("256ssd") ) {
      ssd_price = 150000; 
    } else if( ssd.equals("512SSD") || ssd.equals("512ssd") ) {
      ssd_price = 200000; 
    }
    
    total = cpu_price + memory_price + ssd_price;
    
    System.out.println("CPU:" + cpu  + " " + cpu_price + "원");
    System.out.println("RAM:" + memory  + "G " + memory_price + "원");
    System.out.println("SSD:" + ssd  + " " + ssd_price + "원");
    System.out.println("------------------------");
    System.out.println("결제 금액: " + total + "원");

  }

}
