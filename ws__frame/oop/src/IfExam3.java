
public class IfExam3 {

  public static void main(String[] args) {
    int num = Integer.parseInt(args[0]);
    
    int digit = 0;
    String str = "";
    
    System.out.println("����: " + num);
    
    if(num < 0) System.out.println("������ ó������ �ʽ��ϴ�.");
    else if(num >=0 && num < 10) digit = 1;
    else if(num >= 10 && num < 100) digit = 10;
    else if(num >= 100 && num < 1000) digit = 100;
    else digit = 1000;
    
    str = digit + "�� �ڸ�";
    if(digit == 1000) str += " �̻�";
    
    System.out.println(str);
        
  }

}
