package oop2;
 
import java.lang.String; // �ڵ� import
import java.text.DecimalFormat;
import java.util.Date;

public class APITest {
 
  public static void main(String[] args) {
//    String str = null // �޸� �Ҵ��� ���� �ʾ� �޼ҵ� ��� �Ұ�
//    String str_new = new String("How much is it?"); // �������� ����
    String str = "How much is it?"; // String class ��ü ����
    String res = str.toLowerCase();
    System.out.println("1) "+ res);
    
    res = str.toUpperCase();
    System.out.println("2) "+ res);
    
    int len = str.length();
    System.out.println("3) "+ len);
    
    //How ����
    res = str.substring(0,3);
    System.out.println("4) " + res);
    
    //much ����
    res = str.substring(4,8);
    System.out.println("5) " + res);
    
    res = "JAVA";
    boolean sw = res.equals("JAVA");
    
    if(sw == true) {
      System.out.println("6) ������ ���ڿ�");
    }
    
    sw = res.equals("java");
    if(sw == false) {
      System.out.println("7) JAVA �ƴ�");
    }
    
    res = "JAVA";
    sw = res.equalsIgnoreCase("java"); // ��ҹ��ڸ� ������ ��
    if(sw == true) {
      System.out.println("8) ������ ���ڿ�");
    }
    
    //toLowerCase(), equals()
    if(res.toLowerCase().equals("java")) {
      System.out.println("9) ������ ���ڿ�");
    }
    
    if(res.toLowerCase().equals("Java".toLowerCase())) {
      System.out.println("10) ������ ���ڿ�");
    }
    
    //���� Ȯ���� Ȯ��
    String image = "fall.jPg";
    image = image.toLowerCase();
    sw = image.endsWith("jpg");
    if(sw == true) {
      System.out.println("11) jpg ���۰���");
    }
    
    //�� ������ || ���
    sw = image.endsWith("jpg") || image.endsWith("png");
    if(sw == true) {
      System.out.println("12) jpg,  png ���۰���");
    }
    
    //comma ����
    DecimalFormat df = new DecimalFormat("#,###,###");
    String pay = df.format(2000000);
    System.out.println("13) " + pay);

    df = new DecimalFormat("�� #,###,###��");
    pay = df.format(2000000);
    System.out.println("13) " + pay);

    Date date = new Date();
    String str_date = date.toLocaleString(); // ��Ҽ�: deprecated = �������� ����, �ٵ� ���ϰ� ��밡��
    System.out.println("15) " + str_date);
    
    
  }
}