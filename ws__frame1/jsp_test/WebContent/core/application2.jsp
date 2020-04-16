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
int count = 0; // 접속자수
Object obj = application.getAttribute("count");  // 읽기: 키
out.println("obj: " + obj + "<br>");
if (obj == null) {
  //count 속성이 없음
  count = 1; // 첫번째 접속자 발생
} else {
  out.println("접속자수 증가<br>");
  count = (Integer)obj; // Object 타입을 정수형으로 변환
  count++;   // 두번째 접속자부터 증가 시작
}
out.println("접속자수: " + count);
// void javax.servlet.ServletContext.setAttribute(String arg0, Object arg1)
// JAVA는 가능, JSP 불가능
// Object obj = 1;  // Object 타입에 int 저장 불가 (자바 문법에서는 가능)
// System.out.println(obj); // Object --> Integer --> int
application.setAttribute("count", new Integer(count)); // 기록: 키, 값 -> map과 유사, application에 저장, Object 타입으로 저장

%>
</body>
</html>