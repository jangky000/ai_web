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
int mailno = Integer.parseInt(request.getParameter("mailno"));
String my_ip = request.getRemoteAddr();

MailVO mailVO = mailDAO.read(mailno);
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
  <div class="title_line"><%=application_title %>＞수정</div>
  
  <form name='frm' action='./update_proc.jsp' method='POST'>
    <input type='hidden' name='mailno' value='<%= mailno %>'>
    <fieldset class="fieldset_basic">
      <!-- <legend class="legend_basic">공지사항 등록</legend> -->
      <ul>
        <li class="li_none">
          <label>제목: </label>
          <input class="input_basic" type="text" name="title" style="width: 80%;" autofocus="autofocus" 
                      value="<%=mailVO.getTitle() %>">
        </li>
        <li class="li_none">
          <label>보내는 사람 IP: </label>
          <input class="input_basic" type="text" name="mail_from"  value="<%= my_ip %>" style="width: 200px;" readonly="readonly">
        </li>
        <li class="li_none">
          <label>받는 사람 IP: </label>
          <input class="input_basic" type="text" name="mail_to" style="width: 200px;" value="<%= mailVO.getMail_to()%>">
        </li>
        <li class="li_none">
          <label style="vertical-align: top;">내용: </label>
          <textarea name="content" style="width: 80%; height: 150px;"><%=mailVO.getContent() %></textarea>
        </li>
      </ul>
      
      <table style="border-collapse: collapse; width: 100%; border: solid 1px #999999; margin-top: 100px;">
        <tr>
          <th style="width: 100px; border: solid 1px #999999;">url1:</th>
          <td style="padding-left: 10px; border: solid 1px #999999;">
            <%
              if(mailVO.getUrl1() != null){
                %>
                <input class="input_basic" type="text" name="url1" style="width: 100%;" value="<%=mailVO.getUrl1()%>">
                <%
              }else{
                %>
                <input class="input_basic" type="text" name="url1" style="width: 100%;" value="">
                <%
              }
            %>
          </td>
        </tr>
        <tr>
          <th style="width: 100px; border: solid 1px #999999;">url2:</th>
          <td style="padding-left: 10px; border: solid 1px #999999;">
            <%
              if(mailVO.getUrl2() != null){
                %>
                <input class="input_basic" type="text" name="url2" style="width: 100%;" value="<%=mailVO.getUrl2()%>">
                <%
              }else{
                %>
                <input class="input_basic" type="text" name="url2" style="width: 100%;" value="">
                <%
              }
            %>
          </td>
        </tr>
        <tr>
          <th style="width: 100px; border: solid 1px #999999;">youtube:</th>
          <td style="padding-left: 10px; border: solid 1px #999999;">
            <%
              if(mailVO.getYoutube() != null){
                %>
                <input class="input_basic" type="text" name="youtube" style="width: 100%;" value="<%=mailVO.getYoutube()%>">
                <%
              }else{
                %>
                <input class="input_basic" type="text" name="youtube" style="width: 100%;" value="">
                <%
              }
            %>
          </td>
        </tr>
      </table>
      
      <div class ="bottom_menu">
        <button type="submit">수정 완료</button>
        <button type="button" onclick="location.href = './list.jsp'">취소</button>
        <button type="button" onclick="location.href = './list.jsp'">목록</button>
      </div>
    </fieldset>
    
  </form>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>