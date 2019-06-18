<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/headLogin.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정, KG시네마</title>
<script src="./resources/js/ChangePassword.js"></script>
<style type="text/css">
	element.style {
	    position: relative;
	}
	
	.width-fixed {
	    width: 970px;
	    max-width: 970px;
	    min-width: 970px;
	    margin-left: auto;
	    margin-right: auto;
	}
	
	.form-style .form-table td {
	    padding-left: 30px;
	}
	
	.form-style .form-table th, .form-style .form-table td {
    	border-top: 1px solid #dcdcdc;
    	padding: 5px;
	}
	
	td, th {
    	display: table-cell;
    	vertical-align: inherit;
	}
	
	div {
	    display: block;
	}

	#container {
	    position: relative;
	    margin-top: 38px;
	    margin-bottom: 85px;
	}

	.h2_mypage {
    	position: relative;
    	margin-bottom: 27px;
	}
	*, *:before, *:after {
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    box-sizing: border-box;
	}
	body {
    	font-size: 14px;
    	line-height: 1.42857143;
    	color: #333;
    	background-color: #fff;
    	margin: 49px 0 0 0;
    	padding: 0;
	}
	
	html, body {
    	height: 100%;
    	font-family: 'NanumGothic','나눔고딕','맑은 고딕','Malgun Gothic','돋움',dotum,'Apple SD Gothic Neo',sans-serif;
	}
	
	.form-style .form-table {
    border-top: 2px solid #503396;
    border-bottom: 2px solid #d2d2d2;
    width: 100%;
	}
	
	.form-style .form-table th label {
    	font-size: 12px;
    	font-weight: normal;
	}

	h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6, strong, label {
    	font-weight: 700;
    	font-family: '나눔고딕','NanumGothic','맑은 고딕','Malgun Gothic','돋움',dotum,'Apple SD Gothic Neo',sans-serif;
	}
	
	label {
    	display: inline-block;
    	margin-bottom: 5px;
    	font-weight: bold;
	}
	
	label {
	    cursor: default;
	}
	
	.form-style .form-table td span {
	    display: inline-block;
	}
	
	.ml10 {
	    margin-left: 10px !important;
	}
	
	.text-sub {
    	color: #666;
    	font-size: 12px;
    	display: inline-block;
	}
	
	.t_content {
	    color: #666 !important;
	}
	
	table {
	    border-collapse: collapse;
	    border-spacing: 0;
	}
	
	.icon_list.mypage li {
	    font-size: 13px;
	    color: #333;
	    margin-bottom: 4px;
	}
	
	.icon_list li, .icon_list dd {
	    line-height: 21px;
	    background: url(http://image2.megabox.co.kr/mop/home/icon_list.png) 0 7px no-repeat;
	    color: #666;
	    padding-left: 12px;
	    letter-spacing: -0.5px;
	}
	
	ul, ol, dl, li, p {
	    padding: 0;
	    margin: 0;
	    list-style: none;
	}
	
	li {
	    display: list-item;
	    text-align: -webkit-match-parent;
	}
	
	.user_wrap .btn_wrap button.user.cancel {
	    display: inline-block;
	    width: 123px;
	    height: 45px;
	    background-position: 0 -300px;
	}
	
	.img_btn.user {
	    background-image: url(http://image2.megabox.co.kr/mop/home/btns/btn_member.png);
	}
	
	.mr7 {
	    margin-right: 7px !important;
	}
	
	.img_btn {
	    display: block;
	    overflow: hidden;
	    text-indent: -9999px;
	    border: none;
	    background-repeat: no-repeat;
	    background: transparent;
	    vertical-align: middle;
	}
	
	input, button, select, textarea {
	    font-family: inherit;
	    font-size: inherit;
	    line-height: inherit;
	}
	
	button, html input[type="button"], input[type="reset"], input[type="submit"] {
	    cursor: pointer;
 	   -webkit-appearance: button;
	}
	
	.user_wrap .btn_wrap button.user.modify {
	    background: url(http://image2.megabox.co.kr/mop/home/mypage/bg_mypage_160114.png) -200px -650px no-repeat;
	    display: inline-block;
	    width: 123px;
	    height: 45px;
	}

</style>
</head>
<body>
<form name="pwform" method="post" action="changePwSave.do" enctype="multipart/form-data">  
<div class="h2_mypage">
			<h3 class="sub_title">비밀번호 변경</h3>
			<span> 현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요.</span>
		</div>
		
		<div class="user_wrap">
			<div class="form-style" id="changePw">
				<table class="form-table">
					<caption class="blind2">비밀번호 변경:현재 비밀번호, 새 비밀번호, 새 비밀번호 확인 입력</caption>
					<colgroup>
						<col width="181">
						<col width="">
					</colgroup>
					<tbody><tr>
						<th scope="row" id="th_changePass_passNow"><label for="inputtext1">현재 비밀번호</label></th>
						<td headers="th_changePass_passNow">
							<input type="password" id="inputtext1" title="현재 비밀번호" name="oldPassword" allowtype="number alphabet special" validate="number alphabet special">
							<input type="hidden" name="prePassword" value="${bean.j_pwd }">
						</td>
					</tr>
					<tr>
						<th scope="row" id="th_changePass_passNew"><label for="inputtext2">새 비밀번호</label></th>
						<td headers="th_changePass_passNew">
							<input type="password" id="inputtext2" title="새 비밀번호" name="newPassword" maxlength="15" allowtype="number alphabet special" validate="number alphabet special" onkeydown="passwordLengthCheck(this)"><span class="text-sub ml10 t_content">영문, 숫자, 특수문자 6자리 이상 15자리 이하로 입력 해 주세요.</span>
						</td>
					</tr>
					<tr>
						<th scope="row" id="th_changePass_passConfirm"><label for="inputtext3">새 비밀번호 확인</label></th>
						<td headers="th_changePass_passConfirm">
							<input type="password" id="inputtext3" title="새 비밀번호 확인" name="confirmNewPassword" maxlength="15" allowtype="number alphabet special" validate="number alphabet special"><span class="text-sub ml10 t_content">비밀번호 확인을 위해 한 번 더 입력해 주시기 바랍니다.</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<ul class="icon_list mypage mt10 mb10">
								<li class="t_content">생년월일, 전화번호 등 개인 정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수 있으니 사용을 자제해 주세요.</li>
								<li class="t_content">비밀번호는 3-6개월마다 꼭 바꿔 주세요.</li>
								<li class="t_content">비밀번호 변경시 모바일 기기와 홈페이지에서 모두 로그아웃됩니다. 변경한 비밀번호로 다시 로그인해주세요.</li>
							</ul>
						</td>
					</tr>
				</tbody></table>
			</div>

			<div class="btn_wrap text-center mt50">
				<button type="button" class="img_btn user cancel mr7" onclick="history.back()">취소</button>
				<button type="button" class="img_btn user modify ml7" onclick="check();">수정</button>
			</div>
		</div>
		
	</form>

</body>
</html>