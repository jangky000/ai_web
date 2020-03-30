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
  <form name='frm' action='./check_proc.jsp' method='POST'>
    <fieldset>
      <legend>여행하고 싶은 국가는?</legend>
      <label>
        <input type="checkbox" name='nation1' value='스위스' checked="checked"> 스위스
      </label>
      <br>
      <label>
        <input type="checkbox" name='nation2' value='미국'> 미국
      </label>
      <br>      
      <label>
        <input type="checkbox" name='nation3' value='일본'> 일본
      </label>
      <br>      
      <label>
        <input type="checkbox" name='nation4' value='캐나다'> 캐나다
      </label>
      <br>      
      <label>
        <input type="checkbox" name='nation5' value='그리스'> 그리스
      </label>
      <br>      
    </fieldset>
    
    <fieldset>
      <legend>좋아하는 메뉴는?</legend>
      <label>
        <input type="checkbox" name='food' value='김밥'> 김밥
      </label>
      <br>
      <label>
        <input type="checkbox" name='food' value='라면'> 라면 
      </label>
      <br>
      <label>
        <input type="checkbox" name='food' value='만두'> 만두 
      </label>
      <br>
      <label>
        <input type="checkbox" name='food' value='짜장면'> 짜장면 
      </label>
      <br>
      <label>
        <input type="checkbox" name='food' value='부대찌개'> 부대찌개 
      </label>
      <br>
    </fieldset>
    <br>
    <input type='submit' value='등록'>  
  </form>
</body>
</html>