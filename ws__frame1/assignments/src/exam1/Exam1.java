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
    //항목1,2,10
    File data = new File("C:/ai6/io/data.csv");
    File data_proc = new File("C:/ai6/io/data_proc.txt");
    
    //항목3
    FileReader fr = null;
    BufferedReader br = null;
    FileWriter fw = null;
    PrintWriter pw = null;
    
    //항목9
    try {
      fr = new FileReader(data);
      br = new BufferedReader(fr);
      
      fw = new FileWriter(data_proc, false);
      pw = new PrintWriter(fw);
      
      //항목4
      while (true) {
        String line = br.readLine();
        if (line == null)
          break;
        else {
          System.out.println(line);
          
          //항목5
          StringTokenizer token = new StringTokenizer(line, ",");
          String model = token.nextToken().trim();
          String brand = token.nextToken().trim();
          String version = token.nextToken().trim();
          //항목6
          int origin_price = Integer.parseInt(token.nextToken().trim());
          String store = token.nextToken().trim();
          String is_used = token.nextToken().trim();
          String pickup = token.nextToken().trim();
          
          int brand_discount = 0;
          int used_discount = 0;
          int total = origin_price;
          
          //항목7
          if(is_used.equals("T")) {
            //60% 할인
            used_discount = (int)(total*0.6);
            total = total - used_discount;
          }
          if(brand.equals("깁슨")) {
            //10% 할인
            brand_discount = (int)(total*0.1);
            total = total - brand_discount;
          }
          
          //항목8
          DecimalFormat df = new DecimalFormat("#,###,### 원");
          //항목10
          pw.println("모델명: " + model);
          pw.println("브랜드: " + brand);
          pw.println("버전: " + version);
          pw.println("매장: " + store);
          pw.println("중고 여부: " + is_used);
          pw.println("픽업: " + pickup);
          pw.println("원가: " + df.format(origin_price));
          if(used_discount != 0) {
            pw.println("중고 할인(60%): -" + df.format(used_discount));
          }
          if(brand_discount != 0) {
            pw.println("브랜드 할인(10%): -" + df.format(brand_discount));
          }
          pw.println("결제 금액: " + df.format(total));
          pw.println("-------------------------------");
          
           System.out.println(" → complete.");
        }
      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      //항목9
      try { pw.close();} catch (Exception e) {}
      try { fw.close();} catch (IOException e) {}
      try { br.close();} catch (IOException e) {}
      try { fr.close();} catch (IOException e) {}
    }

  }

}
