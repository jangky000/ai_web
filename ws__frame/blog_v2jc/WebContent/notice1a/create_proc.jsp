<%@page import="nation.web.tool.DBClose"%>
<%@ page contentType="text/html; charset=UTF-8" %>
 
 <!-- MySQL에서 DBMS에 연결할때 쓰던 import 패키지와 구성이 같다. -->
 <!-- MovieDAO2.java 참조 -->
<%@ page import="java.sql.Connection" %>
<%-- <%@ page import=" java.sql.DriverManager" %> --%>
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
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <div class="title_line">공지사항 ver 1.0a＞등록</div>
  <fieldset class="fieldset_basic">
    <!-- <legend class="legend_basic">공지사항 등록</legend> -->
      <ul>
        <%
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String rname = request.getParameter("rname");
        String passwd = request.getParameter("passwd");
        
      //네트워크 설정에 예외처리가 필수
        try {
          /* Class.forName(className); // memory로 클래스를 로딩함, 객체는 생성하지 않음.
          con = DriverManager.getConnection(url, user, password ); // MySQL 연결 */
          con = new DBOpen().getConnection();
          
          sql = new StringBuffer();
          //SQL문 앞에 한 칸 공백 만들기 + ' ; '지우기
          sql.append(" INSERT INTO notice(noticeno, title, content, rname, passwd, rdate )");
          sql.append(" VALUES (notice_seq.nextval, ?, ?, ?, ?, sysdate)"); // '?'는 ?값으로 판단, 문자열도 single quatation 없이 사용
          
          //StringBuffer를 문자열로 변환
          pstmt = con.prepareStatement(sql.toString());
          
          pstmt.setString(1, title);
          pstmt.setString(2, content);
          pstmt.setString(3, rname);
          pstmt.setString(4, passwd);
          
          //pstmt 바인딩 후에 실행
          count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE를 실행
          
        } catch (SQLException e) {
          System.out.println("SQL 실행 중 예외 발생");
          e.printStackTrace(); // 예외가 발생하기까지의 실행 과정 출력
/*         } catch (ClassNotFoundException e) {
          System.out.println("JDBC 드라이버가 없습니다.");
          e.printStackTrace(); */
        } finally {
          new DBClose().close(con, pstmt);
        }
      
      if(count == 1){
        %>
        <li class="li_none">등록 처리에 성공했습니다.</li>
        <%
      } else{
        %>
        <li class="li_error" >등록 처리에 실패했습니다.</li>
        <li class="li_none">다시 시도해주세요. </li>
        <%
      }
        %>
      </ul>
      <div class ="bottom_menu">
        <!-- onclick = "" javascript 연결 -->
        <%
        if(count == 0){
          %>
          <button type="button" onclick="history.back();">다시 시도</button>
          <%
        }
        %>
        <button type="button" onclick="location.href = './create_form.jsp'">계속 등록</button>
        <button type="button" onclick="location.href = './list.jsp'">목록</button>
      </div>
  </fieldset>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>