
public class Operator {

  public static void main(String[] args) {
   System.out.println("100의 100%: " + (100 * 100/100) + "%");
   System.out.println("100의 50%: " + (100 * 50/100) + "%");
   
   //정수/정수 -> 정수
   System.out.println("100의 50%: " + (50 / 100 * 100) + "%"); // 0
   System.out.println("100의 50%: " + (100 *  (50 / 100) ) + "%"); // 0 
   
   System.out.println();
   
   System.out.println("255의 1%: " + (255*1/100d) + "%");
   System.out.println("255의 1%: " + (255*1/100.) + "%");
   System.out.println("255의 1%: " + (255*0.01) + "%"); // 소수를 처리함으로 생기는 작은 오차 발생(소수를 표현하는 구조 때문에)

   System.out.println("100의 1.96%: " + (100*0.0196) + "%");
   System.out.println("100의 0.15%: " + (100*0.0015) + "%");
   
   System.out.println();
   
   int year = 2020;
   year = year+1; // 자기 자신을 증가시키는 증가 알고리즘
   System.out.println("year=" + year); // 2021
   
   year++; // 2022
   
   //권장하지 않는 유형
   System.out.println("------------");
   int year2 = ++year;
   System.out.println("year2=" + year2);//2023
   
   int year3 = year2++; // year2의 변수의 값을 year3에 할당 후 year2 증가
   System.out.println("year2= " + year2);//2024
   System.out.println("year3=" + year3); // 2023
   
   System.out.println();
   
   
   int su1 = 0;
   int su2 = 0;
   int sum = 0;
   
   sum = ++su1 + su2++; // su2는 먼저 su2 변수가 쓰이고나서 (가장 마지막에) 1이 증가됨.
//   su1 = su1 + 1;
//   sum = su1 + su2;
//   su2 = su2 + 1;
   
   System.out.println("su1: " + su1);
   System.out.println("su2: " + su2);
   System.out.println("sum: " + sum);
   
   
   
   
  }

}
