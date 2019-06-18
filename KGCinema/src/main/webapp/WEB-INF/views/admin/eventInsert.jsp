<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eventInsert.jsp</title>
</head>
<body>
<form name="adminform" action="eventinsert.do"  enctype="multipart/form-data" method="post">
 <table>
  <tr>
   <th>등록항목</th> <th>등록내용</th>
  </tr>
  <tr>
   <td>이벤트제목</td><td><input type="text" name=e_title></td>
  </tr>
  <tr>
   <td>이벤트기간</td><td><input type="text" name=e_period></td>
  </tr>
  <tr>
   <td>메인이미지</td><td><input type="file" name=upload_file></td>
  </tr>
  <tr>
   <td>이벤트내용</td><td><input type="file" name=upload_content></td>
  </tr>
  
  
 </table>
 <table >
 <tr>
   <input type="submit" value=등록></td>
   <input type="reset" value=취소></td>
  </tr>
  </table>
</form>


</body>
</html>