<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.IOException" %>
 
<%@ page import="org.apache.commons.fileupload.*" %>
 
<%@ page import = "nation.web.tool.*" %>
 
전송된 파일 목록<br><br>
<%
//-------------------------------------------------------------------
// Fileupload 콤포넌트 관련 코드, 하나의 파일을 업로드 처리
// /WebContent 폴더 기준
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
for(int i=1; i<=3; i++){
  Thread.sleep(2000);  // 2초 지연, 서비스시 주석 처리
    
  fileItem = upload.getFileItem("file" + i); // file1, file2, file3
    
  long filesize = fileItem.getSize(); // 파일 사이즈
        
  if(filesize > 0) {
    filename =upload.saveFile(fileItem, upDir); // 서버에 저장
    out.println("파일명: " + filename + "  / 파일 사이즈: " + filesize + "<br>");
  }  
}
 
%>