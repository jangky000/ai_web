<%@ page contentType="text/plain; charset=UTF-8" %> 
 <%@ page import="org.json.JSONObject" %>
 
<%
Thread.sleep(5000); // 5초

/* 
{
"name":"가길동",
"id":"user1",
"web":80,
"data":90
} 
*/
JSONObject json = new JSONObject();
json.put("name", "가길순");
json.put("id", "user1");
json.put("web",80);
json.put("data",90);

out.println(json.toString());
%>

