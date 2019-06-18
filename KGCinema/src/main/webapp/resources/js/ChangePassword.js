
//====전역변수:각각 체크여부
	var flag = false;//null체크여부
	var flagP = false;//비번확인체크여부
	var flagNP = false;//새비번확인체크여부
	var flagTest = false; // 비번 정규표현식 체크
	
	
//====다 체크하고 submit
	function check(){
		var prepass = pwform.prePassword.value;
		var oldpass = pwform.oldPassword.value;
		var newpass = pwform.newPassword.value;
		var newpass2 = pwform.confirmNewPassword.value;

		

		if (oldpass==null||oldpass==""){
			alert('비밀번호를 입력하세요.');
			pwform.oldPassword.focus();
			return;
		}
		if (newpass==null||newpass==""){
			alert('바꿀 비밀번호를 입력하세요.');
			pwform.newpass.focus();
			return;
		}
		if (newpass2==null||newpass2==""){
			alert('바꿀 비밀번호를 입력하세요.');
			pwform.newpass2.focus();
			return;
		}



		//위에 해당 되는 거 없으면 널 체크 true
		flag=true;
		
		
		if(pwform.prePassword.value == pwform.oldPassword.value) {
			flagP = true;
		} else {
			alert("현재 비밀번호가 틀렸습니다.");
			pwform.oldPassword.focus();
		}
		
		
		var passwordRule = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,15}$/;
		if(passwordRule.test(newpass)==false) {
			alert("비밀번호는 영문, 숫자, 특수문자 중 6~15자를 입력해주세요.");
			pwform.newPassword.focus();
			return;
		} else {
			flagTest = true;
		}
		
		
		if(pwform.newPassword.value == pwform.confirmNewPassword.value) {
			flagNP = true;
		} else {
			alert("새 비밀번호가 틀렸습니다.");
			pwform.confirmNewPassword.focus();
			return;
		}


		

		//위에 다 통과&체크 완료 후 submit
		if(flagTest==true&&flagP==true&&flag==true&&flagNP==true){
			document.pwform.submit();
		} else { return; }
	}//check end
	
	
	
	
		
	
//====각각 데이터 입력 자리수제한(db오류 안나게 바이트로 처리)
	function checklen(obj, maxByte)	{	//db데이터 사이즈에 맞는 길이 체크
		var strValue = obj.value;
		var strLen = strValue.length;
		var totalByte = 0;
		var len = 0;
		var oneChar ="";
		var str2 ="";
		
		for (var i = 0; i < strLen; i++) {	//한글자씩 가져와서
			oneChar = strValue.charAt(i);
			if (escape(oneChar).length > 15)	{	//길이가 4초과=유니코드/한글이면
				totalByte += 2;	//2바이트로 넣어주고
			} else {
				totalByte++;	//아니면 1바이트로 처리
			}
			if(totalByte <= maxByte) {
				len = i+1;	//입력된 데이터의 자리수 기억해주기
			}
		}
		if (totalByte > maxByte) {
			alert(maxByte+'Byte를 초과 입력 불가');
			str2 = strValue.substr(0, len);	//아까 기억한 자리수까지만큼 잘라서 넣어주기
			obj.value = str2;
		}
	}//end
