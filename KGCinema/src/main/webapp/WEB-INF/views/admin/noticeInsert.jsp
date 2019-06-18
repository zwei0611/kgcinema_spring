<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeInsert.jsp</title>
</head>
<script type="text/javascript">
	function check() {
	    var str = document.getElementById("n_content").value;
	    alert(str);
	    str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	    document.noticeform.submit();
 }
</script>

<body>
<form name="noticeform" action="noticeinsert.do">
 <table>
  
  <tr>
   <td>지점</td><td><input type="text" name="n_loc" value="강남"></td>
  </tr>
  <tr>
   <td>제목</td><td><input type="text" name="n_title" style="width:565px;"></td>
  </tr>
  <tr>
   <td>내용</td><td><textarea name=n_content cols="50" rows="10" id="n_content"></textarea>
   </td>
  </tr>
  
 </table>
 <table >
 <tr>
 <td>
   <input type="button" value="등록" onclick="check()">
   <input type="reset" value=취소></td>
  </tr>
  </table>
</form>


</body>
</html>