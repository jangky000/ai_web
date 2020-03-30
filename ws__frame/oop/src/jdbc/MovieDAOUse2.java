package jdbc;

public class MovieDAOUse2 {

  public static void main(String[] args) {
    MovieDAO2 movieDAO = new MovieDAO2();
    
//    int count = movieDAO.create("AI(영화, 2001)", 9.1, "할리 조엘 오스먼트, 주드 로");
//    int count = movieDAO.update(11, "악마는 프라다를 입는다(영화, 2006)", 10.0, "메릴 스트립, 앤 헤서웨이");
    int count = movieDAO.delete(11);
    
    if(count == 1) {
      System.out.println("정상 처리");
    } else {
      System.out.println("처리 실패");
    }
    
  }
}
