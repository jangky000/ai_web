package jdbc;

public class MovieDAOUse2 {

  public static void main(String[] args) {
    MovieDAO2 movieDAO = new MovieDAO2();
    
//    int count = movieDAO.create("AI(��ȭ, 2001)", 9.1, "�Ҹ� ���� ������Ʈ, �ֵ� ��");
//    int count = movieDAO.update(11, "�Ǹ��� ����ٸ� �Դ´�(��ȭ, 2006)", 10.0, "�޸� ��Ʈ��, �� �켭����");
    int count = movieDAO.delete(11);
    
    if(count == 1) {
      System.out.println("���� ó��");
    } else {
      System.out.println("ó�� ����");
    }
    
  }
}
