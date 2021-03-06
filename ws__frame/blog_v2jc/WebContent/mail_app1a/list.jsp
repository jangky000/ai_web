<%@ page contentType="text/html; charset=UTF-8" %>
 
<!-- MySQL에서 DBMS에 연결할때 쓰던 import 패키지와 구성이 같다. -->
 <!-- MovieDAO2.java 참조 -->
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%@ page import ="nation.web.tool.DBOpen" %>
<%@ page import ="nation.web.tool.DBClose" %>

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
  <div class="title_line">메일 앱 ver 1.0a</div>
  
  <%
  out.print("<p>내 IP: " + request.getRemoteAddr() + "</p>");
  String my_ip = request.getRemoteAddr();
  /* out.print("<p>Remote Host: " + request.getRemoteHost() + "</p>"); */
  /* out.print("<p>X-Forwarded-For: " + request.getHeader("x-forwarded-for") + "</p>"); */
  %>
  
  <div class="sub_menu">
    <button type="button" onclick="location.href='./create_form.jsp'">메일 보내기</button>
  </div>
  <table class="table_basic">
    <caption style="text-align: left; margin: 0 0 20px 20px; text-decoration: underline;"><h2>받은 메일함</h2></caption>
    <colgroup>
      <col style="width: 5%;">
      <col style="width: 50%;">
      <col style="width: 12%;">
      <col style="width: 18%;">
      <col style="width: 15%;">
    </colgroup>
    <thead>
      <tr>
        <th class="th_basic">NO</th>
        <th class="th_basic">제목</th>
        <th class="th_basic">보낸사람</th>
        <th class="th_basic">등록일</th>
        <th class="th_basic">기타</th>
      </tr>
    </thead>
    <tbody>
      <%
      try {
        con = new DBOpen().getConnection();
        
        sql = new StringBuffer();
        sql.append(" SELECT mailno, title, content, mail_from, mail_to, rdate");
        sql.append(" FROM mail_app"); 
        sql.append(" WHERE mail_to = ?"); 
        sql.append(" ORDER BY mailno DESC");
       
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, my_ip);
        rs = pstmt.executeQuery(); // SELECT문 실행: executeQuery() : return ResultSet 타입
        
        int n = 0;
        while(true) {
          if(rs.next() == true) {
            System.out.println(rs.getInt("mailno"));
            %>
            <tr>
              <td class="td_basic"><%= rs.getInt("mailno")%></td>
              <td class="td_left"><a href="./read.jsp?mailno=<%= rs.getInt("mailno")%>"><%= rs.getString("title")%></a></td>
              <td class="td_basic"><%= rs.getString("mail_from")%></td>
              <td class="td_basic"><%= rs.getString("rdate")%></td>
              <td class="td_basic"><a href='./delete_form.jsp?mailno=<%= rs.getInt("mailno")%>'>삭제</a></td>
            </tr>
            <%
          }
          else {
            break;
          }
        }
        
      } catch (SQLException e) {
        System.out.println("SQL 실행 중 예외 발생");
        e.printStackTrace();
      } finally {
        new DBClose().close(rs, con, pstmt);
      }
      %>
    </tbody>
  </table>
  
  <hr style="margin: 80px 0;">
  
  <table class="table_basic">
    <caption style="text-align: left; margin: 0 0 20px 20px; text-decoration: underline;"><h2>보낸 메일함</h2></caption>
    <colgroup>
      <col style="width: 5%;">
      <col style="width: 50%;">
      <col style="width: 12%;">
      <col style="width: 18%;">
      <col style="width: 15%;">
    </colgroup>
    <thead>
      <tr>
        <th class="th_basic">NO</th>
        <th class="th_basic">제목</th>
        <th class="th_basic">받는 사람</th>
        <th class="th_basic">등록일</th>
        <th class="th_basic">기타</th>
      </tr>
    </thead>
    <tbody>
      <%
      try {
        con = new DBOpen().getConnection();
        
        sql = new StringBuffer();
        sql.append(" SELECT mailno, title, content, mail_from, mail_to, rdate");
        sql.append(" FROM mail_app"); 
        sql.append(" WHERE mail_from = ?"); 
        sql.append(" ORDER BY mailno DESC");
       
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, my_ip);
        
        rs = pstmt.executeQuery(); // SELECT문 실행: executeQuery() : return ResultSet 타입
        
        int n = 0;
        while(true) {
          if(rs.next() == true) {
            System.out.println(rs.getInt("mailno"));
            %>
            <tr>
              <td class="td_basic"><%= rs.getInt("mailno")%></td>
              <td class="td_left"><a href="./read.jsp?mailno=<%= rs.getInt("mailno")%>"><%= rs.getString("title")%></a></td>
              <td class="td_basic"><%= rs.getString("mail_to")%></td>
              <td class="td_basic"><%= rs.getString("rdate")%></td>
              <td class="td_basic"><a href='./update_form.jsp?mailno=<%= rs.getInt("mailno")%>'>수정</a>/<a href='./delete_form.jsp?mailno=<%= rs.getInt("mailno")%>'>삭제</a></td>
            </tr>
            <%
          }
          else {
            break;
          }
        }
        
      } catch (SQLException e) {
        System.out.println("SQL 실행 중 예외 발생");
        e.printStackTrace();
      } finally {
        new DBClose().close(rs, con, pstmt);
      }
      %>
    </tbody>
  </table>

 <hr style="margin: 80px 0;">
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>