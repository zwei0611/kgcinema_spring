<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<style>
 a{text-decoration:none;color:black;}
</style>
<meta charset="UTF-8">
<title> [eventDetail.jsp]</title>
  <style type="text/css">
                 
  </style>
 </head>
<body>
<table height=300></table>

 <table align="center" width=1000 border=0 cellspacing=0 cellpadding=5>
  <tr align="center"><td colspan=4><img src="<%=request.getContextPath()%>/resources/storage/${event.e_content}" width=700 height=2380> </td>  </tr>
  <p>
  <form action="eventlist.do">
   <tr align="center">
   <td>
    <button><a href="eventmglist.do">목록</a></button>
    <button><a href="eventedit.do?idx=${event.e_no}">수정</a></button>
    <button><a href="eventdelete.do?idx=${event.e_no}">삭제</a></button>
   </td>
   </tr>
  </form>
 
 </table>
 <table height=300></table>
</body>
</html>




