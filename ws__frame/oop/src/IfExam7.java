
public class IfExam7 {

  public static void main(String[] args) {
    String cpu = args[0];
    int memory = Integer.parseInt(args[1]);
    int cpu_price = 0;
    int memory_price = 0;
    
    if(cpu.equals("i3") == true) {
      cpu_price = 100000;
    } else if(cpu.equals("i5") == true) {
      cpu_price = 150000 ;
    } else if(cpu.equals("i7") == true) {
      cpu_price = 200000 ;
    }
    
    memory_price = memory*10000;
    
    System.out.println("CPU:" + cpu  + " " + cpu_price + "원");
    System.out.println("RAM:" + memory  + "G " + memory_price + "원");
    System.out.println("------------------------");
    System.out.println("결제 금액: " + (cpu_price + memory_price) + "원");
  }

}
