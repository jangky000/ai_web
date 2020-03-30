package oop3;

import java.io.File;

public class Folder2 {

  public static void main(String[] args) {
    File folder = new File("C:/ai6/test");
    
    boolean sw = folder.mkdirs();// ������ ������ ������ ���� �ȵ�
    if(sw) {
      System.out.println("1) ���� ����: " + sw);
    }
    
    File src = new File("C:/ai6/test");
    File dest = new File("C:/ai6/test_2019");
    sw = src.renameTo(dest);
    System.out.println("2) ������ ����: " + sw);
    
    sw = dest.delete();
    System.out.println("3) ���� ����: " + sw);
    
    System.out.println("4) ���� ���");
    File swiss = new File("C:/ai6/swiss");
    File[] files = swiss.listFiles();
//    for (int i = 0; i < files.length; i++) {
//      File file = files[i];
//      System.out.println(file.getName() + "(" + file.length() +")");
//    }
    
    System.out.println("-----------------");
    //for each ���, ���ο� ���� ���
//    for(File file: files) {
//      if(file.isFile()) { //������ �ƴ� ���ϸ� ���
//        System.out.println(file.getName() + "(" + file.length() +")");
//      }
//    }
    
//    for (int i = 0; i < 5; i++) {
//      File file = files[i];
//      if(file.isFile()) {
//        System.out.println(file.getName() + "(" + file.length() +")");
//      } else {
//        i--;
//      }
//    }
    
//    System.out.println("------------------------------------");
//    int cnt = 0;
//    
//    for(File file: files) {
//      if(file.isFile()) { //������ �ƴ� ���ϸ� ���
//        System.out.println(file.getName() + "(" +file.length() +")");
//        cnt++;
//      }
//      if(cnt == 5) break;
//    }
    
    System.out.println("--------------------------------------------");
    int cnt = 0;
    Tool tool = new Tool();
    
    for(int i = 2; i < files.length; i++) {
      File file = files[i];
      if(file.isFile()) { //������ �ƴ� ���ϸ� ���
        System.out.println(file.getName() + "(" + tool.unit(file.length()) +")");
        cnt++;
      }
      if(cnt == 5) break;
    }
    
  }
}
