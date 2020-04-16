package network;

import java.io.BufferedReader;
//import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
//import java.io.OutputStream;
//import java.io.OutputStreamWriter;

import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

public class Server2 {
  
  public void server() {
    //������ ������ �ʿ� ���� ��Ȳ -> �޼ҵ� ���� ����
    //���� �⺻�ڵ�
    ServerSocket server = null; // Client�� ���� ���� ��û�� ����.
    Socket socket = null;        // ������ �ۼ��� 
    InetAddress inet = null;     // ���� IP ����
    
    //�Է�
    InputStream is = null; // ��Ʈ��ũ ����
    InputStreamReader isr = null; // �ѱ� ��ȯ ó��
    BufferedReader br = null;   // �޸𸮿� ���    
    
    int port = 2010;
    
    try {
      server = new ServerSocket(port);
      
      while(true) {
        System.out.println("�����ڸ� ��ٸ��� ���Դϴ�.");
        socket = server.accept(); // ��� // listen()�� ������ �� ����.
        
        inet = socket.getInetAddress();
        System.out.println("���ӵ� Client IP: " + inet.getHostAddress());
        
        // �Է� ��ü �����
        is = socket.getInputStream();
        isr = new InputStreamReader(is);
        br = new BufferedReader(isr);
        
        //�Է� ���� �� ���
        String line = br.readLine();
        System.out.println(line);
        
        //���� ������ �ݴ�� ���� ����
        try { br.close(); } catch (IOException e) {  }
        try { isr.close(); } catch (IOException e) {  }
        try { is.close(); } catch (IOException e) {  }
        try { socket.close(); } catch (IOException e) {  }
        
      }
      
    } catch (IOException e) {
      e.printStackTrace();
    }
    
  }
  
}
