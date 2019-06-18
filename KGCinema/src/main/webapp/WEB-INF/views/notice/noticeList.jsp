<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../main/headLogin.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항, KG시네마</title>
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
    .mt25{margin-top:25px;}
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
    .tab_wrap{position: relative;border-bottom: 1px solid #e8e7e7;padding-bottom: 20px;}
    .customer_tab_wrap{padding: 0;border: none;}
    .nav-tabs{overflow: visible;background: url(http://image2.megabox.co.kr/mop/home/btns/bg_sm_btns.png) 0 bottom repeat-x;margin-bottom: 30px;height: 35px;
    border: none;border-bottom: 1px solid #dddddd;}
    .nav{padding-left: 0;margin-bottom: 0;list-style: none;}
    .nav-tabs>li:first-child{margin-left: 0;}
    .nav-tabs li{overflow: visible;position: relative;display: block;float: left;}
    .nav-tabs>li{margin:0;}
    .nav-tabs li:first-child.active a{border-left: 1px solid #e1e1e1;}
    .nav-tabs li.active a{margin-bottom: -1px;background-color: #fff;border-bottom: 1px solid #fff;}
    .nav-tabs>li.active>a{color: #333;cursor: default;background-color: #fff;}
    .nav-tabs li a{margin-bottom: -2px;padding: 0 25px;display: block;border: 1px solid #e1e1e1;border-bottom-color: #e1e1e1;border-left: none;
    font-size: 13px;line-height: 35px;text-align: center;min-width: 114px;height: 35px;background-color: #f9f9f9;color: #666;font-weight: 700;}
    .blind{display: block;overflow: hidden;position: absolute;top: -1000em;left: -1000em;}
    .search_wrapper{width: auto;margin: 0 auto;text-align: right;}
    .customer_search_wrapper>input[type=text], .customer_search_wrapper>button.search{height: 29px;line-height: 25px;}
    .search_wrapper>input[type=text]{width: 199px;text-indent: 10px;font-size: 14px;border-right: none;}
    .search_wrapper>input[type=text], .search_wrapper>button.search{height: 32px;line-height: 32px;color: #666;border: 1px solid #d1d1d1;background-color: #fff;
    vertical-align: middle;}
    #btnNoticeSearchMEG{height: 32px;line-height: 32px;color: #666;border: 1px solid #d1d1d1;background-color: #fff;vertical-align: middle;}
    button.search{width: 37px;font-size: 18px;border-left: none;}
    .fa{display: inline-block;font-family: FontAwesome;font-style: normal;font-weight: normal;line-height: 1;-webkit-font-smoothing: antialiased;} 
    .board_list>table{width: 100%;border-top: 2px solid #503396;border-bottom: 2px solid #d9d9d9;}
    .board_list>table th{background-color: #f8f8f8;}
    .board_list>table tr th, .board_list>table tr td{font-size: 12px;height: 38px;color: #666;border-bottom: 1px solid #d9d9d9;}
    .text-center{text-align: center}
    .text-rigth{text-align: right;}
    .custom-pagination{text-align: center}
    .custom-pagination li{display: inline-block;vertical-align: top;}
    .custom-pagination li a{display: block;border: 1px solid #ccc;padding: 0 8px;height: 25px;line-height: 25px;font-size: 12px;color: #666;vertical-align: middle;
    text-decoration: none;cursor: pointer;}
    .img_btn{overflow: hidden;text-indent: -9999px;background-repeat: no-repeat;background: transparent;}
    .img_btn.customer{background-image: url(http://image2.megabox.co.kr/mop/home/customer/bg_customer.png);}
    .custom-pagination li a.img_btn{border: none;padding: 0;width: 24px;height: 25px;}
    .custom-pagination li a.first{background-position: -300px -550px;}
    .custom-pagination li a.prev{background-position: -400px -550px;}
    .custom-pagination li a.next{background-position: -450px -550px;}
    .custom-pagination li a.last{background-position: -350px -550px;}
    
    .custom-pagination li a.active{border-color: #351F66;background-color: #503396;color: #fff;}
    .custom-pagination li a:hover{border-color: #ccc;background-color: #ccc;color: black;}
    #tx{height: 32px;line-height: 32px;color: #666;border: 1px solid #d1d1d1;background-color: #fff;vertical-align: middle;}

</style>
<script type="text/javascript">
 	function changeclear( ){
 		nform.keyword.value="";
 		nform.keyword.focus();
 	}//end
  </script>
<body>
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
     <span class="sub_title customer st03">공지사항, KGCINEMA의 최신소식을 알려드립니다.</span>
    </h2>
    
    <!-- notice start-->
    <div id="centerNoticeList" class="tab_wrap customer_tab_wrap">
     <ul class="nav nav-tabs" style="margin-bottom:20px;">
      <li class="active">
       <a>전체공지</a>
      </li>
     </ul>
     
     <div class="tab-content">
      <h3 class="blind">전체공지</h3>
      <div class="tab-pane active" id="centerNoticeListAll">
       <div class="search_wrapper customer_search_wrapper mb10">
       <form name="nform" class="mb10">
        <label class="blind">검색어 입력</label>
        <input type="hidden" name="keyfield" value="${skey}" >
        <input id="tx" type="text" title="검색어 입력" id="blind" placeholder="검색어를 입력하세요" name="keyword" maxlength="20" value="${sval}" onfocus="changeclear();">
        <input type="submit" class="search" id="btnNoticeSearchMEG" value="검색" style="width:37px;text-indent: 0px;line-height:0px;">
        </botton>
       </form> 
       </div>
       <div class="board_list">
        <table summary="공지사항 목록">
         <caption class="blind">공지사항 전체공지 목록 : NO, 지역/영화관정보, 공지제목, 게시물 등록일 정보 등을 제공하는 표</caption>
         <colgroup>
          <col width="113">
          <col width="131">
          <col>
          <col width="110">
         </colgroup>
          <thead>
           <tr>
            <th scope="col" id="th_noticelist_no" class="pl25">NO</th>
            <th scope="col" id="th_noticelist_cinema">지역/영화관</th>
            <th scope="col" id="th_noticelist_title" class="text-center">제목</th>
            <th scope="col" id="th_noticelist_create" class="text-right pr30">등록일</th>
           </tr>
          </thead>
          <tbody>
          <c:forEach var="item" items="${naver}">
           <tr>
            <td headers="th_noticelist_no" class="pl25">${item.rn}</td>
            <td headers="th_noticelist_cinema"><c:if test="${item.n_loc eq null}">전체</c:if><c:if test="${item.n_loc ne null}">${item.n_loc}</c:if></td>
            <td headers="th_noticelist_title"><a href="noticedetail.do?idx=${item.n_no}" style="color: #666;" href="#" title="공지사항 상세보기">${item.n_title}</a></td>
            <td headers="th_noticelist_create" class="text-right pr30"><fmt:formatDate value="${item.n_redate}" pattern="yyyy/MM/dd" /></td>       
           </tr>
          </c:forEach> 
          </tbody>
        </table>
       </div>
       
       <ul class="custom-pagination mt25">
       <c:if test="${startpage>10}">
        <li> 
         <a href="noticelist.do?pageNum=${pagecount-pagecount+1}" class="img_btn customer first" title="처음 페이지 보기">
          <span class="blind">처음 페이지</span>
         </a>         
        </li>
       </c:if>
        
       <c:if test="${startpage>10}">
        <li>
         <a href="noticelist.do?pageNum=${startpage-10}" class="img_btn customer prev" title="이전 10페이지 보기">
          <span class="blind">이전 10페이지</span>
         </a>         
        </li>
       </c:if> 

       
       <c:forEach var="i" begin="${startpage}" end="${endpage}">
        <c:choose>
    	  <c:when test="${i==pageNUM}"> 
    	    <li><a class="active" href="noticelist.do?pageNum=${i}${returnpage}">${i}</a></li>
    	  </c:when>
    	  <c:otherwise>
    	    <li><a href="noticelist.do?pageNum=${i}${returnpage}">${i}</a></li>
    	  </c:otherwise>
    	</c:choose>
       </c:forEach>
        
        
    
       <c:if test="${endpage<pagecount}">  
        <li>
         <a href="noticelist.do?pageNum=${startpage+10}" class="img_btn customer next" title="다음 10페이지 보기">
          <span class="blind">다음 10페이지</span>
         </a>         
        </li>
       </c:if> 
         
       <c:if test="${endpage<pagecount}">  
        <li>
         <a href="noticelist.do?pageNum=${pagecount}" class="img_btn customer last" title="마지막 페이지 보기">
          <span class="blind">마지막 페이지</span>
         </a>         
        </li>
        </c:if>    
       </ul>      
      </div>
     </div>
    </div>
    <!-- notice end -->
   </div>
   <!-- container end -->
  </div>
  <!-- main end -->
  <div class="bin"></div>
</body>
</html>