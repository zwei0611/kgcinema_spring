<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="admin_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<title> [movieManagement.jsp]</title>
  <style type="text/css">
    html, body {margin: 0;padding: 0;border:0;vertical-align: baseline;}
    * {box-sizing: border-box;font-family: '나눔고딕','NanumGothic','맑은 고딕','Malgun Gothic','돋움',dotum,'Apple SD Gothic Neo',sans-serif;}
    ul, ol, dl, li, p {margin:0;padding:0;list-style: none;margin:0;padding:0;}
    a{font-size:12pt; font-weight:bold; text-decoration:none; color: black; font-family:NanumGothic; }
    img{margin:0;padding:0;}
    div{margin:0;padding:0;}
    a:hover{font-size:12pt; font-weight:bold; color: #351F66; text-decoration:underline; }       
    .movie_menu ul li{display: inline-block;}
    .movie_menu ul li >a{display: block;width: 175px;height: 50px;margin-left: 1px;background: #efebdb;color: #6f6247;font-size: 16px;line-height: 50px;text-align: center;}
    .movie_menu ul li a.on{background: #231f20 url('images/btn_st02_on.gif') no-repeat 0 0;color: #cdc197;font-weight: bold;}                  
  </style>

  <script type="text/javascript">
  $(document).on('ready', function() {  
	  $("#remove_1").click(function(){
	      $("#remove_2").removeClass("on");
	      $("#remove_1").addClass("on");
	      $(".hidden_1").css({'display' : 'block'});
	      $(".hidden_2").css({'display' : 'none'});
	  });    
	  $("#remove_2").click(function(){
	      $("#remove_1").removeClass("on");
	      $("#remove_2").addClass("on");
	      $(".hidden_2").css({'display' : 'block'});
	      $(".hidden_1").css({'display' : 'none'});           
	  });
  });    
  </script>
 </head>
<body>
<c:if test="${page eq 'mvs' }">
	<c:set var="check">none</c:set>
    <c:set var="check2">block</c:set>
    <c:set var="one"></c:set>
    <c:set var="two">on</c:set>
</c:if>
<c:if test="${page == null }">
	<c:set var="check">block</c:set>
	<c:set var="check2">none</c:set>
	<c:set var="one">on</c:set>
    <c:set var="two"></c:set>
</c:if>
 <div class="movie_menu" style="width: 900px;margin: 0 auto;padding-top: 40px;">
  <ul style="margin-bottom: 17px;list-style:none;text-align: center;">
   <li><a id="remove_1" class="${one}">영화</a></li>
   <li><a id="remove_2" class="${two}">영화슬라이드</a></li>
  </ul>
   
<div class="hidden_1" style="display: ${check};padding-bottom:10px;">
 <p style="text-align:center;margin-bottom:10px;">영화정보 관리</p>

 <table width=900 border=1 cellspacing=0 style="margin:0 auto;">
 <tr align="right">
  <td colspan="6">
  <form action="moviewrite.do">
       <input type="submit" value="영화 추가">
  </form>
  </td>
  </tr>
     </td>
  <tr align="right">
     <td colspan="6">
      <form name="myform">
         <input type="hidden" name="keyfield" value="${skey}" >
         검색 :
         <input type="text" name="keyword"  size=10 value="${sval}">
         <input type="submit" value="검 색 "> 
         
      </form>
      
  </tr>
   
   
  <tr align="center">
     <th width=150 style="border-left-width:0px; border-right-width: 0px;">NO</th> 
     <th width=150 style="border-left-width:0px; border-right-width: 0px;">제 목</th> 
     <th width=450 style="border-left-width:0px; border-right-width: 0px;">타 입</th> 
     <th width=150 style="border-left-width:0px; border-right-width: 0px;">장 르</th>
     <th width=150 style="border-left-width:0px; border-right-width: 0px;">개봉일</th>
     <th width=150 style="border-left-width:0px;">수정/삭제</th>
  </tr>
   <c:forEach var="movie" items="${naver}">
   <tr align="center">
    

   <td style="border-left-width:0px; border-right-width: 0px;">${movie.m_rn}</td>
     
    
     <td style="border-left-width:0px; border-right-width: 0px;"> ${movie.m_title}  </td>
     <td style="border-left-width:0px; border-right-width: 0px;"> ${movie.m_type} </td>
     <td style="border-left-width:0px; border-right-width: 0px;"> ${movie.m_genre} </td>
     <td style="border-left-width:0px; border-right-width: 0px;"> <fmt:formatDate value="${movie.m_premiere}" pattern="yyyy/MM/dd" /> </td>
     <td style="border-left-width:0px;">
      <a href="movieedit.do?idx=${movie.m_no}">[수정]</a>
      <a href="moviedelete.do?idx=${movie.m_no}">[삭제]</a> 
     </td>
   </tr>  
   </c:forEach>
   
  <tr align="center">
   <td colspan="6">
   
    <c:if test="${startpage>10}">
     <a href="moviemglist.do?pageNum=${startpage-10}${returnpage}">[이전]</a>
    </c:if>
    
    
    <c:forEach var="i" begin="${startpage}" end="${endpage}">
       <c:choose>
         <c:when test="${i==pageNUM}"> 
           <font style='font-size:15pt; color:red;'>[${i}]</font>
         </c:when>
         <c:otherwise>
           <a href="moviemglist.do?pageNum=${i}${returnpage}">[${i}]</a> 
         </c:otherwise>
       </c:choose>
    </c:forEach>
 
     <!-- 다음  10 20 30 40 endpage, pagecount -->
       
  <c:if test="${endpage<pagecount}">
   <a href="moviemglist.do?pageNum=${startpage+10}">[다음]</a>
  </c:if>
  
   </td>
  </tr>
 </table> 
 </div>
  
<div class="hidden_2" style="display:${check2};padding-bottom:10px;">
 <p style="text-align:center;margin-bottom:10px;">영화슬라이드 관리</p>

 <table width=900 border=1 cellspacing=0 style="margin:0 auto;">
 <tr align="right">
  <td colspan="5">
  <form action="mvswrite.do">
  	  <input type="submit" value="영화슬라이드 추가">
  	 </form>
  </td>
  </tr>
  	</td>
      
  <tr align="center">
  	<th width=150 style="border-left-width:0px; border-right-width: 0px;">NO</th> 
  	<th width=225 style="border-left-width:0px; border-right-width: 0px;">이미지</th> 
  	<th width=225 style="border-left-width:0px; border-right-width: 0px;">동영상</th> 
  	<th width=150 style="border-left-width:0px; border-right-width: 0px;">등록일</th>
  	<th width=150 style="border-left-width:0px;">수정/삭제</th>
  </tr>
   <c:forEach var="mvs" items="${mvs}">
   <tr align="center">
    

	<td style="border-left-width:0px; border-right-width: 0px;">${mvs.mvs_rn}</td>
     <td style="border-left-width:0px; border-right-width: 0px;"> ${mvs.mvs_file}</td>
     <td style="border-left-width:0px; border-right-width: 0px;"> ${mvs.mvs_video}</td>
     <td style="border-left-width:0px; border-right-width: 0px;"> <fmt:formatDate value="${mvs.mvs_date}" pattern="yyyy/MM/dd" /> </td>
     <td style="border-left-width:0px;">
      <a href="mvsedit.do?idx=${mvs.mvs_no}">[수정]</a>
      <a href="mvsdelete.do?idx=${mvs.mvs_no}">[삭제]</a> 
     </td>
   </tr>  
   </c:forEach>
   
 </table> 
</div>
  
 </div>

</body>
</html>