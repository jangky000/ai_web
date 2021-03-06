<%@ page contentType="text/html; charset=UTF-8" %>
 
<!-- MySQL에서 DBMS에 연결할때 쓰던 import 패키지와 구성이 같다. -->
 <!-- MovieDAO2.java 참조 -->
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%@ page import ="nation.web.tool.DBOpen" %>
<%@ page import ="nation.web.tool.DBClose" %>

 <%!
 //특수 문자의 태그로 변환
public String convertChar(String str){
   return str.replace("\r\n", "<br>");
 }
 %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%>

<%
// 필요 변수 선언
Connection con = null;              // DBMS 연결
PreparedStatement pstmt = null; // SQL 실행
ResultSet rs = null;                   // SELECT 결과를 저장
StringBuffer sql = null;              // SQL 문장
int count = 0;                         // 처리된 레코드 갯수

int mailno = Integer.parseInt(request.getParameter("mailno"));
String my_ip = request.getRemoteAddr();

String title = null;
String mail_from = null;
String mail_to = null;
String content = null;

%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>메일 앱</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <%
    try {
      con = new DBOpen().getConnection();

      sql = new StringBuffer();
      sql.append(" SELECT mailno, title, content, mail_from, mail_to, rdate");
      sql.append(" FROM mail_app");
      sql.append(" WHERE mailno = ?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, mailno);

      rs = pstmt.executeQuery(); // SELECT문 실행: executeQuery() : return ResultSet 타입

      if (rs.next() == true) {
        title = rs.getString("title");
        mail_from = rs.getString("mail_from");
        mail_to = rs.getString("mail_to");
        content = rs.getString("content");

      } else {
  %>
  등록된 글이 없습니다.
  <%
    }

    } catch (SQLException e) {
      System.out.println("SQL 실행 중 예외 발생");
      e.printStackTrace();
    } finally {
      new DBClose().close(rs, con, pstmt);
    }
  %>

  <div class="title_line">메일 앱 ver 1.0a＞조회</div>
  <div class="sub_menu">
    <button type="button" onclick="location.href='./list.jsp'">목록</button>
    <% 
    if(my_ip.equals(mail_to)){
      %>
      <button type="button" onclick="location.href='./reply_form.jsp?mailno=<%= mailno%>'">답장하기</button>
      <%
    }
    if(my_ip.equals(mail_from)){
      %>
      <button type="button" onclick="location.href='./update_form.jsp?mailno=<%= mailno%>'">수정</button>
      <%
    }
    %>
    
    <button type="button" onclick="location.href='./delete_form.jsp?mailno=<%=mailno %>'">삭제</button>
  </div>

    

  <div class="content_title">
    제목:
    <%=title%>
  </div>
  <div style="text-align: left; font-size: 0.9em; margin-bottom: 20px;">
    mail from:
    <%=mail_from%>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mail to:
    <%=mail_to%>
  </div>
  <div style="text-align: left; margin-left: 20px;">
    <%=convertChar(content)%>
  </div>



  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>