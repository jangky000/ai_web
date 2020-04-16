package oop;
 
public class MovieMain {
 
  public static void main(String[] args) {
    Movie movie = new Movie();
    movie.print("검은 사제들");
    movie.print("더 라이트", "퇴마");
    movie.print("엑소시스트", "퇴마",  120);
    movie.print("컨저링2", "퇴마", 131, 7.6, 2016);
    
    String[] Exit = { "조정석", "윤아", "고두심", "박인환", "김지영"};
//    String[] Exit = new String[5];
//    Exit[0] = "조정석";
//    Exit[1] = "윤아";
//    Exit[2] = "고두심";
//    Exit[3] = "박인환";
//    Exit[4] = "김지영";
    
    String[] flower = {"조정석", "윤시윤", "한예리", "최무성"};
//    String[] flower = new String[4];
//    flower[0] = "조정석";
//    flower[1] = "윤시윤";
//    flower[2] = "한예리";
//    flower[3] = "최무성";
    
    movie.print("Exit", Exit);
    movie.print("녹두꽃", flower);
    
    movie.print2("Exit", Exit);
    movie.print2("녹두꽃", flower);
    
    
    String[] ac1 = {"벤스틸러", "크리스튼 위그"};
    String[] ac2 = {"벤틀리"};
    String[] ac3 = {};
    movie.print2("윌터", ac1);
    movie.print2("영화", ac2);
    movie.print2("영화", ac3);
    
    
  }
 
}
  