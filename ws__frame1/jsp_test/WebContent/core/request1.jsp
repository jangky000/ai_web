<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
  <%
  String[] files = new String[10];
 
  files[0] = "./images/tu01.jpg";
  files[1] = "./images/tu02.jpg";
  files[2] = "./images/tu03.jpg";
  files[3] = "./images/tu04.jpg";
  files[4] = "./images/tu05.jpg";
  files[5] = "./images/tu06.jpg";
  files[6] = "./images/tu07.jpg";
  files[7] = "./images/tu08.jpg";
  files[8] = "./images/tu09.jpg";
  files[9] = "./images/tu10.jpg";
  int index = Integer.parseInt(request.getParameter("index"));
  %>
  
  index:<%= index %><br>
  Server: 172.16.12.4<br>
  <%
  if(index > 0 && index <= 10){
  %>
    <img src='<%=files[index-1] %>' style='width:500px;'><br>
  <%
  } else{
  %>
    번호에 해당하는 이미지가 없습니다.
  <%
  }
  %>
  <br>
  
  <%
  //변수명이 일치하게 변수 할당하는 것을 권장
  String filename = request.getParameter("filename");
  %> 
  filename: <%= filename %><br>
  
  <%
  //filename = "./images/" + filename;
  filename = filename.toLowerCase();
  if(filename.endsWith(".jpg") || filename.endsWith(".png") || filename.endsWith(".gif")){
  %>
      
      <img src='./images/<%= filename%>' style='width:500px;'><br>
  <%
  }else{
  %>
  이름에 해당하는 이미지가 없습니다.
  <%
  }
  %>
  
</body>
</html>