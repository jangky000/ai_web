/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.33
 * Generated at: 2020-03-30 09:02:31 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.mail_005fapp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public final class delete_005fproc_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.sql.SQLException");
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("java.sql.ResultSet");
    _jspx_imports_classes.add("java.sql.PreparedStatement");
    _jspx_imports_classes.add("java.sql.DriverManager");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write(" \r\n");
      out.write(" <!-- MySQL에서 DBMS에 연결할때 쓰던 import 패키지와 구성이 같다. -->\r\n");
      out.write(" <!-- MovieDAO2.java 참조 -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" \r\n");
 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
int mailno = Integer.parseInt(request.getParameter("mailno"));

      out.write("\r\n");
      out.write("\r\n");

// 필요 변수 선언
Connection con = null;              // DBMS 연결
PreparedStatement pstmt = null; // SQL 실행
ResultSet rs = null;                   // SELECT 결과를 저장
StringBuffer sql = null;              // SQL 문장
int count = 0;                         // 처리된 레코드 갯수

// MYSQL
// String className = "org.gjt.mm.mysql.Driver"; // MySQL 연결 Driver 
// String url = "jdbc:mysql://172.16.12.4:3306/javadb?useUnicode=true&characterEncoding=euckr"; //데이터베이스 javadb 사용

//Oracle, jdbc 연결
String className = "oracle.jdbc.driver.OracleDriver"; // Oracle 연결 Driver 
String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"; //XE -> soldesk 등으로 달라질 수 있다.

String user = "ai6"; 
String password = "1234";

      out.write("\r\n");
      out.write(" \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>메일 앱</title>\r\n");
      out.write("<link href=\"");
      out.print(root);
      out.write("/css/style.css\" rel=\"Stylesheet\" type=\"text/css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/menu/top.jsp", out, false);
      out.write("\r\n");
      out.write("  <div class=\"title_line\">메일 앱 ver 1.0＞삭제</div>\r\n");
      out.write("  <fieldset class=\"fieldset_basic\">\r\n");
      out.write("    <!-- <legend class=\"legend_basic\">공지사항 등록</legend> -->\r\n");
      out.write("      <ul>\r\n");
      out.write("        ");

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
      //네트워크 설정에 예외처리가 필수
        try {
          Class.forName(className); // memory로 클래스를 로딩함, 객체는 생성하지 않음.
          con = DriverManager.getConnection(url, user, password ); // MySQL 연결
          
          sql = new StringBuffer();
          //SQL문 앞에 한 칸 공백 만들기 + ' ; '지우기
          sql.append(" DELETE FROM mail_app");
          sql.append(" WHERE mailno=?");           
          //StringBuffer를 문자열로 변환
          pstmt = con.prepareStatement(sql.toString());
          
          pstmt.setInt(1, mailno);
          
          //pstmt 바인딩 후에 실행
          count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE를 실행
          
        } catch (SQLException e) {
          System.out.println("SQL 실행 중 예외 발생");
          e.printStackTrace(); // 예외가 발생하기까지의 실행 과정 출력
        } catch (ClassNotFoundException e) {
          System.out.println("JDBC 드라이버가 없습니다.");
          e.printStackTrace();
        } finally {
          //try{ if (rs != null){ rs.close(); } }catch(Exception e){ }
          // 따로 에러 출력하지 않고 연결 종료
          try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
          try{ if (con != null){ con.close(); } }catch(Exception e){ }
        }
      
      if(count == 1){
        
      out.write("\r\n");
      out.write("        <li class=\"li_none\">삭제 처리에 성공했습니다.</li>\r\n");
      out.write("        ");

      } else{
        
      out.write("\r\n");
      out.write("        <li class=\"li_error\" >삭제 처리에 실패했습니다.</li>\r\n");
      out.write("        <li class=\"li_none\">다시 시도해주세요. </li>\r\n");
      out.write("        ");

      }
        
      out.write("\r\n");
      out.write("      </ul>\r\n");
      out.write("      <div class =\"bottom_menu\">\r\n");
      out.write("        <!-- onclick = \"\" javascript 연결 -->\r\n");
      out.write("        ");

        if(count == 0){
          
      out.write("\r\n");
      out.write("          <button type=\"button\" onclick=\"history.back();\">다시 시도</button>\r\n");
      out.write("          ");

        }
        
      out.write("\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("        <button type=\"button\" onclick=\"location.href = './list.jsp'\">목록</button>\r\n");
      out.write("      </div>\r\n");
      out.write("  </fieldset>\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/menu/bottom.jsp", out, false);
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
