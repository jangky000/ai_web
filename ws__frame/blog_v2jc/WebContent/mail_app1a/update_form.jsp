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
 
 //특수 문자의 태그로 변환
public String convertTag(String str){
   return str.replace("<br>", "\r\n");
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

String title = null;
String content = null;
String mail_to = null;
String rdate = null;

%>

<%
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
    new DBClose().close(rs, con, pstmt);
  }
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
  <div class="title_line">메일 앱 ver 1.0a＞수정</div>
  
   <%
    out.print("<p>내 IP: " + request.getRemoteAddr() + "</p>");
    String my_ip = request.getRemoteAddr();
    /* out.print("<p>Remote Host: " + request.getRemoteHost() + "</p>"); */
    /* out.print("<p>X-Forwarded-For: " + request.getHeader("x-forwarded-for") + "</p>"); */
    %>
  
  <form name='frm' action='./update_proc.jsp' method='POST'>
    <input type='hidden' name='mailno' value='<%= mailno %>'>
    <fieldset class="fieldset_basic">
      <!-- <legend class="legend_basic">공지사항 등록</legend> -->
      <ul>
        <li class="li_none">
          <label>제목: </label>
          <input class="input_basic" type="text" name="title" style="width: 80%;" autofocus="autofocus" 
                      value="<%=title %>">
        </li>
        <li class="li_none">
          <label>보내는 사람 IP: </label>
          <input class="input_basic" type="text" name="mail_from"  value="<%= my_ip %>" style="width: 200px;" readonly="readonly">
        </li>
        <li class="li_none">
          <label>받는 사람 IP: </label>
          <input class="input_basic" type="text" name="mail_to" style="width: 200px;" value="<%= mail_to%>">
        </li>
        <li class="li_none">
          <label style="vertical-align: top;">내용: </label>
          <textarea name="content" style="width: 80%; height: 150px;"><%=content %></textarea>
        </li>
      </ul>
      <div class ="bottom_menu">
        <button type="submit">수정 완료</button>
        <button type="button" onclick="location.href = './list.jsp'">취소</button>
        <button type="button" onclick="location.href = './list.jsp'">목록</button>
      </div>
    </fieldset>
    
  </form>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>