package test;

public class SeasonInterMain {

  public static void main(String[] args) {
    // �������̽��� ��ü ���� �Ұ�
    // SeasonInter inter = new SeasonInter(); // Cannot instantiate the type SeasonInter
    SeasonInter inter = new SpringImpl();
    inter.season();
    
    SpringImpl impl = (SpringImpl)inter;
    impl.season();
    impl.spring();
   
  }

}