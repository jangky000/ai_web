package network;

// �������̽�
class Three implements Runnable{
  private String name;
 
  public Three(String name){
    this.name = name;
  }
  
  @Override
  public void run(){
    for (int i=0 ;i<5; i++){
      System.out.println(i + ": " + name);
    }
  }
}
 
public class Thread1 {
 
  public static void main(String[] args) {
    Three three1 = new Three("ĳ���� ����");
    Thread thread1 = new Thread(three1);// ������ ��ü ����
    thread1.start(); // ������ ���� -> run() ȣ��
    
    Three three2 = new Three("��� ����");
    Thread thread2 = new Thread(three2);
    thread2.start();
    
    Three three3 = new Three("��ī��Ʈ ����");
    Thread thread3 = new Thread(three3);
    thread3.start();
  }
} 