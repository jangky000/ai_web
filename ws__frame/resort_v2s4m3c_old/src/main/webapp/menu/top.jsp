<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
// String root = request.getContextPath();
// ${pageContext.request.contextPath} // root = "/resort"
%>

<c:set var='root' value='${pageContext.request.contextPath }'/>

<DIV class='container' style='width: 100%;'> 
  <!-- 화면 상단 메뉴 -->
  <DIV class='top_img'>
    <DIV class='top_menu_label'>Resort 0.1 영화와 여행이있는 리조트</DIV>
    <NAV class='top_menu'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='${root }' >힐링 리조트</A> <span class='top_menu_sep'>&nbsp;</span>
      <A class='menu_link'  href='${root}/categrp/list.do'>카테고리 그룹</A> <span class='top_menu_sep'>&nbsp;</span>    
      <A class='menu_link'  href='${root}/cate/list.do'>모든 카테고리</A> <span class='top_menu_sep'>&nbsp;</span>    
      <A class='menu_link'  href='${root}/contents/list_all_cate.do'>전체글</A> <span class='top_menu_sep'>&nbsp;</span>    
      <A class='menu_link'  href='${root}/member/list.do'>회원목록</A> <span class='top_menu_sep'> </span>  
          
    </NAV>
  </DIV>
  
  <!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성 -->  
  <DIV class="row" style='margin-top: 2px;'>
    <DIV class="col-xs-4 col-sm-3 col-md-2"> <!-- 메뉴 출력 컬럼 -->
      <img src='${root}/menu/images/myimage.png' style='width: 100%;'>
      <div style='margin-top: 5px;'>
        <img src='${root}/menu/images/myface.png'>힐링 리조트
      </div>
       ▷ <A href='${root}/contents/list_all.do'>전체글</A>
       <!-- Spring 출력 카테고리 그룹 / 카테고리 -->
      <%-- <c:import url="/cate/list_index_left.do" /> --%>
    </div>
      
    <DIV class="col-xs-8 col-sm-9 col-md-10 cont">  <!-- 내용 출력 컬럼 -->  
   
<DIV class='content'>