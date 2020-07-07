package test;
 
import java.sql.Connection;
 
import javax.inject.Inject;
import javax.sql.DataSource;
 
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
  locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"}) // xml 검증
public class DataSourceTest {
 
  // java에서 지원하는 객체 주입 어노테이션(객체 자동 할당)
  @Inject
  private DataSource ds;
  
  @Test
  public void testConection() throws Exception{
    
    try {
      Connection con = ds.getConnection();
      System.out.println("데이터베이스 객체 Hashcode: " + con.hashCode());
      
    }catch(Exception e){
      e.printStackTrace();
    }
  }
}