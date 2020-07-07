<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>테스트 실습</title> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
</head>
<body>
<%
int year = 2010;
year++;
out.println("1) year: " + year);
year++;
out.println("2) year: " + year);
year++;
out.println("3) year: " + year);
year++;
out.println("4) year: " + year);
year++;
out.println("5) year: " + year);
%>
</body>
</html>