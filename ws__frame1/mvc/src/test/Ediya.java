package test;

public class Ediya implements CoffeeshopInter {

  @Override
  public void americano() {
    System.out.println("�Ƹ޸�ī��: ������ �մµ�,,");
  }

  @Override
  public void latte() {
     System.out.println("��: ���� ���� �پ��� �� ����,,,");
  }

  @Override
  public void dessert() {
    System.out.println("����Ʈ: ��Ϻ귡�� ����");
  }

  public void TL () {
    System.out.println("���ǳ� �� jmt");
  }
}