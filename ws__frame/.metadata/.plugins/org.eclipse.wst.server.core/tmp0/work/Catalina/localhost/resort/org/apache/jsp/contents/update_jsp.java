/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.33
 * Generated at: 2020-05-25 01:46:38 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.contents;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class update_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html> \r\n");
      out.write("<html lang=\"ko\"> \r\n");
      out.write("<head> \r\n");
      out.write("<meta charset=\"UTF-8\"> \r\n");
      out.write("<meta name=\"viewport\" content=\"user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width\" /> \r\n");
      out.write("<title>Resort world</title>\r\n");
      out.write(" \r\n");
      out.write("<link href=\"../css/style.css\" rel=\"Stylesheet\" type=\"text/css\">\r\n");
      out.write(" \r\n");
      out.write("<script type=\"text/JavaScript\"\r\n");
      out.write("          src=\"http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\r\n");
      out.write(" \r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css\">\r\n");
      out.write("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"../ckeditor/ckeditor.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("  $(function() {\r\n");
      out.write("    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값\r\n");
      out.write("  });\r\n");
      out.write("</script> \r\n");
      out.write(" \r\n");
      out.write("</head> \r\n");
      out.write(" \r\n");
      out.write("<body>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/menu/top.jsp", out, false);
      out.write("\r\n");
      out.write("  <DIV class='title_line'>\r\n");
      out.write("    <A href=\"../categrp/list.do\">카테고리 그룹</A> > \r\n");
      out.write("    <A href=\"../cate/list.do\">모든 카테고리</A> > 글 등록\r\n");
      out.write("  </DIV>\r\n");
      out.write("\r\n");
      out.write("  <ASIDE style='float: left;'>\r\n");
      out.write("    <A href=''>카테고리 그룹</A> > \r\n");
      out.write("    <A href=''>카테고리</A> > 수정\r\n");
      out.write("  </ASIDE>\r\n");
      out.write("  <ASIDE style='float: right;'>\r\n");
      out.write("    <A href=''>목록</A>\r\n");
      out.write("    <!-- <span class='menu_divide' >│</span> --> \r\n");
      out.write("  </ASIDE> \r\n");
      out.write(" \r\n");
      out.write("  <div class='menu_line'></div>\r\n");
      out.write("  <DIV style='width: 100%;'>\r\n");
      out.write("    <FORM name='frm' method='POST' action='./update.do' class=\"form-horizontal\">\r\n");
      out.write("      <!-- FK memberno 지정 -->\r\n");
      out.write("      <input type='hidden' name='memberno' id='memberno' value='1'>\r\n");
      out.write("      <!-- FK categrpno 지정 -->\r\n");
      out.write("      <input type='hidden' name='cateno' id='cateno' value='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.cateno }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("'>\r\n");
      out.write("      \r\n");
      out.write("      <input type='hidden' name='contentsno' id='contentsno' value='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contentsVO.contentsno }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("'>\r\n");
      out.write("      \r\n");
      out.write("      <div class=\"form-group\">   \r\n");
      out.write("        <div class=\"col-md-12\">\r\n");
      out.write("          <input type='text' class=\"form-control\" name='title' value='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contentsVO.title }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("' \r\n");
      out.write("                    placeholder=\"제목\" required=\"required\" style='width: 80%;' autofocus=\"autofocus\">\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>   \r\n");
      out.write("      \r\n");
      out.write("      <div class=\"form-group\">   \r\n");
      out.write("        <div class=\"col-md-12\">\r\n");
      out.write("          <textarea class=\"form-control\" name='content' id='content' rows='10' placeholder=\"내용\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contentsVO.content }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</textarea>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("      <div class=\"form-group\">   \r\n");
      out.write("        <div class=\"col-md-12\">\r\n");
      out.write("          <input type='text' class=\"form-control\" name='web' value='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contentsVO.web }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("' placeholder=\"인터넷 주소\" style='width: 80%;'>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>   \r\n");
      out.write("      \r\n");
      out.write("      <div class=\"form-group\">   \r\n");
      out.write("        <div class=\"col-md-12\">\r\n");
      out.write("          <input type='text' class=\"form-control\" name='word'  value='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contentsVO.word }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("' placeholder=\"검색어\" style='width: 90%;'>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("      <div class=\"form-group\">   \r\n");
      out.write("        <div class=\"col-md-12\">\r\n");
      out.write("          <input type='password' class=\"form-control\" name='passwd'  value='' placeholder=\"패스워드\" style='width: 20%;'>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("      \r\n");
      out.write("      <DIV class='content_bottom_menu'>\r\n");
      out.write("        <button type=\"submit\" class=\"btn btn-info\">수정</button>\r\n");
      out.write("        <button type=\"button\" \r\n");
      out.write("                    onclick=\"location.href='./list.do?categrpno=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.categrpno}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("'\" \r\n");
      out.write("                    class=\"btn btn-info\">취소[목록]</button>\r\n");
      out.write("      </DIV>\r\n");
      out.write("       \r\n");
      out.write("    </FORM>\r\n");
      out.write("  </DIV>\r\n");
      out.write("\r\n");
      out.write("  \r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/menu/bottom.jsp", out, false);
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write(" \r\n");
      out.write("</html>\r\n");
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
