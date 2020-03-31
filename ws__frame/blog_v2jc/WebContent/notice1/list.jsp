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
  <DIV class="title_line">공지사항 ver 1.0 </DIV>
  <DIV class="sub_menu">
    <button type="button" onclick="location.href='./create_form.jsp'">등록</button>
  </DIV>
  <TABLE class="table_basic">
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
        <th class="th_basic">성명</th> 
        <th class="th_basic">등록일</th>
        <th class="th_basic">기타</th>
      </tr>
    </thead>
    <tbody>
    <%
    try {
      Class.forName(className); // memory로 클래스를 로딩함, 객체는 생성하지 않음.
      con = DriverManager.getConnection(url, user, password ); // MySQL 연결
      
      sql = new StringBuffer();
      sql.append(" SELECT noticeno, title, content, rname, passwd, rdate");
      sql.append(" FROM notice"); 
      sql.append(" ORDER BY noticeno DESC");
      
      pstmt = con.prepareStatement(sql.toString());
      
      rs = pstmt.executeQuery(); // SELECT

      while(true) {
        if (rs.next() == true) { // 첫번째 레코드 -> 마지막 레코드로 이동
        %>
          <tr>
            <td class="td_basic"><%=rs.getInt("noticeno") %></td>
            <td class="td_left"><A href="./read.jsp?noticeno=<%=rs.getInt("noticeno") %>"><%=rs.getString("title") %></A></td>
            <td class="td_basic"><%=rs.getString("rname") %></td>
            <td class="td_basic"><%=rs.getString("rdate").substring(0, 10) %></td>
            <td class="td_basic">
              <A href="./update_form.jsp?noticeno=<%=rs.getInt("noticeno") %>">수정</A> 
              / 
              <A href="./delete_form.jsp?noticeno=<%=rs.getInt("noticeno") %>">삭제</A></td>
          </tr>
        <%
        } else {
          break;
        }
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
    </tbody>
  </TABLE> 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>








