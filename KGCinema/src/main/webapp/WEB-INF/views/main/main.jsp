<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="headLogin.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>라이프시어터, KG시네마</title>
    <link href="./resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="./resources/css/full-slider.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="./resources/slick-master/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="./resources/slick-master/slick/slick-theme.css">
    <script src="./resources/vendor/bootstrap/js/bootstrap.bundle2.min.js"></script>
    <script src="./resources/js/agency.min.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="./resources/slick-master/slick/slick.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <link href="./resources/vendor/bootstrap/css/bootstrap2.min.css" rel="stylesheet">
    <link href="./resources/css/agency.min.css" rel="stylesheet">
    
  <style type="text/css">
    html, body {margin: 0;padding: 0;}
    * {box-sizing: border-box;font-family: '나눔고딕','NanumGothic','맑은 고딕','Malgun Gothic','돋움',dotum,'Apple SD Gothic Neo',sans-serif;}
    body{min-width: 100%;min-height:100%;background: url("http://image2.megabox.co.kr/mop/home/ad/1600x1000/160824_bg_img.jpg")no-repeat 50% 0 fixed;background-size: cover;}
    i{display: inline-block;zoom:1;}
    .slider {width: 50%;margin: 100px auto;}
    .slick-slide {margin: 0px 20px;}
    .slick-slide img {width: 100%;}
    .slick-prev:before,.slick-next:before {color: black;}
    .slick-slide {transition: all ease-in-out .3s;opacity: 1;}
    .slick-active {opacity: 1;}
    .slick-current {opacity: 1;}
    .bin{width:100%;height:50px;}
     ul, ol, li, p{list-style:none;margin:0;padding:0;}
    .id{position: relative;display: block;width: 100%;z-index: 10;height: 26px;background-color: #f8f8f8;font-size: 12px;color: #333;text-indent: 14px;vertical-align: middle;border: 1px solid #d9d9d9;margin-bottom: 8px;}
    .pw{position: relative;display: block;width: 100%;z-index: 10;height: 26px;background-color: #f8f8f8;font-size: 12px;color: #333;text-indent: 14px;vertical-align: middle;border: 1px solid #d9d9d9;margin-bottom: 8px;}
    .chek{position: absolute; top: 0px; left: 0px; display: block; width: 16px; height: 16px; padding: 0px; margin: 0px; background: rgb(255, 255, 255); z-index: 0; border: 0px; opacity: 1;}
    .chek_ins{display: inline-block;vertical-align: middle;margin: 0 5px 0 0;padding: 0;width: 16px;height: 16px;background: url(http://image2.megabox.co.kr/mop/home/bg_input.png) 0 0 no-repeat;border: none;cursor: pointer;}
    .b{background-position: -32px 0;}
    .img_login{position: absolute;width: 65px;height: 60px;top: 0;right: 0;background-position: 0 -450px;overflow: hidden;text-indent: -9999px;cursor: pointer;}
    .join_btn{width: 100%;height: 40px;background-color: #f2f2f2;border-top: 1px solid #d7d7d7;margin-top: 30px;}
    .join_btn ul{padding: 5px 33px 0 36px;}
    .join_btn ul li{width: 50%;float: left;background: url(http://image2.megabox.co.kr/mop/home/dot.png) 5px 12px no-repeat;padding: 3px 0 3px 15px;}
    .join_btn ul li a{font-size: 13px;color: #4c4c4c;font-weight: bold;}
    .login_bottom{width: 380px;height: 80px;}
    .login_box_close{position: absolute;top: 10px;right: 10px;width: 20px;height: 20px;background: url(http://image2.megabox.co.kr/mop/home/btns/btn_close.png) 0 0 no-repeat;overflow: hidden;text-indent: -999px;}
    .fast_reserv{display: block;overflow: hidden;text-indent: -9999px;border: none;background-repeat: no-repeat;background: transparent;vertical-align: middle;}
    .fast_btn{float: right;height: 39px;width: 113px;}
    .item{width: 235px;height: 185px;background-color: rgba(0,0,0,0.6);border: 1px solid #333;}
    .renewal{background-color: #503396;border: 1px solid #6245a7;}
    .grandOpeningType{min-width: 100px;max-width: 215px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;height: 36px;color: #fff;box-shadow: 1px 1px 0 rgba(0,0,0,0.4);line-height: 34px;
    margin-top: -3px;font-size: 15px;display: inline-block;padding: 0 10px;}
    .item a{margin: 0;width: 235px;height: 100%;top: 0;background: none;text-align: center;color: #fff;letter-spacing: -0.3px;padding-top: 55px;}
    .rel{position: relative;}
    .subtitle{z-index:100000;display: block;position: relative;width: 970px;margin: 0 auto;top: 230px;letter-spacing: -1px;text-shadow: 1px 1px 1px #000000;behavior: url(/js/css3pie/pie.htc);line-height: 36px;}
    .subtitle_st{font-size: 36px;color: #fff;font-weight: 400;display: block;padding-top: 2px;padding-bottom: 19px;background: url(http://image2.megabox.co.kr/mop/home/main/h2_bg.png) 0 100% no-repeat;}
    .subtitle_st em{display: block;font-style: normal;font-weight: 300;font-size: 18px;line-height: 21px;padding: 8px 0;color: #fff;}
    .subtitle span{display: inline-block;font-size: 24px;line-height: 29px;color: #fff;}
  </style>
</head>

  <script type="text/javascript">
  $(document).on('ready', function() {
      $(".regular").slick({
          dots: true,
          infinite: true,
          slidesToShow: 5,
          slidesToScroll: 1
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
       <c:when test="${ms eq '' || empty ms}">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" class="active"></li>
          <li data-target="#carouselExampleIndicators"></li>
          <li data-target="#carouselExampleIndicators"></li>
        </ol>
        <div class="carousel-inner" role="listbox">      
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('./resources/images/main_slide_1.jpg');height:600px;">
	        <span class="subtitle">
	         <strong class="subtitle_st">TITLE<em>SUBTITLE</em></strong>
	         <span>CONTENT</span>
	        </span>          
            <div class="carousel-caption d-none d-md-block">
              <h3></h3>
              <p></p>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('./resources/images/main_slide_2.jpg');height:600px;">
	        <span class="subtitle">
	         <strong class="subtitle_st">TITLE<em>SUBTITLE</em></strong>
	         <span>CONTENT</span>
	        </span>          
            <div class="carousel-caption d-none d-md-block">
              <h3></h3>
              <p></p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('./resources/images/main_slide_3.jpg');height:600px;">
	        <span class="subtitle">
	         <strong class="subtitle_st">TITLE<em>SUBTITLE</em></strong>
	         <span>CONTENT</span>
	        </span>
            <div class="carousel-caption d-none d-md-block">
              <h3></h3>
              <p></p>
            </div>
          </div>          
        </div>
       </c:when>
       <c:otherwise>
        <ol class="carousel-indicators">
         <c:forEach var="item" items="${ms}">     
          <li data-target="#carouselExampleIndicators" name="${item.ms_date}"></li>
         </c:forEach> 
        </ol>
        <div class="carousel-inner" role="listbox">      
         <c:forEach var="item" items="${ms}">         
          <div class="carousel-item" style="background-image: url('${pageContext.request.contextPath}/resources/storage/${item.ms_file}');height:600px;">
          <c:if test="${item.ms_content ne null}">
           	 <span class="subtitle">
	         <strong class="subtitle_st">${item.ms_title}<em>${item.ms_subtitle}</em></strong>
	         <span>${item.ms_content}</span>
	        </span>
          </c:if>
            <div class="carousel-caption d-none d-md-block">
              <h3></h3>
              <p></p>
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
        
        <div class="login_hidden2" style="width:970px;height:600px;position:absolute;top:0;left:50%;margin-left:-485px;z-index:998;">        
        
        <div style="width:970px;height:61px;position: relative;margin: 0 auto;margin-bottom: 25px;z-index: 20;">
         <div style="position: absolute;top: 28px;left: 102px;left:0;">
          <a style="font-weight: bold;font-size: 14px;color: #fff;line-height: 13px; "href="#" >필름 소사이어티</a>
          <i style="margin: 0 12px;border-right: 1px solid #fff;height: 13px;vertical-align: middle;"></i>
          <a style="font-weight: bold;font-size: 14px;color: #fff;line-height: 13px;" href="#">클래식 소사이어티</a>          
         </div>
         
         <div style="position: absolute;top: 21px;right: 0;">
          <span style="float: left;margin: 12px 24px;">
           <a style="font-weight: bold;font-size: 14px;color: #fff;line-height: 13px;" href="#">고객센터</a>
           <i style="margin: 0 12px;border-right: 1px solid #fff;height: 13px;vertical-align: middle;"></i>
           <a style="font-weight: bold;font-size: 14px;color: #fff;line-height: 13px;" href="#">멤버쉽</a>
           <i style="margin: 0 12px;border-right: 1px solid #fff;height: 13px;vertical-align: middle;"></i>
           <a style="font-weight: bold;font-size: 14px;color: #fff;line-height: 13px;" href="#">VIP</a>
          </span>
           <a href="reserveMain.do">
          <button href="reserve.do" class="fast_reserv fast_btn" type="button" style="cursor: pointer;background-image: url(http://image2.megabox.co.kr/mop/home/btns/btn_header.png);background-position: -150px -100px;padding-right: 19px;">
          </button>
          </a>
         </div>
        </div>
        
        </div>
          
      </div>
    </header>
    
    <section class="py-5" style="border-bottom:1px solid #e5e5e5;background-color:white;">
     <div class="regular slider">
     
     <c:forEach var="item" items="${movie}">
       <div class="movie_1 rel">
         <div class="hover_1" style="width:100%;height:100%;padding-top:50px;z-index:999;position: absolute;display:block;">
             <a href="reserveMovie.do?no=${item.m_no}" style="display:none;text-decoration:none;margin:0 15px;border:1px solid #c1b687;height:48px;font-size:15px;font-weight:bold;color:#c1b687;text-align: center;padding-top:10px;">예매하기</a>
             <div style="margin-top:10px;display:none;">
             <a href="moviedetail.do?idx=${item.m_no}" style="text-decoration:none;display:block;margin:0 15px;border:1px solid #c1b687;height:48px;font-size:15px;font-weight:bold;color:#c1b687;text-align: center;padding-top:10px;">상세보기</a>
             </div>  
         </div>
         <img src="<%=request.getContextPath()%>/resources/storage/${item.m_poster}">
       </div>
     </c:forEach>  
       
       
         
                 
     </div>     
    </section>


    <!-- Page Content -->
 <c:choose> 
  <c:when test="${me le '' || not empty me}"> 
   <c:forEach var="me" items="${me}">    
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
        </div>
        <div class="event_box2" style="width: 632px;height: 315px;border: 1px solid #ccc;border-top: none;position: relative;z-index: 2;">
         <div class="event_box2_left" style="width: 315px;height: 315px;border-right: 1px solid #ccc;float: left;">
		  <c:choose> 
		   <c:when test="${me.me_file2 le '' || not empty me.me_file2}">    
		    <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file2}" style="width:315px;height:315px;">
		   </c:when>
		   <c:otherwise>
		    <img src="./resources/images/new_event2.jpg">
		   </c:otherwise>
		  </c:choose> 
         </div>
         <div class="event_box2_right" style="float:left;">
   		  <c:choose> 
		   <c:when test="${me.me_file3 le '' || not empty me.me_file3}">    
		    <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file3}" style="width:315px;height:315px;">
		   </c:when>
		   <c:otherwise>
		    <img src="./resources/images/new_event3.jpg">
		   </c:otherwise>
		  </c:choose> 
         </div>
        </div>
        <div class="event_box3" style="width: 327px;height: 632px;position: absolute;right: 0;top: 47px;">
		 <c:choose> 
		  <c:when test="${me.me_file4 le '' || not empty me.me_file4}">    
		   <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file4}" style="width:327px;height:632px;">
		  </c:when>
		 <c:otherwise>
		   <img src="./resources/images/new_event4.jpg">
		 </c:otherwise>
		</c:choose>
        </div>
       </div>       
      </div>
     </div>
    </section>
    
    <section class="py-5" style="width:100%;height:500px;">
     <div style="margin: 0 auto;position: relative;background-position: 0 0;background-repeat: no-repeat;width: 865px;height: 370px;">
      <div style="background: url(http://image2.megabox.co.kr//mop/event/2018/C6/D7344C-8AB9-48A9-8A09-7594EC54A5D7.png) no-repeat 0 0;background-size: cover;height: 140px;"></div>
      <div style="width:100%;margin-top: 30px;text-align: center;z-index:1;position: relative;">
       <div style="position: relative;overflow: hidden;">
        <div style="transform: translate3d(0px, 0px, 0px);transition: all 0s ease 0s;width: 900px;position: relative;">
         <div class="" style="width: 281.667px; margin-right: 10px;float: none;display: inline-block;margin-top: 5px;">
          <div class="item">
           <div class="grandOpeningType renewal">리뉴얼 오픈</div>
           <a>
            <div class="thArea" style="font-size: 17px;color: #fff;">경상남도</div>
            <h5 style="font-size: 22px;margin: 10px 0;color: #fff;">양산</h5>
            <div style="font-size: 17px;color: #fff;">12월 8일</div>
           </a>
          </div>
         </div>
         <div class="" style="width: 281.667px; margin-right: 10px;float: none;display: inline-block;margin-top: 5px;">
          <div class="item">
           <div class="grandOpeningType renewal">리뉴얼 오픈</div>
           <a>
            <div class="thArea" style="font-size: 17px;color: #fff;">경상남도</div>
            <h5 style="font-size: 22px;margin: 10px 0;color: #fff;">사천</h5>
            <div style="font-size: 17px;color: #fff;">12월 19일</div>
           </a>
          </div>
         </div>
         <div class="" style="width: 281.667px; margin-right: 10px;float: none;display: inline-block;margin-top: 5px;">
          <div class="item">
           <div class="grandOpeningType renewal">리뉴얼 오픈</div>
           <a>
            <div class="thArea" style="font-size: 17px;color: #fff;">신규오픈</div>
            <h5 style="font-size: 22px;margin: 10px 0;color: #fff;">용인테크노벨리</h5>
            <div style="font-size: 17px;color: #fff;">1월 12일</div>
           </a>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </section>
    
    <section class="py-5" style="background-color:white;">
     <div class="" style="position: relative;padding: 20px 0 80px;">
      <div class="" style="position: relative;z-index: 10;width: 970px;margin: 0 auto;">
       <h3 style="height: 37px;color: #333;font-size: 20px;letter-spacing: -0.5px;">제휴 이벤트</h3>
        <div class="" style="position: relative;">
         <div class="part_event_left" style="width: 632px;height: 632px;border: 1px solid #ccc;">
          <div style="float: left;width: 315px;height: 315px;">
		   <c:choose> 
			<c:when test="${me.me_file5 le '' || not empty me.me_file5}">    
		     <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file5}" style="width:315px;height:315px;">
			</c:when>
		    <c:otherwise>
		     <img src="./resources/images/part_event1.png">
		    </c:otherwise>
		   </c:choose>
          </div>
          <div style="float: left;width: 315px;height: 315px;">
		   <c:choose> 
		    <c:when test="${me.me_file6 le '' || not empty me.me_file6}">    
		     <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file6}" style="width:315px;height:315px;">
			</c:when>
		    <c:otherwise>
		     <img src="./resources/images/part_event2.jpg">
		    </c:otherwise>
		   </c:choose>	
          </div>
          <div style="float: left;width: 315px;height: 315px;">
		   <c:choose> 
		    <c:when test="${me.me_file7 le '' || not empty me.me_file7}">    
		     <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file7}" style="width:315px;height:315px;">
			</c:when>
		    <c:otherwise>
	         <img src="./resources/images/part_event3.jpg">
		    </c:otherwise>
		   </c:choose>
          </div>
          <div style="float: left;width: 315px;height: 315px;">
		   <c:choose> 
			<c:when test="${me.me_file8 le '' || not empty me.me_file8}">    
			 <img src="<%=request.getContextPath()%>/resources/storage/${me.me_file8}" style="width:315px;height:315px;">
			</c:when>
		    <c:otherwise>
	         <img src="./resources/images/part_event4.jpg">
		    </c:otherwise>
		   </c:choose>	
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
         </div>
        </div>
      </div>
     </div>
    </section>      
   </c:forEach>
  </c:when>
  <c:otherwise>
    <section class="py-5" style="background-color:white;">
     <div class="new_event" style="position: relative;padding: 20px 0 80px;">
      <div class="new_event_content" style="position: relative;z-index: 10;width: 970px;margin: 0 auto;">
       <h3 style="height: 37px;color: #333;font-size: 20px;letter-spacing: -0.5px;">새로운 이벤트</h3>
       <div class="new_event_main">
        <div class="event_box1" style="overflow: hidden;position: relative;z-index: 1;width: 632px;height: 317px;border: 1px solid #ccc;">
         <img src="./resources/images/new_event1.jpg">
        </div>
        <div class="event_box2" style="width: 632px;height: 315px;border: 1px solid #ccc;border-top: none;position: relative;z-index: 2;">
         <div class="event_box2_left" style="width: 315px;height: 315px;border-right: 1px solid #ccc;float: left;">
          <img src="./resources/images/new_event2.jpg">
         </div>
         <div class="event_box2_right" style="float:left;">
          <img src="./resources/images/new_event3.jpg">
         </div>
        </div>
        <div class="event_box3" style="width: 327px;height: 632px;position: absolute;right: 0;top: 47px;">
         <img src="./resources/images/new_event4.jpg">
        </div>
       </div>       
      </div>
     </div>
    </section>
    
    <section class="py-5" style="width:100%;height:500px;">
     <div style="margin: 0 auto;position: relative;background-position: 0 0;background-repeat: no-repeat;width: 865px;height: 370px;">
      <div style="background: url(http://image2.megabox.co.kr//mop/event/2018/C6/D7344C-8AB9-48A9-8A09-7594EC54A5D7.png) no-repeat 0 0;background-size: cover;height: 140px;"></div>
      <div style="width:100%;margin-top: 30px;text-align: center;z-index:1;position: relative;">
       <div style="position: relative;overflow: hidden;">
        <div style="transform: translate3d(0px, 0px, 0px);transition: all 0s ease 0s;width: 900px;position: relative;">
         <div class="" style="width: 281.667px; margin-right: 10px;float: none;display: inline-block;margin-top: 5px;">
          <div class="item">
           <div class="grandOpeningType renewal">리뉴얼 오픈</div>
           <a>
            <div class="thArea" style="font-size: 17px;color: #fff;">경상남도</div>
            <h5 style="font-size: 22px;margin: 10px 0;color: #fff;">양산</h5>
            <div style="font-size: 17px;color: #fff;">12월 8일</div>
           </a>
          </div>
         </div>
         <div class="" style="width: 281.667px; margin-right: 10px;float: none;display: inline-block;margin-top: 5px;">
          <div class="item">
           <div class="grandOpeningType renewal">리뉴얼 오픈</div>
           <a>
            <div class="thArea" style="font-size: 17px;color: #fff;">경상남도</div>
            <h5 style="font-size: 22px;margin: 10px 0;color: #fff;">사천</h5>
            <div style="font-size: 17px;color: #fff;">12월 19일</div>
           </a>
          </div>
         </div>
         <div class="" style="width: 281.667px; margin-right: 10px;float: none;display: inline-block;margin-top: 5px;">
          <div class="item">
           <div class="grandOpeningType renewal">리뉴얼 오픈</div>
           <a>
            <div class="thArea" style="font-size: 17px;color: #fff;">신규오픈</div>
            <h5 style="font-size: 22px;margin: 10px 0;color: #fff;">용인테크노벨리</h5>
            <div style="font-size: 17px;color: #fff;">1월 12일</div>
           </a>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </section>
    
    <section class="py-5" style="background-color:white;">
     <div class="" style="position: relative;padding: 20px 0 80px;">
      <div class="" style="position: relative;z-index: 10;width: 970px;margin: 0 auto;">
       <h3 style="height: 37px;color: #333;font-size: 20px;letter-spacing: -0.5px;">제휴 이벤트</h3>
        <div class="" style="position: relative;">
         <div class="part_event_left" style="width: 632px;height: 632px;border: 1px solid #ccc;">
          <div style="float: left;width: 315px;height: 315px;">
           <img src="./resources/images/part_event1.png">
          </div>
          <div style="float: left;width: 315px;height: 315px;">
           <img src="./resources/images/part_event2.jpg">
          </div>
          <div style="float: left;width: 315px;height: 315px;">
           <img src="./resources/images/part_event3.jpg">
          </div>
          <div style="float: left;width: 315px;height: 315px;">
           <img src="./resources/images/part_event4.jpg">
          </div>                    
         </div>
         
         <div class="part_event_right" style="width: 327px;height: 632px;position: absolute;right: 0;top: 0px;">
           <img src="./resources/images/part_event5.jpg">
         </div>
        </div>
      </div>
     </div>
    </section>  
  </c:otherwise>
 </c:choose>
  
  <!--  
    <div style="width:100%;height:400px;background-color:black;"> 
    
    </div>
   -->
    
   <jsp:include page="footer.jsp"></jsp:include>



</body>
</html>