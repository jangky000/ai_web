package test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;

public class File_INOUT {

  public static void main(String[] args) {
    File src = new File("C:/ai6/io/data.txt");
    File dest = new File("C:/ai6/io/data2.txt");
    
    FileReader fr = null;
    BufferedReader br = null;
    
    FileWriter fw = null;
    PrintWriter pw = null;
    
    try {
      fr = new FileReader(src);
      br = new BufferedReader(fr);

      fw = new FileWriter(dest);
      pw = new PrintWriter(fw);
      
      while(true) {
        String line = br.readLine();
        if(line == null) break;
        
//        System.out.println(line);
        StringTokenizer token = new StringTokenizer(line, ",");
        while(token.hasMoreElements()) {
          pw.println(token.nextToken().trim());
          
        }
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try { pw.close(); } catch (Exception e) {}
      try { fw.close(); } catch (IOException e) {}
      try { br.close(); } catch (IOException e) {}
      try { fr.close(); } catch (IOException e) {}
    }
    
    

  }

}
