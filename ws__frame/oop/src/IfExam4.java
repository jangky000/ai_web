
public class IfExam4 {

  public static void main(String[] args) {
    int num = Integer.parseInt(args[0]);
    System.out.println("��: " + num);
    
    if(num >=3 && num <= 5) System.out.println("�뿵");
    else if(num >=6 && num <= 8) System.out.println("�̽÷� ���� ����̺�");
    else if(num >=9 && num <= 11) {
      if(num == 9) System.out.println("���ǻ�");
      else if(num == 10) System.out.println("��� ����");
      else if(num == 11) System.out.println("����� ��ǳ");
    }else if(num <= 2 || num == 12) System.out.println("�Ѱ�� �� ����̺�");
    // syso�� ���� ���� �� ���� �ڵ�?
  }
}
