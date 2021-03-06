<%@ page contentType="text/html; charset=UTF-8" %>
 
 <%@include file="./ssi.jsp" %>
 
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


  <div class="title_line"><%=application_title %>＞수정</div>
  <form name='frm' action='./update_proc.jsp' method='POST'>
    <!-- 사용자에게 보여줄 필요가 없는 데이터 -->
    <input type='hidden'  name= 'noticeno'  value='<%=noticeVO.getNoticeno() %>'>
  
    <fieldset class="fieldset_basic">
      <!-- <legend class="legend_basic">공지사항 등록</legend> -->
      <ul>
        <li class="li_none">
          <label>제목: </label>
          <input class="input_basic" value="<%=noticeVO.getTitle()%>"
                     type="text" name="title" style="width: 80%;" autofocus="autofocus">
        </li>
        <li class="li_none">
          <label style="vertical-align: top;">내용: </label>
          <textarea name="content" style="width: 80%; height: 150px;"><%=noticeVO.getContent()%></textarea>
        </li>
        <li class="li_none">
          <label>성명: </label>
          <input class="input_basic" value="<%=noticeVO.getRname()%>"
                     type="text" name="rname" style="width: 80%;">
        </li>
        <li class="li_none">
          <label>패스워드: </label>
          <input class="input_basic" type="password" name="passwd" style="width: 30%;">
        </li>
      </ul>
      <div class ="bottom_menu">
        <button type="submit">수정</button>
        <button type="button" onclick="location.href = './list.jsp'">취소</button>
        <button type="button" onclick="location.href = './list.jsp'">목록</button>
      </div>
    </fieldset>
  </form>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>