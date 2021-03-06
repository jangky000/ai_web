<%@ page contentType="text/plain; charset=UTF-8" %> 
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>

<%
Thread.sleep(5000); // 5초
%>

<%
/*
json 객체 안에 json 객체 -> 가능하다. 

출력 결과
{
  "code":"A001",
  "product":{
                "name":"Android Phone",
                "price":400000,
                "display":"7 inch"
                }
}
*/
JSONObject json = new JSONObject();
json.put("code", "A001");

JSONObject product = new JSONObject();
product.put("name", "Android Phone");
product.put("price", 400000);
product.put("display", "7 inch");

json.put("product", product);

out.println(json.toString());
%>