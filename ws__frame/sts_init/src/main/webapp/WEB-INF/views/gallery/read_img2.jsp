<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>read_img2.jsp</title>

<style type="text/css">
  * { font-size: 30px; }
</style>

</head>
<body>
  <div style="width: 60%; margin: 20px auto;">
    1. /webapp/WEB-INF/views/gallery/images/img02.jpg<br>
    <!-- 서블릿 주소의 현재 폴더 './' = 'http://localhost:9090/init/gallery' -->
    <img alt="404 찾을 수 없음" src="./images/${img }" style="width:100%;">
    <br>
    2. /webapp/gallery/images/img02.jpg<br>
    <!-- 서블릿 주소의 현재 폴더 './' = 'http://localhost:9090/init/gallery' -->
    <img alt="404 찾을 수 없음" src="/init/gallery/images/${img }" style="width:100%;">
    <br>
    
  </div>
</body>
</html>