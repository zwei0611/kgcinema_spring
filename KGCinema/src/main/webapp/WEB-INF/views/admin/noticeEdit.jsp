<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeEdit.jsp</title>
</head>
<script type="text/javascript">
	function check() {
	    var str = document.getElementById("n_content").value;
	    alert(str);
	    str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	    document.noticeEDform.submit();
 	}
</script>
<body>


<form name=noticeEDform action="noticeeditsave.do">
 <table>
  <tr>
   <td></td><td><input type="hidden" name=n_no value="${notice.n_no}"></td>
  </tr>
  <tr>
   <td>지점</td><td><input type="text" name=n_loc value="${notice.n_loc}"></td>
  </tr>
  <tr>
   <td>제목</td><td><input type="text" name=n_title value="${notice.n_title}"></td>
  </tr>
  <tr>
   <td>내용</td><td><textarea name=n_content id=n_content cols="50" rows="10">${notice.n_content}</textarea>
  </tr>
 </table>
 <table >
 <tr>
   <input type="button" value=수정 onclick="check()"></td>
   <input type="reset" value=취소></td>
  </tr>
  </table>
</form>


</body>
</html>