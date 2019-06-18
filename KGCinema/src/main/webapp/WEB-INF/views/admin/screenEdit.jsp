<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>screen.jsp</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<style>
 *{margin:0;padding:0;}
</style>
<script type="text/javascript">
$(document).on('ready', function() {
	$("#seatstyle").change(function() {
		var style = this.value;
		alert(style);
		
		$.ajax({
			url:"seatCount.do",
			data: "style="+style,
			dataType: "json",
			type: "GET",
			success: function(data){
				$("#s_seatcnt").eq(0).attr("value", + data.count);

			},//sucess end
			error: function(data){
				alert("실패"+data.seatstyle);
				console.log(data);
			}
		
		});//eventdetail end
	});
});
</script>

<body>

<form name="screenform" action="screeneditsave.do">
 <table>
  <tr>
   <td>지점</td>
   <input type="hidden" name="s_no" value="${screen.s_no}">
   <td>   
    <select name="s_theater">
    <c:forEach var="t" items="${tselect}"> 
     <option <c:if test="${screen.s_theater eq t.t_theater}">selected</c:if> >${t.t_theater}</option>
    </c:forEach> 
    </select>
   </td>
  </tr>
  <tr>
   <td>상영관</td><td><input type="text" name="s_scrno" value="${screen.s_scrno}"></td>
  </tr>
  <tr>
   <td>타 입</td>
   <td>
    <select name="s_type">
     <option <c:if test="${screen.s_type eq '일반관'}">selected</c:if> >일반관</option>
     <option <c:if test="${screen.s_type eq 'COMFORT'}">selected</c:if> >COMFORT</option>
     <option <c:if test="${screen.s_type eq 'TableZone'}">selected</c:if> >TableZone</option>
     <option <c:if test="${screen.s_type eq 'MX'}">selected</c:if> >MX</option>
     <option <c:if test="${screen.s_type eq 'THE BOUTIQUE'}">selected</c:if> >THE BOUTIQUE</option>
   </select>
   </td>
  </tr>
  <tr>
   <td>스타일</td>
   <td>
    <select id="seatstyle" name="s_seatstyle">
    <option></option>
    <c:forEach var="s" items="${style}">     
     <option <c:if test="${s.seatstyle eq screen.s_seatstyle}">selected</c:if> >${s.seatstyle}</option>
    </c:forEach> 
   </select>
   </td>
  </tr>
  <tr>
   <td>좌석수</td><td><input id="s_seatcnt" type="text" name="s_seatcnt" value="${screen.s_seatcnt}" readonly></td>
  </tr>
  <tr>
   <td>가격</td><td><input type="text" name="s_price" value="${screen.s_price}"></td>
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