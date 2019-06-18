<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../main/headLogin.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항상세, KG시네마</title>
    <link href="./resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="./resources/vendor/bootstrap/js/bootstrap.bundle2.min.js"></script>
    <script src="./resources/js/agency.min.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <link href="./resources/vendor/bootstrap/css/bootstrap2.min.css" rel="stylesheet">
    <link href="./resources/css/agency.min.css" rel="stylesheet">
</head>
<style>
    html, body {margin: 0;padding: 0;border:0;vertical-align: baseline;}
    * {box-sizing: border-box;font-family: '나눔고딕','NanumGothic','맑은 고딕','Malgun Gothic','돋움',dotum,'Apple SD Gothic Neo',sans-serif;}
    div{display:block;}
    table{border-collapse: collapse;border-spacing: 0;max-width: 100%;}
    tbody{display: table-row-group;vertical-align: middle;border-color: inherit;}
    th{text-align: left;}
    h3{margin: 0;}
    ul, ol, dl, li, p {margin:0;padding:0;list-style: none;}
    img{vertical-align: middle;border:0;}
    button{font-family: inherit;font-size: inherit;line-height: inherit;} 
    input{width: 200px;border: 1px solid #d9d9d9;line-height: 26px;height: 26px;background-color: #f8f8f8;font-size: 12px;color: #333;text-indent: 14px;vertical-align: middle;}
    th{text-align: left;}
    .a{display: inline-block;width: 230px;height: 44px;margin-top: 10px;line-height: 44px;box-sizing: border-box;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;text-align: center;font-size: 16px;color: #cdc197;background: #231f20;font-weight: bold;}
    .bin{width:100%;height:50px;}
    .mb10{margin-bottom: 10px;}   
    .m15{margin-left: 5px;}
    .mr6{margin-right: 6px;}    
    .mr8{margin-right: 8px;}
    .mr2{margin-right: 2px;}
    .ml2{margin-left: 2px;}
    .mt{margin-top: 50px;}
    .mr7{margin-right: 7px;}
    .mt10{margin-top:10px;}
    .mt25{margin-top:25px;}
    .mt40{margin-top: 40px;}
    .ml{margin-left: 7px;}
    .mb30{margin-bottom: 30px;}
    .mb20{margin-bottom: 20px;}
    .pl25{padding-left: 25px;}
    .pr30{padding-right: 30px;}
    .sub_navi{background-color: #f2f2f2;border-top: 1px solid #e1e1e1;border-bottom: 3px solid #503396;}
    .sub_navi_wrap{position: relative;width: 970px;margin: 0 auto;}
    .sub_navi ul li:last-child{margin-right: 0;}
    .sub_navi ul li{position: relative;float: left;}
    .sub_navi ul li a{display: block;overflow: hidden;text-indent: -9999px;width: 60px;height: 50px;}
    .sub_navi ul li a.mypage{background: url(http://image2.megabox.co.kr/mop/home/btns/btn_sub_menu_center.png) no-repeat;}
    .sub_navi ul li a.mypage.sm01{background-position: left center;}
    #container{position: relative;margin-top: 38px;margin-bottom: 85px;}
    .width-fixed{width: 970px;max-width: 970px;min-width: 970px;margin-left: auto;margin-right: auto;}
    h2>.sub_title{display: block;overflow: hidden;font-size: 20px;width: 100%;}
    h2>.sub_title.customer.st03{background-position: 0 -100px;}
    .board_view>table{width: 100%;border-top: 2px solid #503396;border-collapse: separate;}
    .blind2{width: 0;height: 0;overflow: hidden;font-size: 0;}
    .board_view>table tr th, .board_view>table tr td{font-size: 12px;height: 38px;color: #333;border-bottom: 1px solid #dcdcdc;padding-left: 26px;padding-right: 29px;}
    .board_view>table tr th{font-size: 13px;color: #666;background-color: #f2f2f2;}
    .c_purple{color: #503396;}
    .board_view div.contents{padding: 30px 50px 120px 110px;margin-bottom: 20px;border-bottom: 1px solid #d9d9d9;}
    .img_btn{display: block;overflow: hidden;text-indent: -9999px;border: none;background-repeat: no-repeat;background: transparent;vertical-align: middle;}
    .img_btn.mypage{background-image: url(http://image2.megabox.co.kr/mop/home/mypage/bg_mypage_160114.png);}
    .img_btn.mypage.board_list{display: inline-block;width: 60px;height: 22px;background-position: -500px -500px;}
    .pull-left{float:left;}
    .board_list_next_prev{margin-top: 22px;border-top: 2px solid #dcdcdc;}
    .board_list_next_prev li{height: 40px;line-height: 40px;overflow: hidden;border-bottom: 1px solid #dcdcdc;}
    .board_list_next_prev li span, .board_list_next_prev li i, .board_list_next_prev li a{font-size: 12px;display: block;float: left;height: 40px;line-height: 40px;
    color: #666;}
    .board_list_next_prev li span{font-weight: 700;width: 84px;text-align: center;font-size: 13px;}
    .board_list_next_prev li a{margin-left: 135px;text-decoration: none;color: #333;}

</style>
<body>

<%
    pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%> 
  <div class="bin"></div>
  
  <!-- main start -->
  <div>
  <!-- sub menu start -->
   <div class="sub_navi">
    <div class="sub_navi_wrap">
     <ul class="clearfix">
      <li>
       <a class="mypage sm01">고객센터</a>
      </li>
     </ul>
    </div>
   </div>
   <!-- sub menu end -->
   
   <!-- container start -->
   <div id="container" class="width-fixed">
    <h2 class="mb30">
     <span class="sub_title customer st03 mb30">공지사항, KGCINEMA의 최신소식을 알려드립니다.</span>
    </h2>
    <div id="centerNoticeDetail">
     <div class="board_view mt40">
      <table summary="공지사항 메가박스의 최신소식">
       <caption class="blind2">공지사항:제목, 영화관, 등록일 등의 정보를 제공하는 표</caption>
       <colgroup>
        <col width="200">
        <col width="285">
        <col width="200">
        <col>
       </colgroup>
       <tbody>
        <tr>
         <th scope="row" id="th_noticedetail_title">제목</th>
         <td headers="th_noticedetail_title" colspan="3">
          <strong class="c_purple">${fn:replace(notice.n_title,br,cn)}</strong>
         </td>
        </tr>
        <tr>
         <th scope="row" id="th_noticedetail_cinema">영화관</th>
         <td headers="th_noticedetail_cinema">${notice.n_loc}</td>
         <th scope="row" id="th_noticedetail_createdate">등록일</th>
         <td headers="th_noticedetail_createdate"><fmt:formatDate value="${notice.n_redate}" pattern="yyyy/MM/dd" /></td>
        </tr>
       </tbody>
      </table>
      <div class="contents">
       ${fn:replace(notice.n_content,br,cn)}
      </div>
     </div>
     <div class="clearfix mt10">
      <a class="img_btn mypage board_list pull-left" href="noticelist.do?pageNum=${returnpage}">목록</a>
     </div>
     <ul class="board_list_next_prev">
      <li class="prev">
       <span>이전</span>
       <i class="fa fa-chevron-up">▲</i>
       <a href="noticedetail.do?idx=${item.n_no}" title="공지사항 상세보기">${fn:replace(notice.n_title,br,cn)}</a>
      </li>
      <li class="next">
       <span>다음</span>
       <i class="fa fa-chevron-down">▼</i>
       <a href="noticedetail.do?idx=${item.n_no}" title="공지사항 상세보기">${fn:replace(notice.n_title,br,cn)}</a>
      </li>
     </ul>
    </div>
   </div>
   <!-- container end -->
  </div>
  <!-- main end -->
</body>
</html>