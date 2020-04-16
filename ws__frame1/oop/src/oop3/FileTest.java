package oop3;

import java.io.File;
import java.io.IOException;

public class FileTest {
  public static void main(String[] args) throws IOException {
    //"C:/ai6/swiss/sw01.jpg"는 추상 경로, (있는지 없는지 모르기 때문)
    File file = new File("C:/ai6/swiss/sw01.jpg");
    
    if(file.exists()) {
      System.out.println("1) 파일 존재");
    } else {
      System.out.println("1) 파일 없음");
    }
    
    String name = file.getName();
    System.out.println("2) 순수 파일 이름: " + name);
    
    long file_size = file.length();
    System.out.println("3) 파일크기: " + file_size);
    
    System.out.println("4) 절대 경로: " + file.getAbsoluteFile() );
    System.out.println(" - " + file.getAbsolutePath() );
    
    System.out.println("5) 현재 폴더" + file.getParent());
    
    boolean sw = file.isFile();
    System.out.println("6) 파일인지 검사: " + sw);
    
    //파일명 변경 src -> dest
    File src = new File("C:/ai6/swiss/sw03.jpg");
    File dest = new File("C:/ai6/swiss/sw03_x.jpg");
    // call by reference
    sw = src.renameTo(dest);
    System.out.println("7) 파일명 변경: " + sw);
    
    //파일 삭제
    File fdel = new File("C:/ai6/swiss/sw04.jpg");
    sw = fdel.delete();
    System.out.println("5) 파일 삭제: " + sw);
    
    //확장자 확인
    file = new File("C:/ai6/swiss/sw06.JPG");
    name = file.getName().toLowerCase();
    if(name.endsWith("jpg") || name.endsWith("png") || name.endsWith("gif")){
      System.out.println("이미지 파일입니다.");
    }
    
    // 파일 생성
    // IOException 예외처리 필요
    File nfile = new File("C:/ai6/io/data.txt"); // 미리 io 폴더 생성할 것
    sw = nfile.createNewFile(); //  기존에 파일이 있으면 생성 불가
    if(sw) {
      System.out.println("10) 파일 생성");
    }
    
    File src2 = new File("C:/ai6/swiss/sw10.jpg");
    File dest2 = new File("C:/ai6/io/sw10.jpg");
    // 같은 폴더는 이름 변경, 폴더가 다르면 이동
    // 이동할 곳에 같은 이름의 파일이 있으면 이동이안됨.
    // 이동할 곳에 같은 이름의 파일이 있는지 검사
    if (dest2.exists() == true) {
      System.out.println("11) 같은 이름의 파일이 존재");
    } else {
      sw = src2.renameTo(dest2);  
      if (sw == true) {
        System.out.println("12) 파일 이동");
      }
      
      if(dest2.exists()) {
        System.out.println("13) 파일 이동 확인됨.");
      }
    }
  }
}
