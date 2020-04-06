<%@ page contentType="text/html; charset=UTF-8"%>

 <%@include file="./ssi.jsp" %>

<%
NoticeVO noticeVO = new NoticeVO();
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
  <div class="title_line"><%=application_title %>＞삭제</div>
  <fieldset class="fieldset_basic">
    <!-- <legend class="legend_basic">공지사항 등록</legend> -->
    <ul>
      <%
        int noticeno = Integer.parseInt(request.getParameter("noticeno"));
        String passwd = request.getParameter("passwd");

        boolean isPasswdcheck = false;
        int count = 0;
        
        noticeVO.setNoticeno(noticeno);
        noticeVO.setPasswd(passwd);
        
        isPasswdcheck = noticeProc.passwdCheck(noticeno, passwd);
        
        
        if (isPasswdcheck == true) { // 패스워드 일치
          count = noticeProc.delete(noticeno);
        
          if (count == 1) {
            %>
            <li class="li_none">삭제 처리에 성공했습니다.</li>
            <%
          } else {
            %>
            <li class="li_error">삭제 처리에 실패했습니다.</li>
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
      %>
 
    </ul>
    <div class="bottom_menu">
      <!-- onclick = "" javascript 연결 -->
      <%
        if(isPasswdcheck == false || count == 0){
          %>
          <button type="button" onclick="history.back();">다시 시도</button>
          <%
        } else{
        }
        %>
      <button type="button" onclick="location.href = './list.jsp'">목록</button>
    </div>
  </fieldset>

  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>