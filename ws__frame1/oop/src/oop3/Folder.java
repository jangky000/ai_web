package oop3;

import java.io.File;

public class Folder {

  public static void main(String[] args) {
    File folder = new File("C:/ai6/test");
    
    boolean sw = folder.mkdirs();// 기존에 폴더가 있으면 생성 안됨
    if(sw) {
      System.out.println("1) 폴더 생성: " + sw);
    }
    
    File src = new File("C:/ai6/test");
    File dest = new File("C:/ai6/test_2019");
    sw = src.renameTo(dest);
    System.out.println("2) 폴더명 변경: " + sw);
    
    sw = dest.delete();
    System.out.println("3) 폴더 삭제: " + sw);
    
    System.out.println("4) 파일 목록");
    File swiss = new File("C:/ai6/swiss");
    File[] files = swiss.listFiles();
    for (int i = 0; i < files.length; i++) {
      File file = files[i];
      System.out.println(file.getName() + "(" + file.length() +")");
    }
    
    System.out.println("-----------------");
    //for each 방식, 새로운 루프 방법
    for(File file: files) {
      if(file.isFile()) { //폴더가 아닌 파일만 출력
        System.out.println(file.getName() + "(" + file.length() +")");
      }
    }
  }

}
