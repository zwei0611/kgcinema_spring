<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/headLogin.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입, KG시네마</title>

<link rel="stylesheet" type="text/css" href="./resources/css/InputCSS1.css">
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="./resources/js/InputJS1.js"></script>

</head>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

	$(document).ready(function(){
		$('#checkBtn').click(function(){
			var id_reg = /^[a-z]+[a-z0-9]{5,14}/;
			if(id_reg.test($('#checkId').val())==false){
				alert("영문과 숫자 6-15자를 입력하세요");
				$('#checkId').val("");
				$('#checkId').focus();
				return;
			}
			if($('#checkId').val() == "") {
				alert("아이디를 입력해주세요");
				return ;
			} else {
				$.ajax({
					url: '${pageContext.request.contextPath}/check.do?id='+document.getElementById("checkId").value,
					type: 'GET',
					success: function(data) {
						if(data == 1) {
							alert("아이디가 중복됩니다");
							$('#checkId').val("");
							$('#checkId').focus();
							flagI = false;
						} else {
							alert("사용 가능한 아이디입니다");
							flagI = true;
						}
					},
					error: function(data) {
						console.log(data);
					} 
				});
			}
		});
	});

</script>

<body>
	<div class="all" align="center">
		<div class="title"><br><div><h2>회원가입<span class="ml10">KG CINEMA에 오신것을 환영합니다</span></h2></div></div>
		<div class="cf"><br><span class="text-sub mb10">* 표시 항목은 필수입력 항목입니다.</span></div>
		<form name="iform" method="post" action="join.do" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" -->
			<table class="table1">
				<tr>
					<th>* 아이디</th>
					<td >
						<input type="text" size="19" name="j_id" id=checkId onchange="idChangeCheck()" onkeyup="checklen(this,15)" value=""> 
						<input type="button" class="button button1" id="checkBtn"  style="vertical-align: middle;" value="중복확인">
						<label id="idlabel"></label>
					</td>
				</tr>
				<tr>
					<th>* 이름</th>
					<td>
					    <input type="text" size="19" name="j_name" onchange="checkName()" onkeyup="checklen(this,15)" value="">
					    <label id="namelabel"></label>    
					</td>
				</tr>
				<tr>
					<th>* 비밀번호</th>
					<td ><input type="password" name="j_pwd" onkeyup="checklen(this,15)" value=""></td>
				</tr>
				<tr>
					<th>* 비밀번호 확인</th>
					<td>
						<input type="password" name="j_pwd2" onkeyup="checkPwd();" value="">
						<label id="pwdlabel">&nbsp;&nbsp;비밀번호를 한번 더 입력해주세요.</label>
					</td>

				</tr>
				<tr>
					<th>* 주소</th>
					<td colspan= "2">
						<input type="text" size="10" id="code" name="code" readonly value="06267"> <input type="button" class="post" onclick="DaumPostcode()" value="우편번호 검색"><p>
						<input type="text" size="40" id="juso1" name="j_juso1" readonly value=""><p>
						<input type="text" size="40" id="juso2" name="j_juso2" onkeyup="checklen(this,30)" value="">&nbsp;&nbsp;상세주소를 입력하세요 <br>
					</td>
				</tr>
				
				<tr>
					<th>* 생년월일</th>
					<td colspan= "2">
						<input type="text" class="w67" size="4" name="year" onfocus="birth()" onchange="birth()" maxlength="4" value="">&nbsp;년&nbsp;
						<input type="text" class="w44" size="2" name="month" onchange="birth()" maxlength="2" value="">&nbsp;월&nbsp;
						<input type="text" class="w44" size="2" name="day" onchange="birth()" maxlength="2" value="">&nbsp;일&nbsp;
						<label id="birthlabel">&nbsp;&nbsp;생년월일을 입력하세요</label>
					</td>
				</tr>
				
				<tr>
					<th>* 휴대폰</th>
					<td colspan= "2">
						<input type="text" class="w67" size="3" name="num1" onfocus="num()" onchange="num()" maxlength="3" value="">-
						<input type="text" class="w67" size="4" name="num2" onchange="num()" maxlength="4" value="">-
						<input type="text" class="w67" size="4" name="num3" onchange="num()" maxlength="4" value="">&nbsp;
						<label id="numlabel">&nbsp;&nbsp;숫자3~4자리 입력하세요</label>
					</td>
				</tr>
				<tr>
					<th>* email</th>
					<td colspan= "2">
						<input type="text" size="40" name="j_email" onblur="emailcheck()" onkeyup="checklen(this,30)" placeholder="aaa@aaa.aa형식으로 입력" value="">
						<span id="email_ch"></span>
					</td>
				</tr>

			</table>
			<p>
			<input type="button" class="button button2" value="취소" onclick="location.href='main.do'">&nbsp;&nbsp;&nbsp;
			<input type="button" class="button button3" value="등록" onclick="check()">
		</form>
	</div>
</body>
</html>