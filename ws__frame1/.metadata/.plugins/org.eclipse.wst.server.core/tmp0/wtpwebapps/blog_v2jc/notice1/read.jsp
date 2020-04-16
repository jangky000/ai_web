<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%!
// 특수 문자의 태그로 변환
public String convertChar(String str) {
  str = str.replace("\r\n", "<BR>");
  
  return str;
}
%>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath(); 
%>

<%
Connection con = null;              // DBMS 연결
PreparedStatement pstmt = null; // SQL 실행
ResultSet rs = null;                   // SELECT 결과를 저장
StringBuffer sql = null;              // SQL 문장
int count = 0;                         // 처리된 레코드 갯수

// MySQL
// String className = "org.gjt.mm.mysql.Driver"; // MySQL 연결 Drvier 
// String url = "jdbc:mysql://172.16.12.7:3306/javadb?useUnicode=true&characterEncoding=euckr"; 

// Oracle
String className = "oracle.jdbc.driver.OracleDriver"; // Oracle 연결 Drvier 
String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"; 

String user = "ai6"; 
String password = "1234";
%> 

<%
int noticeno = Integer.parseInt(request.getParameter("noticeno"));
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
  <DIV class="title_line">공지사항 ver 1.0＞조회  </DIV>
  <DIV class="sub_menu">
    <button type="button" onclick="location.href='./list.jsp'">목록</button>
    <button type="button" onclick="location.href='./update_form.jsp?noticeno=<%=noticeno %>'">수정</button>
    <button type="button" onclick="location.href='./delete_form.jsp?noticeno=<%=noticeno %>'">삭제</button>
  </DIV>
  
<%
    try {
      Class.forName(className); // memory로 클래스를 로딩함, 객체는 생성하지 않음.
      con = DriverManager.getConnection(url, user, password ); // MySQL 연결
      
      sql = new StringBuffer();
      sql.append(" SELECT noticeno, title, content, rname, passwd, rdate");
      sql.append(" FROM notice"); 
      sql.append(" WHERE noticeno=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, noticeno);
      
      rs = pstmt.executeQuery(); // SELECT

      if (rs.next() == true) { // 첫번째 레코드
      %>
      <DIV class="content_title">
        <%=rs.getString("title") %>
      </DIV>
      <%=convertChar(rs.getString("content")) %>
      
      <DIV class="content_bottom">
        <%=rs.getString("rname") %>
        <%=rs.getString("rdate") %>
      </DIV>
      <%
      } else {
      %>
        등록된 글이 없습니다.
      <%
      }
      
    } catch (SQLException e) {
      System.out.println("SQL 실행중 예외 발생");
      e.printStackTrace(); // 예외가 발생하기까지의 실행과정을 출력
    } catch (ClassNotFoundException e) {
      System.out.println("JDBC 드라이버가 없는것 같습니다.");
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


