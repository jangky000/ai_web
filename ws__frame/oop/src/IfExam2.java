
public class IfExam2 {

  public static void main(String[] args) {
    int num = Integer.parseInt(args[0]);
    String str = "";
    
    if(num == 1) str = "��Ʈ��";
    else if(num == 2) str = "���� ���� ������";
    else if(num == 3)  str = "512 SSD";
    else  str = "���� ��ȸ��...";
  
    System.out.println("���: " + num + " ��ǰ: " + str );

  }
}
