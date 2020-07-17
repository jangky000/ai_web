<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.IOException" %>
 
<%@ page import="org.apache.commons.fileupload.*" %>
 
<%@ page import = "nation.web.tool.*" %>
 
전송된 파일 정보<br><br>
<%
//-------------------------------------------------------------------
// Fileupload 콤포넌트 관련 코드, 하나의 파일을 업로드 처리
//-------------------------------------------------------------------
String upDir = application.getRealPath("/javascript/form_plugin/storage");
String tempDir = application.getRealPath("/javascript/form_plugin/temp");
 
String where = "";         //일반 폼 태그 
String cdate = "";         //일반 폼 태그
 
FileItem fileItem = null;   //업로드 파일 객체
String filename = "";       //업로드 파일명
Upload upload = new Upload(request, -1, -1, tempDir);
 
where = upload.toKor(upload.getParameter("where"));
cdate = upload.toKor(upload.getParameter("cdate"));
 
out.println("촬영 장소: " + where + "<BR>");
out.println("촬영 날짜: " + cdate + "<BR>");
 
// 전송하려는 파일이 최종적으로 3개임으로 3번 순환합니다.
Thread.sleep(1000);  // 1초 지연, 서비스시 주석 처리
fileItem = upload.getFileItem("file1"); // file1
  
if (fileItem != null){
  long filesize = fileItem.getSize(); // 파일 사이즈
  if(filesize > 0) {
    filename =upload.saveFile(fileItem, upDir); // 서버에 저장
    out.println("<IMG src='" + request.getContextPath() + "/javascript/form_plugin/storage/" + filename + "' style='width: 300px; height: 200px;'>");
  }  
}
%>