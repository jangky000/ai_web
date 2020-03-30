package network;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import java.net.InetAddress;
import java.net.Socket;

public class Client1 {
  
  public void client(String ip, int port) {
    Socket socket = null;        // 데이터 송수신 
    InetAddress inet = null;     // 접속 IP 정보
    
    //입력
    InputStream is = null; // 네트워크 전송
    InputStreamReader isr = null; // 한글 변환 처리
    BufferedReader br = null;   // 메모리에 기록    
    
    try {
      socket = new Socket(ip, port); // 서버에 연결 요청
      
      inet = socket.getInetAddress();
      System.out.println("접속한 서버 IP: " + inet.getHostAddress());
      
      // 입력 객체 만들기
      is = socket.getInputStream();
      isr = new InputStreamReader(is);
      br = new BufferedReader(isr);
      
      //입력 받은 값 출력
      String line = br.readLine();
      System.out.println(line);
      
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      //소켓 해제
      try { br.close(); } catch (IOException e) {  }
      try { isr.close(); } catch (IOException e) {  }
      try { is.close(); } catch (IOException e) {  }
      try { socket.close(); } catch (IOException e) {  }
    }
  }
  
}
