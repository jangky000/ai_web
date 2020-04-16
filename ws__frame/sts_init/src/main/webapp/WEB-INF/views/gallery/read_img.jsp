<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>read_img.jsp</title>

<style type="text/css">
  * { font-size: 30px; }
</style>

</head>
<body>
  <div style="width: 60%; margin: 20px auto;">
    1. /webapp/WEB-INF/views/gallery/images/img01.jpg<br>
    <!-- 서블릿 주소의 현재 폴더 './' = 'http://localhost:9090/init/gallery'(가상의 경로) -->
    <img alt="404 찾을 수 없음" src="./images/${img }" style="width:100%;"><!-- .JSP의 주소를 기반으로 하지 않음. http://localhost:9090/init/gallery/images/img01.jpg -->
    <br>
    2. /webapp/resources/gallery/images/img01.jpg
    <img alt="접근 가능" src="/init/resources/gallery/images/${img }" style="width:100%;">
    <br>
    3. /webapp/gallery/images/img01.jpg
    <img alt="404 찾을 수 없음" src="/init/gallery/images/${img }" style="width:100%;"><!-- 접근 불가 http://localhost:9090/init/galimg/img01.jpg -->
  </div>
</body>
</html>