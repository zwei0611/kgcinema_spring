<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movieInsert.jsp</title>
</head>

<script type="text/javascript">
	function check() {
		var str = document.getElementById("textarea").value;
		document.getElementById("temp").value = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		document.adminform.submit();
	}
</script>

<body>
<form name="adminform" action="movieinsert.do" enctype="multipart/form-data" method="post">
 <table>
  <tr>
   <th>등록항목</th> <th>등록내용</th>
  </tr>
  <tr>
   <td>제목</td><td><input type="text" name=m_title></td>
  </tr>
  <tr>
   <td>부제</td><td><input type="text" name=m_subtitle></td>
  </tr>
  <tr>
   <td>등급</td>
   <td>
   <select name="m_grade">
    <option>선택</option>
    <option value="0">전체관람가</option>
    <option value="12">12세관람가</option>
    <option value="15">15세관람가</option>
    <option value="19">청소년관람불가</option>
   </select>
   </td>
  </tr>
  <tr>
   <td>타입</td><td><input type="text" name=m_type></td>
  </tr>
  <tr>
   <td>개봉일</td><td><input type="text" name=upload_premiere placeholder="yyyy-mm-dd"></td>
  </tr>
  <tr>
   <td>감독</td><td><input type="text" name=m_director></td>
  </tr>
  <tr>
   <td>배우</td><td><input type="text" name=m_actor></td>
  </tr>
  <tr>
   <td>장르</td><td><input type="text" name=m_genre></td>
  </tr>
  <tr>
   <td>줄거리</td><td><textarea name="textarea" id="textarea" rows="15" cols="85"></textarea>
  <textarea hidden="" name="m_story" id="temp" rows="10" cols="10"></textarea></td>
  </tr>
  <tr>
   <td>포스터</td><td><input type="file" name="upload_poster"></td>
  </tr>
  <tr>
   <td>스틸컷1</td><td><input type="file" name="upload_steal1"></td>
  </tr>
  <tr>
   <td>스틸컷2</td><td><input type="file" name="upload_steal2"></td>
  </tr>
  <tr>
   <td>스틸컷3</td><td><input type="file" name="upload_steal3"></td>
  </tr>
  <tr>
   <td>스틸컷4</td><td><input type="file" name="upload_steal4"></td>
  </tr>
  <tr>
   <td>스틸컷5</td><td><input type="file" name="upload_steal5"></td>
  </tr>
  
 </table>
 <table >
 <tr>
   <input type="button" value=등록 onclick="check();"></td>
   <input type="reset" value=취소></td>
  </tr>
  </table>
</form>


</body>
</html>