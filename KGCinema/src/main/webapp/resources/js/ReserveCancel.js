
function cancel(data) {
	if(confirm("취소하시겠습니까?") == true) {
	$.ajax({
		url: "cancel.do",
		data: "rno=" + $(data).attr("r_no") + "&rstart=" + $(data).attr("r_start"),
		dataType: "json",
		type: "GET",
		success: function(data) {
			if(data.check==1) {
				location.reload();
		    	alert("취소되었습니다.");
				//location.href='main.do';
			} else {
				alert("취소가 불가능 합니다.\n상영시작 20분 전까지 취소가능합니다");
			}
		},
		error: function(data) {
			console.log(data);
		}
	});
	} else {
		   
	   }
}

