<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    div{margin:0;padding:0;}
</style>
<title>eventManagement</title>
    <script src="./resources/js/Event4.js"></script>
	<link rel="stylesheet" href="./resources/css/magnific-popup.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="./resources/js/jquery.magnific-popup.js"></script>
    <link href="./resources/css/eventMg.css" rel="stylesheet">
    <link href="./resources/css/event2.css" rel="stylesheet">
</head>
<script type="text/javascript">
 	function changeclear( ){
 		nform.keyword.value="";
 		nform.keyword.focus();
 	}//end
  </script>
<body>
  <!-- main start -->
  <div>

   <!-- container start -->
   <div id="container" class="width-fixed">   
    <!-- Event start-->
    <div id="centerEventList" class="tab_wrap customer_tab_wrap">
    
    <p style="text-align:center;">이벤트 관리</p>
     
     <div class="tab-content">
      <h3 class="blind">이벤트</h3>
      <div class="tab-pane active" id="centerEventListAll">
       <div class="search_wrapper customer_search_wrapper mb10">
       <form name="nform" class="mb10">
        <label class="blind">검색어 입력</label>
        <input type="hidden" name="keyfield" value="${skey}" >
        <input id="tx" type="text" title="검색어 입력" id="blind" placeholder="검색어를 입력하세요" name="keyword" maxlength="20" value="${sval}" onfocus="changeclear();">
        <input type="submit" class="search" id="btnNoticeSearchMEG" value="검색" style="width:37px;text-indent: 0px;line-height:0px;">
        </botton>
       </form> 
       </div>
       <div>
        <a href="eventwrite.do"><input type="submit" class="add" id="btnNoticeSearchMEG" value="이벤트추가" style="width:65px;text-indent: 0px;line-height:0px;float:right;"></a>
       </div>
       
       <div id="container" class="pt20">
        <div class="full-width">
         <div id="eventList">
          <ul id="event_wrapper">
          <c:forEach var="item" items="${naver}">
           <li class="item">
            <a onclick="eventdetail(${item.e_no})">
             <img src="<%=request.getContextPath()%>/resources/storage/${item.e_file}">
             <span class="title">${item.e_title}</span>
             <span style="font-size:13px;">${item.e_period}</span>
            </a>
             <a href="eventedit.do?idx=${item.e_no}"><button style="position:absolute;bottom:0;right:35px">수정</button></a>
             <a href="eventdelete.do?idx=${item.e_no}"><button style="position:absolute;bottom:0;right:0px;">삭제</button></a>
           </li>
          </c:forEach> 
       
          </ul>
         </div>
        </div>
       </div>
       
       <ul class="custom-pagination mt25">
       <c:if test="${startpage>10}">
        <li> 
         <a href="eventmglist.do?pageNum=${pagecount-pagecount+1}" class="img_btn customer first" title="처음 페이지 보기">
          <span class="blind">처음 페이지</span>
         </a>         
        </li>
       </c:if>
        
       <c:if test="${startpage>10}">
        <li>
         <a href="eventmglist.do?pageNum=${startpage-10}">[이전]</a>
          <span class="blind">이전 10페이지</span>
         </a>         
        </li>
       </c:if> 

       
       <c:forEach var="i" begin="${startpage}" end="${endpage}">
        <c:choose>
    	  <c:when test="${i==pageNUM}"> 
    	    <li><font style='font-size:15pt; color:red;'>[${i}]</font></li>
    	  </c:when>
    	  <c:otherwise>
    	    <li><a href="eventmglist.do?pageNum=${i}${returnpage}">[${i}]</a></li>
    	  </c:otherwise>
    	</c:choose>
       </c:forEach>
        
        
    
       <c:if test="${endpage<pagecount}">  
        <li>
         <a href="eventmglist.do?pageNum=${startpage+10}">[다음]</a>
          <span class="blind">다음 10페이지</span>
         </a>         
        </li>
       </c:if> 
         
       <c:if test="${endpage<pagecount}">  
        <li>
         <a href="eventmglist.do?pageNum=${pagecount}" class="img_btn customer last" title="마지막 페이지 보기">
          <span class="blind">마지막 페이지</span>
         </a>         
        </li>
        </c:if>    
       </ul>
           
      </div>
     </div>
    </div>
    <!-- Event end -->
   </div>
   <!-- container end -->
   
   <div class="eventpopup mfp-hide">         
	<div class="e_hidden">  </div>   	
	<button type='button' class='mfp-close'>×</button>
	
	<div class="e_top">	          
		<div class="e_title"> </div>   
	</div>
	<br>
	<div class="e_middle">	
		<div>
			<img src="" style="max-width: 800px;">				
		</div>					
    </div>
   </div>
   
  </div>
  <!-- main end -->
  <div class="bin"></div>
</body>
</html>