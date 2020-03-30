<%@ page contentType="text/html; charset=UTF-8" %>
 
<%!
public String isImage(String fname){
  fname = fname.toLowerCase();
  if(fname.endsWith(".jpg") || fname.endsWith(".gif") || fname.endsWith(".png")){
    //bmp는 용량이 커서 사용하지 않는다.
    StringBuffer sb = new StringBuffer();
    sb.append("<img src='./images/");
    sb.append(fname);
    sb.append("' style = 'width:30%;'>");
    
    // 에러 -> 세미 콜론 문제    
    //System.out.println("".format("<img src='./images/%s' style = 'width:30%;'>", fname));
    
    //System.out.println("<img src='./images/"+fname + "' style = 'width:30%;'>");
    return sb.toString();
    //return str;
  } else{
    return "이미지가 아닙니다.";
  }
}
%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{ font-family: 맑은 고딕; font-size: 26px;}
</style>
</head>
<body>

<%= isImage("coffee01.jpg") %>
<br>
<%= isImage("coffee02.jpgx") %>
<br>
<%= isImage("coffee03.jpg") %>
<br>



</body>
</html>
 