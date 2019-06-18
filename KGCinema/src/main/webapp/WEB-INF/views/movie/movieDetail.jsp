<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../main/headLogin.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>영화상세(${movie.m_title})</title>
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
    html, body {margin: 0;padding: 0;border:0;vertical-align: baseline;}
    * {box-sizing: border-box;font-family: '나눔고딕','NanumGothic','맑은 고딕','Malgun Gothic','돋움',dotum,'Apple SD Gothic Neo',sans-serif;}
    div{display:block;}
    ul, ol, dl, li, p {margin:0;padding:0;list-style: none;}
    button{font-family: inherit;font-size: inherit;line-height: inherit;}
    input{width: 200px;border: 1px solid #d9d9d9;line-height: 26px;height: 26px;background-color: #f8f8f8;font-size: 12px;color: #333;text-indent: 14px;vertical-align: middle;}
    .a{display: inline-block;width: 230px;height: 44px;margin-top: 10px;line-height: 44px;box-sizing: border-box;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;text-align: center;font-size: 16px;color: #cdc197;background: #231f20;font-weight: bold;}
    .slider {width: 50%;margin: 100px auto;}
    .slick-slide {margin: 0px 0px;}
    .slick-slide img {width: 100%;}
    .slick-prev:before,.slick-next:before {color: black;}
    .slick-slide {transition: all ease-in-out .3s;opacity: 1;}
    .slick-active {opacity: 1;}
    .slick-current {opacity: 1;}  
    .title{position: relative;min-height: 69px;border-bottom: 2px solid #e5e5e5;}
    .title h2{margin: 0;font-size: 30px;}
    .title p{margin: 8px 0;font-size: 12px;color: #666;}
    .text{position: relative;border-bottom: 2px solid #e5e5e5;padding-bottom: 19px;}
    .star{display: block;position: relative;width: 107px;height: 15px;background: url(http://image2.megabox.co.kr/mop/home/star.png) 0 0 no-repeat;}
    .fill{position: absolute;width: 107px;height: 15px;background: url(http://image2.megabox.co.kr/mop/home/star.png) 0 -15px no-repeat;}
    .left_p{position: relative;float: left;width: 181px;padding-left: 20px;color: #333;font-size: 14px;}
    .left_p span{font-size: 12px;float: left;margin-top: 20px;color: #666;}
    .divider{display: block;position: absolute;width: 1px;height: 20px;top: 10px;right: 0;margin-top: 0;background-color: #e1e1e1;}
    .right_p{position: relative;float: left;width: 181px;padding-left: 20px;color: #333;font-size: 14px;}
    .right_p strong{font-size:28px;}
    .right_p span{olor: #666;}
    .btn_reservation{position: absolute;top: 0;right: 0;width: 121px;height: 43px;padding-top: 1px;}
    .img_btn.movie{background-image: url(http://image2.megabox.co.kr/mop/home/btns/btn_movie.png);background-position: -300px -100px;}
    .img_btn{display: block;overflow: hidden;text-indent: -9999px;border: none;background-repeat: no-repeat;background: transparent;vertical-align: middle;}
    .info{margin-top: 11px;}
    .info li{color: #333;font-size: 14px;line-height: 22px;}
    .info li strong{font-weight: bold;}
    .rating{position: relative;}
    .my_rate{font-size: 12px;color: #666;padding-top: 22px;overflow: visible;white-space: nowrap;}
    .my_rate span{font-size:14px;}
    .my_rate span input{background: transparent;border: 0;width: 21px;height: 20px;margin-top:-5px;margin-left:-5px;}
    .btn_timeSchedule{width: 100px;height: 39px;float: left;margin-left: 5px;border: 1px solid #ccc;background: url(http://image2.megabox.co.kr/mop/home/btns/btn_timeSchedule.png) 50% 50% no-repeat;margin-right: 0;}
    .content{padding: 0;background: none;margin: 0 0 15px 0;font-size: 18px;color: #333;}
    .content_text{color: #666;line-height: 20px;font-size: 14px;}
    .bin{width:100%;height:50px;}
    
  </style>
</head>

  <script type="text/javascript">
  
	function bodyFunction() {
		var chDate = '${myreply.dr_point}';
		if(chDate == 1) {
			check1 = false;
			check2 = true;
			check3 = true;
			check4 = true;
			check5 = true;
		}else if(chDate == 2) {
			check1 = true;
			check2 = false;
			check3 = true;
			check4 = true;
			check5 = true;
		}else if(chDate == 3) {
			check1 = true;
			check2 = true;
			check3 = false;
			check4 = true;
			check5 = true;
		}else if(chDate == 4) {
			check1 = true;
			check2 = true;
			check3 = true;
			check4 = false;
			check5 = true;
		}else if(chDate == 5) {
			check1 = true;
			check2 = true;
			check3 = true;
			check4 = true;
			check5 = false;
		}else {
			  check1 = true;
			  check2 = true;
			  check3 = true;
			  check4 = true;
			  check5 = true;			
		}
	}
  $(document).on('ready', function() {
	  $('.lazy').slick({
		  slidesToShow: 1,
		  slidesToScroll: 1,
		  arrows: false,
		  fade: true,
	      lazyLoad: 'ondemand',
	      infinite: true,
		  asNavFor: '.center'
		});
		$('.center').slick({
		  slidesToShow: 4,
		  slidesToScroll: 1,
		  asNavFor: '.lazy',
		  dots: true,
		  centerMode: false,
		  infinite: true,
		  focusOnSelect: true
		});		
		$("#a").click(function(){
			check1 = false;
			check2 = true;
			check3 = true;
			check4 = true;
			check5 = true;
			if(check1 == false) {
	       		$("#a").attr('src', 'http://image2.megabox.co.kr/mop/home/star_mid_on.png');
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$("#aa").attr('src', 'http://image2.megabox.co.kr/mop/home/star_mid_on.png');
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$("#movieDetailStarScoreTxt").text("괜히봤어요");
	       		$(".text-center").text("괜히봤어요");
			}
	    });
		$("#aa").click(function(){
			check1 = false;
			check2 = true;
			check3 = true;
			check4 = true;
			check5 = true;
			if(check1 == false) {
	       		$("#a").attr('src', 'http://image2.megabox.co.kr/mop/home/star_mid_on.png');
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$("#aa").attr('src', 'http://image2.megabox.co.kr/mop/home/star_mid_on.png');
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$("#movieDetailStarScoreTxt").text("괜히봤어요");
	       		$(".text-center").text("괜히봤어요");
			}
	    });
		$("#a").mouseover(function(){
		    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#movieDetailStarScoreTxt").text("괜히봤어요");
		});
		$("#aa").mouseover(function(){
		    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $(".text-center").text("괜히봤어요");
		});
		
		$("#a").mouseout(function(){
			if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("평점을 입력해주세요");
			}else if(check1 == false && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("괜히봤어요");
			}else if(check1 == true && check2 == false && check3 == true && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("기대하진 말아요");
			}else if(check1 == true && check2 == true && check3 == false && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("무난했어요");
			}else if(check1 == true && check2 == true && check3 == true && check4 == false && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("기대해도 좋아요!");
			}else if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == false) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");	    
			    $("#movieDetailStarScoreTxt").text("너무 멋진 영화였어요!");
			}
		});	
		$("#aa").mouseout(function(){
			if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("평점을 입력해주세요");
			}else if(check1 == false && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("괜히봤어요");
			}else if(check1 == true && check2 == false && check3 == true && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("기대하진 말아요");
			}else if(check1 == true && check2 == true && check3 == false && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("무난했어요");
			}else if(check1 == true && check2 == true && check3 == true && check4 == false && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("기대해도 좋아요!");
			}else if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == false) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");	    
			    $(".text-center").text("너무 멋진 영화였어요!");
			}
		});
		
		
		$("#b").click(function(){
			check2 = false;
			check1 = true;
			check3 = true;
			check4 = true;
			check5 = true;
			if(check2 == false) {
				$("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$("#aa").attr('src', 'http://image2.megabox.co.kr/mop/home/star_mid_on.png');
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$(".text-center").text("기대하진 말아요");
			    $("#movieDetailStarScoreTxt").text("기대하진 말아요");
			}
	    });
		$("#bb").click(function(){
			check2 = false;
			check1 = true;
			check3 = true;
			check4 = true;
			check5 = true;
			if(check2 == false) {
				$("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$("#aa").attr('src', 'http://image2.megabox.co.kr/mop/home/star_mid_on.png');
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$(".text-center").text("기대하진 말아요");
			    $("#movieDetailStarScoreTxt").text("기대하진 말아요");
			}
	    });
		$("#b").mouseover(function(){
			$("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#movieDetailStarScoreTxt").text("기대하진 말아요");
		});
		$("#bb").mouseover(function(){
			$("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $(".text-center").text("기대하진 말아요");
		});
		$("#b").mouseout(function(){
			if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#movieDetailStarScoreTxt").text("평점을 입력해주세요");
			}else if(check1 == false && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("괜히봤어요");
			}else if(check1 == true && check2 == false && check3 == true && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("기대하진 말아요");
			}else if(check1 == true && check2 == true && check3 == false && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("무난했어요");
			}else if(check1 == true && check2 == true && check3 == true && check4 == false && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("기대해도 좋아요!");
			}else if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == false) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");	    
			    $("#movieDetailStarScoreTxt").text("너무 멋진 영화였어요!");
			}    
		});	
		$("#bb").mouseout(function(){
			if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $(".text-center").text("평점을 입력해주세요");
			}else if(check1 == false && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("괜히봤어요");
			}else if(check1 == true && check2 == false && check3 == true && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("기대하진 말아요");
			}else if(check1 == true && check2 == true && check3 == false && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("무난했어요");
			}else if(check1 == true && check2 == true && check3 == true && check4 == false && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("기대해도 좋아요!");
			}else if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == false) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");	    
			    $(".text-center").text("너무 멋진 영화였어요!");
			}    
		});	
		$("#c").click(function(){
			check3 = false;
			check1 = true;
			check2 = true;
			check4 = true;
			check5 = true;
			if(check3 == false) {
				$("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$("#aa").attr('src', 'http://image2.megabox.co.kr/mop/home/star_mid_on.png');
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$(".text-center").text("무난했어요");
			    $("#movieDetailStarScoreTxt").text("무난했어요");
			}
	    });
		$("#cc").click(function(){
			check3 = false;
			check1 = true;
			check2 = true;
			check4 = true;
			check5 = true;
			if(check3 == false) {
				$("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$("#aa").attr('src', 'http://image2.megabox.co.kr/mop/home/star_mid_on.png');
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$(".text-center").text("무난했어요");
			    $("#movieDetailStarScoreTxt").text("무난했어요");
			}
	    });		
		$("#c").mouseover(function(){
			$("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#movieDetailStarScoreTxt").text("무난했어요");
		});
		$("#cc").mouseover(function(){
			$("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $(".text-center").text("무난했어요");
		});
		$("#c").mouseout(function(){
			if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#movieDetailStarScoreTxt").text("평점을 입력해주세요");
			}else if(check1 == false && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("괜히봤어요");
			}else if(check1 == true && check2 == false && check3 == true && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("기대하진 말아요");
			}else if(check1 == true && check2 == true && check3 == false && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("무난했어요");
			}else if(check1 == true && check2 == true && check3 == true && check4 == false && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("기대해도 좋아요!");
			}else if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == false) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");	    
			    $("#movieDetailStarScoreTxt").text("너무 멋진 영화였어요!");
			}    
		});
		$("#cc").mouseout(function(){
			if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $(".text-center").text("평점을 입력해주세요");
			}else if(check1 == false && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("괜히봤어요");
			}else if(check1 == true && check2 == false && check3 == true && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("기대하진 말아요");
			}else if(check1 == true && check2 == true && check3 == false && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("무난했어요");
			}else if(check1 == true && check2 == true && check3 == true && check4 == false && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("기대해도 좋아요!");
			}else if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == false) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");	    
			    $(".text-center").text("너무 멋진 영화였어요!");
			}    
		});
		
		$("#d").click(function(){
			check4 = false;
			check1 = true;
			check2 = true;
			check3 = true;
			check5 = true;
			if(check4 == false) {
				$("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$("#aa").attr('src', 'http://image2.megabox.co.kr/mop/home/star_mid_on.png');
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$(".text-center").text("기대해도 좋아요!");
			    $("#movieDetailStarScoreTxt").text("기대해도 좋아요!");
			}
	    });		
		$("#dd").click(function(){
			check4 = false;
			check1 = true;
			check2 = true;
			check3 = true;
			check5 = true;
			if(check4 == false) {
				$("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$("#aa").attr('src', 'http://image2.megabox.co.kr/mop/home/star_mid_on.png');
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
	       		$(".text-center").text("기대해도 좋아요!");
			    $("#movieDetailStarScoreTxt").text("기대해도 좋아요!");
			}
	    });	
		$("#d").mouseover(function(){
			$("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $("#movieDetailStarScoreTxt").text("기대해도 좋아요!");
		});
		$("#dd").mouseover(function(){
			$("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
		    $(".text-center").text("기대해도 좋아요!");
		});
		$("#d").mouseout(function(){
			if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#movieDetailStarScoreTxt").text("평점을 입력해주세요");
			}else if(check1 == false && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("괜히봤어요");
			}else if(check1 == true && check2 == false && check3 == true && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("기대하진 말아요");
			}else if(check1 == true && check2 == true && check3 == false && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("무난했어요");
			}else if(check1 == true && check2 == true && check3 == true && check4 == false && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("기대해도 좋아요!");
			}else if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == false) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");	    
			    $("#movieDetailStarScoreTxt").text("너무 멋진 영화였어요!");
			}	
		});	
		$("#dd").mouseout(function(){
			if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $(".text-center").text("평점을 입력해주세요");
			}else if(check1 == false && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("괜히봤어요");
			}else if(check1 == true && check2 == false && check3 == true && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("기대하진 말아요");
			}else if(check1 == true && check2 == true && check3 == false && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("무난했어요");
			}else if(check1 == true && check2 == true && check3 == true && check4 == false && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("기대해도 좋아요!");
			}else if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == false) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");	    
			    $(".text-center").text("너무 멋진 영화였어요!");
			}	
		});	
		
		$("#e").click(function(){
			check5 = false;
			check1 = true;
			check2 = true;
			check3 = true;
			check4 = true;
			if(check5 == false) {
				$("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
	       		$("#aa").attr('src', 'http://image2.megabox.co.kr/mop/home/star_mid_on.png');
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
	       		$(".text-center").text("너무 멋진 영화였어요!");
			    $("#movieDetailStarScoreTxt").text("너무 멋진 영화였어요!");
			}
	    });
		$("#ee").click(function(){
			check5 = false;
			check1 = true;
			check2 = true;
			check3 = true;
			check4 = true;
			if(check5 == false) {
				$("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
	       		$("#aa").attr('src', 'http://image2.megabox.co.kr/mop/home/star_mid_on.png');
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
	       		$(".text-center").text("너무 멋진 영화였어요!");
			    $("#movieDetailStarScoreTxt").text("너무 멋진 영화였어요!");
			}
	    });
		$("#e").mouseover(function(){
			$("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#movieDetailStarScoreTxt").text("너무 멋진 영화였어요!");
		});
		$("#ee").mouseover(function(){
			$("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
		    $(".text-center").text("너무 멋진 영화였어요!");
		});
		$("#e").mouseout(function(){
			if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == true) {
				$("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#movieDetailStarScoreTxt").text("평점을 입력해주세요");
			}else if(check1 == false && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("괜히봤어요");
			}else if(check1 == true && check2 == false && check3 == true && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("기대하진 말아요");
			}else if(check1 == true && check2 == true && check3 == false && check4 == true && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("무난했어요");
			}else if(check1 == true && check2 == true && check3 == true && check4 == false && check5 == true) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $("#movieDetailStarScoreTxt").text("기대해도 좋아요!");
			}else if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == false) {
			    $("#a").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#b").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#c").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#d").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#e").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");	    
			    $("#movieDetailStarScoreTxt").text("너무 멋진 영화였어요!");
			}
		});	
		$("#ee").mouseout(function(){
			if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == true) {
				$("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $(".text-center").text("평점을 입력해주세요");
			}else if(check1 == false && check2 == true && check3 == true && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("괜히봤어요");
			}else if(check1 == true && check2 == false && check3 == true && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("기대하진 말아요");
			}else if(check1 == true && check2 == true && check3 == false && check4 == true && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("무난했어요");
			}else if(check1 == true && check2 == true && check3 == true && check4 == false && check5 == true) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_off.png");	    
			    $(".text-center").text("기대해도 좋아요!");
			}else if(check1 == true && check2 == true && check3 == true && check4 == true && check5 == false) {
			    $("#aa").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#bb").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#cc").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#dd").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");
			    $("#ee").attr("src", "http://image2.megabox.co.kr/mop/home/star_mid_on.png");	    
			    $(".text-center").text("너무 멋진 영화였어요!");
			}
		});	
		
	
			$(".rate_insert input").click(function() {
				var id = $(".j_id").attr("value");
				var score = this.value;
				var mno = $(".m_no").attr("value");
				var no = $(".dr_no").attr("value");
				var content = $('.dr_content').val();
				
				$.ajax({
					url:"replyinsert.do",
					data: "score="+score + "&id="+id + "&mno="+mno + "&no="+ no + "&content="+ content,
					dataType: "json",
					type: "GET",
					success: function(data){
						if(data.dr_no == null || data.dr_no == "") {
							$(".rate_insert .dr_no").attr("value", + data.no);
							$(".rate_insert #score").attr("value", + data.score);
							$(".left_p Strong").text(data.starscore);
							$(".left_p .inwon").text(data.cnt);
							if(data.starscore <= 1.0) {$(".fill").css({"width" : "10%"});}
							else if(data.starscore <= 2.0) {$(".fill").css({"width" : "20%"});}
							else if(data.starscore <=3.0) {$(".fill").css({"width" : "30%"});}
							else if(data.starscore <=4.0) {$(".fill").css({"width" : "40%"});}
							else if(data.starscore <=5.0) {$(".fill").css({"width" : "50%"});}
							else if(data.starscore <=6.0) {$(".fill").css({"width" : "60%"});}
							else if(data.starscore <=7.0) {$(".fill").css({"width" : "70%"});}
							else if(data.starscore <=8.0) {$(".fill").css({"width" : "80%"});}
							else if(data.starscore <=9.0) {$(".fill").css({"width" : "90%"});}
							else{$(".fill").css({"width" : "100%"});}
						}else {
							$(".rate_insert .dr_no").attr("value", + data.dr_no);	
							$(".rate_insert #score").attr("value", + data.dr_point);
							$(".rate_insert .dr_content").text(data.dr_content);
							$(".left_p Strong").text(data.dr_starscore);
							$(".left_p .inwon").text(data.dr_cnt);
							if(data.dr_starscore <= 1.0) {$(".fill").css({"width" : "10%"});}
							else if(data.dr_starscore <= 2.0) {$(".fill").css({"width" : "20%"});}
							else if(data.dr_starscore <=3.0) {$(".fill").css({"width" : "30%"});}
							else if(data.dr_starscore <=4.0) {$(".fill").css({"width" : "40%"});}
							else if(data.dr_starscore <=5.0) {$(".fill").css({"width" : "50%"});}
							else if(data.dr_starscore <=6.0) {$(".fill").css({"width" : "60%"});}
							else if(data.dr_starscore <=7.0) {$(".fill").css({"width" : "70%"});}
							else if(data.dr_starscore <=8.0) {$(".fill").css({"width" : "80%"});}
							else if(data.dr_starscore <=9.0) {$(".fill").css({"width" : "90%"});}
							else{$(".fill").css({"width" : "100%"});}							
						}
					},//sucess end
					error: function(data){
						alert("로그인이 필요합니다.");
						console.log(data);
					}
				
				});
			});		
			
			$(".rate_edit input").click(function() {
				var id = $(".j_id").attr("value");
				var score = this.value;
				var mno = $(".m_no").attr("value");
				var no = $(".dr_no").attr("value");
				var content = $('.dr_content').val();
				$.ajax({
					url:"replyedit.do",
					data: "score="+score + "&id="+id + "&mno="+mno + "&no="+ no + "&content="+ content,
					dataType: "json",
					type: "GET",
					success: function(data){
							$(".rate_edit .dr_no").attr("value", + data.dr_no);	
							$(".rate_edit #score").attr("value", + data.dr_point);
							$(".rate_edit .dr_content").text(data.dr_content);
							$(".left_p Strong").text(data.dr_starscore);
							$(".left_p .inwon").text(data.dr_cnt);
							if(data.dr_starscore <= 1.0) {$(".fill").css({"width" : "10%"});}
							else if(data.dr_starscore <= 2.0) {$(".fill").css({"width" : "20%"});}
							else if(data.dr_starscore <=3.0) {$(".fill").css({"width" : "30%"});}
							else if(data.dr_starscore <=4.0) {$(".fill").css({"width" : "40%"});}
							else if(data.dr_starscore <=5.0) {$(".fill").css({"width" : "50%"});}
							else if(data.dr_starscore <=6.0) {$(".fill").css({"width" : "60%"});}
							else if(data.dr_starscore <=7.0) {$(".fill").css({"width" : "70%"});}
							else if(data.dr_starscore <=8.0) {$(".fill").css({"width" : "80%"});}
							else if(data.dr_starscore <=9.0) {$(".fill").css({"width" : "90%"});}
							else{$(".fill").css({"width" : "100%"});}							
					},//sucess end
					error: function(data){
						alert("실패"+data.score+data.score);
						console.log(data);
					}
				
				});
			});	
			
			$(".rate_insert button").click(function() {
				var id = $(".j_id").attr("value");
				var score = $("#score").attr("value");
				var mno = $(".m_no").attr("value");
				var no = $(".dr_no").attr("value");
				
				
				if($('#txt').val() == null || $('#txt').val() == "" ) {
					var content = $('.dr_content').val();
					alert("내용을 입력해주세요.");
				}else {
					var content = $('#txt').val();
				}
				$.ajax({
					url:"replyinsert.do",
					data: "score="+score + "&id="+id + "&mno="+mno + "&no="+ no + "&content="+ content,
					dataType: "json",
					type: "GET",
					success: function(data){
							$(".rate_insert .dr_no").attr("value", + data.dr_no);
							$(".rate_insert #score").attr("value", + data.dr_point);
							$(".rate_insert .dr_content").text(data.dr_content);
							$("#movieCommentTotalCount").text("(" + data.dr_replycount + ")");
							$(".left_p Strong").text(data.dr_starscore);
							$(".left_p .inwon").text(data.dr_cnt);
							//$('#txt').val("");
							if(data.dr_starscore <= 1.0) {$(".fill").css({"width" : "10%"});}
							else if(data.dr_starscore <= 2.0) {$(".fill").css({"width" : "20%"});}
							else if(data.dr_starscore <=3.0) {$(".fill").css({"width" : "30%"});}
							else if(data.dr_starscore <=4.0) {$(".fill").css({"width" : "40%"});}
							else if(data.dr_starscore <=5.0) {$(".fill").css({"width" : "50%"});}
							else if(data.dr_starscore <=6.0) {$(".fill").css({"width" : "60%"});}
							else if(data.dr_starscore <=7.0) {$(".fill").css({"width" : "70%"});}
							else if(data.dr_starscore <=8.0) {$(".fill").css({"width" : "80%"});}
							else if(data.dr_starscore <=9.0) {$(".fill").css({"width" : "90%"});}
							else{$(".fill").css({"width" : "100%"});}							
							if($('#txt').val() == null || $('#txt').val() == "" ) {
								
							}else {
								location.reload();
							}
					},//sucess end
					error: function(data){
						alert("로그인이 필요합니다.");
						console.log(data);
					}
				
				});
			});	
			
			$(".rate_edit button").click(function() {
				var id = $(".j_id").attr("value");
				var score = $("#score").attr("value");
				var mno = $(".m_no").attr("value");
				var no = $(".dr_no").attr("value");
				
			
				
				if($('#txt').val() == null || $('#txt').val() == "" ) {
					var content = $('.dr_content').val();
					alert("내용을 입력해주세요.");
				}else {
					var content = $('#txt').val();
				}
				$.ajax({
					url:"replyedit.do",
					data: "score="+score + "&id="+id + "&mno="+mno + "&no="+ no + "&content="+ content,
					dataType: "json",
					type: "GET",
					success: function(data){
							$(".rate_edit .dr_no").attr("value", + data.dr_no);
							$(".rate_edit #score").attr("value", + data.dr_point);
							$(".rate_edit .dr_content").text(data.dr_content);
							$("#movieCommentTotalCount").text("(" + data.dr_replycount + ")");
							$(".left_p Strong").text(data.dr_starscore);
							$(".left_p .inwon").text(data.dr_cnt);
							//$('#txt').val("");
							if(data.dr_starscore <= 1.0) {$(".fill").css({"width" : "10%"});}
							else if(data.dr_starscore <= 2.0) {$(".fill").css({"width" : "20%"});}
							else if(data.dr_starscore <=3.0) {$(".fill").css({"width" : "30%"});}
							else if(data.dr_starscore <=4.0) {$(".fill").css({"width" : "40%"});}
							else if(data.dr_starscore <=5.0) {$(".fill").css({"width" : "50%"});}
							else if(data.dr_starscore <=6.0) {$(".fill").css({"width" : "60%"});}
							else if(data.dr_starscore <=7.0) {$(".fill").css({"width" : "70%"});}
							else if(data.dr_starscore <=8.0) {$(".fill").css({"width" : "80%"});}
							else if(data.dr_starscore <=9.0) {$(".fill").css({"width" : "90%"});}
							else{$(".fill").css({"width" : "100%"});}
							if($('#txt').val() == null || $('#txt').val() == "" ) {
								
							}else {
								location.reload();
							}
					},//sucess end
					error: function(data){
						alert("실패"+data.score+data.score);
						console.log(data);
					}
				});
			});			
			
			var get = $(".row").children(".cell").length;
			
			$(".cell .btn_wrap .btn_delete").click(function() {
				var dr_no = this.value;
				alert("삭제완료");
				$.ajax({
					url:"replydelete.do",
					data: "dr_no="+dr_no,
					dataType: "json",
					type: "GET",
					success: function(data){
						location.reload();
					},//sucess end
					error: function(data){
						alert("실패");
						console.log(data);
					}
				
				});
			});				
  });
  
  
  </script>
<body onload="bodyFunction();">
  <header style="background-color:#231f20;min-width: 980px;padding:10px;">
   <div class="lazy slider" data-sizes="50vw">
    <div>
      <img data-lazy="<%=request.getContextPath()%>/resources/storage/${movie.m_steal1}">
    </div>
    <div>
      <img data-lazy="<%=request.getContextPath()%>/resources/storage/${movie.m_steal2}">
    </div>
    <div>
      <img data-lazy="<%=request.getContextPath()%>/resources/storage/${movie.m_steal3}">
    </div>
    <div>
      <img data-lazy="<%=request.getContextPath()%>/resources/storage/${movie.m_steal4}">
    </div>
    <div>
      <img data-lazy="<%=request.getContextPath()%>/resources/storage/${movie.m_steal5}">
    </div>
   </div> 
  </header>

<div style="width:1680px;min-width: 980px;margin:0 auto;">
  <section class="py-5">
   <div><p style="text-align:center;font-weight:bold;color:#231f20;font-size:22px;">트레일러·스틸컷</p></div>
   <div class="center slider">
    <div>
      <img src="<%=request.getContextPath()%>/resources/storage/${movie.m_steal1}" width="120" height="100">
    </div>
    <div>
      <img src="<%=request.getContextPath()%>/resources/storage/${movie.m_steal2}" width="120" height="100">
    </div>
    <div>
      <img src="<%=request.getContextPath()%>/resources/storage/${movie.m_steal3}" width="120" height="100">
    </div>
    <div>
      <img src="<%=request.getContextPath()%>/resources/storage/${movie.m_steal4}" width="120" height="100">
    </div>
    <div>
      <img src="<%=request.getContextPath()%>/resources/storage/${movie.m_steal5}" width="120" height="100">
    </div>
   </div>
  </section>
  
  <div style="width:800px;padding: 30px 0 50px;margin:0 auto;">
   <div style="height:396px;">
   
    <div class="left" style="float: left;width: 230px;margin-right: 25px;">
     <span style="position: relative;display: block;width: 230px;height: 336px;"><img src="<%=request.getContextPath()%>/resources/storage/${movie.m_poster}" style="width:230px;height:336px;"></span>
    </div>
    
    <div class="right" style="float: right;width: 545px;">
    
     <div class="title" style="overflow: visible;">
      <h2>
       <sapn>${movie.m_title}</sapn>
       <p style="padding-left:3px;">${movie.m_subtitle}</p>
      </h2>
     </div>
     
     <div class="text">
      <div style="overflow: hidden;margin-top: 9px;">
       <span class="star" style="position: absolute;top: 2px;left: -3px;">
        <c:choose>
         <c:when test="${movie.m_point le null || not empty ''}">
          <span class="fill" style="width: 0%;"></span>
         </c:when>
         <c:when test="${movie.m_point <= 1.0}">
          <span class="fill" style="width: 10%;"></span>
         </c:when>
         <c:when test="${movie.m_point <= 2.0}">
          <span class="fill" style="width: 20%;"></span>
         </c:when>
         <c:when test="${movie.m_point <= 3.0}">
          <span class="fill" style="width: 30%;"></span>
         </c:when> 
         <c:when test="${movie.m_point <= 4.0}">
          <span class="fill" style="width: 40%;"></span>
         </c:when>          
         <c:when test="${movie.m_point <= 5.0}">
          <span class="fill" style="width: 50%;"></span>
         </c:when>  
         <c:when test="${movie.m_point <= 6.0}">
          <span class="fill" style="width: 60%;"></span>
         </c:when>  
         <c:when test="${movie.m_point <= 7.0}">
          <span class="fill" style="width: 70%;"></span>
         </c:when>  
         <c:when test="${movie.m_point <= 8.0}">
          <span class="fill" style="width: 80%;"></span>
         </c:when>  
         <c:when test="${movie.m_point <= 9.0 || movie.m_point == 9.0}">
          <span class="fill" style="width: 90%;"></span>
         </c:when>  
         <c:otherwise>
          <span class="fill" style="width: 100%;"></span>
         </c:otherwise>           
        </c:choose>
       </span>      
       <p class="left_p" style="text-align: right;padding-right: 20px;padding-left: 0;">
        <span class="inwon">${inwon}</span>
        <span>명 참여</span>
        <strong style="font-size:28px;">${movie.m_point}</strong>
        <span class="divider"></span>
       </p>     
       <p class="right_p">
              예매율<strong> 2 </strong>위<span></span>
       </p>    
       <a class="img_btn movie btn_reservation" href="reserveMovie.do?no=${movie.m_no}">예매하기</a>       
      </div>     
      <ul class="info">
       <li><strong>타입</strong> : ${movie.m_type}</li>
       <li><strong>개봉일</strong> : <fmt:formatDate pattern="yyyy.MM.dd" value="${movie.m_premiere}" /></li>  
       <li><strong>감독</strong> : ${movie.m_director}</li>
       <li><strong>출연진</strong> : ${movie.m_actor}</li>
       <li><strong>장르</strong> : ${movie.m_genre}</li>
      </ul>  
     </div>
     
     <div class="rating">
      <c:choose>
 	   <c:when test="${myreply.dr_id eq '' || empty myreply.dr_id}"> 
 	    <div class="my_rate rate_insert">
         <span style="font-size: 12px;margin-right:5px;">내 평점</span>
         <span style="min-width: 119px; cursor: pointer; width: 119px;">
          <input class="dr_no" type="hidden" value="">
          <input class="j_id" type="hidden" value="${bean.j_id}">
          <input class="m_no" type="hidden" value="${movie.m_no}">
          <input type="hidden" id="score" value="">
          <textarea style="display:none;" class="dr_content"></textarea>
          <c:choose>
 	       <c:when test="${myreply.dr_point eq '' || empty myreply.dr_point}">
	          <input id="a" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점1 괜히봤어요" value="1">
	          <input id="b" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점2 기대하진 말아요" value="2">
	          <input id="c" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점3 무난했어요" value="3">
	          <input id="d" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
	          <input id="e" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
	          <input type="hidden" name="score">
	       </c:when>          
 	       <c:when test="${myreply.dr_point eq 1}">
	          <input id="a" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
	          <input id="b" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점2 기대하진 말아요" value="2">
	          <input id="c" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점3 무난했어요" value="3">
	          <input id="d" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
	          <input id="e" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
	          <input type="hidden" name="score">
	       </c:when>
 	       <c:when test="${myreply.dr_point eq 2}">
	          <input id="a" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
	          <input id="b" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
	          <input id="c" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점3 무난했어요" value="3">
	          <input id="d" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
	          <input id="e" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
	          <input type="hidden" name="score">
	       </c:when>
 	       <c:when test="${myreply.dr_point eq 3}">
	          <input id="a" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
	          <input id="b" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
	          <input id="c" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점3 무난했어요" value="3">
	          <input id="d" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
	          <input id="e" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
	          <input type="hidden" name="score">
	       </c:when>
 	       <c:when test="${myreply.dr_point eq 4}">
	          <input id="a" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
	          <input id="b" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
	          <input id="c" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점3 무난했어요" value="3">
	          <input id="d" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점4 기대해도 좋아요!" value="4">
	          <input id="e" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
	          <input type="hidden" name="score">
	       </c:when>	
 	       <c:otherwise>
	          <input id="a" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
	          <input id="b" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
	          <input id="c" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점3 무난했어요" value="3">
	          <input id="d" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점4 기대해도 좋아요!" value="4">
	          <input id="e" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점5 너무 멋진 영화였어요!" value="5">
	          <input type="hidden" name="score">
	       </c:otherwise>              	       	       
	       </c:choose>   
       </c:when>
       <c:otherwise>
        <div class="my_rate rate_edit">
         <span style="font-size: 12px;margin-right:5px;">내 평점</span>
         <span style="min-width: 119px; cursor: pointer; width: 119px;">
          <input class="dr_no" type="hidden" value="${myreply.dr_no}">
          <input class="j_id" type="hidden" value="${bean.j_id}">
          <input class="m_no" type="hidden" value="${movie.m_no}">
          <input type="hidden" id="score" value="${myreply.dr_point}">
          <textarea style="display:none;" class="dr_content">${myreply.dr_content}</textarea>
          <c:choose>
 	       <c:when test="${myreply.dr_point eq '' || empty myreply.dr_point}">
	          <input id="a" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점1 괜히봤어요" value="1">
	          <input id="b" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점2 기대하진 말아요" value="2">
	          <input id="c" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점3 무난했어요" value="3">
	          <input id="d" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
	          <input id="e" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
	          <input type="hidden" name="score">
	       </c:when>          
 	       <c:when test="${myreply.dr_point eq 1}">
	          <input id="a" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
	          <input id="b" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점2 기대하진 말아요" value="2">
	          <input id="c" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점3 무난했어요" value="3">
	          <input id="d" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
	          <input id="e" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
	          <input type="hidden" name="score">
	       </c:when>
 	       <c:when test="${myreply.dr_point eq 2}">
	          <input id="a" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
	          <input id="b" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
	          <input id="c" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점3 무난했어요" value="3">
	          <input id="d" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
	          <input id="e" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
	          <input type="hidden" name="score">
	       </c:when>
 	       <c:when test="${myreply.dr_point eq 3}">
	          <input id="a" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
	          <input id="b" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
	          <input id="c" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점3 무난했어요" value="3">
	          <input id="d" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
	          <input id="e" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
	          <input type="hidden" name="score">
	       </c:when>
 	       <c:when test="${myreply.dr_point eq 4}">
	          <input id="a" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
	          <input id="b" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
	          <input id="c" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점3 무난했어요" value="3">
	          <input id="d" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점4 기대해도 좋아요!" value="4">
	          <input id="e" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
	          <input type="hidden" name="score">
	       </c:when>	
 	       <c:otherwise>
	          <input id="a" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
	          <input id="b" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
	          <input id="c" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점3 무난했어요" value="3">
	          <input id="d" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점4 기대해도 좋아요!" value="4">
	          <input id="e" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점5 너무 멋진 영화였어요!" value="5">
	          <input type="hidden" name="score">
	       </c:otherwise>              	       	       
	       </c:choose>
       </c:otherwise> 
      </c:choose>
       </span>
       <span id="movieDetailStarScoreTxt" style="display: inline-block;vertical-align: text-bottom;font-size: 12px;line-height:-10px;">평점을 입력해주세요</span>
      </div>  
     </div>     
    </div>
   </div>
    
   <div style="margin-bottom: 60px;">
    <h3 class="content">줄거리</h3>
    <div class="content_text">
     ${movie.m_story}
    </div>
   </div>
   <c:import url="/replylist.do" />
  </div>
  
 </div> <!-- 마지막 DIV -->
    



</body>
</html>