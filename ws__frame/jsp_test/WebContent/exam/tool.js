/**
 * ex10
 * tool.js
 */

window.onload = function(){
    //ex2
    document.getElementById('btn_ex2').onclick=func_ex2; 
    //ex3
    document.getElementById('btn_ex3').addEventListener('click', func_ex3); 
}

// ex8
$(function(){
  alert('페이지 로딩 완료');
  $("#btn_check_img").on('click', check_img);
  $("#search").html('search id 검색 완료');
  $("#sum_result").html(sum(10, 20));
});

//ex1
function func_ex1(){
  alert('ex1 onclick 이벤트 호출');
}

//ex2
function func_ex2(){
  alert('DOM level1 방식 ex2 이벤트 호출');
}

//ex3
function func_ex3(){
  alert('DOM level2 방식 ex3 이벤트 호출');
}

//ex4
function sum(fnum, rnum){
  return fnum+rnum;
}

// ex9
function check_img(){
  var frm = $('#frm');
  var is_img = $('#is_img', frm).val();

  var trimmed_is_img = $.trim(is_img);
  
  if (trimmed_is_img.length == 0) {
    $('img_result').html('FALSE');
    return;
  } else{
    var fileformat = trimmed_is_img.slice(trimmed_is_img.lastIndexOf(".")+1).toLowerCase();
    if(fileformat != "jpg" && fileformat != "png" && fileformat != "gif" && fileformat != "bmp"){
      $('#img_result').html('FALSE');
      return;
    } else{
      $('#img_result').html('TRUE');
      return;
    }
  }
  
}
