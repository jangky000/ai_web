package test;

class Computer { }

public class CastTest2 {
  public static void main(String[] args) {
    Computer pc = new Computer();
    System.out.println("pc: " + pc.hashCode()); // pc: 2018699554
    
    // Object�� ��� Ŭ������ super Ŭ����
    Object obj = new Computer();
    System.out.println("obj: " + obj.hashCode()); // obj: 1311053135
    
    Computer pc2 = (Computer)obj; // Ÿ���� �����ص� Hashcode�� ������� ����
    System.out.println("pc2: " + pc2.hashCode()); // pc2: 1311053135
  }

}