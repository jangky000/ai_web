/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.33
 * Generated at: 2020-04-02 07:41:59 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.mail_005fapp1b;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import nation.web.mail_app1b.MailVO;
import nation.web.mail_app1b.MailDAO;

public final class read_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {


 //특수 문자의 태그로 변환
public String convertChar(String str){
   return str.replace("\r\n", "<br>");
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
    _jspx_imports_classes.add("nation.web.mail_app1b.MailDAO");
    _jspx_imports_classes.add("nation.web.mail_app1b.MailVO");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" ");
      out.write("\r\n");
      out.write(" \r\n");
 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();

      out.write("\r\n");
      out.write("\r\n");

int mailno = Integer.parseInt(request.getParameter("mailno"));
String my_ip = request.getRemoteAddr();

MailDAO mailDAO = new MailDAO();
MailVO mailVO = mailDAO.read(mailno);

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
      out.write("  <div class=\"title_line\">메일 앱 ver 1.0b＞조회</div>\r\n");
      out.write("  <div class=\"sub_menu\">\r\n");
      out.write("    <button type=\"button\" onclick=\"location.href='./list.jsp'\">목록</button>\r\n");
      out.write("    ");
 
    if(my_ip.equals(mailVO.getMail_to())){
      
      out.write("\r\n");
      out.write("      <button type=\"button\" onclick=\"location.href='./reply_form.jsp?mailno=");
      out.print( mailno);
      out.write("'\">답장하기</button>\r\n");
      out.write("      ");

    }
    if(my_ip.equals(mailVO.getMail_from())){
      
      out.write("\r\n");
      out.write("      <button type=\"button\" onclick=\"location.href='./update_form.jsp?mailno=");
      out.print( mailno);
      out.write("'\">수정</button>\r\n");
      out.write("      ");

    }
    
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    <button type=\"button\" onclick=\"location.href='./delete_form.jsp?mailno=");
      out.print(mailno );
      out.write("'\">삭제</button>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("  <div class=\"content_title\">\r\n");
      out.write("    제목:\r\n");
      out.write("    ");
      out.print(mailVO.getTitle());
      out.write("\r\n");
      out.write("  </div>\r\n");
      out.write("  <div style=\"text-align: left; font-size: 0.9em; margin-bottom: 20px;\">\r\n");
      out.write("    mail from:\r\n");
      out.write("    ");
      out.print(mailVO.getMail_from());
      out.write("\r\n");
      out.write("    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mail to:\r\n");
      out.write("    ");
      out.print(mailVO.getMail_to());
      out.write("\r\n");
      out.write("  </div>\r\n");
      out.write("  <div style=\"text-align: left; margin-left: 20px;\">\r\n");
      out.write("    ");
      out.print(convertChar(mailVO.getContent()));
      out.write("\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("  ");
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
