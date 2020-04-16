package oop4;
 
public class Employee2Use {
 /**
  * oop에서 권장하는 패턴, private
  * @param args
  */
  public static void main(String[] args) {
    Employee2 emp1 = new Employee2();
    // 클래스를 private로 선언함으로써 직접 필드에 접근할 수 없다.
    //-> 개발자가 접근하는 것을 막음 -> 코드 간 간섭을 줄임, 컴포넌트 독립성을 강화
    // emp1.name = "아로미";  // The field Employee2.name is not visible

    Employee2 emp2 = new Employee2("왕눈이", 68, 75, 89);  // 객체 생성
    // 변수에 접근이 불가능함으로 처리 로직 구현
    emp2.calc();
    emp2.print();
  }
 
}