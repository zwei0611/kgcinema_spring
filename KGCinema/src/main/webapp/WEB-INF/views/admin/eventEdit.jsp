<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eventEdit.jsp</title>

</head>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script type="text/javascript">

   
   function check() {
      var str = document.getElementById("textarea").value;
      document.getElementById("temp").value = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
      document.adminform.submit();
   }
</script>

<body>

<form name="adminform" action="eventeditsave.do" enctype="multipart/form-data" method="post" >
 <table>
  <tr>
   <th>수정항목</th> <th>수정내용</th>
  </tr>
  <tr>
   <td><input type="hidden" name=e_no value="${event.e_no}"></td>
  </tr>
  <tr>
   <td>제목</td><td><input type="text" name=e_title value="${event.e_title}"></td>
  </tr>
  <tr>
   <td>기간</td><td><input type="text" name=e_period value="${event.e_period}"></td>
  </tr>
  
  <tr>
   <td>이벤트메인</td>
   <td>

    <img id="preview" class="img-circle pull-left image_width" name="sujung_img" width="250" height="250" src="<%=request.getContextPath()%>/resources/storage/${event.e_file}">

   </td>
   <td><input type="file" name="upload_file" id="file">
   <input type="hidden" name="e_file"  value="${event.e_file}">
   
   </td>
  </tr>
  <tr>
   <td>이벤트내용</td>
   <td>
    <img id="preview2" class="img-circle pull-left image_width" name="sujung_img" width="250" height="250" src="<%=request.getContextPath()%>/resources/storage/${event.e_content}">
   </td>
   <td>
    <input type="file" name="upload_content" id="file2" >
     <input type="hidden" name="e_content"  value="${event.e_content}">
   </td>
  </tr>
  
  
 </table>
 <table >
 <tr>
   <input type="submit" value=수정></td>
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
               $('#preview').css({'width' : '250px'});
               $('#preview').css({'height' : '250px'});
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
               $('#preview2').attr('src', e.target.result);
               $('#preview2').attr('name', escape(e.name));
               $('#preview2').css({'width' : '250px'});
               $('#preview2').css({'height' : '250px'});
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