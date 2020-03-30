<%@ page contentType="text/html; charset=UTF-8"%>

<!-- MySQL에서 DBMS에 연결할때 쓰던 import 패키지와 구성이 같다. -->
<!-- MovieDAO2.java 참조 -->
<%@ page import="java.sql.Connection"%>
<%@ page import=" java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%>

<%
  // 필요 변수 선언
  Connection con = null; // DBMS 연결
  PreparedStatement pstmt = null; // SQL 실행
  ResultSet rs = null; // SELECT 결과를 저장
  StringBuffer sql = null; // SQL 문장
  int count = 0; // 처리된 레코드 갯수
  
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
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
  <jsp:include page="/menu/top.jsp" flush='false' />
  <div class="title_line">공지사항 ver 1.0</div>
  <fieldset class="fieldset_basic">
    <!-- <legend class="legend_basic">공지사항 등록</legend> -->
    <ul>
      <%
        int noticeno = Integer.parseInt(request.getParameter("noticeno"));
        
          String title = request.getParameter("title");
          String content = request.getParameter("content");
          String rname = request.getParameter("rname");
          String passwd = request.getParameter("passwd");
          int passwd_cnt = 0;
          //System.out.println(passwd);
          
        //네트워크 설정에 예외처리가 필수
          try {
            Class.forName(className); // memory로 클래스를 로딩함, 객체는 생성하지 않음.
            con = DriverManager.getConnection(url, user, password ); // MySQL 연결
            
            // 패스워드 검사
            sql = new StringBuffer();
            //SQL문 앞에 한 칸 공백 만들기 + ' ; '지우기
            sql.append(" SELECT COUNT(*) AS passwd_cnt");
            sql.append(" FROM notice"); 
            sql.append(" WHERE noticeno=? AND passwd=?"); 
                
            //StringBuffer를 문자열로 변환
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, noticeno);
            pstmt.setString(2, passwd);
            
            rs = pstmt.executeQuery();
            rs.next();
            passwd_cnt = rs.getInt("passwd_cnt");
            
            if(passwd_cnt == 1){ // 패스워드 일치
              // 수정처리
              sql = new StringBuffer();
              //SQL문 앞에 한 칸 공백 만들기 + ' ; '지우기
              sql.append(" UPDATE notice");
              sql.append(" SET title=?, content=?, rname=?"); 
              sql.append(" WHERE noticeno=?"); 
              
              //StringBuffer를 문자열로 변환
              pstmt = con.prepareStatement(sql.toString());
              pstmt.setString(1, title);
              pstmt.setString(2, content);
              pstmt.setString(3, rname);
              pstmt.setInt(4, noticeno);
              
              //pstmt 바인딩 후에 실행
              count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE를 실행

              if (count == 1) {
                %>
                  <li class="li_none">등록 처리에 성공했습니다.</li>
                <%
              } else {
                %>
                  <li class="li_error">등록 처리에 실패했습니다.</li>
                  <li class="li_none">다시 시도해주세요.</li>
                <%
              }
            } else { // 패스워드 불일치
              System.out.println("비밀번호 일치하지 않음");
              %>
                <li class="li_error">비밀번호가 일치하지 않습니다.</li>
                <li class="li_none">다시 시도해주세요.</li>
              <%
        }

        } catch (SQLException e) {
          System.out.println("SQL 실행 중 예외 발생");
          e.printStackTrace(); // 예외가 발생하기까지의 실행 과정 출력
        } catch (ClassNotFoundException e) {
          System.out.println("JDBC 드라이버가 없습니다.");
          e.printStackTrace();
        } finally {
          //try{ if (rs != null){ rs.close(); } }catch(Exception e){ }
          // 따로 에러 출력하지 않고 연결 종료
          try {
            if (pstmt != null) {
              pstmt.close();
            }
          } catch (Exception e) {
          }
          try {
            if (con != null) {
              con.close();
            }
          } catch (Exception e) {
          }
        }
      %>

    </ul>
    <div class="bottom_menu">
      <!-- onclick = "" javascript 연결 -->
      <%
        if(passwd_cnt == 0 || count == 0){
          %>
          <button type="button" onclick="history.back();">다시 시도</button>
          <%
        } else{
        %>
        <button type="button"
        onclick="location.href = './read.jsp?noticeno=<%= noticeno %>'">수정 확인</button>
        <%
        }
        %>
      <button type="button" onclick="location.href = './list.jsp'">목록</button>
    </div>
  </fieldset>

  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>