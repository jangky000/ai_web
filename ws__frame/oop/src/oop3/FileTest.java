package oop3;

import java.io.File;
import java.io.IOException;

public class FileTest {
  public static void main(String[] args) throws IOException {
    //"C:/ai6/swiss/sw01.jpg"�� �߻� ���, (�ִ��� ������ �𸣱� ����)
    File file = new File("C:/ai6/swiss/sw01.jpg");
    
    if(file.exists()) {
      System.out.println("1) ���� ����");
    } else {
      System.out.println("1) ���� ����");
    }
    
    String name = file.getName();
    System.out.println("2) ���� ���� �̸�: " + name);
    
    long file_size = file.length();
    System.out.println("3) ����ũ��: " + file_size);
    
    System.out.println("4) ���� ���: " + file.getAbsoluteFile() );
    System.out.println(" - " + file.getAbsolutePath() );
    
    System.out.println("5) ���� ����" + file.getParent());
    
    boolean sw = file.isFile();
    System.out.println("6) �������� �˻�: " + sw);
    
    //���ϸ� ���� src -> dest
    File src = new File("C:/ai6/swiss/sw03.jpg");
    File dest = new File("C:/ai6/swiss/sw03_x.jpg");
    // call by reference
    sw = src.renameTo(dest);
    System.out.println("7) ���ϸ� ����: " + sw);
    
    //���� ����
    File fdel = new File("C:/ai6/swiss/sw04.jpg");
    sw = fdel.delete();
    System.out.println("5) ���� ����: " + sw);
    
    //Ȯ���� Ȯ��
    file = new File("C:/ai6/swiss/sw06.JPG");
    name = file.getName().toLowerCase();
    if(name.endsWith("jpg") || name.endsWith("png") || name.endsWith("gif")){
      System.out.println("�̹��� �����Դϴ�.");
    }
    
    // ���� ����
    // IOException ����ó�� �ʿ�
    File nfile = new File("C:/ai6/io/data.txt"); // �̸� io ���� ������ ��
    sw = nfile.createNewFile(); //  ������ ������ ������ ���� �Ұ�
    if(sw) {
      System.out.println("10) ���� ����");
    }
    
    File src2 = new File("C:/ai6/swiss/sw10.jpg");
    File dest2 = new File("C:/ai6/io/sw10.jpg");
    // ���� ������ �̸� ����, ������ �ٸ��� �̵�
    // �̵��� ���� ���� �̸��� ������ ������ �̵��̾ȵ�.
    // �̵��� ���� ���� �̸��� ������ �ִ��� �˻�
    if (dest2.exists() == true) {
      System.out.println("11) ���� �̸��� ������ ����");
    } else {
      sw = src2.renameTo(dest2);  
      if (sw == true) {
        System.out.println("12) ���� �̵�");
      }
      
      if(dest2.exists()) {
        System.out.println("13) ���� �̵� Ȯ�ε�.");
      }
    }
  }
}
