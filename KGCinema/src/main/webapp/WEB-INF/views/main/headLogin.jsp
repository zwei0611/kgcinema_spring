<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="shortcut icon" href="./resources/images/favicon1.ico" />
	
    <link href="./resources/vendor/bootstrap/css/bootstrap2.min.css" rel="stylesheet">
    <script src="./resources/js/jquery.magnific-popup.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="./resources/vendor/jquery/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="./resources/vendor/bootstrap/js/bootstrap.bundle2.min.js"></script>
    <script src="./resources/js/agency.min.js"></script>
    <script src="./resources/js/Head.js"></script>
    <link href="./resources/vendor/bootstrap/css/bootstrap2.min.css" rel="stylesheet">
    <link href="./resources/css/agency2.min.css" rel="stylesheet">
</head>
  <style>
   div{display: block;}
   ul, ol, dl, li, p{padding: 0;margin: 0;list-style: none;}
   .w{width:100px;text-align:center;}
   .member_info{width: 150px;position: absolute;right: 0;top: 0;height: 49px;border-right: 1px solid #c6c6c6;}
   .photo{float: left;position: relative;margin: 6px 0 0 13px;width:37px;height:37px;}
   .photo img{width: 37px;height: 37px;border-radius: 20px;}
   .img{vertical-align: middle;}
   .icon{display: inline-block;overflow: hidden;margin: 0;padding: 0;border: 0;background-color: transparent;background-position: 50% 50%;background-repeat: no-repeat;font-size: 0;line-height: 0;text-decoration: none;vertical-align: middle;text-indent: -1000em;}
   .icon.member_icon{position: absolute;left: 50%;bottom: 0;width: 30px;height: 14px;background: url(http://image2.megabox.co.kr/mop/home/common/normal.png);}
   .member_info .name{width: 75px;float: left;margin-left: 14px;}
   .member_info .name a.name_btn{position: relative;top: 2px;left: 0;margin-top: 7px;display: block;font-size: 12px;color: #000;opacity: .6;filter: alpha(opacity=60);text-decoration: none;}
   .member_info .name a.name_btn span.name_arrow{position: absolute;top: 0;right: 0;}
   .fa{display: inline-block;font-family: FontAwesome;font-style: normal;font-weight: normal;line-height: 1;-webkit-font-smoothing: antialiased;}
   .member_info .name .name_membership{overflow: hidden;font-size: 12px;white-space: nowrap;}
   .login_info_form{position: absolute;top: 0px;right: 0;width: 301px;-webkit-border-radius: 5px;-moz-border-radius: 5px;-ms-border-radius: 5px;-o-border-radius: 5px;border-radius: 5px;
   -webkit-box-shadow: 0 5px 6px rgba(0,0,0,0.5);-moz-box-shadow: 0 5px 6px rgba(0,0,0,0.5);box-shadow: 0 5px 6px rgba(0,0,0,0.5);background-color: #fff;z-index: 1000;}
   .login_info_top{padding: 16px 15px;height:52px;}
   .login_info_top>.login_info_title{margin: -16px -15px 0;padding: 10px 15px;font-size: 14px;line-height: 20px;overflow: hidden;vertical-align: bottom;border-bottom: 1px solid #e5e5e5;}
   .login_info_top>.login_info_title p{float: left;color: #333;vertical-align: top;padding:0;margin:0;}
   .login_info_top>.login_info_title p strong{font-size: 18px;}
   .login_info_middle{height: 116px;border-bottom: 1px solid #e5e5e5;}
   .login_info_middle_center{padding: 0 18px;text-align: center;}
   .login_info_middle_center li{float:left;}
   .login_info_middle_center li a{display: block;position: relative;height: 72px;width: 76px;margin: 20px 6px;background: url(./resources/images/login_middle_icon.png) no-repeat;}
   .login_info_middle_center li .item2{background-position: -101px center;}
   .login_info_middle_center li .item3{background-position: -204px center;}
   .login_info_bottom{width: 301px;height: 80px;}
   .login_info_box_close{position: absolute;top: 10px;right: 10px;width: 20px;height: 20px;background: url(http://image2.megabox.co.kr/mop/home/btns/btn_close.png) 0 0 no-repeat;overflow: hidden;text-indent: -999px;}
   .login_info_bottom2{height: 35px;overflow: hidden;padding: 12px 15px;background-color: #f2f2f2;clear: both;text-align: center;}
   .login_info_bottom2 a{display: inline-block;zoom: 1;width: 100px;height: 23px;line-height: 20px;border: 1px solid #c1c1c1;background-color: #fff;text-align: center;color: #666;font-size: 12px;
    vertical-align: top;margin-top: -6px;}
   .login_info_bottom2 a:hover{color:black;}
    
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
   .custom_alert{background-color: #fff;position: absolute;display: inline-block;zoom: 1;width: 450px;z-index: 10030;-webkit-border-radius: 5px;-moz-border-radius: 5px;-ms-border-radius: 5px;-o-border-radius: 5px;
    border-radius: 5px;-webkit-box-shadow: 0 0 10px rgba(0,0,0,0.5);-moz-box-shadow: 0 0 10px rgba(0,0,0,0.5);box-shadow: 0 0 10px rgba(0,0,0,0.5);}
   .custom_alert .ca_header{position: relative;padding-top: 12px;height: 42px;text-align: center;border-bottom: 1px solid #e5e5e5;}
   .custom_alert .ca_header h6{margin: 0; font-size: 18px;}
   .custom_alert .ca_body{padding: 30px 20px 15px;text-align: center;font-size: 13px;line-height: 26px;}
   .custom_alert .ca_footer{padding: 20px;text-align: center;color: #e1e1e1;}
   .img_btn{display: block;overflow: hidden;text-indent: -9999px;border: none;background-repeat: no-repeat;background: transparent;vertical-align: middle;}
   .img_btn.booking{background-image: url(http://image2.megabox.co.kr/mop/home/btns/btn_booking.png);}
   .custom_alert .ca_footer button{margin: 0 5px;display: inline-block;width: 68px;height: 30px;}
   .custom_alert .ca_footer button.ok{background-position: -80px 0;}
   
   .custom_alert .btn_ca_close{width: 17px;height: 17px;position: absolute;top: 12px;right: 16px;background-position: -510px -460px;}

  </style>
<body>

  <c:choose>
   <c:when test="${bean.j_id le '' || not empty bean.j_id}">
    <!-- head login -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color:white;height:50px;border-bottom: 1px solid #D5D5D5;">
      <div class="container" style="width:970px;padding-left:0px;padding-right:0px;position: relative;">
        <a class="navbar-brand js-scroll-trigger" href="main.do" style="font-weight:bold;">KG CINEMA</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item w" style="border-left:1px solid #c6c6c6;">
              <a class="nav-link js-scroll-trigger" href="movielist.do">영화</a>
            </li>
            <li class="nav-item w" style="border-left:1px solid #c6c6c6;border-right:1px solid #c6c6c6;">
              <a class="nav-link js-scroll-trigger" href="noticelist.do">공지사항</a>
            </li>            
            <li class="nav-item w" style="border-right:1px solid #c6c6c6;">
              <a class="nav-link js-scroll-trigger" href="eventlist.do">이벤트</a>
            </li>
            <li class="nav-item w" style="border-right:1px solid #c6c6c6;width:150px;height:49px;">
              <a class="nav-link js-scroll-trigger" href="#about"></a>
            </li>
          </ul>
        </div>
         <div class="member_info remove_loginInfo hidden">
          <div class="photo">
           <img src="http://image2.megabox.co.kr/mop/home/user/bg_myphoto.png" alt="프로필사진배경" style="position: absolute;left: 0;top: 0;">
           <c:choose>
            <c:when test="${bean.j_file1 eq '' || empty bean.j_file1}">
             <img src="http://image2.megabox.co.kr/mop/home/user/profile_m.png" alt='프로필사진' style='position: absolute;left: 0;top: 0;'>
            </c:when>
            <c:otherwise>
             <img src="${pageContext.request.contextPath}/resources/storage/${bean.j_file1}" alt='프로필사진' style='position: absolute;left: 0;top: 0;'>
            </c:otherwise>
           </c:choose>
           <i class="icon member_icon normal">일반</i>
          </div>
          <div class="name">
           <a href="#my" class="name_btn">
            <strong>${bean.j_name}<span>님</span></strong>
            <span class="name_arrow" style="width:12px;height:17px;"><i class="fa fa-chevron-down" style="width:12px;height:12px;">▼</i></span>
           </a>
           <a class="name_membership" href="reservdetails.do" style="color:#198591;">예매확인/취소</a>
          </div>
        </div>
      </div>
    </nav>
    
       <div class="login_info_hidden" style="width:970px;height:600px;position:fixed;left:50%;margin-left:-485px;display:none;z-index:999;top:50px;">
        <div class="login_info_form">
         <div class="login_info_top">
          <div class="login_info_title">
           <p><strong>${bean.j_id}</strong> 님</p>
          </div>
         </div>
         <div class="login_info_middle">
          <ul class="login_info_middle_center">
           <li><a class="item1" href="mypage.do"></a></li>
           <li><a class="item2" href="reservdetails.do"></a></li>
           <c:if test="${bean.j_id eq 'admin' }">
           		<li><a class="item3" href="msmglist.do"></a></li>
           </c:if>
          </ul>
         </div>
         <div class="login_info_bottom">
           <a><img src="http://mlink-cdn.netinsight.co.kr/2018/03/29/eedd0949a87336fff8bc0d345e2c6bff.jpg" width="301" height="80" border="0"></a>     
          <a class="login_info_box_close" title="닫기" style="cursor:pointer">닫기</a>
         </div>  
         <div class="login_info_bottom2">
          <a href="logout.do">로그아웃</a>
         </div>   
        </div>   
       </div> 
       
       
       <script type="text/javascript">
        $(document).on('ready', function() {     
          $(".hidden").click(function(){
          $(".login_info_hidden").css({'display' : 'block'});
          });
        $(".login_info_box_close").click(function(){
          $(".login_info_hidden").css({'display' : 'none'});
          });
        });
      </script>            
    <!-- head login end-->      
      </c:when>
      
     <c:otherwise>  
    <!-- head logout -->   
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color:white;height:50px;border-bottom: 1px solid #D5D5D5;">
      <div class="container" style="width:970px;padding-left:0px;padding-right:0px;">
        <a class="navbar-brand js-scroll-trigger" href="main.do" style="font-weight:bold;">KG CINEMA</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item w" style="border-left:1px solid #c6c6c6;">
              <a class="nav-link js-scroll-trigger" href="movielist.do">영화</a>
            </li>
            <li class="nav-item w" style="border-left:1px solid #c6c6c6;border-right:1px solid #c6c6c6;">
              <a class="nav-link js-scroll-trigger" href="noticelist.do">공지사항</a>
            </li>            
            <li class="nav-item w" style="border-right:1px solid #c6c6c6;">
              <a class="nav-link js-scroll-trigger" href="eventlist.do">이벤트</a>
            </li>
            <li class="nav-item w">
              <a class="nav-link js-scroll-trigger hidden" href="#login" style="border-right:1px solid #D5D5D5;">로그인</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    
        
        <div class="login_hidden" style="width:970px;height:600px;position:fixed;left:50%;margin-left:-485px;display:none;z-index:999;top:50px;">
      
        
        <div class="login_form" style="height: auto;width: 380px;box-shadow: 0 5px 6px rgba(0,0,0,0.5);background-color: #fff;border-radius: 5px;z-index: 1000;top: 0px;right: 0;position: absolute;">
         <sapn style="display: block;height: 50px;"></sapn>
         <div class="login_middle" style="padding: 0 33px 0 36px;">
         <form name="loginForm" method="post" action="login.do">
          <div>
           <h4 style="background: url(http://image2.megabox.co.kr/mop/home/btns/socialLogin_bg.png) 0 -8px no-repeat;height: 17px;padding-left: 75px;font-size: 16px;font-weight: 500;margin: 0 0 10px 0;">
            <sapn style="display: block;overflow: hidden;position: absolute;top: -1000em;left: -1000em;font-size: 16px;font-weight: 500;">KGCINEMA</sapn>로그인
           </h4>
           <div style="position: relative;padding-right: 76px;">
            <input class="id" type="text" id="userid" name="userid" placeholder="아이디" title="아이디입력" maxlength="20">
            <input class="pw" type="password" id="userpw" name="userpw" placeholder="비밀번호" title="비밀번호입력" maxlength="20">
            <p style="font-size: 11px;margin: 13px 0;position: relative;color: #503396;">
             <span style="position:relative;float:left;">
              <label style="position: relative;z-index:9;font-size: 12px;font-weight: normal;color: #666;margin-bottom: 0;margin-right:5px;">아이디저장</label>
              <span style="vertical-align: middle;display: inline-block;width: 18px;height: 18px;position: relative;">
               <input class="chek" type="checkbox" name="keepLogin" title="아이디저장">
               <!--<ins class="chek_ins" style="position: absolute;width: 16px;height: 16px;top: 0px;left: 0px;background-color: #fff;z-index: 0;"></ins>-->
              </span>
             </span>
            </p>
             <input type="submit" id="btnlogin" value="로그인" title="로그인" class="img_login" style="background-image: url(http://image2.megabox.co.kr/mop/home/btns/btn_member.png);">
           </div>
          </div>
          </form>
          
          <div class="orline" style="border-top: 1px solid #f2f2f2;margin: 50px 0 20px;">
           <span style="width: 28px;height: 28px;display: block;margin: -15px 142px 0;text-indent: 9999px;background: url(http://image2.megabox.co.kr/mop/home/btns/socialLogin_bg.png) 0 -80px no-repeat;">or</span>
          </div>         
         </div>
         
         <div class="join_btn" >
          <ul>
           <li><a>ID/PW찾기</a></li>
           <li><a href="write.do">회원가입</a></li>
          </ul>
         </div>
         
         <div class="login_bottom">
          <div>
           <a><img src="http://mlink-cdn.netinsight.co.kr/2018/03/29/eedd0949a87336fff8bc0d345e2c6bff.jpg" height="80" border="0"></a>
          </div>
         
          <a class="login_box_close" title="닫기" style="cursor:pointer">닫기</a>
         </div>       
        </div>   
       </div> 
                  
       <script type="text/javascript">
        $(document).on('ready', function() {     
          $(".hidden").click(function(){
          $(".login_hidden").css({'display' : 'block'});
          });
        $(".login_box_close").click(function(){
          $(".login_hidden").css({'display' : 'none'});
          });
        });

       </script>                   
    <!-- head logout end -->         
     </c:otherwise>
    </c:choose>       
    
</body>
</html>