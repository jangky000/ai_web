package oop;
 
public class FieldUse {
 
   public static void main(String[] args) {
     // fieldTest: 객체, FieldTest는 클래스
      FieldTest fieldTest = new FieldTest();
      
      
      System.out.println(fieldTest.year); // 0
      System.out.println(fieldTest.product); // null

      System.out.println(fieldTest.price); // 0
      System.out.println(fieldTest.dc); // 0.0
      System.out.println(fieldTest.as); // false
      System.out.println(">" + fieldTest.grade + "<");
      System.out.println("-----------------");
      
      
      // 객체에 새로운 값 할당
      fieldTest.year = 2016;
      fieldTest.product = "노트북";
      fieldTest.price = 600000;
      fieldTest.dc = 3.5;
      fieldTest.as = true;
      fieldTest.grade = 'A';
      
      System.out.println(fieldTest.year); 
      System.out.println(fieldTest.product); 
      System.out.println(fieldTest.price);
      System.out.println(fieldTest.dc);
      System.out.println(fieldTest.as);
      System.out.println(fieldTest.grade);
      
   }
 
}