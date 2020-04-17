<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
 
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

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">공지사항 ver 1.0＞등록 </DIV>
  
  <fieldset class="fieldset_basic">

     <ul>
     <%
     String title = request.getParameter("title");
     String content = request.getParameter("content");
     String rname = request.getParameter("rname");
     String passwd = request.getParameter("passwd");
     
     try {
       Class.forName(className); // memory로 클래스를 로딩함, 객체는 생성하지 않음.
       con = DriverManager.getConnection(url, user, password ); // MySQL 연결
       
       sql = new StringBuffer();
       sql.append(" INSERT INTO notice (noticeno, title, content, rname, passwd, rdate)");
       sql.append(" VALUES(notice_seq.nextval, ?, ?, ?, ?, sysdate)"); // ?는 변수의 값으로 대체됨.
       
       pstmt = con.prepareStatement(sql.toString());
       pstmt.setString(1, title); // 1: 첫번째 ?
       pstmt.setString(2, content);
       pstmt.setString(3, rname);
       pstmt.setString(4, passwd);
       
       count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
       
     } catch (SQLException e) {
       System.out.println("SQL 실행중 예외 발생");
       e.printStackTrace(); // 예외가 발생하기까지의 실행과정을 출력
     } catch (ClassNotFoundException e) {
       System.out.println("JDBC 드라이버가 없는것 같습니다.");
       e.printStackTrace();
     } finally {
       // try{ if (rs != null){ rs.close(); } }catch(Exception e){ }
  
       try{ if (pstmt != null){ pstmt.close(); } }catch(Exception e){ }
       try{ if (con != null){ con.close(); } }catch(Exception e){ }
     }
     
     if (count == 1) {
     %>
       <LI class="li_none">등록 처리에 성공했습니다.</LI>
     <%  
     } else {
    %>
       <LI class="li_error">등록 처리에 실패했습니다.</LI>
       <LI class="li_none">다시한번 시도해주세요.</LI>
    <%   
     }
     %>
     </ul> 
     
     <DIV class="bottom_menu">
       <%
       if (count == 0) {
       %>
         <button type="button" onclick="history.back();">다시 시도</button>
       <%  
       }
       %>
       <button type="button" onclick="location.href='./create_form.jsp'">계속 등록</button>
       <button type="button" onclick="location.href='./list.jsp'">목록</button>
     </DIV>
      
  </fieldset> 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>




