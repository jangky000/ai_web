package exam1;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.StringTokenizer;

public class Exam1 {

  public static void main(String[] args) {
    //�׸�1,2,10
    File data = new File("C:/ai6/io/data.csv");
    File data_proc = new File("C:/ai6/io/data_proc.txt");
    
    //�׸�3
    FileReader fr = null;
    BufferedReader br = null;
    FileWriter fw = null;
    PrintWriter pw = null;
    
    //�׸�9
    try {
      fr = new FileReader(data);
      br = new BufferedReader(fr);
      
      fw = new FileWriter(data_proc, false);
      pw = new PrintWriter(fw);
      
      //�׸�4
      while (true) {
        String line = br.readLine();
        if (line == null)
          break;
        else {
          System.out.println(line);
          
          //�׸�5
          StringTokenizer token = new StringTokenizer(line, ",");
          String model = token.nextToken().trim();
          String brand = token.nextToken().trim();
          String version = token.nextToken().trim();
          //�׸�6
          int origin_price = Integer.parseInt(token.nextToken().trim());
          String store = token.nextToken().trim();
          String is_used = token.nextToken().trim();
          String pickup = token.nextToken().trim();
          
          int brand_discount = 0;
          int used_discount = 0;
          int total = origin_price;
          
          //�׸�7
          if(is_used.equals("T")) {
            //60% ����
            used_discount = (int)(total*0.6);
            total = total - used_discount;
          }
          if(brand.equals("�齼")) {
            //10% ����
            brand_discount = (int)(total*0.1);
            total = total - brand_discount;
          }
          
          //�׸�8
          DecimalFormat df = new DecimalFormat("#,###,### ��");
          //�׸�10
          pw.println("�𵨸�: " + model);
          pw.println("�귣��: " + brand);
          pw.println("����: " + version);
          pw.println("����: " + store);
          pw.println("�߰� ����: " + is_used);
          pw.println("�Ⱦ�: " + pickup);
          pw.println("����: " + df.format(origin_price));
          if(used_discount != 0) {
            pw.println("�߰� ����(60%): -" + df.format(used_discount));
          }
          if(brand_discount != 0) {
            pw.println("�귣�� ����(10%): -" + df.format(brand_discount));
          }
          pw.println("���� �ݾ�: " + df.format(total));
          pw.println("-------------------------------");
          
           System.out.println(" �� complete.");
        }
      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      //�׸�9
      try { pw.close();} catch (Exception e) {}
      try { fw.close();} catch (IOException e) {}
      try { br.close();} catch (IOException e) {}
      try { fr.close();} catch (IOException e) {}
    }

  }

}
