/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.33
 * Generated at: 2020-05-25 03:39:21 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.contents;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class delete_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/C:/ai6/ws__frame/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/resort_v2s4m3c/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1586748538176L));
  }

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
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html> \r\n");
      out.write("<html lang=\"ko\"> \r\n");
      out.write("<head> \r\n");
      out.write("<meta charset=\"UTF-8\"> \r\n");
      out.write("<meta name=\"viewport\" content=\"user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width\" /> \r\n");
      out.write("<title>Resort world</title>\r\n");
      out.write(" \r\n");
      out.write("<link href=\"../css/style.css\" rel=\"Stylesheet\" type=\"text/css\">\r\n");
      out.write(" \r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css\">\r\n");
      out.write("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\r\n");
      out.write("</head> \r\n");
      out.write(" \r\n");
      out.write("<body>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/menu/top.jsp", out, false);
      out.write("\r\n");
      out.write("  <DIV class='title_line'>\r\n");
      out.write("    <A href=\"../categrp/list.do\">카테고리 그룹</A> > \r\n");
      out.write("    <A href=\"../cate/list.do\">모든 카테고리</A> > 삭제\r\n");
      out.write("  </DIV>\r\n");
      out.write("\r\n");
      out.write("  <ASIDE style='float: left;'>\r\n");
      out.write("    <A href='../categrp/list.do'>카테고리 그룹</A> > \r\n");
      out.write("    <A href='./list.do?cateno=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${cateno }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write('\'');
      out.write('>');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${cateVO.name }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</A> >\r\n");
      out.write("    삭제\r\n");
      out.write("  </ASIDE>\r\n");
      out.write("  <ASIDE style='float: right;'>\r\n");
      out.write("    <A href='./list.do?cateno=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.cateno }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("'>목록</A>\r\n");
      out.write("    <!-- <span class='menu_divide' >│</span> --> \r\n");
      out.write("  </ASIDE> \r\n");
      out.write("  \r\n");
      out.write("  <div class='menu_line'></div>\r\n");
      out.write(" \r\n");
      out.write("  <FORM name='frm' method='POST' action='./delete.do'>\r\n");
      out.write("      <input type='hidden' name='contentsno' value='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.contentsno}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("'>\r\n");
      out.write("      <input type=\"hidden\" name=\"cateno\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.cateno }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\r\n");
      out.write("            \r\n");
      out.write("      <div class=\"form-group\">   \r\n");
      out.write("        <div class=\"col-md-12\" style='text-align: center; margin: 30px;'>\r\n");
      out.write("          삭제 되는글: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contentsVO.title }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("<br><br>\r\n");
      out.write("          삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.<br><br>\r\n");
      out.write("          \r\n");
      out.write("        <div class=\"form-group\">   \r\n");
      out.write("        <div class=\"col-md-12\">\r\n");
      out.write("          <input type='password' class=\"form-control\" name='passwd'  value='' placeholder=\"패스워드\" style='width: 20%; margin: 10px auto;'>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("          \r\n");
      out.write("          <button type = \"submit\" class=\"btn btn-info\">삭제 진행</button>\r\n");
      out.write("          <button type = \"button\" onclick = \"history.back()\" class=\"btn btn-info\">취소</button>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>   \r\n");
      out.write("  </FORM>\r\n");
      out.write(" \r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/menu/bottom.jsp", out, false);
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write(" \r\n");
      out.write("</html>\r\n");
      out.write("  ");
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
