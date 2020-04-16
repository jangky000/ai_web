package oop3;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.StringTokenizer;

public class MovieProc2 {

  public static void main(String[] args) {
    // 윈도우에서만 사용하는 형식 \
    // \\ 두번 써줌으로 이스케이프 문자가 아님을 알려줌
    File data = new File("C:\\ai6\\io\\movie.csv");
    File data_proc = new File("C:/ai6/io/movie_proc2.txt");

    // 파일 읽기
    FileReader fr = null; // 파일 읽기
    BufferedReader br = null; // 메모리에 읽은 파일 저장

    // 파일 쓰기
    FileWriter fw = null; // 파일쓰기
    PrintWriter pw = null; // 메모리에 기록

    try {
      // FileReader는 Reader와 상속에 상속 관계
      fr = new FileReader(data);
      // BufferedReader는 Reader의 상속 관계
      // 상속 관계에서는 자식 클래스의 타입이 부모 클래스의 타입에 포함된다
      br = new BufferedReader(fr);

      fw = new FileWriter(data_proc, false); // false: 기존 내용을 삭제 후 새로 기록, true: 파일 끝에 추가(로그 등)
      // Writer를 상속 받은 FileWriter를 인자로 넘겨줌
      pw = new PrintWriter(fw);

      while (true) {
        String line = br.readLine(); // 파일에서 하나의 라인을 읽어옴
        if (line == null)
          break; // 종료
        else {
          System.out.println(line);
          
//          String[] values = line.split(","); // 악마는 프라다를 입는다., A, 2, 1
//          String name = values[0]; // 영화명
//          String seat = values[1]; // 좌석
//          int count = Integer.parseInt(values[2]); // 성인수 // 공백 들어가면 안됨
//          int child = Integer.parseInt(values[3]); // 학생수
          StringTokenizer token = new StringTokenizer(line, ",");
          String name = token.nextToken().trim();
          String seat = token.nextToken().trim();
          int count = Integer.parseInt(token.nextToken().trim());
          int child = Integer.parseInt(token.nextToken().trim());
          
          //변수 아끼지 말고 선언?
          int count_price = 0; // 성인 금액
          int child_price = 0; // 학생 금액
          int seat_price = 0; // 좌석당 금액
          int total = 0; // 결제 금액
          int point = 0; // 포인트
          
          if(seat.equalsIgnoreCase("A")) {
            seat_price = 11000;
          } else if(seat.equalsIgnoreCase("B")) {
            seat_price = 10000;
          } else if(seat.equalsIgnoreCase("C")) {
            seat_price = 9000;
          }
          
          count_price = seat_price*count;             // 성인금액
          child_price = (int)(seat_price*0.8)*child;  // 학생금액
          total = count_price + child_price;            // 결제금액
          point = (int)(total*0.05);                         // 포인트
          
          DecimalFormat df = new DecimalFormat("#,###,### 원");
          //파일 출력
          pw.println("영화명: " + name); // 파일 기록
          pw.println("좌석: " + seat);
          pw.println("성인수: " + count + "명");
          pw.println("학생수: " + child + "명");
          pw.println("성인 금액: " + df.format(count_price));
          pw.println("학생 금액: " + df.format(child_price));
          pw.println("결재 금액: " + df.format(total));
          pw.println("포인트(5%): " + df.format(point));
          pw.println("-------------------------------");
          
          //프롬프트 출력
           System.out.println(" → complete.");
          
          
          
          
          
        }
      }

    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      // add catch clause
      e.printStackTrace();
    } finally {
      // 파일 닫기(닫지 않으면 파일에 쓰기가 되지 않는 오류 발생)
      // 역순으로 닫기
      // 예외처리
      try { pw.close(); } catch (Exception e2) {}
      try { fw.close(); } catch (Exception e2) {}
      try { br.close(); } catch (Exception e2) {}
      try { fr.close(); } catch (Exception e2) {}
      
      
    }


  }
}
