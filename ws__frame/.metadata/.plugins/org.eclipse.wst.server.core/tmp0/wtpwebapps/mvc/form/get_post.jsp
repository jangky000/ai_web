<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
  <div style="width: 50%; margin: 30px auto; text-align: center;">

    <!-- 프로젝트명 필수로 명시(/mvc),    맨 앞에는 /를 표기 -->
    <form name='frm' method='GET' action="/mvc/form/getpost.do">
      <button type='submit' style="font-size: 26px;">GET 방식 전송</button>
    </form>

    <br>

    <form name='frm' method='POST' action="/mvc/form/getpost.do">
      <button type='submit' style="font-size: 26px;">POST 방식 전송</button>
    </form>

  </div>
</body>
</html>