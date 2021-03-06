<%@ page contentType="text/html; charset=UTF-8" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
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
  <div class="title_line">메일 앱 ver 1.0b＞보내기</div>
  
   <%
    out.print("<p>내 IP: " + request.getRemoteAddr() + "</p>");
    String my_ip = request.getRemoteAddr();
    /* out.print("<p>Remote Host: " + request.getRemoteHost() + "</p>"); */
    /* out.print("<p>X-Forwarded-For: " + request.getHeader("x-forwarded-for") + "</p>"); */
    %>
  
  <form name='frm' action='./create_proc.jsp' method='POST'>
    <fieldset class="fieldset_basic">
      <!-- <legend class="legend_basic">공지사항 등록</legend> -->
      <ul>
        <li class="li_none">
          <label>제목: </label>
          <input class="input_basic" type="text" name="title" style="width: 80%;" autofocus="autofocus">
        </li>
        <li class="li_none">
          <label>보내는 사람 IP: </label>
          <input class="input_basic" type="text" name="mail_from"  value="<%= my_ip %>" style="width: 200px;" readonly="readonly">
        </li>
        <li class="li_none">
          <label>받는 사람 IP: </label>
          <input class="input_basic" type="text" name="mail_to" style="width: 200px;">
        </li>
        <li class="li_none">
          <label style="vertical-align: top;">내용: </label>
          <textarea name="content" style="width: 80%; height: 150px;"></textarea>
        </li>
        <!-- <li class="li_none">
          <label style="vertical-align: top;">url1: </label>
          <input class="input_basic" type="text" name="url1" style="width: 200px;">
        </li> -->
      </ul>
      
      <table style="border-collapse: collapse; width: 100%; border: solid 1px #999999; margin-top: 100px;">
        <tr>
          <th style="width: 100px; border: solid 1px #999999;">url1:</th>
          <td style="padding-left: 10px; border: solid 1px #999999;">
            <input class="input_basic" type="text" name="url1" style="width: 100%;" value="https://">
          </td>
        </tr>
        <tr>
          <th style="width: 100px; border: solid 1px #999999;">url2:</th>
          <td style="padding-left: 10px; border: solid 1px #999999;">
            <input class="input_basic" type="text" name="url2" style="width: 100%;" value="https://">
          </td>
        </tr>
        <tr>
          <th style="width: 100px; border: solid 1px #999999;">youtube:</th>
          <td style="padding-left: 10px; border: solid 1px #999999;">
            <input class="input_basic" type="text" name="youtube" style="width: 100%;" value="https://">
          </td>
        </tr>
      </table>
      
      <div class ="bottom_menu">
        <button type="submit">전송</button>
        <button type="button" onclick="location.href = './list.jsp'">취소</button>
        <button type="button" onclick="location.href = './list.jsp'">목록</button>
      </div>
    </fieldset>
    
  </form>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>