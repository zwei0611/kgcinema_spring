<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../main/headLogin.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>영화, KG시네마</title>
    <link href="./resources/css/full-slider.css" rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/magnific-popup.css">
    <script src="./resources/js/VideoPopUp.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="./resources/js/jquery.magnific-popup.js"></script>
	<script src="./resources/slick-master/slick/slick.min.js" type="text/javascript" charset="utf-8"></script>    
  <style type="text/css">
    html, body {margin: 0;padding: 0;}
    * {margin: 0;padding: 0;box-sizing: border-box;font-family: '나눔고딕','NanumGothic','맑은 고딕','Malgun Gothic','돋움',dotum,'Apple SD Gothic Neo',sans-serif;}
    ul,li{list-style: none;}
    div{display: block;}
    a{text-decoration: none;color: #555;}
    .movie_menu ul li{display: inline-block;}
    .movie_menu ul li >a{display: block;width: 175px;height: 50px;margin-left: 1px;background: #efebdb;color: #6f6247;font-size: 16px;line-height: 50px;text-align: center;}
    .movie_menu ul li a.on{background: #231f20 url('./resources/images/btn_st02_on.gif') no-repeat 0 0;color: #cdc197;font-weight: bold;}
    .movie_list li{width: 230px;height: 411px;margin: 0 0 40px 20px;position: relative;float: left;border: 1px solid #dedede;}
    .img{width: 228px;height: 334px;}
    .img img{width: 228px;height: 334px;}
    .list_text{border-top: 1px solid #e5e5e5;}
    .list_text dt{padding: 12px 15px 11px 15px;border-bottom: 1px solid #dedede;}
    .list_text dt a{overflow: hidden;width: 100%;white-space: nowrap;text-overflow: ellipsis;font-size: 14px;color: #231f20;font-weight: bold;line-height: 20px;}
    .bin{width:100%;height:50px;}
    .layer_popup{position: fixed;top: 0;left: 0;width: 100%;height: 100%;background: url("/LCHS/Image/Bg/bg_mask80.png") repeat left top;z-index: 9999;}
    .btn_close_1{z-index:9999;position: absolute;right: 20px;top: 20px;width: 22px;height: 23px;font-size: 0;line-height: 0;}
    .btn_close_2{z-index:9999;position: absolute;right: 20px;top: 20px;width: 22px;height: 23px;font-size: 0;line-height: 0;}
    .btn_close_3{z-index:9999;position: absolute;right: 20px;top: 20px;width: 22px;height: 23px;font-size: 0;line-height: 0;}
    .btn_close_4{z-index:9999;position: absolute;right: 20px;top: 20px;width: 22px;height: 23px;font-size: 0;line-height: 0;}
    .btn_close_5{z-index:9999;position: absolute;right: 20px;top: 20px;width: 22px;height: 23px;font-size: 0;line-height: 0;}
    .btn_close_6{z-index:9999;position: absolute;right: 20px;top: 20px;width: 22px;height: 23px;font-size: 0;line-height: 0;}
    .btn_close_7{z-index:9999;position: absolute;right: 20px;top: 20px;width: 22px;height: 23px;font-size: 0;line-height: 0;}
    .btn_close_8{z-index:9999;position: absolute;right: 20px;top: 20px;width: 22px;height: 23px;font-size: 0;line-height: 0;}
  </style>
</head>

  <script type="text/javascript">
  $(document).on('ready', function() {
      $(".regular").slick({
          dots: true,
          infinite: true,
          slidesToShow: 5,
          slidesToScroll: 5
        });
      
      $(".hover_1").mouseover(function(){
         $(this).css({'background-color' : 'black'});
         $(this).css({'opacity' : '0.6'});
         $(this).find('a').css({'display' : 'block'});
         $(this).find('div').css({'display' : 'block'});
      });
      $(".hover_1").mouseout(function(){
         $(this).css({'background-color' : 'none'});
         $(this).css({'opacity' : '0'});
         $(this).find('a').css({'display' : 'none'});
         $(this).find('div').css({'display' : 'none'});
      });
      
      $(".hover_2").mouseover(function(){
         $(this).css({'background-color' : 'black'});
         $(this).css({'opacity' : '0.6'});
         $(this).find('a').css({'display' : 'block'});
         $(this).find('div').css({'display' : 'block'});
      });
      $(".hover_2").mouseout(function(){
         $(this).css({'background-color' : 'none'});
         $(this).css({'opacity' : '0'});
         $(this).find('a').css({'display' : 'none'});
         $(this).find('div').css({'display' : 'none'});
      });
      
      $("#remove_1").click(function(){
          $("#remove_2").removeClass("on");
          $("#remove_1").addClass("on");
          $("#remove_1").css({'color' : '#cdc197'});
          $("#remove_2").css({'color' : ''});
          $(".hidden_1").css({'display' : 'block'});
          $(".hidden_2").css({'display' : 'none'});
      });    
      $("#remove_2").click(function(){
          $("#remove_1").removeClass("on");
          $("#remove_2").addClass("on");
          $("#remove_2").css({'color' : '#cdc197'});
          $("#remove_1").css({'color' : ''});
          $(".hidden_2").css({'display' : 'block'});
          $(".hidden_1").css({'display' : 'none'});          
      });     
      $(".li_1").click(function(){
         $(".layer_popup_1").css({'display' : 'block'});
         $("#video_1").get(0).play();
      });
      $(".btn_close_1").click(function(){
         $(".layer_popup_1").css({'display' : 'none'});
         $("#video_1").get(0).pause();
      });  
      $(".li_2").click(function(){
         $(".layer_popup_2").css({'display' : 'block'});
         $("#video_2").get(0).play();
      });
      $(".btn_close_2").click(function(){
         $(".layer_popup_2").css({'display' : 'none'});
         $("#video_2").get(0).pause();
      });  
      $(".li_3").click(function(){
         $(".layer_popup_3").css({'display' : 'block'});
         $("#video_3").get(0).play();
      });
      $(".btn_close_3").click(function(){
         $(".layer_popup_3").css({'display' : 'none'});
         $("#video_3").get(0).pause();
      }); 
      $(document).keyup(function(e) {
    	if (e.keyCode == 27) {
    	  $("#videostop").get(0).pause();       
    	}
      });      
      $("body").click(function(){
          $("#videostop").get(0).pause();
      });      
      
	     $(".carousel-inner .carousel-item:first-child").addClass("active");
	     $(".carousel-indicators li:first-child").addClass("active");
  });
  </script>
<body>
    <div class="bin">
    </div>
    
    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <c:choose> 
       <c:when test="${mvs eq '' || empty mvs}"> 
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" class="active"></li>
          <li data-target="#carouselExampleIndicators"></li>
          <li data-target="#carouselExampleIndicators"></li>    
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active li_1" style="background-image: url('./resources/images/movie_slideList_1.jpg');height:420px;">
            <div class="carousel-caption d-none d-md-block">
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item li_2" style="background-image: url('./resources/images/movie_slideList_2.jpg');height:420px;">
            <div class="carousel-caption d-none d-md-block">
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item li_3" style="background-image: url('./resources/images/movie_slideList_3.jpg');height:420px;">
            <div class="carousel-caption d-none d-md-block">
            </div>
          </div>                                                     
        </div>
       </c:when>
       <c:otherwise>
        <ol class="carousel-indicators">
         <c:forEach var="item" items="${mvs}">        
          <li data-target="#carouselExampleIndicators" name="${item.mvs_date}"></li>
         </c:forEach>
        </ol>
        <div class="carousel-inner" role="listbox">
         <c:forEach var="item" items="${mvs}">          
          <div class="carousel-item" style="
          background-image: url('${pageContext.request.contextPath}/resources/storage/${item.mvs_file}');height:420px;" onclick="video(${item.mvs_no})">
            <div class="carousel-caption d-none d-md-block">
            </div>
          </div>   
         </c:forEach>                                                  
        </div>       
       </c:otherwise> 
      </c:choose> 
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>

    <section class="py-5">
     <div class="movie_menu" style="width: 980px;margin: 0 auto;padding-top: 40px;">
      <ul style="margin-bottom: 17px;list-style:none;text-align: center;">
       <li><a id="remove_1" class="on">현재상영작</a></li>
       <li><a id="remove_2" class="">상영예정작</a></li>
      </ul>
     <div>
      <div class="jump" style="width:980px;height:14px;margin-bottom:20px;"></div>
     
     <div class="hidden_1" style="display: block;padding-bottom:10px;">
      <ul class="movie_list" style="margin-left: -20px;min-height: 441px;">
      
     <c:forEach var="item" items="${movie}">
  
       <li class="list_1">
        <div style="position: relative;">
         <span class="img">
          <a style="display: block;"><img src="<%=request.getContextPath()%>/resources/storage/${item.m_poster}"></a>
         </span>
        </div>
        
        <div class="hover_1" style="display: block;width: 228px;height: 335px;padding: 114px 20px 0;opacity:0;position: absolute;left: 0;top: 0;color: #fff;text-align: center;font-size: 14px;line-height: 27px;z-index:999;">
           <a href="reserveMovie.do?no=${item.m_no}" style="display:none;text-decoration:none;display:block;margin:0 15px;border:1px solid #c1b687;height:48px;font-size:15px;font-weight:bold;color:#c1b687;text-align: center;padding-top:10px;">예매하기</a>
           <div style="display:none;margin-top:10px;">
           <a href="moviedetail.do?idx=${item.m_no}" style="text-decoration:none;display:block;margin:0 15px;border:1px solid #c1b687;height:48px;font-size:15px;font-weight:bold;color:#c1b687;text-align: center;padding-top:10px;">상세보기</a>
           </div>  
       </div>

        <dl class="list_text">
         <dt>
          <span class="grade_15" style="">
           <c:choose>
           <c:when test="${item.m_grade eq 0}">
            <img src="./resources/images/bg_grade_all.png" style="margin-top:-1px;">
           </c:when>
           <c:when test="${item.m_grade eq 12}">
            <img src="./resources/images/bg_grade_12.png" style="margin-top:-1px;">
           </c:when>
           <c:when test="${item.m_grade eq 15}">
            <img src="./resources/images/bg_grade_15.png" style="margin-top:-1px;">
           </c:when>
           <c:otherwise>
            <img src="./resources/images/bg_grade_18.png" style="margin-top:-1px;">
           </c:otherwise>

          </c:choose>
          </span><c:set var="moviestr" value="${item.m_title }"></c:set>
          <a>${fn:substring(moviestr,0,15)}<c:if test="${item.m_title.length()>14 }">…</c:if></a>
         </dt>
        </dl>
       </li>
       
     </c:forEach>  
       
       
                                         
      </ul>
     </div>
     
     <div class="hidden_2" style="display: none;padding-bottom:10px;">
      <ul class="movie_list" style="margin-left: -20px;min-height: 441px;">
      
       <c:forEach var="nextItem" items="${next}">
  
       <li class="list_1">
        <div style="position: relative;">
         <span class="img">
          <a style="display: block;"><img src="<%=request.getContextPath()%>/resources/storage/${nextItem.m_poster}"></a>
         </span>
        </div>
        
        <div class="hover_2" style="display:block;width: 228px;height: 335px;padding: 114px 20px 0;position: absolute;left: 0;top: 0;color: #fff;text-align: center;font-size: 14px;line-height: 27px;z-index:999;">
           <a href="resev.do" style="display:none;text-decoration:none;margin:0 15px;border:1px solid #c1b687;height:48px;font-size:15px;font-weight:bold;color:#c1b687;text-align: center;padding-top:10px;">예매하기</a>
           <div style="display:none;margin-top:10px;">
           <a href="moviedetail.do?idx=${nextItem.m_no}" style="text-decoration:none;display:block;margin:0 15px;border:1px solid #c1b687;height:48px;font-size:15px;font-weight:bold;color:#c1b687;text-align: center;padding-top:10px;">상세보기</a>
           </div>  
       </div>

        <dl class="list_text">
         <dt>
          <span class="grade_15" style="">
           <c:choose>
           <c:when test="${nextItem.m_grade eq 0}">
            <img src="./resources/images/bg_grade_all.png" style="margin-top:-1px;">
           </c:when>
           <c:when test="${nextItem.m_grade eq 12}">
            <img src="./resources/images/bg_grade_12.png" style="margin-top:-1px;">
           </c:when>
           <c:when test="${nextItem.m_grade eq 15}">
            <img src="./resources/images/bg_grade_15.png" style="margin-top:-1px;">
           </c:when>
           <c:otherwise>
             <img src="./resources/images/bg_grade_18.png" style="margin-top:-1px;">
           </c:otherwise>

          </c:choose>
          </span><c:set var="nextmoviestr" value="${nextItem.m_title }"></c:set>
          <a>${fn:substring(nextmoviestr,0,15)}<c:if test="${nextItem.m_title.length()>14 }">…</c:if></a>
         </dt>
        </dl>
       </li>
       
     </c:forEach>  
                                         
      </ul>
     </div>
     
     </div>
    </div>
    </section>    
    <div class="layer_popup_open mfp-hide">   
    <div class="jp-video jp-video-360p jp-video-270p" style="position: absolute;top: 50%;left:50%;height:548px;margin-left: -485px;margin-top: -274px;z-index: 9999;width: 970px;">
      <video id="videostop" width="970px" height="548px" preload="auto" controls autoplay="autoplay" src="">
      
      </video>
      <button type='button' class='mfp-close' style="bottom:0;">×</button>
     </div>   
    </div>    
    
    <div class="layer_popup_1" style="display: none;">
     <div class="jp-video jp-video-360p jp-video-270p" style="position: absolute;top: 50%;left: 50%;height: 548px;margin-left: -485px;margin-top: -274px;z-index: 9999;width: 970px;">
      <video id="video_1" src="http://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/201812/13519_301_1.mp4" controls style="height: 548px;"></video>
     <a class="btn_close_1" style="background: url() 0 0 no-repeat;text-indent: -999px;background-color:white;">닫기</a> 
     </div>   
    </div>
    
    <div class="layer_popup_2" style="display: none;">
     <div class="jp-video jp-video-360p jp-video-270p" style="position: absolute;top: 50%;left: 50%;height: 548px;margin-left: -485px;margin-top: -274px;z-index: 9999;width: 970px;">
      <video id="video_2" src="http://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/201901/13772_301_1.mp4" controls style="height: 548px;"></video>
     <a class="btn_close_2" style="background: url() 0 0 no-repeat;text-indent: -999px;background-color:white;">닫기</a> 
     </div>   
    </div>
    
    <div class="layer_popup_3" style="display: none;">
     <div class="jp-video jp-video-360p jp-video-270p" style="position: absolute;top: 50%;left: 50%;height: 548px;margin-left: -485px;margin-top: -274px;z-index: 9999;width: 970px;">
      <video id="video_3" src="http://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/201812/13167_301_1.mp4" controls style="height: 548px;"></video>
     <a class="btn_close_3" style="background: url() 0 0 no-repeat;text-indent: -999px;background-color:white;">닫기</a> 
     </div>   
    </div>

</body>
</html>