<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movieSlideInsert.jsp</title>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
</head>
<style>
 .img-circle {border:2px solid black;}
</style>
<body>
<form name="adminform" action="mvsinsert.do"  enctype="multipart/form-data" method="post">
 <table> 
 
  <tr>
   <th>슬라이드 이미지 추가(size: 1600 * 600)</th>
  </tr>

  <tr>
   <td>
    <img id="preview" class="img-circle" name="upload_img" width="450" height="200" >
   </td>
   
   <td>
    <input type="file" name="upload_file" id="file">
   </td>
  </tr>
  
    <tr>
   <th>영화슬라이드 클릭시 나오는 영상추가</th>
  </tr>

  <tr>
   <td>
    <div id="preview2" class="img-circle" name="upload_video" style="width:450px;height:200px;position: relative;">
     <p style="width:200px;position: absolute;left:122px;top:70px;text-align: center;color:blue;">
     
     </p>
    </div>
   </td>
   
   <td>
    <input type="file" name="upload_video" id="file2">
   </td>
  </tr>
    
 </table>
 
 <table>
 <tr>
   <input type="submit" value=등록></td>
   <input type="reset" value=취소></td>
  </tr>
 </table>
</form>

<script>

$(document).ready(function() {
   function readURL(input) {
       if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
               $('#preview').attr('src', e.target.result);
               $('#preview').attr('name', escape(e.name));
               $('#preview').css({'width' : '450px'});
               $('#preview').css({'height' : '200px'});
           }
           reader.readAsDataURL(input.files[0]);
       }
   }

   $("#file").change(function () {
       readURL(this);
   });
   
   });
   
$(document).ready(function() {
	   function readURL(input) {
	       if (input.files && input.files[0]) {
	           var reader = new FileReader();
	           reader.onload = function (e) {
	               $('#preview2 p').text("upload ok!!");
	               $('#preview2').css({'width' : '450px'});
	               $('#preview2').css({'height' : '200px'});
	           }
	           reader.readAsDataURL(input.files[0]);
	       }
	   }

	   $("#file2").change(function () {
	       readURL(this);
	   });
	   
	   });   
   
</script>


</body>
</html>