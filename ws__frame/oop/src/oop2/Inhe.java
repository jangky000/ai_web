package oop2;
 
public class Inhe {
 
  public static void main(String[] args) {
    Phone phone = new Phone();
    System.out.println(phone.phone_name);
    phone.tel();
    phone.sms();
    System.out.println("-------------------------");
    
    PDA pda = new PDA();
    System.out.println(pda.pda_name);
    pda.tel(); // 상속
    pda.sms(); // 상속
    pda.mms();
    pda.camera();
    System.out.println("-------------------------");
    
    Smart smart = new Smart();
    System.out.println(smart.smart_name);
    smart.tel(); // Phone
    smart.sms(); // Phone
    smart.mms(); // PDA
    smart.camera(); // PDA
    smart.market(); // Smart
    smart.internet(); // Smart
    smart.mweb(); // Smart
    System.out.println("-------------------------");
    
    FIR fir = new FIR();
    fir.tel();
    fir.sms();
    fir.mms();
    fir.camera();
    fir.market();
    fir.internet();
    fir.mweb();
    fir.iot();
    fir.bigdata();
    fir.ai();
    
    
  }
}