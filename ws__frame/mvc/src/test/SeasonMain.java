package test;

public class SeasonMain {

  public static void main(String[] args) {
    
    //�Ϲ������� ��� ��� ����
    //�θ� Ŭ������ (�߻� Ŭ���� or �������̽�)�� ��쿡 �θ� ��ü�� ������ �� ���� ���� �ִ�. -> �׷��� �ڽ� ��ü�� �θ� ��ü�� �Ҵ� 
    Season season = new Season();
    season.print();
    
    //�θ� Ÿ�Կ� �ڽ� ��ü�� �Ҵ�
    Spring spring1 = new Spring();
    Season season1 = spring1;
    season1.print(); // spring! ��� / Ÿ���� Season, ��ü�� Spring�� �ν��Ͻ�
    
    //�ڽ� Ÿ�Կ� �θ� ��ü�� �Ҵ� -> ����
    //Season season2 = new Season();
    //Spring spring2 = (Spring)season2; // ���� �߻�: Exception in thread "main" java.lang.ClassCastException: test.Season cannot be cast to test.Spring at test.SeasonMain.main(SeasonMain.java:11)
    //spring2.print(); 
    
    //Season Ÿ���� Spring��ü�� (Spring���� ����ȯ�Ͽ�)Spring Ÿ�Կ� �Ҵ�
    Season season3 = new Spring();
    Spring spring3 = (Spring)season3; 
    spring3.print(); // Spring! ���, Ÿ���� Spring, ��ü�� Spring�� �ν��Ͻ�

    }

}