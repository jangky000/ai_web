<%@ page contentType="text/html; charset=UTF-8" %>
 
 <%@ page import='nation.web.tool.*' %>
 
<%@ include file="./ssi.jsp" %>
 
<!DOCTYPE html>
<html lang="ko">
<head> 
<meta charset="UTF-8">
<title>파일 업로드 처리</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<%
// enctype="multipart/form-data"방식으로 전송된 폼의 데이터는 reqest 객체 사용시 null값
// String title = request.getParameter("title");
// String file1 = request.getParameter("file1");

String tempDir = application.getRealPath("/file/temp");  // WebContent 기준
String upDir = application.getRealPath("/file/storage");   // WebContent 기준

// @param request HttpServletRequest 객체 
// @param threshold 메모리에 저장할 최대크기,  -1: 무제한, byte 단위 
// @param max 업로드할 최대 파일크기, -1: 무제한, byte 단위
// @param repositoryPath 업로드 경로 
Upload upload = new Upload(request, (1024 * 1024 * 1), -1, tempDir); // 1 MB: 1024 x 1024 x 1

String title = upload.toKor(upload.getParameter("title")); // 한글 변환 // 스프링은 자동으로 변환해줌
// String file1 = upload.getParameter("file1"); // file type is null

FileItem fileItem = upload.getFileItem("file1");
String file1 = fileItem.getName(); // 업로드전 파일명 추출
long size1 = fileItem.getSize();  // 파일 사이즈

if (size1 > (1024 * 1024 * 1)) {
%>
  <DIV style='color: #FF0000; font-weight: bold;'>
    전송 파일이 1MB를 넘을 수 없습니다. 다시 시도해주세요.
    <button type='button' onclick="location.href='./create_form.jsp'">다시 시도</button>
  </DIV>
<%  
} else{
  // 크롬으로부터 업로드된 파일 저장후 파일명 리턴 
  String new_file1 = upload.saveFile(fileItem, upDir);  
  //C:\ai6\ws__frame\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jsp_test\file\storage
%>
  촬영지: <%=title %><br>
  파일명: <%=file1 %><br>
  파일 크기: <%=size1 %><br>
  저장된 파일명: <%=new_file1 %><br>
  
  <IMG src='./storage/<%=new_file1 %>' style='width: 50%;'><br><br>
  <button type='button' onclick="location.href='./create_form.jsp'">계속 등록</button>
<%  
}
%>

</body>
</html>