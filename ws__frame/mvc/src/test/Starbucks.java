package test;

public class Starbucks implements CoffeeshopInter {

  @Override
  public void americano() {
    System.out.println("�Ƹ޸�ī��: ���� �����ν���");
  }

  @Override
  public void latte() {
     System.out.println("��: ���� �ɼ��� ����");
  }

  @Override
  public void dessert() {
    System.out.println("����Ʈ: ���������� ���");
  }
  
  public void JHB() {
    System.out.println("�ڸ���Ϻ�Ƽ jmt");
  }

}