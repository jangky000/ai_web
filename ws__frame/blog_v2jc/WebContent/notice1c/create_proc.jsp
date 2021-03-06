<%-- <%@page import="nation.web.tool.DBClose"%> --%>
<%@ page contentType="text/html; charset=UTF-8" %>

 <%@include file="./ssi.jsp" %>

<!-- 자동 getter/setter 호출 -->
<jsp:useBean id="noticeVO" class="nation.web.notice1c.NoticeVO"></jsp:useBean>
<jsp:setProperty property="*" name="noticeVO"/>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <div class="title_line"><%=application_title %>＞등록</div>
  <fieldset class="fieldset_basic">
    <!-- <legend class="legend_basic">공지사항 등록</legend> -->
    <ul>
      <%
        /* String title = request.getParameter("title");
          String content = request.getParameter("content");
          String rname = request.getParameter("rname");
          String passwd = request.getParameter("passwd");
          
          noticeVO.setTitle(title);
          noticeVO.setContent(content);
          noticeVO.setRname(rname);
          noticeVO.setPasswd(passwd); */
          
          int count = noticeDAO.create(noticeVO); // call by reference

          if(count == 1) {
            %>
            <li class="li_none">등록 처리에 성공했습니다.</li>
            <%
          } else {
            %>
            <li class="li_error">등록 처리에 실패했습니다.</li>
            <li class="li_none">다시 시도해주세요.</li>
            <%
          }
          %>
    </ul>
    <div class="bottom_menu">
      <!-- onclick = "" javascript 연결 -->
        <%
        if (count == 0) {
          %>
          <button type="button" onclick="history.back();">다시 시도</button>
          <%
        }
        %>
      <button type="button"
        onclick="location.href = './create_form.jsp'">계속 등록</button>
      <button type="button" onclick="location.href = './list.jsp'">목록</button>
    </div>
  </fieldset>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>