<%@ page contentType="text/html; charset=UTF-8" %>
<!-- jsp: include를 사용했기 때문에 root로 인한 충돌이 발생하지 않는다. -->
<% String root = request.getContextPath(); %>

<DIV class='container'>
  <DIV class='top_img'>
    <NAV class="top_menu">
      <a href="<%=root %>" class="menu_link">HOME</a> | 로그인 | 예약 | 조회 | Q&A | 고객센터 
    </NAV>
  </DIV>
 
  <DIV style='margin-top: 10px;'> <!-- 좌측 메뉴 + 내용 시작 -->
    <DIV class='left_menu'> <!--  좌측 메뉴 시작 -->
      <div class="li_left_menu_1" >국내 여행</div>
      <UL>
         <!-- 모든 위치에서 동일한 주소를 찾아야하므로, 절대 경로로 설정 -->
        <LI class="li_left_menu_2"><a href="<%= request.getContextPath() %>/notice1/list.jsp">version 1.0</a></LI>
        <LI class="li_left_menu_2"><a href="<%= request.getContextPath() %>/notice1a/list.jsp">version 1.0a</a></LI>
        <LI class="li_left_menu_2"><a href="<%= request.getContextPath() %>/notice1b/list.jsp">version 1.0b</a></LI>
        <LI class="li_left_menu_2">version 1.0c</LI>
        <LI class="li_left_menu_2">version 1.0d</LI>
      </UL>
      <!-- br을 쓰는 것보다 margin으로 여백을 주는 것이 낫다 -->
      <div class="li_left_menu_1">메일</div>
      <UL>
        <LI class="li_left_menu_2"><a href="<%= request.getContextPath() %>/mail_app/list.jsp">version 1.0</a></LI>
        <LI class="li_left_menu_2"><a href="<%= request.getContextPath() %>/mail_app1a/list.jsp">version 1.0a</a></LI>
        <LI class="li_left_menu_2"><a href="<%= request.getContextPath() %>/mail_app1b/list.jsp">version 1.0b</a></LI>
        <LI class="li_left_menu_2">version 1.0c</LI>
        <LI class="li_left_menu_2">version 1.0d</LI>
      </UL>
    
    </DIV>  <!--  좌측 메뉴 종료 -->
    
    <DIV class='content_body'> <!--  내용 시작 -->