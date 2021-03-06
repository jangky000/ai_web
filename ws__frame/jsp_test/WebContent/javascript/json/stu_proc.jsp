<%@ page contentType="text/plain; charset=UTF-8" %>
<%@ page import="org.json.JSONObject" %>

<%
Thread.sleep(3000);

// http://localhost:9090/jsp_test/javascript/json/stu_proc.jsp?name=왕눈이&java=90&html=100&css=90
// {"msg":"통과","css":90,"java":90,"avg":93,"name":"왕눈이","tot":280,"html":100}
 
String name = request.getParameter("name");
int java = Integer.parseInt(request.getParameter("java"));
int html = Integer.parseInt(request.getParameter("html"));
int css = Integer.parseInt(request.getParameter("css"));

int tot = java + html + css;
int avg = (int)(tot / 3);
String msg = "";
if(avg >= 70) {
  msg = "통과"; 
} else {
  msg= "대기";
}

/* json 객체 만들기 */
JSONObject json = new JSONObject();

json.put("name", name);
json.put("java", java);
json.put("html", html);
json.put("css", css);
json.put("tot", tot);
json.put("avg", avg);
json.put("msg", msg);

out.println(json.toString()); // 반드시 필요함 
// 없으면 jsp처리 결과에(html)에 아무것도 나오지 않게 됨 -> json 객체가 출력되어야 함
%> 