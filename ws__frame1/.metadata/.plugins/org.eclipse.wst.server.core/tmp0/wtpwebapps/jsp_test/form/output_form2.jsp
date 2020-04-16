<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>title</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
 <%
 String trips = "태국/베트남/호주/스위스/캐나다/한국";
 String[] trips_ary = trips.split("/");
 
 
 %>
 여행할 국가 순위
 <ol>
 <%
 for(int i =0; i<trips_ary.length; i++){
 %>
   <li><%=trips_ary[i] %></li>
 <%
 }
 %>
 </ol>
 
 여행할 국가<br>
 <select>
<%
 for(int i =0; i<trips_ary.length; i++){
 %>
   <option value="<%=trips_ary[i] %>"><%=trips_ary[i] %></option>
 <%
 }
 %>
 </select>
 
 <br><br>
 
 여행할 국가<br>
 <%
 for(int i =0; i<trips_ary.length; i++){
 %>
   <label style="cursor:pointer;"><input type="radio"  name ="travel"  value="<%=trips_ary[i] %>"><%=trips_ary[i] %></label><br>
 <%
 }
 %>
 
  <br><br>
 여행할 국가<br>
 <%
 for(int i =0; i<trips_ary.length; i++){
 %>
   <label style="cursor:pointer;"><input type="checkbox"  name ="travel"  value="<%=trips_ary[i] %>"><%=trips_ary[i] %></label><br>
 <%
 }
 %>
 
</body>
</html>