package test;

public class SeasonInterMain {

  public static void main(String[] args) {
    // 인터페이스는 객체 생성 불가
    // SeasonInter inter = new SeasonInter(); // Cannot instantiate the type SeasonInter
    SeasonInter inter = new SpringImpl();
    inter.season();
    
    SpringImpl impl = (SpringImpl)inter;
    impl.season();
    impl.spring();
   
  }

}
