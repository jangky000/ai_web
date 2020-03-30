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
    //변수의 공유가 필요 없는 상황 -> 메소드 내에 선언
    //서버 기본코드
    ServerSocket server = null; // Client의 최초 접속 요청을 받음.
    Socket socket = null;        // 데이터 송수신 
    InetAddress inet = null;     // 접속 IP 정보
    
    //입력
    InputStream is = null; // 네트워크 전송
    InputStreamReader isr = null; // 한글 변환 처리
    BufferedReader br = null;   // 메모리에 기록    
    
    int port = 2010;
    
    try {
      server = new ServerSocket(port);
      
      while(true) {
        System.out.println("접속자를 기다리는 중입니다.");
        socket = server.accept(); // 대기 // listen()과 합쳐진 것 같다.
        
        inet = socket.getInetAddress();
        System.out.println("접속된 Client IP: " + inet.getHostAddress());
        
        // 입력 객체 만들기
        is = socket.getInputStream();
        isr = new InputStreamReader(is);
        br = new BufferedReader(isr);
        
        //입력 받은 값 출력
        String line = br.readLine();
        System.out.println(line);
        
        //생성 순서의 반대로 연결 해제
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
