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
String title = "";
String content = "";
String rname = "";
String rdate = "";

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
    title = rs.getString("title");
    content = rs.getString("content");
    rname = rs.getString("rname");
    rdate = rs.getString("rdate");
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
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">공지사항 ver 1.0＞삭제 </DIV>
  <form name='frm' action='./delete_proc.jsp' method='POST'>
    <input type='hidden' name='noticeno' value='<%=noticeno %>'>
    
    <fieldset class="fieldset_basic">
      <ul>
        <li class="li_none" style="font-weight: bold;">
          <%=title %>
        </li>
        <li class="li_none">
          <%=convertChar(content) %>
        </li>
        <li class="li_none">
          <%=rname %> <%=rdate %>
        </li>
        <li class="li_none">
          <label>패스워드: </label>
          <input type="password" name="passwd" style="width: 30%;" class="input_basic">
        </li>
        <li class="li_none">
          <DIV style="text-align: center;">
            <span style="color: #FF0000; font-weight: bold;">삭제를 진행하면 복구 할 수 없습니다.</span><br>
            삭제하시겠습니까?            
          </DIV>
        </li>
      </ul>

      <DIV class="bottom_menu">
        <button type="submit">삭제 진행</button>
        <button type="button" onclick="location.href='./list.jsp'">취소</button>
        <button type="button" onclick="location.href='./list.jsp'">목록</button>
      </DIV>
    
    </fieldset>
    
  </form>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>






