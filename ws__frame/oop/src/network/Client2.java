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
    Socket socket = null;        // 데이터 송수신 
    InetAddress inet = null;     // 접속 IP 정보
    
    //출력
    OutputStream os = null; // 네트워크 전송
    OutputStreamWriter osw = null; // 한글 변환 처리
    BufferedWriter bw = null;   // 메모리에 기록    
    
    try {
      socket = new Socket(ip, port); // 서버에 연결 요청
      
      inet = socket.getInetAddress();
      System.out.println("접속한 서버 IP: " + inet.getHostAddress());
      
      //출력 객체 생성
      os = socket.getOutputStream();
      osw = new OutputStreamWriter(os);
      bw = new BufferedWriter(osw);
      
      bw.write("ㅁㄴㅇㅁㄴㅇㅁㄴ"); // 메모리에 기록
      bw.flush(); // 전송
      
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      //소켓 해제
      try { bw.close(); } catch (IOException e) {  }
      try { osw.close(); } catch (IOException e) {  }
      try { os.close(); } catch (IOException e) {  }
      try { socket.close(); } catch (IOException e) {  }
    }
  }
  
}
