package jdbc;

public class MovieDAOUse {

  public static void main(String[] args) {
    MovieDAO movieDAO = new MovieDAO();
//    movieDAO.create("월터의 상상은 현실이 된다(영화, 2018)", 7.9, "벤 스틸러");
//    movieDAO.create("컨저링2(영화, 2016)", 7.5, "베라 파미가");
//    movieDAO.list();
//    movieDAO.read(1);
//    movieDAO.test();
//    movieDAO.update(1, "포레스트 검프(영화, 1994)", 10.0, "톰 행크스");
    movieDAO.delete(10);
  }
}
