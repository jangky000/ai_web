package network;

//import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
//import java.io.InputStream;
//import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;

public class Client2 {
  
  public void client(String ip, int port) {
    Socket socket = null;        // 汽戚斗 勺呪重 
    InetAddress inet = null;     // 羨紗 IP 舛左
    
    //窒径
    OutputStream os = null; // 革闘趨滴 穿勺
    OutputStreamWriter osw = null; // 廃越 痕発 坦軒
    BufferedWriter bw = null;   // 五乞軒拭 奄系    
    
    try {
      socket = new Socket(ip, port); // 辞獄拭 尻衣 推短
      
      inet = socket.getInetAddress();
      System.out.println("羨紗廃 辞獄 IP: " + inet.getHostAddress());
      
      //窒径 梓端 持失
      os = socket.getOutputStream();
      osw = new OutputStreamWriter(os);
      bw = new BufferedWriter(osw);
      
      bw.write("けいしけいしけい"); // 五乞軒拭 奄系
      bw.flush(); // 穿勺
      
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      //社掴 背薦
      try { bw.close(); } catch (IOException e) {  }
      try { osw.close(); } catch (IOException e) {  }
      try { os.close(); } catch (IOException e) {  }
      try { socket.close(); } catch (IOException e) {  }
    }
  }
  
}
