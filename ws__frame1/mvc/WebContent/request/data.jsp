<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<%


request.setAttribute("dev", "JAVA 개발자");
String dev = (String)request.getAttribute("dev");
System.out.println(dev);

request.setAttribute("year", 2020);
int year = (Integer)request.getAttribute("year");
System.out.println(year);

request.setAttribute("point", 10.5);
double point = (Double)request.getAttribute("point");
System.out.println(point);

request.setAttribute("date", new Date());
Date date = (Date)request.getAttribute("date");
System.out.println(date.toLocaleString());

request.setAttribute("web","Web 개발");
String web = (String)request.getAttribute("web");
System.out.println(web);
 
%>
</body>
</html>
</html>