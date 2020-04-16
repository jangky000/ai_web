<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 28px;}
</style>
</head>
<body>
  <form name='frm' action='./select_proc.jsp' method='GET'>
    <H2>주말 여행지 선택</H2>
    1박 2일 국내 여행 직접 입력:
    <input type='text' name='travel1' size='20' placeholder="동해 등 입력" autofocus="autofocus">
    <br>
    3박 4일 해외 여행지 선택:
    <select name = "travel2">
      <option value ="태국">태국</option>
      <option value ="베트남" selected>베트남</option>
      <option value ="호주">호주</option>
    </select>
 
    <br>
    <input type='submit' value='신청'>
  </form>
</body>
</html>