package oop3;

import java.util.StringTokenizer;

public class Token2 {

  public static void main(String[] args) {
    StringTokenizer st = new StringTokenizer("��, ,����,�ܿ�", ","); // ���ڰ� ������ ����, ���鵵 ����
    int count = st.countTokens();
    System.out.println(count);
    
    // ����� ���� �ܾ �����ϴ��� �˻�, ���� ��� ������ true, �ƴϸ� false
    while(st.hasMoreTokens()) { 
      System.out.println(st.nextToken());  // �ܾ� ����
    }
    
  }

}