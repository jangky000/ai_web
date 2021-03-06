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
  <div class="title_line"><%= application_title%>＞삭제</div>
  
  <form name='frm' action='./delete_proc.jsp' method='POST'>
    <input type='hidden' name='mailno' value='<%= mailno %>'>
    <fieldset class="fieldset_basic">
      <!-- <legend class="legend_basic">공지사항 등록</legend> -->
      <ul>
        <li class="li_none">
          <label>제목: </label>
          <%=mailVO.getTitle() %>
        </li>
        <li class="li_none">
          <label>보내는 사람 IP: </label>
          <%= my_ip %>
        </li>
        <li class="li_none">
          <label>받는 사람 IP: </label>
          <%= mailVO.getMail_to()%>
        </li>
        <li class="li_none">
          <label style="vertical-align: top;">내용: </label>
          <%=mailVO.getContent() %>
        </li>
        
        <li class="li_none" style="margin-bottom: 100px;">
          <table style="border-collapse: collapse; width: 100%; border: solid 1px #999999; margin-top: 100px;">
            <tr>
              <th style="width: 100px; border: solid 1px #999999;">url1:</th>
              <td style="padding-left: 10px; border: solid 1px #999999;">
                <%
                  if(mailVO.getUrl1() != null){
                    %>
                    <a href="<%=mailVO.getUrl1()%>"><%=mailVO.getUrl1()%></a>
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
                    <a href="<%=mailVO.getUrl2()%>"><%=mailVO.getUrl2()%></a>
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
                    <a href="<%=mailVO.getYoutube()%>"><%=mailVO.getYoutube()%></a>
                    <%
                  }
                %>
              </td>
            </tr>
          </table>
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