package oop;
 
public class HanwooUse2 {
 
  public static void main(String[] args) {
    Hanwoo hanwoo = new Hanwoo();
    
    hanwoo.name = "�ɵ��";
    hanwoo.productor = "Ⱦ��";
    hanwoo.weight = 400;
    hanwoo.price = (hanwoo.weight/100) * 12000;
    hanwoo.dc = hanwoo.price - (int)(hanwoo.price * 0.1);
    
    System.out.println("��ǰ��: " + hanwoo.name);
    System.out.println("������: " + hanwoo.productor);
    System.out.println("��   ��: " + hanwoo.weight + " g");
    System.out.println("��   ��: " + hanwoo.price + " ��");
    System.out.println("���ΰ�: " + hanwoo.dc + " ��");
    System.out.println("------------------------------");
    
    hanwoo.name = "��ä��";
    hanwoo.productor = "Ⱦ��";
    hanwoo.weight = 400;
    hanwoo.price = (hanwoo.weight/100) * 15000;
    hanwoo.dc = hanwoo.price - (int)(hanwoo.price * 0.1);
    
    System.out.println("��ǰ��: " + hanwoo.name);
    System.out.println("������: " + hanwoo.productor);
    System.out.println("��   ��: " + hanwoo.weight + " g");
    System.out.println("��   ��: " + hanwoo.price + " ��");
    System.out.println("���ΰ�: " + hanwoo.dc + " ��");
    System.out.println("------------------------------");
    
    hanwoo.name = "ä��";
    hanwoo.productor = "����ѿ� ����";
    hanwoo.weight = 400;
    hanwoo.price = (hanwoo.weight/100) * 10000;
    hanwoo.dc = hanwoo.price - (int)(hanwoo.price * 0.1);
    
    System.out.println("��ǰ��: " + hanwoo.name);
    System.out.println("������: " + hanwoo.productor);
    System.out.println("��   ��: " + hanwoo.weight + " g");
    System.out.println("��   ��: " + hanwoo.price + " ��");
    System.out.println("���ΰ�: " + hanwoo.dc + " ��");
    System.out.println("------------------------------");
    
    hanwoo.name = "�����";
    hanwoo.productor = "ȫ��";
    hanwoo.weight = 400;
    hanwoo.price = (hanwoo.weight/100) * 11000;
    hanwoo.dc = hanwoo.price - (int)(hanwoo.price * 0.1);
    
    System.out.println("��ǰ��: " + hanwoo.name);
    System.out.println("������: " + hanwoo.productor);
    System.out.println("��   ��: " + hanwoo.weight + " g");
    System.out.println("��   ��: " + hanwoo.price + " ��");
    System.out.println("���ΰ�: " + hanwoo.dc + " ��");
    System.out.println("------------------------------");
    
    hanwoo.name = "�Ƚ�";
    hanwoo.productor = "ȫ��";
    hanwoo.weight = 500;
    hanwoo.price = (hanwoo.weight/100) * 12000;
    hanwoo.dc = hanwoo.price - (int)(hanwoo.price * 0.1);
    
    System.out.println("��ǰ��: " + hanwoo.name);
    System.out.println("������: " + hanwoo.productor);
    System.out.println("��   ��: " + hanwoo.weight + " g");
    System.out.println("��   ��: " + hanwoo.price + " ��");
    System.out.println("���ΰ�: " + hanwoo.dc + " ��");
    
  }
 
}