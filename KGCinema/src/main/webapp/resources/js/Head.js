/*
$(document).ready(function(){
$("#btnlogin").click(function() {
	if ($("#userid").val() == "") {
		alert("아이디를 입력해주세요.");
		return;
	} else if($("#userpw").val() == "") {
		alert("비밀번호를 입력해주세요.");
		return;
	} else{
	$.ajax({
		url: "login.do",
		data: "userid=" + $("#userid").val() + "&userpw=" + $("#userpw").val(),
		dataType: "json",
		type: "GET",
		success: function(data) {
			if(data.check==1){
				location.href='main.do';
			} else {
				alert("로그인 정보가 잘못되었습니다");
				$("#userpw").focus();
			}
		},
		error: function(data) {
			console.log(data);
		}
	}); }
});
});
*/

// 로그인 엔터키
$(document).ready(function() {
	$('form[name=loginForm]').on('submit', function(e) {
		// stop form submit event
		e.preventDefault();
		
		if($("#userid").val() == "") {
			alert("아이디를 입력해주세요.");
			return;
		} else if($("#userpw").val() == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		} else {
			$.ajax({
				url: "login.do",
				data: "userid=" + $("#userid").val() + "&userpw=" + $("#userpw").val(),
				dataType: "json",
				type: "GET",
				success: function(data) {
					if(data.check==1) {
						location.reload();
						
					} else {
						alert("로그인 정보가 잘못되었습니다.");
						$("#userpw").focus();
					}
				},
				error: function(data) {
					console.log(data);
				}
			});
		}
		
	});
});
