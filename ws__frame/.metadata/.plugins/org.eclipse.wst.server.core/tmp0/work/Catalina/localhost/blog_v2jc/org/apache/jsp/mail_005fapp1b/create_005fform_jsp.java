/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.33
 * Generated at: 2020-04-03 02:55:54 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.mail_005fapp1b;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class create_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = null;
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
 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();

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
      out.write("  <div class=\"title_line\">메일 앱 ver 1.0b＞보내기</div>\r\n");
      out.write("  \r\n");
      out.write("   ");

    out.print("<p>내 IP: " + request.getRemoteAddr() + "</p>");
    String my_ip = request.getRemoteAddr();
    /* out.print("<p>Remote Host: " + request.getRemoteHost() + "</p>"); */
    /* out.print("<p>X-Forwarded-For: " + request.getHeader("x-forwarded-for") + "</p>"); */
    
      out.write("\r\n");
      out.write("  \r\n");
      out.write("  <form name='frm' action='./create_proc.jsp' method='POST'>\r\n");
      out.write("    <fieldset class=\"fieldset_basic\">\r\n");
      out.write("      <!-- <legend class=\"legend_basic\">공지사항 등록</legend> -->\r\n");
      out.write("      <ul>\r\n");
      out.write("        <li class=\"li_none\">\r\n");
      out.write("          <label>제목: </label>\r\n");
      out.write("          <input class=\"input_basic\" type=\"text\" name=\"title\" style=\"width: 80%;\" autofocus=\"autofocus\">\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"li_none\">\r\n");
      out.write("          <label>보내는 사람 IP: </label>\r\n");
      out.write("          <input class=\"input_basic\" type=\"text\" name=\"mail_from\"  value=\"");
      out.print( my_ip );
      out.write("\" style=\"width: 200px;\" readonly=\"readonly\">\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"li_none\">\r\n");
      out.write("          <label>받는 사람 IP: </label>\r\n");
      out.write("          <input class=\"input_basic\" type=\"text\" name=\"mail_to\" style=\"width: 200px;\">\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"li_none\">\r\n");
      out.write("          <label style=\"vertical-align: top;\">내용: </label>\r\n");
      out.write("          <textarea name=\"content\" style=\"width: 80%; height: 150px;\"></textarea>\r\n");
      out.write("        </li>\r\n");
      out.write("        <!-- <li class=\"li_none\">\r\n");
      out.write("          <label style=\"vertical-align: top;\">url1: </label>\r\n");
      out.write("          <input class=\"input_basic\" type=\"text\" name=\"url1\" style=\"width: 200px;\">\r\n");
      out.write("        </li> -->\r\n");
      out.write("      </ul>\r\n");
      out.write("      \r\n");
      out.write("      <table style=\"border-collapse: collapse; width: 100%; border: solid 1px #999999; margin-top: 100px;\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <th style=\"width: 100px; border: solid 1px #999999;\">url1:</th>\r\n");
      out.write("          <td style=\"padding-left: 10px; border: solid 1px #999999;\">\r\n");
      out.write("            <input class=\"input_basic\" type=\"text\" name=\"url1\" style=\"width: 100%;\" value=\"https://\">\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <th style=\"width: 100px; border: solid 1px #999999;\">url2:</th>\r\n");
      out.write("          <td style=\"padding-left: 10px; border: solid 1px #999999;\">\r\n");
      out.write("            <input class=\"input_basic\" type=\"text\" name=\"url2\" style=\"width: 100%;\" value=\"https://\">\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <th style=\"width: 100px; border: solid 1px #999999;\">youtube:</th>\r\n");
      out.write("          <td style=\"padding-left: 10px; border: solid 1px #999999;\">\r\n");
      out.write("            <input class=\"input_basic\" type=\"text\" name=\"youtube\" style=\"width: 100%;\" value=\"https://\">\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table>\r\n");
      out.write("      \r\n");
      out.write("      <div class =\"bottom_menu\">\r\n");
      out.write("        <button type=\"submit\">전송</button>\r\n");
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
