<%@page import="nation.web.tool.DBClose"%>
<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ page import = "nation.web.notice1b.NoticeVO" %>
<%@ page import = "nation.web.notice1b.NoticeDAO" %>
 
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
  // 여기서는 html과 섞이지 않게 코드를 분리하는 것이 유지보수하기에 좋다.
  int noticeno = Integer.parseInt(request.getParameter("noticeno"));
  NoticeVO noticeVO = new NoticeDAO().read(noticeno);
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


  <div class="title_line">공지사항 ver 1.0b＞삭제</div>
  <form name='frm' action='./delete_proc.jsp' method='POST'>
    <!-- 사용자에게 보여줄 필요가 없는 데이터 -->
    <input type='hidden'  name= 'noticeno'  value='<%= noticeVO.getNoticeno()%>'>
  
    <fieldset class="fieldset_basic">
      <!-- <legend class="legend_basic">공지사항 등록</legend> -->
      <ul>
        <li class="li_none" style="font-weight: bold;">
          <!-- <label>제목: </label> -->
          <%=noticeVO.getTitle() %>
        </li>
        <li class="li_none">
          <!-- <label style="vertical-align: top;">내용: </label> -->
          <%=convertChar(noticeVO.getContent()) %>
        </li>
        <li class="li_none">
          <label>성명: </label>
          <%=noticeVO.getRname()%>
        </li>
        <li class="li_none">
          <label>패스워드: </label>
          <input class="input_basic" type="password" name="passwd" style="width: 30%;">
        </li>
        <li class="li_none">
          <div style="text-align: center;">
            <p style="font-size: 20px; color:red; font-weight: bold;">삭제를 진행하면 복구할 수 없습니다.</p>
            삭제하시겠습니까?
          </div>
        </li>
      </ul>
      
      
      <div class ="bottom_menu">
        <button type="submit">삭제 진행</button>
        <button type="button" onclick="location.href = './list.jsp'">취소</button>
        <button type="button" onclick="location.href = './list.jsp'">목록</button>
      </div>
    </fieldset>
  </form>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>