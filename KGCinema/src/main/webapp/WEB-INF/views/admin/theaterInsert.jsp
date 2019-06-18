<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>theaterInsert.jsp</title>
</head>
<style>
 *{margin:0;padding:0;}
</style>
<script type="text/javascript">
	function check() {
	    var str = document.getElementById("ncontent").value;
	    alert(str);
	    str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	    document.noticeform.submit();
 }
</script>

<body>

<form name="theaterform" action="theaterinsert.do">
 <table>
  <tr>
   <td>지 역</td>
   <td>
   <select name="t_location">
    <option>서울</option>
    <option>경기</option>
    <option>인천</option>
    <option>대전/충청/세종</option>
    <option>부산/대구/경상</option>
    <option>광주/전라</option>
    <option>강원</option>
    <option>제주</option>
   </select>
   </td>
  </tr>  
  <tr>
   <td>극 장</td><td><input type="text" name="t_theater"></td>
  </tr>
  <tr>
   <td>주 소</td><td><input type="text" name="t_juso1"></td>
  </tr>
  <tr>
   <td>상세주소</td><td><input type="text" name="t_juso2"></td>
  </tr>  
 </table>
 <table >
 <tr>
 <td>
   <input type="submit" value="등록">
   <input type="reset" value=취소></td>
  </tr>
  </table>
</form>


</body>
</html>