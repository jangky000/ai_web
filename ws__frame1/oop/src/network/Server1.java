package network;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;

import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

public class Server1 {
  
  public void server() {
    //������ ������ �ʿ� ���� ��Ȳ -> �޼ҵ� ���� ����
    //���� �⺻�ڵ�
    ServerSocket server = null; // Client�� ���� ���� ��û�� ����.
    Socket socket = null;        // ������ �ۼ��� 
    InetAddress inet = null;     // ���� IP ����
    
    //���
    OutputStream os = null; // ��Ʈ��ũ ����
    OutputStreamWriter osw = null; // �ѱ� ��ȯ ó��
    BufferedWriter bw = null;   // �޸𸮿� ���   
    
    int port = 2010;
    
    try {
      server = new ServerSocket(port);
      
      while(true) {
        System.out.println("�����ڸ� ��ٸ��� ���Դϴ�.");
        socket = server.accept(); // ��� // listen()�� ������ �� ����.
        
        inet = socket.getInetAddress();
        System.out.println("���ӵ� Client IP: " + inet.getHostAddress());
        
        //��� ��ü ����
        os = socket.getOutputStream();
        osw = new OutputStreamWriter(os);
        bw = new BufferedWriter(osw);
        
        bw.write("[��õ]"); // �޸𸮿� ���
        bw.flush(); // ����
        
        //���� ������ �ݴ�� ���� ����
        try { bw.close(); } catch (IOException e) {  }
        try { osw.close(); } catch (IOException e) {  }
        try { os.close(); } catch (IOException e) {  }
        try { socket.close(); } catch (IOException e) {  }
        
      }
      
    } catch (IOException e) {
      e.printStackTrace();
    }
    
  }
  
}
