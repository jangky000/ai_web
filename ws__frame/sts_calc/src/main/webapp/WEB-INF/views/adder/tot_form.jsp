<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>tot_form.jsp</title>
<style type="text/css">
  *{ font-size: 26px;}
</style> 
</head> 
 
<body>
<DIV class='container'>
<DIV class='content'>
  <H1>tot_form.jsp</H1>
 
  <div class='panel'>
    <H1></H1>
    <!-- ContextPath (프로젝트 별명, 가상 경로) 선언: /calc -->
    <form name='frm' method='post' action="/calc/adder/add3.do">
      수1: <input type='number' name='no1' value='' autofocus="autofocus"><br><br>
      수2: <input type='number' name='no2' value=''><br><br>
      <button type='submit'>합계</button>
    </form>
  </div>
</DIV> <!-- content END -->
</DIV> <!-- container END -->  
</body>
 
</html>