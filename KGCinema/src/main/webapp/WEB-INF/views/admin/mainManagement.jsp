<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="admin_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="./resources/js/MainEventInsert.js"></script>
    <script src="./resources/js/MainEventEdit2.js"></script>
    <script src="./resources/js/MainEventInsertSave.js"></script>
	<link rel="stylesheet" href="./resources/css/magnific-popup.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="./resources/js/jquery.magnific-popup.js"></script>
    <link href="./resources/css/event2.css" rel="stylesheet">
<title> [mainManagement.jsp]</title>
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
    #filenone{display: none;} 
  </style>
  <script>
  $(document).on('ready', function() {  
	  $("#remove_1").click(function(){
	      $("#remove_2").removeClass("on");
	      $("#remove_3").removeClass("on");
	      $("#remove_1").addClass("on");
	      $("#remove_1").css({'color' : '#cdc197'});
	      $("#remove_2").css({'color' : ''});
	      $("#remove_3").css({'color' : ''});
	      $(".hidden_1").css({'display' : 'block'});
	      $(".hidden_2").css({'display' : 'none'});
	      $(".hidden_3").css({'display' : 'none'});
	  });    
	  $("#remove_2").click(function(){
	      $("#remove_1").removeClass("on");
	      $("#remove_3").removeClass("on");
	      $("#remove_2").addClass("on");
	      $("#remove_2").css({'color' : '#cdc197'});
	      $("#remove_1").css({'color' : ''});
	      $("#remove_3").css({'color' : ''});
	      $(".hidden_2").css({'display' : 'block'});
	      $(".hidden_1").css({'display' : 'none'});          
	      $(".hidden_3").css({'display' : 'none'});  
	  });
	  $("#remove_3").click(function(){
	      $("#remove_1").removeClass("on");
	      $("#remove_2").removeClass("on");
	      $("#remove_3").addClass("on");
	      $("#remove_3").css({'color' : '#cdc197'});
	      $("#remove_1").css({'color' : ''});
	      $("#remove_2").css({'color' : ''});
	      $(".hidden_3").css({'display' : 'block'});
	      $(".hidden_1").css({'display' : 'none'});       
	      $(".hidden_2").css({'display' : 'none'});  
	  });
  });  
  </script>
 </head>
<body>
<div class="movie_menu" style="width: 970px;margin: 0 auto;padding-top: 40px;">
      <ul style="margin-bottom: 17px;list-style:none;text-align: center;">
       <li><a id="remove_1" class="on">메인슬라이드</a></li>
       <li><a id="remove_2" class="">메인NEW이벤트</a></li>
       <li><a id="remove_3" class="">제휴이벤트</a></li>
      </ul>

<div class="hidden_1" style="display: block;padding-bottom:10px;">
<p style="text-align:center;margin-bottom:10px;">메인슬라이드 관리</p>

 <table width=970 border=1 cellspacing=0 style="margin:0 auto;">
 <tr align="right">
  <td colspan="5">
  <form action="mswrite.do">
  	  <input type="submit" value="메인슬라이드 추가">
  	 </form>
  </td>
  </tr>
  	</td>
      
  <tr align="center">
  	<th width=150 style="border-left-width:0px; border-right-width: 0px;">NO</th> 
  	<th width=450 style="border-left-width:0px; border-right-width: 0px;">파일명</th> 
  	<th width=150 style="border-left-width:0px; border-right-width: 0px;">등록일</th>
  	<th width=150 style="border-left-width:0px;">수정/삭제</th>
  </tr>
   <c:forEach var="ms" items="${ms}">
   <tr align="center">
    

	<td style="border-left-width:0px; border-right-width: 0px;">${ms.ms_rn}</td>
     <td style="border-left-width:0px; border-right-width: 0px;"> ${ms.ms_file}</td>
     <td style="border-left-width:0px; border-right-width: 0px;"> <fmt:formatDate value="${ms.ms_date}" pattern="yyyy/MM/dd" /> </td>
     <td style="border-left-width:0px;">
      <a href="msedit.do?idx=${ms.ms_no}">[수정]</a>
      <a href="msdelete.do?idx=${ms.ms_no}">[삭제]</a> 
     </td>
   </tr>  
   </c:forEach>
   
 </table> 
 </div>
 <c:choose> 
