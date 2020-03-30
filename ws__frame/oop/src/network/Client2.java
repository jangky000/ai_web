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
    Socket socket = null;        // ������ �ۼ��� 
    InetAddress inet = null;     // ���� IP ����
    
    //���
    OutputStream os = null; // ��Ʈ��ũ ����
    OutputStreamWriter osw = null; // �ѱ� ��ȯ ó��
    BufferedWriter bw = null;   // �޸𸮿� ���    
    
    try {
      socket = new Socket(ip, port); // ������ ���� ��û
      
      inet = socket.getInetAddress();
      System.out.println("������ ���� IP: " + inet.getHostAddress());
      
      //��� ��ü ����
      os = socket.getOutputStream();
      osw = new OutputStreamWriter(os);
      bw = new BufferedWriter(osw);
      
      bw.write("����������������"); // �޸𸮿� ���
      bw.flush(); // ����
      
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      //���� ����
      try { bw.close(); } catch (IOException e) {  }
      try { osw.close(); } catch (IOException e) {  }
      try { os.close(); } catch (IOException e) {  }
      try { socket.close(); } catch (IOException e) {  }
    }
  }
  
}
