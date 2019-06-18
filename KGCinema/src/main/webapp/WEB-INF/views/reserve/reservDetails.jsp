<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../main/headLogin.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매확인/취소, KG시네마</title>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<link rel="stylesheet" href="./resources/css/magnific-popup.css">
	<script src="./resources/js/jquery.magnific-popup.js"></script>
    <link href="./resources/css/event1.css" rel="stylesheet">
    <link href="./resources/css/event2.css" rel="stylesheet">
    <script type="text/javascript" src="./resources/js/ReserveCancel.js"></script>
    <script src="./resources/js/Reserve3.js"></script>
    <!-- 
    <script type="text/javascript">
    	$(document).ready(function () {
    		$(function() {
    		alert("하이");
    			
    		});
    	});
    </script>
     -->
</head>
   <script type="text/javascript">
    $(document).on('ready', function() {
        $(".menu_1").click(function(){
            $(".menu_2").removeClass("active");
            $(".menu_3").removeClass("active");
            $(".menu_1").addClass("active");
            $("#kgCinemaList_1").css({'display' : 'block'});
            $("#kgCinemaList_2").css({'display' : 'none'});   
            $("#kgCinemaList_3").css({'display' : 'none'}); 
        });  
        $(".menu_2").click(function(){
            $(".menu_1").removeClass("active");
            $(".menu_3").removeClass("active");
            $(".menu_2").addClass("active");
            $("#kgCinemaList_2").css({'display' : 'block'});
            $("#kgCinemaList_1").css({'display' : 'none'});   
            $("#kgCinemaList_3").css({'display' : 'none'}); 
        });
        $(".menu_3").click(function(){
            $(".menu_1").removeClass("active");
            $(".menu_2").removeClass("active");
            $(".menu_3").addClass("active");
            $("#kgCinemaList_3").css({'display' : 'block'});
            $("#kgCinemaList_1").css({'display' : 'none'});   
            $("#kgCinemaList_2").css({'display' : 'none'}); 
        });
    });
  </script>
  <style>
   ol{list-style:none;}
   .nav nav-tabs li{margin-bottom: -2px;padding: 0 25px;display: block;border: 1px solid #e1e1e1;border-bottom-color: #e1e1e1;border-left: none;font-size: 13px;line-height: 35px;
    text-align: center;min-width: 114px;height: 35px;background-color: #f9f9f9;color: #666;font-weight: 700;}
   .nav-tabs li:first-child a{border-left: 1px solid #e1e1e1;}
   .kgCinema_list {margin-bottom:20px;}
   .kgCinema_list .thum {float:left; width:115px; height:145px; text-align:center;}
   .kgCinema_list .thum img {width:115px; height:145px}
   .kgCinema_list .kgCimema_cont {float:left; width:702px; margin-left:40px; line-height:22px}
   .kgCinema_list .kgCimema_cont dt {clear:both; float:left; width:142px; font-size:14px; color:#666}
   .kgCinema_list .kgCimema_cont dd {float:left; width:550px; font-size:14px; color:#231f20; font-weight:bold;}
   .kgCinema_list .btn_s_view {position:absolute; top:80px; right:30px; display:block; padding-right:22px; background:url('/LCHS/Image/Icon/payment_down.gif') no-repeat 100% 50%; color:#999;}
   .kgCinema_list .kgCinema_box {position:relative; overflow:hidden; width:100%; padding:20px 30px; border-bottom:1px solid #c0c0c0; background:#fff; box-sizing:border-box;
   -webkit-box-sizing:border-box; -moz-box-sizing:border-box}
   .btn_s_view:hover {color:#cd190b;text-decoration: none;}
   .sub_navi ul li a.mypage{background: url(http://image2.megabox.co.kr/mop/home/btns/btn_sub_menu_mypage.png) 0 0 no-repeat;
	}
	.sub_navi ul li a.mypage.sm01 {
    width: 85px;
    background-position: 0 0;
}
     #small-dialog {
        background: white;
        padding: 10px 0px 30px;
        text-align: center;
        max-width: 400px;
        margin: 40px auto;
        position: relative;
        font-size: 20px;
        border-radius : 15px;
      }
  #small-dialog #dialogTop{
	  	border-bottom: 1px;
	    border-bottom-style: solid;
	    border-bottom-color: #aaa;
	    padding-bottom: 8px;
	    font-size: 23px;
	    font-weight: bold;
  }
  
  #small-dialog .dialogbtn{
  	margin-top: 23px;
    padding: 5px 36px;
    background-color: #503396;
    border-style: solid;
    border-color: #503396;
    color: #fff;
    font-size: 19px;
    font-weight: bold;
  }
  </style>
<body>

  <div class="bin"></div>
  
  <!-- main start -->
  <div id="event_all">
  <!-- sub menu start -->
   <div class="sub_navi">
    <div class="sub_navi_wrap">
     <ul class="clearfix">
      <li>
       <a class="mypage sm01">나의 KG시네마</a>
      </li>
     </ul>
    </div>
   </div>
   <!-- sub menu end -->
   
   <!-- container start -->
   <div id="container" class="width-fixed">
    <h2 class="mb30">
     <span class="sub_title customer st03">예매내역 확인/취소${temp1 }</span>
    </h2>
    
    <!-- Event start-->
    <div id="centerEventList" class="tab_wrap customer_tab_wrap">
     <ul class="nav nav-tabs">
      <li class="menu_1 active">
       <a>예매내역</a>
      </li>
      <li class="menu_2">
       <a>지난내역</a>
      </li>
      <li class="menu_3">
       <a>취소내역</a>
      </li>
     </ul>
     
     <div class="tab-content">
      <h3 class="blind">예매내역</h3>
      
	    <ol class="kgCinema_list" id="kgCinemaList_1">
	    <c:if test="${reserve == '[]' }">
	    	<br><br><br>
	    	&nbsp;&nbsp;&nbsp;최근 예매 내역이 없습니다.
	    </c:if>
	    <c:forEach var="todayReserve" items="${reserve }">
	    
			<li>
			 <div class="kgCinema_box">
			  <span class="thum">
			  	<c:forEach var="mbean" items="${movie}">
			  		<c:if test="${mbean.m_title eq todayReserve.r_title }">
			  			<img src="${pageContext.request.contextPath}/resources/storage/${mbean.m_poster}" alt="${mbean.m_title }">
			  		</c:if>
			  	</c:forEach>
			  </span>
			   <dl class="kgCimema_cont">
			   <fmt:formatDate var="rst" value="${todayReserve.r_start }" pattern="yyyy-MM-dd HH:mm"/>
			    <dt>예매번호</dt> <dd>${todayReserve.r_no }</dd>
				<dt>예매 영화명</dt> <dd>${todayReserve.r_title }-${todayReserve.r_type }</dd>
				<dt>관람영화관/관</dt> <dd><span>${todayReserve.r_theater }/${todayReserve.r_scrno }</span></dd>
				<dt>관람일시</dt> <dd><fmt:formatDate value="${todayReserve.r_start }" pattern="yyyy-MM-dd (E), HH시 mm분"/></dd>
				<dt>관람인원/좌석</dt> <dd>${todayReserve.r_inwon }/${todayReserve.r_seat.substring(0,todayReserve.r_seat.lastIndexOf(",")) }</dd>
				<dt>총 결제 금액</dt> <dd><fmt:formatNumber value="${todayReserve.r_price }" pattern="#,###"/> <span>\</span></dd>
			   </dl>
			  <a href="#" r_no="${todayReserve.r_no }" r_start="${rst }" class="btn_s_view" onclick="cancel(this)"><span>취소</span></a>
			</div>
			</li>		
			
		</c:forEach>
	   </ol>
	   
	    <ol class="kgCinema_list" id="kgCinemaList_2" style="display:none;">
	    <c:if test="${oldReserve == '[]' }">
	    	<br><br><br>
	    	&nbsp;&nbsp;&nbsp;최근 예매 내역이 없습니다.
	    </c:if>
		<c:forEach var="oldReserve" items="${oldReserve }">
			<li>
			 <div class="kgCinema_box">
			  <span class="thum">
			  	<c:forEach var="mbean" items="${movie}">
			  		<c:if test="${mbean.m_title eq oldReserve.r_title }">
			  			<img src="${pageContext.request.contextPath}/resources/storage/${mbean.m_poster}" alt="${mbean.m_title }">
			  		</c:if>
			  	</c:forEach>
			  </span>
			   <dl class="kgCimema_cont">
			    <dt>예매번호</dt> <dd>${oldReserve.r_no }</dd>
				<dt>예매 영화명</dt> <dd>${oldReserve.r_title }-${oldReserve.r_type }</dd>
				<dt>관람영화관/관</dt> <dd><span>${oldReserve.r_theater }/${oldReserve.r_scrno }</span></dd>
				<dt>관람일시</dt> <dd><fmt:formatDate value="${oldReserve.r_start }" pattern="yyyy-MM-dd (E), HH시 mm분"/></dd>
				<dt>관람인원/좌석</dt> <dd>${oldReserve.r_inwon }/${oldReserve.r_seat.substring(0,oldReserve.r_seat.lastIndexOf(",")) }</dd>
				<dt>총 결제 금액</dt> <dd><fmt:formatNumber value="${oldReserve.r_price }" pattern="#,###"/> <span>\</span></dd>
			   </dl>
			</div>
			</li>		
		</c:forEach>					
	   </ol>
	   
	    <ol class="kgCinema_list" id="kgCinemaList_3" style="display:none;">
			<c:if test="${cancel == '[]' }">
	    	<br><br><br>
	    	&nbsp;&nbsp;&nbsp;최근 취소 내역이 없습니다.
	    </c:if>
		<c:forEach var="cancelReserve" items="${cancel }">
			<li>
			 <div class="kgCinema_box">
			  <span class="thum">
			  	<c:forEach var="mbean" items="${movie}">
			  		<c:if test="${mbean.m_title eq cancelReserve.r_title }">
			  			<img src="${pageContext.request.contextPath}/resources/storage/${mbean.m_poster}" alt="${mbean.m_title }">
			  		</c:if>
			  	</c:forEach>
			  </span>
			   <dl class="kgCimema_cont">
			    <dt>예매번호</dt> <dd>${cancelReserve.r_no }</dd>
				<dt>예매 영화명</dt> <dd>${cancelReserve.r_title }-${cancelReserve.r_type }</dd>
				<dt>관람영화관/관</dt> <dd><span>${cancelReserve.r_theater }/${cancelReserve.r_scrno }</span></dd>
				<dt>관람일시</dt> <dd><fmt:formatDate value="${cancelReserve.r_start }" pattern="yyyy-MM-dd (E), HH시 mm분"/></dd>
				<dt>관람인원/좌석</dt> <dd>${cancelReserve.r_inwon }/${cancelReserve.r_seat.substring(0,cancelReserve.r_seat.lastIndexOf(",")) }</dd>
				<dt>총 결제 금액</dt> <dd><fmt:formatNumber value="${cancelReserve.r_price }" pattern="#,###"/> <span>\</span></dd>
			   </dl>
			</div>
			</li>		
		</c:forEach>					
	   </ol>	   	   
	   
	   
     </div>
    </div>
    <!-- Event end -->
   </div>
   <!-- container end -->
   

  </div>
  <!-- main end -->
  <div class="bin"></div>
  
  <c:if test="${test1 eq 'ok' }">
<script>
$(document).ready(function() {
		$.magnificPopup.open({
			  items: {
			    src: '.popup'
			  },
			  type: 'inline'
		});		
});
</script>
  
  <div id="small-dialog" class="popup">
  	<div id="dialogTop"> 알림 </div>
  	<br>
  	예매가 완료되었습니다<br>
  	상영시간 20분전까지 취소가 가능합니다.
  	<br>
  	<button type="button" class="dialogbtn" onclick="dialogclose()">확인</button>
  	<br>
  </div>
  </c:if>
  
</body>
</html>
  
  