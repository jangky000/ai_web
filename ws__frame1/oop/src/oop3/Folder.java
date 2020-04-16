package oop3;

import java.io.File;

public class Folder {

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
    for (int i = 0; i < files.length; i++) {
      File file = files[i];
      System.out.println(file.getName() + "(" + file.length() +")");
    }
    
    System.out.println("-----------------");
    //for each ���, ���ο� ���� ���
    for(File file: files) {
      if(file.isFile()) { //������ �ƴ� ���ϸ� ���
        System.out.println(file.getName() + "(" + file.length() +")");
      }
    }
  }

}
