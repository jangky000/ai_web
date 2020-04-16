
public class IfExam2 {

  public static void main(String[] args) {
    int num = Integer.parseInt(args[0]);
    String str = "";
    
    if(num == 1) str = "노트북";
    else if(num == 2) str = "무한 복합 프린터";
    else if(num == 3)  str = "512 SSD";
    else  str = "다음 기회에...";
  
    System.out.println("등수: " + num + " 상품: " + str );

  }
}
