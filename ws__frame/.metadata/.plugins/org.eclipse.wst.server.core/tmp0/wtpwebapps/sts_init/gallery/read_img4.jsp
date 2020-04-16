<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>read_img4.jsp</title>

<style type="text/css">
  * { font-size: 30px; }
</style>

</head>
<body>
  <div style="width: 60%; margin: 20px auto;">
    1. /webapp/gallery/images/img03.jpg<br>
    <!-- 서블릿 주소의 현재 폴더 './' = 'http://localhost:9090/init/gallery' -->
    <img alt="" src="./images/${img }" style="width:100%;">
    <br>
  </div>
</body>
</html>