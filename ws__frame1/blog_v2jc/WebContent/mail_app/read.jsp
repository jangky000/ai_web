<%@ page contentType="text/html; charset=UTF-8" %>
 
<!-- MySQL에서 DBMS에 연결할때 쓰던 import 패키지와 구성이 같다. -->
 <!-- MovieDAO2.java 참조 -->
<%@ page import="java.sql.Connection" %>
<%@ page import=" java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
 
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

// MYSQL
// String className = "org.gjt.mm.mysql.Driver"; // MySQL 연결 Driver 
// String url = "jdbc:mysql://172.16.12.4:3306/javadb?useUnicode=true&characterEncoding=euckr"; //데이터베이스 javadb 사용

//Oracle, jdbc 연결
String className = "oracle.jdbc.driver.OracleDriver"; // Oracle 연결 Driver 
String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"; //XE -> soldesk 등으로 달라질 수 있다.

String user = "ai6"; 
String password = "1234";
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
  <div class="title_line">메일 앱 ver 1.0＞조회</div>
  <div class="sub_menu">
    <button type="button" onclick="location.href='./list.jsp'">목록</button>
    <button type="button" onclick="location.href='./create_form.jsp?mail_to=1234'">답장하기</button>
    <!-- <button type="button" onclick="location.href='./update.jsp'">수정</button> -->
    <button type="button" onclick="location.href='./delete.jsp'">삭제</button>
  </div>
  <% int mailno = Integer.parseInt(request.getParameter("mailno")); %>
    <%
      try {
        Class.forName(className);
        con = DriverManager.getConnection(url, user, password );
        
        sql = new StringBuffer();
        sql.append(" SELECT mailno, title, content, mail_from, mail_to, rdate");
        sql.append(" FROM mail_app"); 
        sql.append(" WHERE mailno = ?");
       
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, mailno);
        
        rs = pstmt.executeQuery(); // SELECT문 실행: executeQuery() : return ResultSet 타입
        
        if(rs.next() == true) {
          %>
          <div class="content_title">
            제목: <%=rs.getString("title") %>
          </div>
          <div style="text-align: left; font-size: 0.9em; margin-bottom: 20px;">
            mail from: <%=rs.getString("mail_from") %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            mail to: <%=rs.getString("mail_to") %>
          </div>
          <div style="text-align: left; margin-left: 20px;">
            <%= convertChar(rs.getString("content")) %>
          </div>
          
          <%
        } else {
         %>
         등록된 글이 없습니다.
         <%
        }
        
      } catch (SQLException e) {
        System.out.println("SQL 실행 중 예외 발생");
        e.printStackTrace();
      } catch (ClassNotFoundException e) {
        System.out.println("JDBC 드라이버가 없습니다.");
        e.printStackTrace();
      } finally {
        try{ if (rs != null){ rs.close(); } }catch(Exception e){ }
        try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
        try{ if (con != null){ con.close(); } }catch(Exception e){ }
      }
    %>

 
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>