<c:when test="${me le '' || not empty me}"> 
	<c:forEach var="me" items="${me}">    
	 <div class="hidden_2" style="display: none;padding-bottom:10px;">
	    <section class="py-5" style="background-color:white;">
	     <div class="new_event" style="position: relative;padding: 20px 0 80px;">
	      <div class="new_event_content" style="position: relative;z-index: 10;width: 970px;margin: 0 auto;">
	       <h3 style="height: 37px;color: #333;font-size: 20px;letter-spacing: -0.5px;">새로운 이벤트</h3>
	       <div class="new_event_main">
	       
	        <div class="event_box1" style="overflow: hidden;position: relative;z-index: 1;width: 632px;height: 317px;border: 1px solid #ccc;">
		       <c:choose> 
				<c:when test="${me.me_file1 le '' || not empty me.me_file1}">    
				 <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file1}" style='width:632px;height:317px;'>
				</c:when>
		        <c:otherwise>
		         <img src="./resources/images/new_event1.jpg">
		        </c:otherwise>
		       </c:choose>
	         <button style="position:absolute;right:0;top:0;" onclick="mainEventEdit1()">수정</button>
	        </div>
	        <div class="event_box2" style="width: 632px;height: 315px;border: 1px solid #ccc;border-top: none;position: relative;z-index: 2;">
	         <div class="event_box2_left" style="width: 315px;height: 315px;border-right: 1px solid #ccc;float: left;position:relative;">
		       <c:choose> 
				<c:when test="${me.me_file2 le '' || not empty me.me_file2}">    
				 <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file2}" style="width:315px;height:315px;">
				</c:when>
		        <c:otherwise>
		         <img src="./resources/images/new_event2.jpg">
		        </c:otherwise>
		       </c:choose> 	         
	          <button style="position:absolute;right:0;top:0;" onclick="mainEventEdit2()">수정</button>
	         </div>
	         <div class="event_box2_right" style="float:left;position:relative;">
		       <c:choose> 
				<c:when test="${me.me_file3 le '' || not empty me.me_file3}">    
				 <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file3}" style="width:315px;height:315px;">
				</c:when>
		        <c:otherwise>
		         <img src="./resources/images/new_event3.jpg">
		        </c:otherwise>
		       </c:choose> 	         	          
	          <button style="position:absolute;right:0;top:0;" onclick="mainEventEdit3()">수정</button>
	         </div>
	        </div>
	        <div class="event_box3" style="width: 327px;height:632px;position:absolute;right:0;top:37px;">
		       <c:choose> 
				<c:when test="${me.me_file4 le '' || not empty me.me_file4}">    
				 <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file4}" style="width:327px;height:632px;">
				</c:when>
		        <c:otherwise>
		         <img src="./resources/images/new_event4.jpg">
		        </c:otherwise>
		       </c:choose> 	 	        
	         <button style="position:absolute;right:0;top:0;" onclick="mainEventEdit4()">수정</button>
	        </div>
	       </div>       
	      </div>
	     </div>
	    </section>
	 </div>
	 
	 <div class="hidden_3" style="display: none;padding-bottom:10px;">
	     <section class="py-5" style="background-color:white;">
	     <div class="" style="position: relative;padding: 20px 0 80px;">
	      <div class="" style="position: relative;z-index: 10;width: 970px;margin: 0 auto;">
	       <h3 style="height: 37px;color: #333;font-size: 20px;letter-spacing: -0.5px;">제휴 이벤트</h3>
	        <div class="" style="position: relative;">
	         <div class="part_event_left" style="width: 632px;height: 632px;border: 1px solid #ccc;">
	          <div style="float: left;width: 315px;height: 315px;position:relative;">
		       <c:choose> 
				<c:when test="${me.me_file5 le '' || not empty me.me_file5}">    
				 <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file5}" style="width:315px;height:315px;">
				</c:when>
		        <c:otherwise>
		         <img src="./resources/images/part_event1.png">
		        </c:otherwise>
		       </c:choose>	          
	           <button style="position:absolute;right:0;top:0;" onclick="mainEventEdit5()">수정</button>
	          </div>
	          <div style="float: left;width: 315px;height: 315px;position:relative;">
		       <c:choose> 
				<c:when test="${me.me_file6 le '' || not empty me.me_file6}">    
				 <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file6}" style="width:315px;height:315px;">
				</c:when>
		        <c:otherwise>
		         <img src="./resources/images/part_event2.jpg">
		        </c:otherwise>
		       </c:choose>	  	          
	           <button style="position:absolute;right:0;top:0;" onclick="mainEventEdit6()">수정</button>
	          </div>
	          <div style="float: left;width: 315px;height: 315px;position:relative;">
		       <c:choose> 
				<c:when test="${me.me_file7 le '' || not empty me.me_file7}">    
				 <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file7}" style="width:315px;height:315px;">
				</c:when>
		        <c:otherwise>
	             <img src="./resources/images/part_event3.jpg">
		        </c:otherwise>
		       </c:choose>		          
	           <button style="position:absolute;right:0;top:0;" onclick="mainEventEdit7()">수정</button>
	          </div>
	          <div style="float: left;width: 315px;height: 315px;position:relative;">
		       <c:choose> 
				<c:when test="${me.me_file8 le '' || not empty me.me_file8}">    
				 <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file8}" style="width:315px;height:315px;">
				</c:when>
		        <c:otherwise>
	             <img src="./resources/images/part_event4.jpg">
		        </c:otherwise>
		       </c:choose>		          
	           <button style="position:absolute;right:0;top:0;" onclick="mainEventEdit8()">수정</button>
	          </div>                    
	         </div>
	         
	         <div class="part_event_right" style="width: 327px;height: 632px;position: absolute;right: 0;top: 0px;">
		       <c:choose> 
				<c:when test="${me.me_file9 le '' || not empty me.me_file9}">    
				 <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file9}" style="width:327px;height:632px;">
				</c:when>
		        <c:otherwise>
	             <img src="./resources/images/part_event5.jpg">
		        </c:otherwise>
		       </c:choose>			              
	           <button style="position:absolute;right:0;top:0;" onclick="mainEventEdit9()">수정</button>
	         </div>
	        </div>
	      </div>
	     </div>
	    </section>    
	 </div>
	</c:forEach> 
  </c:when>	
  <c:otherwise>
	 <div class="hidden_2" style="display: none;padding-bottom:10px;">
	    <section class="py-5" style="background-color:white;">
	     <div class="new_event" style="position: relative;padding: 20px 0 80px;">
	      <div class="new_event_content" style="position: relative;z-index: 10;width: 970px;margin: 0 auto;">
	       <h3 style="height: 37px;color: #333;font-size: 20px;letter-spacing: -0.5px;">새로운 이벤트</h3>
	       <div class="new_event_main">
	       
	        <div class="event_box1" style="overflow: hidden;position: relative;z-index: 1;width: 632px;height: 317px;border: 1px solid #ccc;">
	         <img src="./resources/images/new_event1.jpg">
	         <button style="position:absolute;right:0;top:0;" onclick="mainEventInsert1()">수정</button>
	        </div>
	        <div class="event_box2" style="width: 632px;height: 315px;border: 1px solid #ccc;border-top: none;position: relative;z-index: 2;">
	         <div class="event_box2_left" style="width: 315px;height: 315px;border-right: 1px solid #ccc;float: left;position:relative;">
	          <img src="./resources/images/new_event2.jpg">
	          <button style="position:absolute;right:0;top:0;" onclick="mainEventInsert2()">수정</button>
	         </div>
	         <div class="event_box2_right" style="float:left;position:relative;">
	          <img src="./resources/images/new_event3.jpg">
	          <button style="position:absolute;right:0;top:0;" onclick="mainEventInsert3()">수정</button>
	         </div>
	        </div>
	        <div class="event_box3" style="width: 327px;height: 632px;position: absolute;right: 0;top: 37px;">
	         <img src="./resources/images/new_event4.jpg">
	         <button style="position:absolute;right:0;top:0;" onclick="mainEventInsert4()">수정</button>
	        </div>
	       </div>       
	      </div>
	     </div>
	    </section>
	 </div>
	 
	 <div class="hidden_3" style="display: none;padding-bottom:10px;">
	     <section class="py-5" style="background-color:white;">
	     <div class="" style="position: relative;padding: 20px 0 80px;">
	      <div class="" style="position: relative;z-index: 10;width: 970px;margin: 0 auto;">
	       <h3 style="height: 37px;color: #333;font-size: 20px;letter-spacing: -0.5px;">제휴 이벤트</h3>
	        <div class="" style="position: relative;">
	         <div class="part_event_left" style="width: 632px;height: 632px;border: 1px solid #ccc;">
	          <div style="float: left;width: 315px;height: 315px;position:relative;">
	           <img src="./resources/images/part_event1.png">
	           <button style="position:absolute;right:0;top:0;" onclick="mainEventInsert5()">수정</button>
	          </div>
	          <div style="float: left;width: 315px;height: 315px;position:relative;">
	           <img src="./resources/images/part_event2.jpg">
	           <button style="position:absolute;right:0;top:0;" onclick="mainEventInsert6()">수정</button>
	          </div>
	          <div style="float: left;width: 315px;height: 315px;position:relative;">
	           <img src="./resources/images/part_event3.jpg">
	           <button style="position:absolute;right:0;top:0;" onclick="mainEventInsert7()">수정</button>
	          </div>
	          <div style="float: left;width: 315px;height: 315px;position:relative;">
	           <img src="./resources/images/part_event4.jpg">
	           <button style="position:absolute;right:0;top:0;" onclick="mainEventInsert8()">수정</button>
	          </div>                    
	         </div>
	         
	         <div class="part_event_right" style="width: 327px;height: 632px;position: absolute;right: 0;top: 0px;">
	           <img src="./resources/images/part_event5.jpg">
	           <button style="position:absolute;right:0;top:0;" onclick="mainEventInsert9()">수정</button>
	         </div>
	        </div>
	      </div>
	     </div>
	    </section>    
	 </div>
  </c:otherwise>
 </c:choose>
  
   <div class="eventpopup mainEventInsert mfp-hide">       
   <form name="dd" action="maineventinsert.do"  enctype="multipart/form-data" method="post">  
	<div class="e_hidden">  </div>   	
	<button type='button' class='mfp-close'>×</button>
	
	<div class="e_middle">	
					
    </div>

   </form> 
   </div> 
