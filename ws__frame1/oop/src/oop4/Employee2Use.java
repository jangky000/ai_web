package oop4;
 
public class Employee2Use {
 /**
  * oop���� �����ϴ� ����, private
  * @param args
  */
  public static void main(String[] args) {
    Employee2 emp1 = new Employee2();
    // Ŭ������ private�� ���������ν� ���� �ʵ忡 ������ �� ����.
    //-> �����ڰ� �����ϴ� ���� ���� -> �ڵ� �� ������ ����, ������Ʈ �������� ��ȭ
    // emp1.name = "�Ʒι�";  // The field Employee2.name is not visible

    Employee2 emp2 = new Employee2("�մ���", 68, 75, 89);  // ��ü ����
    // ������ ������ �Ұ��������� ó�� ���� ����
    emp2.calc();
    emp2.print();
  }
 
}