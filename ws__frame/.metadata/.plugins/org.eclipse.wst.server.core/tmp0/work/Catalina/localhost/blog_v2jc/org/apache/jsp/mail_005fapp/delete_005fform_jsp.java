/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.33
 * Generated at: 2020-03-31 07:01:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.mail_005fapp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import nation.web.tool.DBOpen;

public final class delete_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {


 //특수 문자의 태그로 변환
public String convertChar(String str){
   return str.replace("\r\n", "<br>");
 }
 
 //특수 문자의 태그로 변환
public String convertTag(String str){
   return str.replace("<br>", "\r\n");
 }
 
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
    _jspx_imports_classes.add("nation.web.tool.DBOpen");
    _jspx_imports_classes.add("java.sql.SQLException");
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("java.sql.ResultSet");
    _jspx_imports_classes.add("java.sql.PreparedStatement");
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
      out.write("  <!-- MySQL에서 DBMS에 연결할때 쓰던 import 패키지와 구성이 같다. -->\r\n");
      out.write(" <!-- MovieDAO2.java 참조 -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" ");
      out.write("\r\n");
      out.write(" \r\n");
 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();

      out.write("\r\n");
      out.write(" \r\n");
      out.write(" ");

// 필요 변수 선언
Connection con = null;              // DBMS 연결
PreparedStatement pstmt = null; // SQL 실행
ResultSet rs = null;                   // SELECT 결과를 저장
StringBuffer sql = null;              // SQL 문장
int count = 0;                         // 처리된 레코드 갯수

String title = null;
String content = null;
String mail_to = null;
String rdate = null;

      out.write("\r\n");
      out.write("\r\n");

  // 여기서는 html과 섞이지 않게 코드를 분리하는 것이 유지보수하기에 좋다.
  int mailno = Integer.parseInt(request.getParameter("mailno"));

  try {
    con = new DBOpen().getConnection();

    sql = new StringBuffer();
    sql.append(" SELECT mailno, title, content, mail_to, rdate");
    sql.append(" FROM mail_app");
    sql.append(" WHERE mailno = ?");

    pstmt = con.prepareStatement(sql.toString());
    pstmt.setInt(1, mailno);

    rs = pstmt.executeQuery(); // SELECT문 실행: executeQuery() : return ResultSet 타입

    if (rs.next() == true) {
      // 지역변수가 되기 때문에 여기서 선언하지 않음
      title = rs.getString("title");
      content = convertTag(rs.getString("content"));
      mail_to = rs.getString("mail_to");
      rdate = rs.getString("rdate");

    } else {
      System.out.println("등록된 글이 없습니다.");
    }

  } catch (SQLException e) {
    System.out.println("SQL 실행 중 예외 발생");
    e.printStackTrace();
  } finally {
    try {
      if (rs != null) {
        rs.close();
      }
    } catch (Exception e) {
    }
    try {
      if (pstmt != null) {
        pstmt.close();
      }
    } catch (Exception e) {
    }
    try {
      if (con != null) {
        con.close();
      }
    } catch (Exception e) {
    }
  }

      out.write("\r\n");
      out.write(" \r\n");
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
      out.write("  \r\n");
      out.write("   ");

    out.print("<p>내 IP: " + request.getRemoteAddr() + "</p>");
    String my_ip = request.getRemoteAddr();
    /* out.print("<p>Remote Host: " + request.getRemoteHost() + "</p>"); */
    /* out.print("<p>X-Forwarded-For: " + request.getHeader("x-forwarded-for") + "</p>"); */
    
      out.write("\r\n");
      out.write("  \r\n");
      out.write("  <form name='frm' action='./delete_proc.jsp' method='POST'>\r\n");
      out.write("    <input type='hidden' name='mailno' value='");
      out.print( mailno );
      out.write("'>\r\n");
      out.write("    <fieldset class=\"fieldset_basic\">\r\n");
      out.write("      <!-- <legend class=\"legend_basic\">공지사항 등록</legend> -->\r\n");
      out.write("      <ul>\r\n");
      out.write("        <li class=\"li_none\">\r\n");
      out.write("          <label>제목: </label>\r\n");
      out.write("          ");
      out.print(title );
      out.write("\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"li_none\">\r\n");
      out.write("          <label>보내는 사람 IP: </label>\r\n");
      out.write("          ");
      out.print( my_ip );
      out.write("\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"li_none\">\r\n");
      out.write("          <label>받는 사람 IP: </label>\r\n");
      out.write("          ");
      out.print( mail_to);
      out.write("\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"li_none\">\r\n");
      out.write("          <label style=\"vertical-align: top;\">내용: </label>\r\n");
      out.write("          ");
      out.print(content );
      out.write("\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"li_none\">\r\n");
      out.write("          <div style=\"text-align: center;\">\r\n");
      out.write("            <p style=\"font-size: 20px; color:red; font-weight: bold;\">삭제를 진행하면 복구할 수 없습니다.</p>\r\n");
      out.write("            삭제하시겠습니까?\r\n");
      out.write("          </div>\r\n");
      out.write("        </li>\r\n");
      out.write("      </ul>\r\n");
      out.write("      <div class =\"bottom_menu\">\r\n");
      out.write("        <button type=\"submit\">삭제 진행</button>\r\n");
      out.write("        <button type=\"button\" onclick=\"location.href = './list.jsp'\">취소</button>\r\n");
      out.write("        <button type=\"button\" onclick=\"location.href = './list.jsp'\">목록</button>\r\n");
      out.write("      </div>\r\n");
      out.write("    </fieldset>\r\n");
      out.write("    \r\n");
      out.write("  </form>\r\n");
      out.write(" \r\n");
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
