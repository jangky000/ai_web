<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ page import ="nation.web.mail_app1b.MailDAO" %>
<%@ page import ="nation.web.mail_app1b.MailVO" %>

<%
  request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%>

<%
  MailDAO mailDAO = new MailDAO();
  MailVO mailVO = new MailVO();
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
  <fieldset class="fieldset_basic">
    <!-- <legend class="legend_basic">공지사항 등록</legend> -->
      <ul>
        <%
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String mail_from = request.getParameter("mail_from");
        String mail_to = request.getParameter("mail_to");
        String url1 = request.getParameter("url1");
        String url2 = request.getParameter("url2");
        String youtube = request.getParameter("youtube");
        
        mailVO.setTitle(title);
        mailVO.setContent(content);
        mailVO.setMail_from(mail_from);
        mailVO.setMail_to(mail_to);
        mailVO.setUrl1(url1);
        mailVO.setUrl2(url2);
        mailVO.setYoutube(youtube);
        
        int count = mailDAO.create(mailVO); // call by reference
      
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
        <button type="button" onclick="location.href = './create_form.jsp'">새로운 메일 보내기</button>
        <button type="button" onclick="location.href = './list.jsp'">목록</button>
      </div>
  </fieldset>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>