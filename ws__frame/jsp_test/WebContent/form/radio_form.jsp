<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>축제</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
  <h2>축제 예약</h2>
  <!-- post 방식 전송도 get과 같이 파라미터에 접근할 수 있다 -->
  <form name='frm' action='./festival_proc.jsp' method='POST'>
    축제:
    <label style="cursor: pointer;">
      <input type="radio" name="festival" value="산수유 축제" checked="checked">산수유 축제
    </label>
    <label>
      <input type="radio" name="festival" value="매화 축제">매화 축제
    </label>
    <label>
      <input type="radio" name="festival" value="연꽃 축제">연꽃 축제
    </label>
    <label>
      <input type="radio" name="festival" value="연꽃 축제">빙어 축제
    </label>
    <label>
      <input type="radio" name="festival" value="연꽃 축제">한우 축제
    </label>
    <br>
    참가 인원: <input type = "number"  name="count" size="10" min="1" max="500" value="3">
    <br>
    통신사: 
    <label style="cursor: pointer;">
      <input type="radio" name="mobile" value="SKT" >SKT
    </label>
    <label style="cursor: pointer;">
      <input type="radio" name="mobile" value="KT" >KT
    </label>
    <label style="cursor: pointer;">
      <input type="radio" name="mobile" value="LG U+" >LG U+
    </label>
    <label style="cursor: pointer;">
      <input type="radio" name="mobile" value="알뜰폰" >알뜰폰
    </label>
    <br>
    전화번호: 
    <input type="text" name="mobileno" value="010-1111-2222">
    <br><br>
    <button type="submit"> 예약 </button>
  </form>
</body>
</html>