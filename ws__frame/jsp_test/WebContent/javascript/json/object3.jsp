<%@ page contentType="text/plain; charset=UTF-8" %> 
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>

<%
Thread.sleep(5000); // 5초
%>

<%
/*
{
  "name": "가길동",
  "id": "user1",
  "web": 80,
  "data": 90
}
*/
JSONArray list = new JSONArray(); 

JSONObject json = new JSONObject();
json.put("name", "가길순");
json.put("id", "user1");
json.put("web", 80);
json.put("data", 90);
list.put(json);

json = new JSONObject();
json.put("name", "나길순");
json.put("id", "user2");
json.put("web", 75);
json.put("data", 70);
list.put(json);

json = new JSONObject();
json.put("name", "아로미");
json.put("id", "user3");
json.put("web", 100);
json.put("data", 95);
list.put(json);

out.println(list.toString());
/*
[
 {"data":90,"web":80,"name":"가길순","id":"user1"},
 {"data":70,"web":75,"name":"나길순","id":"user2"},
 {"data":95,"web":100,"name":"아로미","id":"user3"}
 ]
 */
%>