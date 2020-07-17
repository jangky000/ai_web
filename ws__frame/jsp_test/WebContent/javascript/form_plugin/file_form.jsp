<%@ page contentType = "text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>파일 업로드 폼</title>
 
<link href="../../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        
<script src="http://malsup.github.com/jquery.form.js"></script> <!-- 다운 받을 필요 없음, CDN 방식 -->
 
<script type="text/javascript">
  $(function() {
    var frm = $('#frm');
    frm.ajaxForm(send_response); // 응답처리 함수 등록, Form plugin Ajax 지원 기능 등록 -> 자동으로 ajax form으로 처리해줌
    $('#msgGIF').hide();  // Progress bar 숨기기
    
  });
  
  // 닫기 버튼
  function getCloseButton() {
    var str = "<br><br><SPAN class='box1' id='box1'><A href=\"javascript: $('#panel').hide();\">CLOSE</A></SPAN>";
    
    return str;
  }
 
  // 파일 전송
  function send(){
    var frm = $('#frm');
    if ($('#file1', frm).val() == '') {  // frm 폼에서 id가 'file1'인 태그 검색
      str = "첫번째 파일을 선택해주세요.";
      str += getCloseButton(); // 닫기 버튼 추가
      $('#panel').html(str);
      $('#panel').show();
      
      return; // 실행 중지
    }
    
    if ($('#file2', frm).val() == '') {
      str = "두번째 파일을 선택해주세요.";
      str += getCloseButton(); // 닫기 버튼 추가
      $('#panel').html(str);
      $('#panel').show();
      
      return;
    }
    
    if ($('#file3', frm).val() == '') {
      str = "세번째 파일을 선택해주세요.";
      str += getCloseButton(); // 닫기 버튼 추가
      $('#panel').html(str);
      $('#panel').show();
      
      return;
    }
    
    $('#panel').text(''); // table 태그 내용 지우기
    $('#msg').text('이미지를 전송중입니다.'); // 메시지 출력
    $('#msgGIF').show();  // Progressbar 출력
    $('#frm').submit();  // 서브밋
    
  }
 
  function send_response(rdata){
    var frm = $('#frm');
    $('#file1', frm).val(''); // frm 폼안에 있는 ID가 file1인 태그의 값 삭제
    $('#file2', frm).val(''); // frm 폼안에 있는 ID가 file1인 태그의 값 삭제
    $('#file3', frm).val(''); // frm 폼안에 있는 ID가 file1인 태그의 값 삭제
    $('#msg').text(''); // 메시지 출력
    $('#msgGIF').hide();   // progress bar 감추기
 
    $('#msg-panel').html(rdata); // panel에 전송 결과 출력
  }
  
</script>
 
</head>
 
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
 
  <!-- 전송시 체크된 값 관련 메시지 출력 -->
  <DIV id='panel' class='popup1' style='display: none; height: 150px;'>
 
  </DIV>
  
  <form name="frm" id="frm" action="./file_proc2.jsp" 
      method="post"
      enctype="multipart/form-data" style='margin: 50px;'>
    촬영 장소: <input type="text" name="where" size="60" value="스위스에서...">
    <br>
    촬영 날짜: <input type="text" name="cdate" size="60" value="2015년 7월 22일">
    <br>
    ⓐ 이미지 파일: <input type="file" name="file1" id="file1" size="50"><br> 
    ⓑ 이미지 파일: <input type="file" name="file2" id="file2" size="50"><br>
    ⓒ 이미지 파일: <input type="file" name="file3" id="file3" size="50"><br>
 
    <input type="button" value="전송" onclick="send();">
    <input type="reset" value="선택취소" >
  </form>
 
  <!--  메시지 출력 -->
  <DIV id="msg" style='margin: 20px auto; width: 500px; text-align: center;'></DIV>
 
  <!-- 진행바 출력 -->
  <DIV id="msgGIF" style='display: none; margin: 20px auto; width: 500px; text-align: center;'>
    <img src="./images/ani01.gif">
  </DIV>
 
  <!-- 전송 결과 출력 -->
  <DIV id='msg-panel' style='width: 80%; margin: 20px auto; border: solid 2px #DDDDDD; text-align: center;'></DIV>
 
   
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
</body>
 
</html>
 