<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<script type="text/javascript">
$(function(){
  $("#addBtn").on("click", addView);
  addView();
});
 
function addView(){
  $.ajax({
      url: "./add_view_pg.do",
      type: "GET",
      cache: false,
      dataType: "JSON",
      data: "replyPage="+$("#reply_list").attr("data-replyPage"),
      success: function(rdata){
        $("#reply_list").attr("data-replyPage", rdata.replyPage);
        // alert(data.replyPage);
        // $('#reply_list').html(data.replyPage);
        var content="";
        for(index=0; index <rdata.list.length; index++) {
          content += "<DIV style='width: 100%; padding: 10px;'>";
          content += rdata.list[index].title + "("+rdata.list[index].name+") "+"<br>";
          content += rdata.list[index].content;
          content += "</DIV>";
        }
       
        $(content).appendTo("#reply_list");
      },
      error: function (request, status, error){
        alert(request.status + "\n"+request.responseText + "\n" + error);      
      }
  });
}
 
</script>
 
 
</head> 
<body>
<DIV class='container'>
  
  <DIV id='reply_list' data-replyPage='1' style='border: solid 1px #AAAAAA; margin: 0px auto; width: 70%; background-color: #FFFFFF;'>
    
  </DIV>  
  <DIV id='reply_list_btn' style='border: solid 1px #AAAAAA; margin: 0px auto; width: 70%; background-color: #AAAAAA;'>
    <button id='addBtn' style='width: 100%;'>더보기 ▽</button>     
  </DIV>  
 
</DIV>
</body>
</html> 
 