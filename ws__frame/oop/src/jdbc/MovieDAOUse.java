package jdbc;

public class MovieDAOUse {

  public static void main(String[] args) {
    MovieDAO movieDAO = new MovieDAO();
//    movieDAO.create("������ ����� ������ �ȴ�(��ȭ, 2018)", 7.9, "�� ��ƿ��");
//    movieDAO.create("������2(��ȭ, 2016)", 7.5, "���� �Ĺ̰�");
//    movieDAO.list();
//    movieDAO.read(1);
//    movieDAO.test();
//    movieDAO.update(1, "������Ʈ ����(��ȭ, 1994)", 10.0, "�� ��ũ��");
    movieDAO.delete(10);
  }
}
