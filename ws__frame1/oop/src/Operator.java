
public class Operator {

  public static void main(String[] args) {
   System.out.println("100�� 100%: " + (100 * 100/100) + "%");
   System.out.println("100�� 50%: " + (100 * 50/100) + "%");
   
   //����/���� -> ����
   System.out.println("100�� 50%: " + (50 / 100 * 100) + "%"); // 0
   System.out.println("100�� 50%: " + (100 *  (50 / 100) ) + "%"); // 0 
   
   System.out.println();
   
   System.out.println("255�� 1%: " + (255*1/100d) + "%");
   System.out.println("255�� 1%: " + (255*1/100.) + "%");
   System.out.println("255�� 1%: " + (255*0.01) + "%"); // �Ҽ��� ó�������� ����� ���� ���� �߻�(�Ҽ��� ǥ���ϴ� ���� ������)

   System.out.println("100�� 1.96%: " + (100*0.0196) + "%");
   System.out.println("100�� 0.15%: " + (100*0.0015) + "%");
   
   System.out.println();
   
   int year = 2020;
   year = year+1; // �ڱ� �ڽ��� ������Ű�� ���� �˰���
   System.out.println("year=" + year); // 2021
   
   year++; // 2022
   
   //�������� �ʴ� ����
   System.out.println("------------");
   int year2 = ++year;
   System.out.println("year2=" + year2);//2023
   
   int year3 = year2++; // year2�� ������ ���� year3�� �Ҵ� �� year2 ����
   System.out.println("year2= " + year2);//2024
   System.out.println("year3=" + year3); // 2023
   
   System.out.println();
   
   
   int su1 = 0;
   int su2 = 0;
   int sum = 0;
   
   sum = ++su1 + su2++; // su2�� ���� su2 ������ ���̰��� (���� ��������) 1�� ������.
//   su1 = su1 + 1;
//   sum = su1 + su2;
//   su2 = su2 + 1;
   
   System.out.println("su1: " + su1);
   System.out.println("su2: " + su2);
   System.out.println("sum: " + sum);
   
   
   
   
  }

}
