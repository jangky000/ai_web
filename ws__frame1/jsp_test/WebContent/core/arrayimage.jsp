<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for문 실습</title>
</head>
<body>
<h1>튜울립 축제</h1>
<%
String images[] = new String[10];

for(int i=0; i<10; i++){
  //숫자를 2자리로 맞춰줌
  images[i] = String.format("./images/tu%02d.jpg", i+1); 
}
/*
for(int i =0; i<10; i++){
  out.println(images[i]);
  if(i%5 == 4){
    out.println("<br>");
  }
}
*/
for(int i =0; i<10; i++){
  if(i%5 == 0 && i !=0){
    out.println("<br>");
  }
  out.println("<img src='" + images[i] + "' style='width:200px; height:150px';>");
}

// 자릿수 맞춰주기
// 0: 자릿수 숫자가 없으면 0으로 채움, #: 자릿수 숫자가 없으면 채우지 않음
//DecimalFormat df = new DecimalFormat("00");
//System.out.println(df.format(9));
//System.out.println(df.format(10));
System.out.println(String.format("./images/tu%02d.jpg", 1)); // 01
System.out.println(String.format("./images/tu%02d.jpg", 99)); // 99
System.out.println(String.format("./images/tu%02d.jpg", 100)); // 100


%>
 
</body>
</html>