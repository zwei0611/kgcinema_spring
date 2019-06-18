<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movieEdit.jsp</title>
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
<form name="adminform" action="movieeditsave.do" method="post" enctype="multipart/form-data">
 <table>
  <tr>
   <th>수정항목</th> <th>수정내용</th>
  </tr>
  <tr>
   <td><input type="hidden" name=m_no value="${movie.m_no}"></td>
  </tr>
  <tr>
   <td>제목</td><td><input type="text" name=m_title value="${movie.m_title}"></td>
  </tr>
  <tr>
   <td>부제</td><td><input type="text" name=m_subtitle value="${movie.m_subtitle}"></td>
  </tr>
  <tr>
   <td>등급</td><td><input type="text" name=m_grade value="${movie.m_grade}"></td>
  </tr>
  <tr>
   <td>타입</td><td><input type="text" name=m_type value="${movie.m_type}"></td>
  </tr>
  <tr>
   <td>개봉일</td><td><input type="text" name=upload_premiere value="<fmt:formatDate value="${movie.m_premiere}" pattern="yyyy-MM-dd" />"></td>
  </tr>
  <tr>
   <td>감독</td><td><input type="text" name=m_director value="${movie.m_director}"></td>
  </tr>
  <tr>
   <td>배우</td><td><input type="text" name=m_actor value="${movie.m_actor}"></td>
  </tr>
  <tr>
   <td>장르</td><td><input type="text" name=m_genre value="${movie.m_genre}"></td>
  </tr>
  <tr>
   <td>줄거리</td><td><textarea name="textarea" id="textarea" rows="15" cols="85">${fn:replace(movie.m_story,br,cn)}</textarea>
  <textarea hidden="" name="m_story" id="temp" rows="10" cols="10"></textarea></td></td>
  </tr>
  <tr>
   <td>포스터</td>
   <td>
    <img id="preview" class="img-circle pull-left image_width" name="sujung_img" width="250" height="250" src="<%=request.getContextPath()%>/resources/storage/${movie.m_poster}">
	<span>
	<input type="file" name="upload_poster" id="file">
    <input type="hidden" name="m_poster"  value="${movie.m_poster}">
    </span>
   </td>
  </tr>
  
  <tr>
   <td>스틸컷1</td>
   <td>
    <img id="preview2" class="img-circle pull-left image_width" name="sujung_img" width="250" height="250" src="<%=request.getContextPath()%>/resources/storage/${movie.m_steal1}">
    <span>
    <input type="file" name="upload_steal1" id="file2" >
    <input type="hidden" name="m_steal1"  value="${movie.m_steal1}">
    </span>
   </td>
  </tr>
  
  <tr>
   <td>스틸컷2</td>
   <td>
    <img id="preview3" class="img-circle pull-left image_width" name="sujung_img" width="250" height="250" src="<%=request.getContextPath()%>/resources/storage/${movie.m_steal2}">
    <span>
    <input type="file" name="upload_steal2" id="file3">
    <input type="hidden" name="m_steal2"  value="${movie.m_steal2}">
    </span>
   </td>
  </tr>
  
  <tr>
   <td>스틸컷3</td>
   <td><img id="preview4" class="img-circle pull-left image_width" name="sujung_img" width="250" height="250" src="<%=request.getContextPath()%>/resources/storage/${movie.m_steal3}">
   <span>
    <input type="file" name="upload_steal3" id="file4">
    <input type="hidden" name="m_steal3"  value="${movie.m_steal3}">
   </span>
   </td>

  </tr>
  
  <tr>
   <td>스틸컷4</td>
   <td><img id="preview5" class="img-circle pull-left image_width" name="sujung_img" width="250" height="250" src="<%=request.getContextPath()%>/resources/storage/${movie.m_steal4}">
   <span>
    <input type="file" name="upload_steal4" id="file5">
    <input type="hidden" name="m_steal4"  value="${movie.m_steal4}">
   </span>
   </td>
  </tr>
  
  <tr>
   <td>스틸컷5</td>
   <td><img id="preview6" class="img-circle pull-left image_width" name="sujung_img" width="250" height="250" src="<%=request.getContextPath()%>/resources/storage/${movie.m_steal5}">
   <span>
    <input type="file" name="upload_steal5" id="file6">
    <input type="hidden" name="m_steal5"  value="${movie.m_steal5}">
   </span>
   </td>
  </tr>
  
 </table>
 <table >
 <tr>
   <input type="button" onclick="check();" value=수정>
   <input type="button" onclick="history.back();" value=취소>
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
$(document).ready(function() {
   function readURL(input) {
       if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
               $('#preview3').attr('src', e.target.result);
               $('#preview3').attr('name', escape(e.name));
               $('#preview3').css({'width' : '250px'});
               $('#preview3').css({'height' : '250px'});
           }
           reader.readAsDataURL(input.files[0]);
       }
   }

   $("#file3").change(function () {
       readURL(this);
   });
   
   });
   
$(document).ready(function() {
   function readURL(input) {
       if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
               $('#preview4').attr('src', e.target.result);
               $('#preview4').attr('name', escape(e.name));
               $('#preview4').css({'width' : '250px'});
               $('#preview4').css({'height' : '250px'});
           }
           reader.readAsDataURL(input.files[0]);
       }
   }

   $("#file4").change(function () {
       readURL(this);
   });
   
   });   
   
$(document).ready(function() {
   function readURL(input) {
       if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
               $('#preview5').attr('src', e.target.result);
               $('#preview5').attr('name', escape(e.name));
               $('#preview5').css({'width' : '250px'});
               $('#preview5').css({'height' : '250px'});
           }
           reader.readAsDataURL(input.files[0]);
       }
   }

   $("#file5").change(function () {
       readURL(this);
   });
   
   });
   
$(document).ready(function() {
   function readURL(input) {
       if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
               $('#preview6').attr('src', e.target.result);
               $('#preview6').attr('name', escape(e.name));
               $('#preview6').css({'width' : '250px'});
               $('#preview6').css({'height' : '250px'});
           }
           reader.readAsDataURL(input.files[0]);
       }
   }

   $("#file6").change(function () {
       readURL(this);
   });
   
   });

</script>

</body>
</html>