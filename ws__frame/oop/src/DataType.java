
public class DataType {

  public static void main(String[] args) {
    boolean sw = true;
    
    System.out.println("sw");
    System.out.println(sw);
    
    sw = false; // ����
    System.out.println(sw);
    System.out.println("sw: " + sw);
    
    
    System.out.println("--------------------");
    
    char chr  = 'A';
    String str = "A";
    System.out.println("chr= " + chr);
    System.out.println("str= " + str);
    
    String movie = "Exit";
    System.out.println("movie = " + movie);
    
    movie = "������ ����";
    String star = "�ڡ١١١�";
    System.out.println(movie + "(" + star + ")");
    
    int payment = 2000000;
    int pay = payment; //���� <- ������ �� �Ҵ�
    
    System.out.println("�޿�1: " + pay);
    System.out.println("�޿�2: " + pay + 500000 );
    System.out.println("�޿�3: " + (pay + 500000) );
    System.out.println("����: " + pay*13  );
    
    int year = pay *13 + 2000000;
    System.out.println("���� + ������: " + year  );
    System.out.println("-----------");
    
    long year_long = year; // 8����Ʈ�� 4����Ʈ �Ҵ�
//    year = year_long; // 4����Ʈ�� 8����Ʈ �Ҵ� �Ұ�, ERROR
    int year_int = (int)year_long; // ����ȯ
    
    float f = 1.0f;
    double d = 1.0; // �Ҽ��� �⺻�� double, 8 byte�� �⺻
    
    float f2 = (float)d; // �Ҽ��� ǥ���� �������� ���� ��� float���� �޸� ����
    
  }
}
