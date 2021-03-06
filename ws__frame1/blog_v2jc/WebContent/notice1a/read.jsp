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

%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <% int noticeno = Integer.parseInt(request.getParameter("noticeno")); %>
  <div class="title_line">공지사항 ver 1.0a＞조회</div>
  <div class="sub_menu">
  <button type="button" onclick="location.href='./list.jsp'">목록</button>
    <button type="button" onclick="location.href='./update_form.jsp?noticeno=<%= noticeno%>'">수정</button>
    <button type="button" onclick="location.href='./delete_form.jsp?noticeno=<%= noticeno%>'">삭제</button>
  </div>

    <%
      try {
        con = new DBOpen().getConnection();
        
        sql = new StringBuffer();
        sql.append(" SELECT noticeno, title, content, rname, passwd, rdate");
        sql.append(" FROM notice"); 
        sql.append(" WHERE noticeno = ?");
       
        pstmt = con.prepareStatement(sql.toString());
        pstmt.setInt(1, noticeno);
        
        rs = pstmt.executeQuery(); // SELECT문 실행: executeQuery() : return ResultSet 타입
        
        if(rs.next() == true) {
          %>
          <div class="content_title">
            <%=rs.getString("title") %>
          </div>
          <%= convertChar(rs.getString("content")) %>
          
          <div class="content_bottom">
            <%=rs.getString("rname") %>
            <%=rs.getString("rdate") %>
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
      } finally {
        new DBClose().close(rs, con, pstmt);
      }
    %>

 
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>