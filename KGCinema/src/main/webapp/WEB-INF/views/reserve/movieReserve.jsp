<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../main/headLogin.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>빠른예매(시간표)</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="./resources/slick-master/slick/slick.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="./resources/slick-master/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="./resources/slick-master/slick/slick-theme.css">
    <link href="./resources/css/agency.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="./resources/demos/style.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="./resources/js/Reserve_step1.js"></script>
    
    
   <script type="text/javascript">
  $(document).on('ready', function() {
   $("#showMovieListBtn").click(function(){
     $("#reserve_hide").css({'display' : 'block'});
   });  
   $("#reserve_hide #btnMovieCancel").click(function(){
     $("#reserve_hide").css({'display' : 'none'});
     document.mform.title.value = "";
     document.mform.no.value = "";
     $("#selectMovieList li").removeClass("sel");
   });
   $("#cinemaList li.none_select").click(function(){
    $("#reserve_hide2").css({'display' : 'block'});
   });  
   $("#reserve_hide2 #btnMovieCancel").click(function(){
    $("#reserve_hide2").css({'display' : 'none'});
    document.mform.theater.value = "";
     $(".theater_list ul li").removeClass("activeArea");
   });  
  });
  </script>
       
  <style type="text/css">
    html, body {margin: 0;padding: 0;border:0;vertical-align: baseline;}
    * {box-sizing: border-box;font-family: '나눔고딕','NanumGothic','맑은 고딕','Malgun Gothic','돋움',dotum,'Apple SD Gothic Neo',sans-serif;}
    .mb10{margin-bottom: 10px;}
    .mr13{margin-right: 13px;}
    div{display:block;}
    ul, ol, dl, li, p {margin:0;padding:0;list-style: none;}
    button{font-family: inherit;font-size: inherit;line-height: inherit;}
    input{width: 200px;border: 1px solid #d9d9d9;line-height: 26px;height: 26px;background-color: #f8f8f8;font-size: 12px;color: #333;text-indent: 14px;vertical-align: middle;}
    .bin{width:100%;height:50px;}
    #reservation{z-index:1060;}
    .fade.in{opacity: 1;}
    .modal{position: fixed;top: 0;right: 0;bottom: 0;left: 0;z-index: 1040;overflow: auto;overflow-y: scroll;}
    .wrapper{width: 968px;margin: 0 auto;padding: 88px 0 30px 0;}
    .wrapper .contents.ReservationBn_ok{height:auto;}
    .wrapper .contents{width: 100%;height: 619px;border: 1px solid #cdcdcd;background-color: #f9f9f9;position: relative;}
    .wrapper .contents .left_wrap{float: left;width: 433px;border-right: 1px solid #e0e0e0;margin-right: -1px;}
    .wrapper .contents .date{height: 90px;padding-bottom: 9px;}
    .wrapper .contents .left_wrap>div{border-bottom: 1px solid #e0e0e0;padding: 18px 19px 0 20px;}
    .wrapper .contents .title{margin-bottom:11px;}
    .booking_lp h2, .booking_lp h3{background: url(http://image2.megabox.co.kr/mop/home/btns/btn_booking_160912.png) 0 0 no-repeat;height: 26px;width: 80px;text-indent: -9999px;overflow: hidden;}
    .booking_lp h2.h2_date{background-position: 0 -160px;}
    .wrapper .contents .title h2{float: left;color: #503396;font-size: 24px;margin: 0;padding: 0;}
    .wrapper .contents .title .util{float: right;}
    #datepicker_wrap{position: relative;}
    .img_btn{display: block;overflow: hidden;text-indent: -9999px;border: none;background-repeat: no-repeat;background: transparent;vertical-align: middle;}
    .img_btn.booking{background-image: url(http://image2.megabox.co.kr/mop/home/btns/btn_booking.png);}
    .wrapper .contents .title .util .btn_util{width: 22px;height: 22px;}
    .wrapper .contents .title .util .btn_util.cal{background-position: 0 -80px;}
    .wrapper .contents .left_wrap>.theater{height: 219px;}
    .booking_lp h2.h2_theater{background-position: -80px -160px;}
    .wrapper .contents .left_wrap>.theater ul li{position: relative;float: left;width: 190px;height: 66px;border: 1px solid #e0e0e0;display: table;}
    .wrapper .contents button.btn_add{display: block;width: 100%;height: 100%;margin: 0;padding: 0;border: none;background: url(http://image2.megabox.co.kr/mop/home/btns/btn_add.png) 50% 50% no-repeat;}
    .wrapper .contents .left_wrap>.movie{height: 308px;border: none;position: relative;}
    .booking_lp h2.h2_movie{background-position: -160px -160px;}
    .wrapper .contents .left_wrap>.movie .select_all{position: absolute;top: 55px;width: 392px;height: 230px;border: 1px solid #e1e1e1;z-index: 1;}
    .wrapper .contents .left_wrap>.movie .select_all .glass{height: 139px;background: #fff;opacity: .9;}
    .wrapper .contents .left_wrap>.movie .select_all .glass p{text-align: center;padding-top: 50px;color: #333;font-size: 34px;}
    .wrapper .contents .left_wrap>.movie .select_all .btn_wrap{border-top: 1px solid #e1e1e1;border-bottom: 1px solid #e1e1e1;height: 90px;background: #fff;}
    .wrapper .contents .left_wrap>.movie .select_all .btn_wrap .select_movie{width: 100%;height: 100%;margin: 0;background: url(http://image2.megabox.co.kr/mop/home/btns/select_movie.png) 50% 50% no-repeat;}
    .wrapper .contents .right_wrap{float: left;width: 534px;}
    .wrapper .contents .right_wrap .time{height: 90px;padding: 18px 30px 9px 30px;}
    .wrapper .contents .right_wrap>div{border-bottom: 1px solid #e0e0e0;}
    .booking_lp h2.h2_time{background-position: -240px -160px;}
    .slidebar{position: relative;height: 25px;background-color: #fff;border: 1px solid #e0e0e0;border-radius: 2px;}
    .wrapper .contents .right_wrap .movie_list{width: 533px;height: 526px;border: none;overflow: auto;position: relative;}
    .wrapper .contents .right_wrap .movie_list ul li{height: 60px;border-bottom: 1px solid #e5e5e5;border-left: 1px solid #e5e5e5;background-color: #fff;cursor: pointer;}
    .wrapper .contents .right_wrap .movie_list .viewing_time{width: 26%;padding: 15px 0 0 20px;}
    .wrapper .contents .right_wrap .movie_list ul li>div{float: left;position: relative;background: url(http://image2.megabox.co.kr/mop/home/btns/btn_close.png) right -357px no-repeat;height: 100%;}
    .wrapper .contents .right_wrap .movie_list .viewing_time .morning{top: 3px;font-size: 12px;color: #666;}
    .wrapper .contents .right_wrap .movie_list .viewing_time p{color: #333;font-size: 14px;}
    .wrapper .contents .right_wrap .movie_list ul li>div p{margin: 0;padding: 0;}
    .wrapper .contents .right_wrap .movie_list .viewing_time p strong{font-size:20px;}
    .wrapper .contents .right_wrap .movie_list .morning{position: absolute;}
    .wrapper .contents .right_wrap .movie_list .movie{width: 49%;padding: 10px 0 0 10px;}
    .wrapper .contents .right_wrap .movie_list .movie .title{text-overflow: ellipsis;white-space: nowrap;overflow: hidden;vertical-align: top;font-weight: 700;}
    .wrapper .contents .right_wrap .movie_list .subtitle{top: 35px;}
    .wrapper .contents .right_wrap .movie_list .subtitle{position: absolute;font-size: 12px;color: #666;}
    .age, .age_m{background: url(http://image2.megabox.co.kr/mop/home/bg_age2.png) 0 -999px no-repeat;display: inline-block;width: 17px;height: 18px;margin-right: 4px;text-indent: -99999px;overflow: hidden;vertical-align: middle;}
    .wrapper .contents .right_wrap .movie_list .movie .title a{color: #333;text-decoration: none;}
    .age_12{background-position: -60px 0;}
    .wrapper .contents .right_wrap .movie_list .theater_wrap{width: 25%;padding: 10px 19px 0 0;background: none;float: right;}
    .wrapper .contents .right_wrap .movie_list .theater_wrap p{text-align: right;white-space: nowrap;font-size: 12px;line-height: 14px;}
    .wrapper .contents .right_wrap .movie_list .seat{top: 40px;right: 19px;font-weight: 400;}
    
    #select_theater, #select_movie, #select_seat{z-index: 1080;}
    .fade.in{opacity: 1;}
    .booking_lp2{overflow:auto;}
    .booking_lp2 .wrapper{width: 970px;margin: 0 auto;padding: 88px 0 30px 0;}
    .booking_lp2 .wrapper .contents{position: relative;min-height: 554px;border: 1px solid #cdcdcd;background-color: #fff;}
    .booking_lp2 .wrapper .contents .movie_header{overflow: hidden;padding: 13px 20px 12px 20px;background-color: #f9f9f9;border-bottom: 1px solid #e0e0e0;}
    .booking_lp2 .wrapper .contents .movie_header h3{color: #503396;padding: 0;margin: 0;margin-top: 4px;}
    .booking_lp h3.h3_movie_all.active{background-position: -580px -350px;}
    .booking_lp h3.h3_movie_all{width: 85px;}
    .booking_lp2 h3 a{display: block;height: 26px;}
    .blank{background: url(http://image2.megabox.co.kr/mop/home/blank.png);}
    .booking_lp .h3_split{width: 1px;height: 27px;margin: 0 20px;background: url(http://image2.megabox.co.kr/mop/home/btns/h3_split.png) 50% 50% no-repeat;}
    .booking_lp h3.h3_specialcontent{width: 105px;background-position: -700px -300px;}
    .booking_lp2 .wrapper .contents .util{height: 42px;padding: 9px 19px 0 19px;}
    .sort{overflow: hidden;padding-right: 6px;}
    .booking_lp2 .wrapper .contents .util .sort{float: right;}
    .booking_lp2 .wrapper .contents .util .sort li{float: left;padding: 7px 0 6px 0;border-left: none;line-height: auto;margin: 0;}
    .booking_lp2 .wrapper .contents .util .sort li a{display: block;padding: 0 14px;color: #666;font-size: 12px;text-decoration: none;line-height: 1;}
    .booking_lp2 .wrapper .contents .util .sort li a.active{color: #198591;font-weight: bold;}
    .movie_body{padding: 0 18px;overflow: auto;height: 454px;}
    .booking_lp2 .wrapper .contents .movie_body{width: 966px;left:1px;position: relative;}
    .movie_list_zone{overflow: hidden;margin-right: -18px;}
    .movie_list_zone li, #moviePost_select_movie .movie_body .movie_list li{position: relative;float: left;width: 132px;height: 227px;cursor: pointer;}
    .movie_list_zone li .poster, #moviePost_select_movie .movie_body .movie_list li .poster{height: 188px;border-left: 1px solid #fff;}
    .movie_list_zone li .poster img, #moviePost_select_movie .movie_body .movie_list li .poster img{width: 100%;height: 100%;display: block;}
    .blind{display: block;overflow: hidden;position: absolute;top: -1000em;left: -1000em;}
    .movie_list_zone li .title{border-left: 1px solid #e5e5e5;height: 39px;font-size: 12px;color: #333;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;padding-top: 10px;padding-left: 7px;}
    .age2{width: 17px;height: 18px;margin-right: 4px;text-indent: -99999px;overflow: hidden;}
    .booking_lp2 .wrapper .contents .util .selected{float: left;overflow: hidden;}
    .booking_lp2 .wrapper .contents .util .selected .sel_all{width: 25px;height: 25px;float: left;background-position: -240px -80px;}
    .booking_lp2 .wrapper .contents .util .selected>p{display: block;float: left;padding: 3px 10px;margin-right: 10px;border: 1px solid #ededed;border-radius: 2px;background-color: #fff;font-size: 12px;}
    .last_btns{position: absolute;top: 13px;right: 13px;}
    .booking_lp2 .wrapper .contents button{width: 68px;height: 30px;float: left;margin-left: 10px;}
    .booking_lp2 .wrapper .contents button.cancel{background-position: 0 0;}
    .booking_lp2 .wrapper .contents button.ok{background-position: -80px 0;}
    .wrapper .contents .left_wrap>.movie .list li {float: left;width: 97px;margin-left: 1px;}
    .wrapper .contents .left_wrap>.movie .list.selected li{width: 97px;}
    .wrapper .contents .left_wrap>.movie .list li:first-child{margin-left: 0;}
    .wrapper .contents .left_wrap>.movie .list li .poster{position: relative;border: 1px solid #e0e0e0;height: 140px;}
    .wrapper .contents .left_wrap>.movie .list li .poster button.close_small{top: 0;}
    .wrapper .contents button.close_small{position: absolute;right: -1px;top: -1px;width: 20px;height: 20px;border: 1px solid #e0e0e0;background: #ffffff url(http://image2.megabox.co.kr/mop/home/btns/btn_close.png) 4px -86px no-repeat;}
    .wrapper .contents .left_wrap>.movie .list li .poster img{width: 100%;height: 100%;}
    .booking_lp h3.h3_theater1.active{background-position: -400px -200px;}
    .booking_lp h3.h3_theater2{background-position: -320px -160px;cursor: pointer;}
    .booking_lp2 .wrapper .contents .movie_body{width: 966px;position: relative;left: 1px;}
    .theater_list{display: block;height: 453px;border-top: 1px solid #e5e5e5;background: #FFF;overflow: hidden;clear: both;}
    .theater_list ul{display: block;overflow: hidden;overflow-y: auto;height: 451px;float: left;border-right: 1px solid #e5e5e5;}
    .theater_list ul.depth1{width: 178px;}
    .theater_list ul li{height: 36.4px;font-size: 12px;color: #333;padding: 12px 15px 0 20px;cursor: pointer;font-weight: 800;}
    .theater_list ul.depth1 li{border-bottom: 1px solid #e5e5e5;}
    .theater_list ul.depth1 li.active{background-color: #f9f9f9;}
    .theater_list ul a{text-decoration: none;color: #333;}
    .theater_list ul.depth1 li.active span{display: block;float: right;font-weight: 700;font-size: 16px;margin-top: -2px;}
    .theater_list ul.depth2{width: 201px;background-color: #f9f9f9;}
    .theater_list ul.depth2 li.activeArea{font-weight: 700;color: #fff;background-color: #198591;}
    .theater_list ul.depth2 li.activeArea a{color: #fff;}
    
    .age_12{background-position: -60px 0;}
    .age_15 {background-position: -90px 0;}
    .age_0 {background-position: 0 0}
    .age_19 {background-position: -30px 0;}
    
    
    
    
    
    
    
    .sel{color: #fff;background-color: #198591;}
    
    .slick-track{text-align: center;}
    .slick-prev:before, .slick-next:before{color:#503396;}
    .slick-slide {transition: all ease-in-out .3s;opacity: 1;}
    .slick-active {opacity: 1;}
    .slick-current{background-color: #503396;opacity: 1;}
    .center li{cursor: pointer;}
    .center li a{color:black;text-decoration: none;}
    
    
    
  </style>
  
 <script>
 jQuery(function($){
           $.datepicker.regional['ko'] = {closeText: '닫기',prevText: '이전달',nextText: '다음달',currentText: '오늘',monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],dayNames: ['일','월','화','수','목','금','토'],dayNamesShort: ['일','월','화','수','목','금','토'],dayNamesMin: ['일','월','화','수','목','금','토'],weekHeader: 'Wk',dateFormat: 'yy-mm-dd',firstDay: 0,isRTL: false,showMonthAfterYear: true,yearSuffix: ''};
           $.datepicker.setDefaults($.datepicker.regional['ko']);
           
       });
        
   $( function() {
     $( "#datepicker" ).datepicker({
        buttonImageOnly: true,
       buttonText: "Select date",
       minDate: 0
       
       

     });

          
     $("#selectMovieList li").click(function () {     
        var selSu = $(".sel").length
         var srcSu = $(".src").length
         
         
         if(selSu > 0) {
            $(this).removeClass("sel");
            $(this).find('img').removeClass("src");
             var imagetitle = jQuery('.src').attr("title");
             document.mform.title.value = imagetitle;
             
             if(document.mform.title.value == "undefined") {
                document.mform.title.value = "";
                document.mform.no.value = "";
             }
             return false;
         }else {
            $(this).addClass("sel");
            $(this).find('img').addClass("src");
            var imagetitle = jQuery('.src').attr("title");
             document.mform.title.value = imagetitle;
             
             if(document.mform.title.value == "undefined") {
                document.mform.title.value = "";
                document.mform.no.value = "";
             }
                        
             var no = jQuery('.src').attr("no");
             
             document.mform.no.value = no;
         }
     });
     
     

    	 

     
   }); 
   
   function theaterClick(data) {
	   var $area = $('li.activeArea', '#body_theater1 .depth2').removeClass('activeArea');
	   var activeSu = $(".activeArea").length;
       if(activeSu > 0) {
            $(data).removeClass("activeArea");
            $(data).find('a').removeClass("Area");
             var Area = jQuery(data).attr('theatername');
             document.mform.theater.value = Area;
             return false;
        }else {
            $(data).addClass("activeArea");
            $(data).find('a').addClass("Area");
            var Area = jQuery(data).attr('theatername');
             document.mform.theater.value = Area;                    
         }
   }
   
   
   
   
   

   
   
   
   
   
   function movieDel() {
      document.mform.no.value = "";
      document.mform.submit();
   }
   function theaterDel() {
     document.mform.theater.value = "";
     document.mform.submit();
   }
   
   function send() {
      document.mform.submit();
   }
   
   function send2() {
	   document.sform.submit();
   }
   
   
  </script>

  
</head>
<body>
   <div class="bin"></div>
   <form action="reserveMovie.do" method="post" name="mform" enctype="multipart/form-data">

   <div class="wrapper">
    <div class="contents clearfix ReservationBn_ok">
     <div class="left_wrap">
      <div class="date">
       <div class="title clearfix">
        <h2 class="h2_date">날짜</h2>
        <div class="util" id="datepicker_wrap">
         <input type="text" id="datepicker" name="date" value="${date }" onchange="send();" readonly="readonly" class="" style="cursor:pointer;border:1px solid gray;">
        </div>
       </div>
      </div>
      <div class="theater">
       <div class="title clearfix">
        <h2 class="h2_theater">극장</h2>
       </div>
       <div id="cinemaList" class="list">
         <ul>
         <c:choose>
          <c:when test="${tbean eq null || tbean eq ''}">
          <li class="none_select mr13 mb10">
           <button type="button" class="btn_add" title="극장선택"></button>
          </li>
          </c:when>
          <c:otherwise>
          <li class="select mr13 mb10">
          
          <button type="button" class="close_small" onclick="theaterDel();"></button>
           <span style="display: table-cell;height: 100%;vertical-align: middle;text-align: center;background-color:white;line-height: 20px;">${tbean}</span>
           
          </li>
          </c:otherwise>
         </c:choose>
          <li class="none_select mb10">
           <button type="button" class="btn_add" title="극장선택"></button>
          </li>
          <li class="none_select mr13">
           <button type="button" class="btn_add" title="극장선택"></button>
          </li>
          <li class="none_select">
           <button type="button" class="btn_add" title="극장선택"></button>
          </li>
         </ul>
         
         
        </div>
      </div>
      <div class="movie">
      <div class="title clearfix">
       <h2 class="h2_movie">영화</h2>
      </div>
      
   <c:choose>
    <c:when test="${mbean.m_poster eq null || mbean.m_poster eq ''}">
      <div class="select_all" id="selectedAllMovie" style="display:block;">
       <div class="glass">
        <p>모든영화</p>
       </div>
       <div class="btn_wrap">
        <button type="button" class="img_btn select_movie" id="showMovieListBtn">영화선택</button>
       </div>
      </div> 
    </c:when>
    <c:otherwise>
    <div class="list selected" id="selectedMovieList" style="display: block;">
       <ul style="overflow: hidden;">
       

        <li class="poster">
          <div class="poster">
           <button type="button" class="close_small" onclick="movieDel();"></button>
           <img src="${pageContext.request.contextPath}/resources/storage/${mbean.m_poster}">
           
          </div>
        </li>

        
        <li class="poster">
          <div class="poster">
           <button type="button" class="btn_add"></button>
           
          </div>
        </li>
        <li class="poster">
          <div class="poster">
           <button type="button" class="btn_add"></button>
           
          </div>
        </li>
        <li class="poster">
          <div class="poster">
           <button type="button" class="btn_add"></button>   
          </div>
        </li>
       </ul>
       
       <div class="btn_wrap" style="border-top: 1px solid #e1e1e1;border-bottom: 1px solid #e1e1e1;height: 90px;background: #fff;">
        <button type="button" class="img_btn select_movie" id="showMovieListBtn" style="height:90px;width: 100%;height: 100%;margin: 0;
        background: url(./resources/images/movie_text.png) 50% 50% no-repeat;text-indent:0;color:#503396;font-weight: bold;"></button>
       </div>
       
      </div>

    </c:otherwise>
  </c:choose>


      
      
      
     </div>    
    </div>
    <div class="right_wrap">
     <div class="time">
      <div class="title clearfix">
       <h2 class="h2_time">시간</h2>
      </div>
      <div class="slidebar" id="sel_time">
       <ul class="center slider">
        <li onclick="fnMove('0')"><a>1</a></li>   <li onclick="fnMove('1')"><a>2</a></li>   <li onclick="fnMove('2')"><a>3</a></li>   <li onclick="fnMove('3')"><a>4</a></li>   <li onclick="fnMove('4')"><a>5</a></li>
        <li onclick="fnMove('5')"><a>6</a></li>   <li onclick="fnMove('6')"><a>7</a></li>   <li onclick="fnMove('7')"><a>8</a></li>   <li onclick="fnMove('8')"><a>9</a></li>   <li onclick="fnMove('9')"><a>10</a></li>
        <li onclick="fnMove('10')"><a>11</a></li>  <li onclick="fnMove('11')"><a>12</a></li>  <li onclick="fnMove('12')"><a>13</a></li>  <li onclick="fnMove('13')"><a>14</a></li>  <li onclick="fnMove('14')"><a>15</a></li>
        <li onclick="fnMove('15')"><a>16</a></li>  <li onclick="fnMove('16')"><a>17</a></li>  <li onclick="fnMove('17')"><a>18</a></li>  <li onclick="fnMove('18')"><a>19</a></li>  <li onclick="fnMove('19')"><a>20</a></li>
        <li onclick="fnMove('20')"><a>21</a></li>  <li onclick="fnMove('21')"><a>22</a></li>  <li onclick="fnMove('22')"><a>23</a></li>  <li onclick="fnMove('23')"><a>24</a></li>  <li onclick="fnMove('24')"><a>25</a></li>
        <li onclick="fnMove('25')"><a>26</a></li>  <li onclick="fnMove('26')"><a>27</a></li>  <li onclick="fnMove('27')"><a>28</a></li>  <li onclick="fnMove('28')"><a>29</a></li>  <li onclick="fnMove('29')"><a>30</a></li>
       </ul>
      </div>
     </div>
     <div id="time-movie-list" class="movie_list">
      <ul id="movieTimeList">
      <div id=div1 >
      <c:forEach var="sbean" items="${schedule }">
       <li onclick="location.href='/cinema/reserveSeat.do?idx=${sbean.schedule_id}'">
        <div class="viewing_time">
         <p class="morning"></p>
         <p class="time_table">
          <strong><fmt:formatDate value="${sbean.starthour }" pattern="HH:mm"/></strong>
          <span>~ <fmt:formatDate value="${sbean.endhour }" pattern="HH:mm"/></span>
         </p>
        </div>
        <div class="movie">
         <p class="title">
         <c:forEach var="type" items="${movie}">
         <c:if test="${sbean.title eq type.m_title}">
          <span class="age age_${type.m_grade }">12세관람가</span>
         </c:if>
          </c:forEach>
          <a href=#">${sbean.title }</a>
         </p>
         <p class="subtitle"><c:forEach var="type" items="${movie}">
         	<c:if test="${sbean.title eq type.m_title}">
         		${type.m_type}
         	</c:if>
         </c:forEach></p>
        </div>
        <div class="theater_wrap">
         <p class="theater">${sbean.theater }<br>${sbean.scrno }</p>
         <p class="seat">0 / <c:forEach var="count" items="${screenCount}">
         	<c:if test="${sbean.theater eq count.s_theater && sbean.scrno eq count.s_scrno}">
         		${count.s_seatcnt }
         	</c:if>
         </c:forEach></p>
        </div>
       </li>

</c:forEach>




       </div>
      </ul>
     </div>
    </div>
   </div>
   <div style="background-color:red;width:100%;height:80px;">
    <img src="http://mlink-cdn.netinsight.co.kr/2018/12/18/b3cd1cc9fccd90afbff97d6dd5c766b8.jpg" width:970px;> 
   </div>
  </div>
   
   <script>
   //시간 슬라이더
   $(".center").slick({
       dots: false,
       infinite: true,
       centerMode: true,
       slidesToShow: 10,
      slidesToScroll: 1,
       centerMode: false,
       focusOnSelect: true
     });
   
   //스크롤이동
   function fnMove(seq){
       var offset = $("#div" + seq).offset();
       $('#time-movie-list').animate({scrollTop : offset.top}, 400);
   }

   </script>
   
   <div class="modal fade booking_lp booking_lp2 in" style="display:none;" id="reserve_hide2">
    <div class="wrapper">
     <div class="contents" style="height:554px;">
 
      <div class="movie_header">
       <h3 class="h3_theater1 pull-left overflow_visible active" style="float: left;">
        <a class="blank movieListTabBtn">지역별</a>
       </h3>
       <i class="icon h3_split pull-left" style="float:left;"></i>
       <h3 class="h3_theater2 pull-left ml10 overflow_visible">
        <a class="blank movieListTabBtn">특별관</a>
       </h3>
      </div>
      
      <div class="util">
       <div class="selected">
 
        <p class="selected_movie">
         <input name="theater" type="text" style="height:20px;width:150px;" value="${tbean }" readonly>
        </p>
        
       </div>
      </div>
      
      <div id="body_theater1" class="tab-pane movie_body body_theater1 active" style="display: block;">
       <div class="theater_list">
        <ul class="depth1">
        <li data-areacode="10" areaname="서울" class="">
         <a href="javascript:void(0);" title="서울 선택">서울<div class=""></div></a>
         <span></span>
         </li>
         <li data-areacode="30" areaname="경기" class="">
         <a href="javascript:void(0);" title="경기 선택">경기<div class=""></div></a>
         <span></span>
         </li>
         <li data-areacode="35" areaname="인천" class="">
         <a href="javascript:void(0);" title="인천 선택">인천<div class=""></div></a>
         <span></span>
         </li>
         <li data-areacode="45" areaname="대전/충청/세종" class="">
         <a href="javascript:void(0);" title="대전/충청/세종 선택">대전/충청/세종<div class=""></div></a>
         <span></span>
         </li>
         <li data-areacode="55" areaname="부산/대구/경상" class="">
         <a href="javascript:void(0);" title="부산/대구/경상 선택">부산/대구/경상<div class=""></div></a>
         <span></span>
         </li>
         <li data-areacode="65" areaname="광주/전라" class="">
         <a href="javascript:void(0);" title="광주/전라 선택">광주/전라<div class=""></div></a>
         <span></span>
         </li>
         <li data-areacode="70" areaname="강원" class="">
         <a href="javascript:void(0);" title="강원 선택">강원<div class=""></div></a>
         <span></span>
         </li>
         <li data-areacode="80" areaname="제주" class="">
         <a href="javascript:void(0);" title="제주 선택">제주<div class=""></div></a>
         <span></span>
         </li>
        </ul>
        
        <ul class="depth2">
        	<!-- 극장 li 들어감 -->
        
        </ul>
       </div>
      </div>
      
      <div class="last_btns">
       <button class="img_btn booking cancel" id="btnMovieCancel" type="button">취소</button>
       <button class="img_btn booking ok" id="btnMovieConfirm" type="button" onclick="send();">확인</button>
      </div>   
        
     </div>
    </div>
   </div>
   
   <div class="modal fade booking_lp booking_lp2 in" style="display:none;" id="reserve_hide">
    <div class="wrapper">
     <div class="contents">
 
      <div class="movie_header">
       <h3 class="h3_movie_all pull-left overflow_visible active" style="float: left;">
        <a class="blank movieListTabBtn">모든영화</a>
       </h3>
       <i class="icon h3_split pull-left" style="float:left;"></i>
       <h3 class="h3_specialcontent pull-left overflow_visible">
        <a class="blank movieListTabBtn">특별컨텐트</a>
       </h3>
      </div>
      
      <div class="util">
       <div class="selected">
        <button type="button" class="img_btn booking sel_all mr10 ml0" style="margin-right: 10px;margin-left: 0px;"></button>
        <p class="selected_movie">

         <input name="title" type="text" style="height:20px;width:150px;" value="" readonly>
         <input type="text"  name="no" hidden="" style="height:20px;width:150px;" value="${mbean.m_no }">
        </p>
       </div>
       <ul class="sort">
        <li><a class="sortBtn active">예매율순</a></li>
       </ul>
      </div>
      </form>
      <div class="movie_body movie">
       <ul id="selectMovieList" class="movie_list_zone">
       
       <c:forEach var="item" items="${movie}">
        <li>
         <a><span class="blind">${item.m_title}</span></a>
         <div class="poster">
           <img src="${pageContext.request.contextPath}/resources/storage/${item.m_poster}" title="${item.m_title}" no="${item.m_no }" name="">
         </div>
         <p class="title">
         <span class="age2 age_15" style="">
          <c:choose>
           <c:when test="${item.m_grade eq 0}">
            <img src="./resources/images/bg_grade_all.png" style="margin-top:-1px;">
           </c:when>
           <c:when test="${item.m_grade eq 12}">
            <img src="./resources/images/bg_grade_12.png" style="margin-top:-1px;">
           </c:when>
           <c:when test="${item.m_grade eq '15'}">
            <img src="./resources/images/bg_grade_15.png" style="margin-top:-1px;">
           </c:when>
           <c:otherwise>
             <img src="./resources/images/bg_grade_18.png" style="margin-top:-1px;">
           </c:otherwise>
          </c:choose>
         </span>
         <span>${item.m_title}</span>
         </p>
        </li>
       </c:forEach>
        
        
       </ul>
      </div>
      
      <div class="last_btns">
       <button class="img_btn booking cancel" id="btnMovieCancel" type="button">취소</button>
       <button class="img_btn booking ok" id="btnMovieConfirm" type="button" onclick="send();">확인</button>
      </div>   
        
     </div>
    </div>
   </div>
 
 
 
   <jsp:include page="../main/footer.jsp"></jsp:include>
   

</body>
</html>