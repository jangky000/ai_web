package test;
 
class Sale {  // �θ� class
  public void spring_summer() {
    System.out.println("�� -> ����");
  }
}
// class Sale2 extends Object { } // �θ� class
 //Sale�� ���
class Y2014 extends Sale {
  @Override
  public void spring_summer() {
    System.out.println("spring -> summer");
  }
}
 
class Y2015 extends Sale { }
 
class Y2016 { }
 
public class CastTest1 {
 
  public static void main(String[] args) {
    
    Y2014 y2014 = new Y2014();
    Sale sale = y2014; // �ڽ� ��ü�� �θ� �Ҵ� ����, sale ��ü ���� sale ��ü�� class Ÿ����? Sale Ÿ��, (�޸𸮿��� y2014������)
    
    sale = new Y2015(); // �θ� <- �ڽ�
    // sale = new Y2016(); // ��� ���谡 �ƴ�, �Ҵ� �� �� ����.
    // Y2015 y2015 = sale; // �ڽ� <- �θ�, �Ҵ� �� �� ����.
    Y2015 y2015 = (Y2015) sale; // ��ü ����ȯ. �ڽ� Ÿ������ �θ� �Ҵ�
  
    // instanceof ~�� ��ü�ΰ�?
    // ������
    // ���� ���� ���¸� ���� �� �ִ� �ɷ�(���� Ÿ��, ���, �������̽�)
    // �Ϲ������� ��ü ������ �Ҵ�Ǵ� Ÿ���� �����ؾ��ϳ� �º��� Ÿ�԰� �캯�� Ÿ���� �޶� �θ� Ŭ������ �ڽ� Ŭ������ �Ҵ� ���� �� ����

    //Y2015�� �ν��Ͻ��̱⵵, Sale�� ��ü�̱⵵ �� -> ������
    System.out.println("sale instanceof Y2015: " + (sale instanceof Y2015)); // true
    System.out.println("sale instanceof Sale: " + (sale instanceof Sale));       // true
    
    //Sale Ÿ������ Y2014 class�� ��ü�� ������ ��
    Sale sale2 = new Y2014();
    sale2.spring_summer(); // �ڽ� Ŭ������ �޼ҵ�(�켱)�� ȣ���

  }
 
}