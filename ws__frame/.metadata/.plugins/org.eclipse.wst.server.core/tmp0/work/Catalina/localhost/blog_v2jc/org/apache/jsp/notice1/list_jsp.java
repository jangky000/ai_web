/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.33
 * Generated at: 2020-03-31 07:12:20 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.notice1;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" \r\n");
 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath(); 

      out.write("\r\n");
      out.write("\r\n");

Connection con = null;              // DBMS 연결
PreparedStatement pstmt = null; // SQL 실행
ResultSet rs = null;                   // SELECT 결과를 저장
StringBuffer sql = null;              // SQL 문장
int count = 0;                         // 처리된 레코드 갯수

// MySQL
// String className = "org.gjt.mm.mysql.Driver"; // MySQL 연결 Drvier 
// String url = "jdbc:mysql://172.16.12.7:3306/javadb?useUnicode=true&characterEncoding=euckr"; 

// Oracle
String className = "oracle.jdbc.driver.OracleDriver"; // Oracle 연결 Drvier 
String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"; 

String user = "ai6"; 
String password = "1234";

      out.write(" \r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title></title>\r\n");
      out.write("<link href=\"");
      out.print(root);
      out.write("/css/style.css\" rel=\"Stylesheet\" type=\"text/css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/menu/top.jsp", out, false);
      out.write("\r\n");
      out.write("  <DIV class=\"title_line\">공지사항 ver 1.0 </DIV>\r\n");
      out.write("  <DIV class=\"sub_menu\">\r\n");
      out.write("    <button type=\"button\" onclick=\"location.href='./create_form.jsp'\">등록</button>\r\n");
      out.write("  </DIV>\r\n");
      out.write("  <TABLE class=\"table_basic\">\r\n");
      out.write("    <colgroup>\r\n");
      out.write("      <col style=\"width: 5%;\">\r\n");
      out.write("      <col style=\"width: 50%;\">\r\n");
      out.write("      <col style=\"width: 12%;\">\r\n");
      out.write("      <col style=\"width: 18%;\">\r\n");
      out.write("      <col style=\"width: 15%;\">\r\n");
      out.write("    </colgroup>\r\n");
      out.write("    <thead>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <th class=\"th_basic\">NO</th>\r\n");
      out.write("        <th class=\"th_basic\">제목</th>\r\n");
      out.write("        <th class=\"th_basic\">성명</th> \r\n");
      out.write("        <th class=\"th_basic\">등록일</th>\r\n");
      out.write("        <th class=\"th_basic\">기타</th>\r\n");
      out.write("      </tr>\r\n");
      out.write("    </thead>\r\n");
      out.write("    <tbody>\r\n");
      out.write("    ");

    try {
      Class.forName(className); // memory로 클래스를 로딩함, 객체는 생성하지 않음.
      con = DriverManager.getConnection(url, user, password ); // MySQL 연결
      
      sql = new StringBuffer();
      sql.append(" SELECT noticeno, title, content, rname, passwd, rdate");
      sql.append(" FROM notice"); 
      sql.append(" ORDER BY noticeno DESC");
      
      pstmt = con.prepareStatement(sql.toString());
      
      rs = pstmt.executeQuery(); // SELECT

      while(true) {
        if (rs.next() == true) { // 첫번째 레코드 -> 마지막 레코드로 이동
        
      out.write("\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td class=\"td_basic\">");
      out.print(rs.getInt("noticeno") );
      out.write("</td>\r\n");
      out.write("            <td class=\"td_left\"><A href=\"./read.jsp?noticeno=");
      out.print(rs.getInt("noticeno") );
      out.write('"');
      out.write('>');
      out.print(rs.getString("title") );
      out.write("</A></td>\r\n");
      out.write("            <td class=\"td_basic\">");
      out.print(rs.getString("rname") );
      out.write("</td>\r\n");
      out.write("            <td class=\"td_basic\">");
      out.print(rs.getString("rdate").substring(0, 10) );
      out.write("</td>\r\n");
      out.write("            <td class=\"td_basic\">\r\n");
      out.write("              <A href=\"./update_form.jsp?noticeno=");
      out.print(rs.getInt("noticeno") );
      out.write("\">수정</A> \r\n");
      out.write("              / \r\n");
      out.write("              <A href=\"./delete_form.jsp?noticeno=");
      out.print(rs.getInt("noticeno") );
      out.write("\">삭제</A></td>\r\n");
      out.write("          </tr>\r\n");
      out.write("        ");

        } else {
          break;
        }
      }
      
    } catch (SQLException e) {
      System.out.println("SQL 실행중 예외 발생");
      e.printStackTrace(); // 예외가 발생하기까지의 실행과정을 출력
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC 드라이버가 없는것 같습니다.");
      e.printStackTrace();
    } finally {
      try{ if (rs != null){ rs.close(); } }catch(Exception e){ }
      try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
      try{ if (con != null){ con.close(); } }catch(Exception e){ }
    }     
    
      out.write("\r\n");
      out.write("    </tbody>\r\n");
      out.write("  </TABLE> \r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/menu/bottom.jsp", out, false);
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
