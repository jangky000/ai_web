<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>파일 전송</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
  <form name='frm' action='./create_proc.jsp' method='POST' 
            enctype="multipart/form-data">
    <TABLE class='table_basic' style='width: 60%;'>
      <TR>
        <TH class='th_basic'>촬영 장소</TH>
        <TD class='td_left'>
          <input type='text' name='title' value='오스트리아 가을' style='width: 90%;'>
        </TD>
      </TR>
 
      <TR>
        <TH class='th_basic'>이미지 파일</TH>
        <TD class='td_left'>
          <input type='file' name='file1' style='width: 90%;'>
        </TD>
      </TR>
    </TABLE>
    
    <DIV class='bottom_menu'>
      <button type='submit'>파일 업로드</button> 
    </DIV>   
  </form>
 
 
</body>
</html>