package oop4;
 
public class Employee2Use2 {
 
  public static void main(String[] args) {
    Employee2 emp = new Employee2("�Ʒι�", 90, 100, 85);  // ��ü ����
    emp.calc();
    emp.print();
    
    emp = new Employee2("�մ���", 70, 80, 89);  // ��ü ����
    emp.calc();
    emp.print();
    
    emp = new Employee2("���浿", 90, 90, 87);  // ��ü ����
    emp.calc();
    emp.print();
  }
}