package oop4;
 
public class EmployeeUse {
 
  public static void main(String[] args) {
    Employee emp = new Employee();  // ��ü ����
    emp.name = "�Ʒι�"; // Ŭ���� �������� �̻� ������, oop�̷п��� �������� �ʴ´�.
    emp.java = 90;
    emp.web = 100;
    emp.dbms = 85;
    
    emp.tot = emp.java + emp.web + emp.dbms;
    emp.avg = (emp.tot / 3.0);
    
    System.out.println("����: " + emp.name);
    System.out.println("JAVA: " + emp.java);
    System.out.println("WEB: " + emp.web);
    System.out.println("DBMS: " + emp.dbms);
    System.out.println("����: " + emp.tot);
    System.out.println("���: " + (int)emp.avg);
    
    System.out.println("-----------------------------");
 
    Employee emp2 = new Employee();
    emp2.name = "�մ���";
    emp2.java = 70;
    emp2.web = 80;
    emp2.dbms = 90;
    
    emp2.tot = emp2.java + emp2.web + emp2.dbms;
    emp2.avg = (emp2.tot / 3.0);
    
    System.out.println("����: " + emp2.name);
    System.out.println("JAVA: " + emp2.java);
    System.out.println("WEB: " + emp2.web);
    System.out.println("DBMS: " + emp2.dbms);
    System.out.println("����: " + emp2.tot);
    System.out.println("���: " + (int)emp2.avg);
    
    System.out.println("-----------------------------");
    
    Employee emp3 = new Employee();  // ��ü ����
    emp3.name = "���浿";
    emp3.java = 90;
    emp3.web = 90;
    emp3.dbms = 90;
    
    emp3.tot = emp3.java + emp3.web + emp3.dbms;
    emp3.avg = (emp3.tot / 3.0);
    
    System.out.println("����: " + emp3.name);
    System.out.println("JAVA: " + emp3.java);
    System.out.println("WEB: " + emp3.web);
    System.out.println("DBMS: " + emp3.dbms);
    System.out.println("����: " + emp3.tot);
    System.out.println("���: " + (int)emp3.avg);
    
  }
 
}