<%@ page contentType="text/html; charset=UTF-8" %>

<!-- import는 ssi에서 모아서 선언, 안 쓰는 경우에는 메모리를 사용하지 않는다고 함 -->
<%@ page import = "java.util.ArrayList" %>

<%@ page import="nation.web.notice1d.NoticeProc" %>
<%-- <%@ page import="nation.web.notice1d.NoticeDAO" %> --%>
<%@ page import="nation.web.notice1d.NoticeVO" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath(); 
%>

<%
String application_title = "공지사항 ver 1.0d"; 
%>

<%
/* JSP는 Process만 호출 */
/* NoticeDAO noticeDAO = new NoticeDAO(); */
NoticeProc noticeProc = new NoticeProc();
%>

<%
      int nowPage = 0;
      int recordPerPage = 0;
      
      if(request.getParameter("nowPage") == null){
        nowPage = 1;
      } else{
        nowPage = Integer.parseInt(request.getParameter("nowPage"));
      }
      
      if(request.getParameter("recordPerPage") == null){
        recordPerPage = 3;
      } else{
        recordPerPage = Integer.parseInt(request.getParameter("recordPerPage"));
      }
%>