<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>theaterEdit.jsp</title>
</head>
<script type="text/javascript">
	function check() {
	    var str = document.getElementById("ncontent").value;
	    alert(str);
	    str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	    document.noticeform.submit();
 }
</script>

<body>
<form name="theaterform" action="theatereditsave.do">
 <table>
    <input type="hidden" name="t_no" value="${theater.t_no}">
  <tr>
   <td>지 역</td>
   <td>
   <select name="t_location">
    <option <c:if test="${theater.t_location eq '서울'}">selected</c:if> >서울</option>
    <option <c:if test="${theater.t_location eq '경기'}">selected</c:if> >경기</option>
    <option <c:if test="${theater.t_location eq '인천'}">selected</c:if> >인천</option>
    <option <c:if test="${theater.t_location eq '대전/충청/세종'}">selected</c:if> >대전/충청/세종</option>
    <option <c:if test="${theater.t_location eq '부산/대구/경상'}">selected</c:if> >부산/대구/경상</option>
    <option <c:if test="${theater.t_location eq '광주/전라'}">selected</c:if> >광주/전라</option>
    <option <c:if test="${theater.t_location eq '강원'}">selected</c:if> >강원</option>
    <option <c:if test="${theater.t_location eq '제주'}">selected</c:if> >제주</option>
   </select>
   </td>
  </tr>   
  <tr>
  	<td>극 장</td><td><input type="text" name="t_theater" value="${theater.t_theater}"></td>
  </tr>
  <tr>
   <td>주 소1</td><td><input type="text" name="t_juso1" value="${theater.t_juso1}"></td>
  </tr>
  <tr>
   <td>주 소2</td><td><input type="text" name="t_juso2" value="${theater.t_juso2}"></td>
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