<c:forEach var="item" items="${me}">	   
   <div class="eventpopup mainEventEdit mfp-hide">       
   <form name="oo" action="maineventeditsave.do"  enctype="multipart/form-data" method="post">  
	<div class="e_hidden">  </div>   	
	<button type='button' class='mfp-close'>×</button>
	<div class="e_middle">	
	 <input type="hidden" name="me_no" value="${item.me_no}">
	 <input type="file" name="upload_file1" id="file1">				
	 <input type="hidden" name="me_file1" value="${item.me_file1}">
	 <input type="file" name="upload_file2" id="file2" style="display:none;">
	 <input type="hidden" name="me_file2" value="${item.me_file2}">  
	 <input type="file" name="upload_file3" id="file3" style="display:none;">
	 <input type="hidden" name="me_file3" value="${item.me_file3}" >  
	 <input type="file" name="upload_file4" id="file4" style="display:none;">
	 <input type="hidden" name="me_file4" value="${item.me_file4}">
	 <input type="file" name="upload_file5" id="file5" style="display:none;">
	 <input type="hidden" name="me_file5" value="${item.me_file5}">
	 <input type="file" name="upload_file6" id="file6" style="display:none;">
	 <input type="hidden" name="me_file6" value="${item.me_file6}">
	 <input type="file" name="upload_file7" id="file7" style="display:none;">
	 <input type="hidden" name="me_file7" value="${item.me_file7}">
	 <input type="file" name="upload_file8" id="file8" style="display:none;">
	 <input type="hidden" name="me_file8" value="${item.me_file8}">
	 <input type="file" name="upload_file9" id="file9" style="display:none;">
	 <input type="hidden" name="me_file9" value="${item.me_file9}">
	 <input type="submit" value="수정">
    </div>

   </form> 
   </div>    
    </c:forEach>
 </div>
 
 
</body>
</html>
