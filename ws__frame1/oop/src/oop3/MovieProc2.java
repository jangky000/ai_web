package oop3;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.StringTokenizer;

public class MovieProc2 {

  public static void main(String[] args) {
    // �����쿡���� ����ϴ� ���� \
    // \\ �ι� �������� �̽������� ���ڰ� �ƴ��� �˷���
    File data = new File("C:\\ai6\\io\\movie.csv");
    File data_proc = new File("C:/ai6/io/movie_proc2.txt");

    // ���� �б�
    FileReader fr = null; // ���� �б�
    BufferedReader br = null; // �޸𸮿� ���� ���� ����

    // ���� ����
    FileWriter fw = null; // ���Ͼ���
    PrintWriter pw = null; // �޸𸮿� ���

    try {
      // FileReader�� Reader�� ��ӿ� ��� ����
      fr = new FileReader(data);
      // BufferedReader�� Reader�� ��� ����
      // ��� ���迡���� �ڽ� Ŭ������ Ÿ���� �θ� Ŭ������ Ÿ�Կ� ���Եȴ�
      br = new BufferedReader(fr);

      fw = new FileWriter(data_proc, false); // false: ���� ������ ���� �� ���� ���, true: ���� ���� �߰�(�α� ��)
      // Writer�� ��� ���� FileWriter�� ���ڷ� �Ѱ���
      pw = new PrintWriter(fw);

      while (true) {
        String line = br.readLine(); // ���Ͽ��� �ϳ��� ������ �о��
        if (line == null)
          break; // ����
        else {
          System.out.println(line);
          
//          String[] values = line.split(","); // �Ǹ��� ����ٸ� �Դ´�., A, 2, 1
//          String name = values[0]; // ��ȭ��
//          String seat = values[1]; // �¼�
//          int count = Integer.parseInt(values[2]); // ���μ� // ���� ���� �ȵ�
//          int child = Integer.parseInt(values[3]); // �л���
          StringTokenizer token = new StringTokenizer(line, ",");
          String name = token.nextToken().trim();
          String seat = token.nextToken().trim();
          int count = Integer.parseInt(token.nextToken().trim());
          int child = Integer.parseInt(token.nextToken().trim());
          
          //���� �Ƴ��� ���� ����?
          int count_price = 0; // ���� �ݾ�
          int child_price = 0; // �л� �ݾ�
          int seat_price = 0; // �¼��� �ݾ�
          int total = 0; // ���� �ݾ�
          int point = 0; // ����Ʈ
          
          if(seat.equalsIgnoreCase("A")) {
            seat_price = 11000;
          } else if(seat.equalsIgnoreCase("B")) {
            seat_price = 10000;
          } else if(seat.equalsIgnoreCase("C")) {
            seat_price = 9000;
          }
          
          count_price = seat_price*count;             // ���αݾ�
          child_price = (int)(seat_price*0.8)*child;  // �л��ݾ�
          total = count_price + child_price;            // �����ݾ�
          point = (int)(total*0.05);                         // ����Ʈ
          
          DecimalFormat df = new DecimalFormat("#,###,### ��");
          //���� ���
          pw.println("��ȭ��: " + name); // ���� ���
          pw.println("�¼�: " + seat);
          pw.println("���μ�: " + count + "��");
          pw.println("�л���: " + child + "��");
          pw.println("���� �ݾ�: " + df.format(count_price));
          pw.println("�л� �ݾ�: " + df.format(child_price));
          pw.println("���� �ݾ�: " + df.format(total));
          pw.println("����Ʈ(5%): " + df.format(point));
          pw.println("-------------------------------");
          
          //������Ʈ ���
           System.out.println(" �� complete.");
          
          
          
          
          
        }
      }

    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      // add catch clause
      e.printStackTrace();
    } finally {
      // ���� �ݱ�(���� ������ ���Ͽ� ���Ⱑ ���� �ʴ� ���� �߻�)
      // �������� �ݱ�
      // ����ó��
      try { pw.close(); } catch (Exception e2) {}
      try { fw.close(); } catch (Exception e2) {}
      try { br.close(); } catch (Exception e2) {}
      try { fr.close(); } catch (Exception e2) {}
      
      
    }


  }
}
