package network;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import java.net.InetAddress;
import java.net.Socket;

public class Client1 {
  
  public void client(String ip, int port) {
    Socket socket = null;        // ������ �ۼ��� 
    InetAddress inet = null;     // ���� IP ����
    
    //�Է�
    InputStream is = null; // ��Ʈ��ũ ����
    InputStreamReader isr = null; // �ѱ� ��ȯ ó��
    BufferedReader br = null;   // �޸𸮿� ���    
    
    try {
      socket = new Socket(ip, port); // ������ ���� ��û
      
      inet = socket.getInetAddress();
      System.out.println("������ ���� IP: " + inet.getHostAddress());
      
      // �Է� ��ü �����
      is = socket.getInputStream();
      isr = new InputStreamReader(is);
      br = new BufferedReader(isr);
      
      //�Է� ���� �� ���
      String line = br.readLine();
      System.out.println(line);
      
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      //���� ����
      try { br.close(); } catch (IOException e) {  }
      try { isr.close(); } catch (IOException e) {  }
      try { is.close(); } catch (IOException e) {  }
      try { socket.close(); } catch (IOException e) {  }
    }
  }
  
}
