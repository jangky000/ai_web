<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("UTF-8"); %>
 
<%
Thread.sleep(5000); // 5초간 중지, 배포할 때는 사용할 일이 없음, 네트워크를 타고 오는데 시간이 걸리기 때문
%>
 
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

System.out.println("id: "+ id);

if (id.equals("user1") && passwd.equals("123")){
%>
  성명: 홍길동<BR>
  아이디: <%=id %><BR>
  패스워드: <%=passwd %><BR>
  본봉: ￦ 2,300,000 원 <BR>
  수당: ￦ 100,000 원 <BR>
  합계: ￦ 2,400,000 원 <BR>
<%  
}else{
%>
  아이디와 패스워드가 일치하지 않습니다.<BR><BR>
<%  
}
%>  