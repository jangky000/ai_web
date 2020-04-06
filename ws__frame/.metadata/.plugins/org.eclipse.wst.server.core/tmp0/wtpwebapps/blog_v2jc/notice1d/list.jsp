<%@ page contentType="text/html; charset=UTF-8" %>
 
<%! public String wrap_xmp(String str){ return "<xmp>"+str + "</xmp>";} %>

 <%@include file="./ssi.jsp" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <div class="title_line"><%=application_title %></div>
  <div class="sub_menu">
    <button type="button" onclick="location.href='./create_form.jsp'">등록</button>
  </div>
  <table class="table_basic">
    <colgroup>
      <col style="width: 5%;">
      <col style="width: 50%;">
      <col style="width: 12%;">
      <col style="width: 18%;">
      <col style="width: 15%;">
    </colgroup>
    <thead>
      <tr>
        <th class="th_basic">NO</th>
        <th class="th_basic">제목</th>
        <th class="th_basic">성명</th>
        <th class="th_basic">등록일</th>
        <th class="th_basic">기타</th>
      </tr>
    </thead>
    <tbody>
      <%
      int nowPage = 0;
      int recordPerPage = 0;
      
      if(request.getParameter("nowPage") == null){
        nowPage = 1;
      } else{
        nowPage = Integer.parseInt(request.getParameter("nowPage"));
      }
      
      if(request.getParameter("recordPerPage") == null){
        recordPerPage = 3;
      } else{
        recordPerPage = Integer.parseInt(request.getParameter("recordPerPage"));
      }
      
      ArrayList<NoticeVO> list = noticeProc.list(nowPage,  recordPerPage);
      
      for(NoticeVO vo: list){
        %>
        <tr>
          <td class="td_basic"><%= vo.getNoticeno()%></td>
          <td class="td_left"><a href="./read.jsp?noticeno=<%= vo.getNoticeno()%>&nowPage=<%=nowPage %>&recordPerPage=<%= recordPerPage%>"><%= vo.getTitle()%></a></td>
          <td class="td_basic"><%= vo.getRname()%></td>
          <td class="td_basic"><%= vo.getRdate().substring(0,10)%></td>
          <td class="td_basic">
              <a href='./update_form.jsp?noticeno=<%= vo.getNoticeno()%>'>수정</a>
               /
              <a href='./delete_form.jsp?noticeno=<%= vo.getNoticeno()%>'>삭제</a></td>
        </tr>
      <%
      }
      %>
    </tbody>
  </table>
 
  <DIV class='bottom_menu'>
    <%
    // -----------------------------------------------------------------------------
    // 페이징 관련 코드 시작
    // -----------------------------------------------------------------------------
    // listFile 목록 파일명
    // nowPage 현재 페이지
    // recordPerPage 페이지당 레코드 수
    String listFile = "list.jsp";
    String paging = noticeProc.pagingBox(listFile, nowPage, recordPerPage);
    out.println(paging);
    // -----------------------------------------------------------------------------
    %> 
  </DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>