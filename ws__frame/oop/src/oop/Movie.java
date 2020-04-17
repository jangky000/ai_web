package oop;
 
public class Movie {
  //�޼ҵ� �����ε�
  public void print(String name) {
    System.out.println("��ȭ��: " + name);
    System.out.println("----------------------");
  }
  public void print(String name, String genre) {
    System.out.println("��ȭ��: " + name);
    System.out.println("��   ��: " + genre);
    System.out.println("----------------------");
  }
  
  public void print(String name, String genre, int long_time) {
    System.out.println("��ȭ��: " + name);
    System.out.println("��   ��: " + genre);
    System.out.println("��   ��: " + long_time);
    System.out.println("----------------------");
  }
  
  public void print(String name, String genre, int long_time, double score, int open) {
    System.out.println("��ȭ��: " + name);
    System.out.println("��   ��: " + genre);
    System.out.println("��   ��: " + long_time);
    System.out.println("��   ��: " + score);
    System.out.println("��   ��: " + open);
    System.out.println("----------------------");
  }
  
  public void print(String name, String[] actors) {
    System.out.println("��ȭ��: " + name);
    System.out.print("��   ��:  ");
    for(int i =0; i<actors.length; i++) {
      System.out.print(actors[i] + " ");
    }
    System.out.println();
    System.out.println("----------------------");
  }
  public void print2(String name, String[] actors) {
    System.out.println("��ȭ��: " + name);
    System.out.print("��   ��:  ");
    if(actors.length == 0) {
      System.out.println("��� ����");
    } else {
      //��� 1
      for(int i =0; i<actors.length-1; i++) {
        System.out.print(actors[i] + ", ");
      }
      System.out.println(actors[actors.length-1]);
      
      //Ȥ��(for�� if�� Ȱ��) �ǹ� �ľ��� �� ����
      for(int i =0; i<actors.length-1; i++) {
        System.out.print(actors[i]);
        if(i < actors.length - 1) {
          System.out.print(", ");
        }
      }
      
    }
    
    System.out.println("----------------------");
  }
  
}