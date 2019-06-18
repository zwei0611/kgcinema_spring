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
inwon = 0;
selInwon = 0;
seat_html = "";
selSeat = "";
price = 0;
price_html = "";
inwon_html = "";
inwonStr = "";

// 8명 초과할경우 0으로 초기화
$(document).ready(function() {
	$("#ticketTypeCode_01").change(function() {
		var adult = this.value;
		var youth = $("#ticketTypeCode_02").val();
		if((Number(adult)+Number(youth)) > 8) {
			alert("인원선택은 총 8명까지 가능합니다.");
			this.value = 0;
		} else if((Number(adult)+Number(youth)) < selInwon) {
			location.reload();
		} else {
			if(adult != 0 && youth != 0) {
				inwon_html = '<span>일반 '+adult+'명&nbsp;</span>';
				inwon_html += '<span>청소년 '+youth+'명&nbsp;</span>';
				$("#countSelectedByTicket").html(inwon_html);
				price = adult * 10000;
				price += youth * 8000;
				inwonStr = '일반 '+adult+'명, 청소년 '+youth+'명';
			} else if(adult == 0 && youth != 0) {
				inwon_html = '<span>청소년 '+youth+'명&nbsp;</span>';
				$("#countSelectedByTicket").html(inwon_html);
				price = youth * 8000;
				inwonStr = '청소년 '+youth+'명';
			} else if(youth == 0 && adult !=0) {
				inwon_html = '<span>일반 '+adult+'명&nbsp;</span>';
				$("#countSelectedByTicket").html(inwon_html);
				price = adult * 10000;
				inwonStr = '일반 '+adult+'명';
			} else {
				inwon_html = '';
				$("#countSelectedByTicket").html(inwon_html);
				price = 0;
			}
		    price_html = price.toString();
		    if(price >= 1000 && price < 10000) {
		    	price_html = price_html.substring(0,1) + "," + price_html.substring(1);
		    } else if(price >= 10000 && price < 100000) {
		    	price_html = price_html.substring(0,2) + "," + price_html.substring(2);
		    } else if(price >= 100000 && price < 1000000) {
		    	price_html = price_html.substring(0,3) + "," + price_html.substring(3);
		    }
		    $("#ticketTotalPrice").html(price_html);
		    
		    $("#r_inwon").attr("value",inwonStr);
		    $("#r_price").attr("value",price);
		}
	});
	$("#ticketTypeCode_02").change(function() {
		var youth = this.value;
		var adult = $("#ticketTypeCode_01").val();
		if((Number(youth)+Number(adult)) > 8) {
			alert("인원선택은 총 8명까지 가능합니다.");
			this.value = 0;
		} else if((Number(adult)+Number(youth)) < selInwon) {
			location.reload();
		} else {
			if(adult != 0 && youth != 0) {
				inwon_html = '<span>일반 '+adult+'명&nbsp;</span>';
				inwon_html += '<span>청소년 '+youth+'명&nbsp;</span>';
				$("#countSelectedByTicket").html(inwon_html);
				price = adult * 10000;
				price += youth * 8000;
				inwonStr = '일반 '+adult+'명, 청소년 '+youth+'명';
			} else if(adult == 0 && youth != 0) {
				inwon_html = '<span>청소년 '+youth+'명&nbsp;</span>';
				$("#countSelectedByTicket").html(inwon_html);
				price = youth * 8000;
				inwonStr = '청소년 '+youth+'명';
			} else if(youth == 0 && adult != 0) {
				inwon_html = '<span>일반 '+adult+'명&nbsp;</span>';
				$("#countSelectedByTicket").html(inwon_html);
				price = adult * 10000;
				inwonStr = '일반 '+adult+'명';
			} else {
				inwon_html = '';
				$("#countSelectedByTicket").html(inwon_html);
				price = 0;
			}
		    price_html = price.toString();
		    if(price >= 1000 && price < 10000) {
		    	price_html = price_html.substring(0,1) + "," + price_html.substring(1);
		    } else if(price >= 10000 && price < 100000) {
		    	price_html = price_html.substring(0,2) + "," + price_html.substring(2);
		    } else if(price >= 100000 && price < 1000000) {
		    	price_html = price_html.substring(0,3) + "," + price_html.substring(3);
		    }
		    $("#ticketTotalPrice").html(price_html);
		    
		    $("#r_inwon").attr("value",inwonStr);
		    $("#r_price").attr("value",price);
		}
	});
});


var BookingSeatDatas = {
		checkSeat: function(data) {
			var adult = $("#ticketTypeCode_01").val();
			var youth = $("#ticketTypeCode_02").val();
			inwon = Number(adult) + Number(youth);
			if(inwon < 1) {
				alert("인원을 먼저 선택해주세요.");
				return;
			} else if(inwon - selInwon <= 0) {
				alert("모두 선택하였습니다");
				return;
			} else if(inwon - selInwon == 1) {
			    $(data).attr("class","seat_selected");
			    $(data).attr("title",$(data).attr("seatgroup")+$(data).attr("seatno")+"(선택됨)");
			    $(data).attr("onmouseover","");
			    $(data).attr("onmouseout","");
			    $(data).attr("onclick","BookingSeatDatas.deselectSeat(\""+$(data).attr("seatgroup")+"\","+"\""+$(data).attr("seatno")+"\")");
			    $(data).attr("onkeyup","");
			    $(data).attr("onblur","");
			    $(data).attr("onkeypress","");
			    selInwon += 1;
			    // <li data-seat-num="A1">A1</li>
			    selSeat += $(data).attr("seatgroup")+$(data).attr("seatno")+',';
			    $("#r_seat").attr("value",selSeat);
			    seat_html += '<li data-seat-num=\"'+$(data).attr("seatgroup")+$(data).attr("seatno")+'">'+$(data).attr("seatgroup")+$(data).attr("seatno")+'</li>';
			    $("#selectedSeatNumbers1").html(seat_html);
				return;
			} else if(inwon - selInwon != 1) {
				var px = $(data).attr("style").split(" ")[5].split("px")[0];
				var prepx = Number(px) - 18;
				var nextpx = Number(px) + 18;
				
				var bean = $(data).attr("id").split("_");
				var next = bean[0]+"_"+bean[1]+"_"+(Number(bean[2])+1)+"_"+bean[3];
				var pre = bean[0]+"_"+bean[1]+"_"+(Number(bean[2])-1)+"_"+bean[3];
				var preno = $("#"+pre).attr("seatno");
				var preclass = $("#"+pre).attr("class");
				var nextno = $("#"+next).attr("seatno");
				var nextclass = $("#"+next).attr("class");
				var premouseover = $("#"+pre).attr("onmouseover");
				var nextmouseover = $("#"+next).attr("onmouseover");
				
				// seat_done, seat_selected
				if(nextno != undefined && nextclass != "seat_done" && nextmouseover != "") {
					var nextcheck = $("#"+next).attr("style").split(" ")[5].split("px")[0];
					if(nextpx == nextcheck) {
						$("#"+next).attr("class","seat_selected");
						$("#"+next).attr("title",$("#"+next).attr("seatgroup")+$("#"+next).attr("seatno")+"(선택됨)");
					    $("#"+next).attr("onmouseover","");
					    $("#"+next).attr("onmouseout","");
					    $("#"+next).attr("onclick","BookingSeatDatas.deselectSeat(\""+$("#"+next).attr("seatgroup")+"\","+"\""+$("#"+next).attr("seatno")+"\")");
					    $("#"+next).attr("onkeyup","");
					    $("#"+next).attr("onblur","");
					    $("#"+next).attr("onkeypress","");
					    $(data).attr("class","seat_selected");
					    $(data).attr("title",$(data).attr("seatgroup")+$(data).attr("seatno")+"(선택됨)");
					    $(data).attr("onmouseover","");
					    $(data).attr("onmouseout","");
					    $(data).attr("onclick","BookingSeatDatas.deselectSeat(\""+$(data).attr("seatgroup")+"\","+"\""+$(data).attr("seatno")+"\")");
					    $(data).attr("onkeyup","");
					    $(data).attr("onblur","");
					    $(data).attr("onkeypress","");
					    selInwon += 2;
					    selSeat += $(data).attr("seatgroup")+$(data).attr("seatno")+',';
					    selSeat += $("#"+next).attr("seatgroup")+$("#"+next).attr("seatno")+',';
					    $("#r_seat").attr("value",selSeat);
						seat_html += '<li data-seat-num=\"'+$(data).attr("seatgroup")+$(data).attr("seatno")+'">'+$(data).attr("seatgroup")+$(data).attr("seatno")+'</li>';
						seat_html += '<li data-seat-num=\"'+$("#"+next).attr("seatgroup")+$("#"+next).attr("seatno")+'">'+$("#"+next).attr("seatgroup")+$("#"+next).attr("seatno")+'</li>';
					    $("#selectedSeatNumbers1").html(seat_html);
					} else if(preno != undefined && preclass != "seat_done" && premouseover != "") {
						$("#"+pre).attr("class","seat_selected");
						$("#"+pre).attr("title",$("#"+pre).attr("seatgroup")+$("#"+pre).attr("seatno")+"(선택됨)");
					    $("#"+pre).attr("onmouseover","");
					    $("#"+pre).attr("onmouseout","");
					    $("#"+pre).attr("onclick","BookingSeatDatas.deselectSeat(\""+$("#"+pre).attr("seatgroup")+"\","+"\""+$("#"+pre).attr("seatno")+"\")");
					    $("#"+pre).attr("onkeyup","");
					    $("#"+pre).attr("onblur","");
					    $("#"+pre).attr("onkeypress","");
					    $(data).attr("class","seat_selected");
					    $(data).attr("title",$(data).attr("seatgroup")+$(data).attr("seatno")+"(선택됨)");
					    $(data).attr("onmouseover","");
					    $(data).attr("onmouseout","");
					    $(data).attr("onclick","BookingSeatDatas.deselectSeat(\""+$(data).attr("seatgroup")+"\","+"\""+$(data).attr("seatno")+"\")");
					    $(data).attr("onkeyup","");
					    $(data).attr("onblur","");
					    $(data).attr("onkeypress","");
					    selInwon += 2;
					    selSeat += $(data).attr("seatgroup")+$(data).attr("seatno")+',';
					    selSeat += $("#"+pre).attr("seatgroup")+$("#"+pre).attr("seatno")+',';
					    $("#r_seat").attr("value",selSeat);
					    seat_html += '<li data-seat-num=\"'+$(data).attr("seatgroup")+$(data).attr("seatno")+'">'+$(data).attr("seatgroup")+$(data).attr("seatno")+'</li>';
						seat_html += '<li data-seat-num=\"'+$("#"+pre).attr("seatgroup")+$("#"+pre).attr("seatno")+'">'+$("#"+pre).attr("seatgroup")+$("#"+pre).attr("seatno")+'</li>';
					    $("#selectedSeatNumbers1").html(seat_html);
					}
				} else if(preno != undefined && preclass != "seat_done" && premouseover != "") {
					var precheck = $("#"+pre).attr("style").split(" ")[5].split("px")[0];
					if(prepx == precheck) {
						$("#"+pre).attr("class","seat_selected");
						$("#"+pre).attr("title",$("#"+pre).attr("seatgroup")+$("#"+pre).attr("seatno")+"(선택됨)");
					    $("#"+pre).attr("onmouseover","");
					    $("#"+pre).attr("onmouseout","");
					    $("#"+pre).attr("onclick","BookingSeatDatas.deselectSeat(\""+$("#"+pre).attr("seatgroup")+"\","+"\""+$("#"+pre).attr("seatno")+"\")");
					    $("#"+pre).attr("onkeyup","");
					    $("#"+pre).attr("onblur","");
					    $("#"+pre).attr("onkeypress","");
					    $(data).attr("class","seat_selected");
					    $(data).attr("title",$(data).attr("seatgroup")+$(data).attr("seatno")+"(선택됨)");
					    $(data).attr("onmouseover","");
					    $(data).attr("onmouseout","");
					    $(data).attr("onclick","BookingSeatDatas.deselectSeat(\""+$(data).attr("seatgroup")+"\","+"\""+$(data).attr("seatno")+"\")");
					    $(data).attr("onkeyup","");
					    $(data).attr("onblur","");
					    $(data).attr("onkeypress","");
					    selInwon += 2;
					    selSeat += $(data).attr("seatgroup")+$(data).attr("seatno")+',';
					    selSeat += $("#"+pre).attr("seatgroup")+$("#"+pre).attr("seatno")+',';
					    $("#r_seat").attr("value",selSeat);
					    seat_html += '<li data-seat-num=\"'+$(data).attr("seatgroup")+$(data).attr("seatno")+'">'+$(data).attr("seatgroup")+$(data).attr("seatno")+'</li>';
						seat_html += '<li data-seat-num=\"'+$("#"+pre).attr("seatgroup")+$("#"+pre).attr("seatno")+'">'+$("#"+pre).attr("seatgroup")+$("#"+pre).attr("seatno")+'</li>';
					    $("#selectedSeatNumbers1").html(seat_html);
					} else {
						$(data).attr("class","seat_selected");
					    $(data).attr("title",$(data).attr("seatgroup")+$(data).attr("seatno")+"(선택됨)");
					    $(data).attr("onmouseover","");
					    $(data).attr("onmouseout","");
					    $(data).attr("onclick","BookingSeatDatas.deselectSeat(\""+$(data).attr("seatgroup")+"\","+"\""+$(data).attr("seatno")+"\")");
					    $(data).attr("onkeyup","");
					    $(data).attr("onblur","");
					    $(data).attr("onkeypress","");
					    selInwon += 1;
					    selSeat += $(data).attr("seatgroup")+$(data).attr("seatno")+',';
					    $("#r_seat").attr("value",selSeat);
					    seat_html += '<li data-seat-num=\"'+$(data).attr("seatgroup")+$(data).attr("seatno")+'">'+$(data).attr("seatgroup")+$(data).attr("seatno")+'</li>';
					    $("#selectedSeatNumbers1").html(seat_html);
					}
				} else {
					$(data).attr("class","seat_selected");
				    $(data).attr("title",$(data).attr("seatgroup")+$(data).attr("seatno")+"(선택됨)");
				    $(data).attr("onmouseover","");
				    $(data).attr("onmouseout","");
				    $(data).attr("onclick","BookingSeatDatas.deselectSeat(\""+$(data).attr("seatgroup")+"\","+"\""+$(data).attr("seatno")+"\")");
				    $(data).attr("onkeyup","");
				    $(data).attr("onblur","");
				    $(data).attr("onkeypress","");
				    selInwon += 1;
				    selSeat += $(data).attr("seatgroup")+$(data).attr("seatno")+',';
				    $("#r_seat").attr("value",selSeat);
				    seat_html += '<li data-seat-num=\"'+$(data).attr("seatgroup")+$(data).attr("seatno")+'">'+$(data).attr("seatgroup")+$(data).attr("seatno")+'</li>';
				    $("#selectedSeatNumbers1").html(seat_html);
				}
			}
			
			/*
			var seatgroup = $(data).attr("seatgroup");
			var seatno = $(data).attr("seatno");
			*/
		},
		
		seatMouseOver: function(data) {
			var adult = $("#ticketTypeCode_01").val();
			var youth = $("#ticketTypeCode_02").val();
			inwon = Number(adult) + Number(youth);
			if(inwon < 1) {
				return;
			} else if(inwon - selInwon <= 0) {
				return;
			} else if(inwon - selInwon == 1) {
				$("#"+data).attr("class","seat_selected");
			} else if(inwon - selInwon != 1) {
				var px = $("#"+data).attr("style").split(" ")[5].split("px")[0];
				var prepx = Number(px) - 18;
				var nextpx = Number(px) + 18;
				
				var bean = data.split("_");
				var next = bean[0]+"_"+bean[1]+"_"+(Number(bean[2])+1)+"_"+bean[3];
				var pre = bean[0]+"_"+bean[1]+"_"+(Number(bean[2])-1)+"_"+bean[3];
				var preno = $("#"+pre).attr("seatno");
				var nextno = $("#"+next).attr("seatno");
				var preclass = $("#"+pre).attr("class");
				var nextclass = $("#"+next).attr("class");
				var premouseover = $("#"+pre).attr("onmouseover");
				var nextmouseover = $("#"+next).attr("onmouseover");

				if(nextno != undefined && nextclass != "seat_done" && nextclass != "seat_selected") {
					var nextcheck = $("#"+next).attr("style").split(" ")[5].split("px")[0];
					if(nextpx == nextcheck) {
						$("#"+next).attr("class","seat_selected");
					} else if(preno != undefined && preclass != "seat_done" && preclass != "seat_selected") {
						$("#"+pre).attr("class","seat_selected");
					}
				} else if(preno != undefined && preclass != "seat_done" && preclass != "seat_selected") {
					var precheck = $("#"+pre).attr("style").split(" ")[5].split("px")[0];
					if(prepx == precheck) {
						$("#"+pre).attr("class","seat_selected");
					}
				}
				$("#"+data).attr("class","seat_selected");
			}
			
			
			
			
		},
		
		seatMouseOut: function(data) {
			var adult = $("#ticketTypeCode_01").val();
			var youth = $("#ticketTypeCode_02").val();
			inwon = Number(adult) + Number(youth);
			if(inwon < 1) {
				return;
			} else if(inwon - selInwon <= 0) {
				return;
			} else if(inwon - selInwon == 1) {
				$("#"+data).attr("class","seat_normal");
			} else if(inwon - selInwon != 1) {
				var px = $("#"+data).attr("style").split(" ")[5].split("px")[0];
				var prepx = Number(px) - 18;
				var nextpx = Number(px) + 18;
				
				var bean = data.split("_");
				var next = bean[0]+"_"+bean[1]+"_"+(Number(bean[2])+1)+"_"+bean[3];
				var pre = bean[0]+"_"+bean[1]+"_"+(Number(bean[2])-1)+"_"+bean[3];
				var preno = $("#"+pre).attr("seatno");
				var nextno = $("#"+next).attr("seatno");
				var preclass = $("#"+pre).attr("class");
				var nextclass = $("#"+next).attr("class");
				var premouseover = $("#"+pre).attr("onmouseover");
				var nextmouseover = $("#"+next).attr("onmouseover");
				
				if(nextno != undefined && nextclass != "seat_done" && nextmouseover != "") {
					var nextcheck = $("#"+next).attr("style").split(" ")[5].split("px")[0];
					if(nextpx == nextcheck) {
						$("#"+next).attr("class","seat_normal");
					} else if(preno != undefined && preclass != "seat_done" && premouseover != "") {
						$("#"+pre).attr("class","seat_normal");
					}
				} else if(preno != undefined && preclass != "seat_done" && premouseover != "") {
					var precheck = $("#"+pre).attr("style").split(" ")[5].split("px")[0];
					if(prepx == precheck) {
						$("#"+pre).attr("class","seat_normal");
					}
				}
				$("#"+data).attr("class","seat_normal");
			}
		},
		
		deselectSeat: function(group, no) {
			var adult = $("#ticketTypeCode_01").val();
			var youth = $("#ticketTypeCode_02").val();
			inwon = Number(adult) + Number(youth);
		
				var px = $("#seat_"+group+"_"+no+"_10").attr("style").split(" ")[5].split("px")[0];
				var prepx = Number(px) - 18;
				var nextpx = Number(px) + 18;
				
				var bean = $("#seat_"+group+"_"+no+"_10").attr("id").split("_");
				var next = bean[0]+"_"+bean[1]+"_"+(Number(bean[2])+1)+"_"+bean[3];
				var pre = bean[0]+"_"+bean[1]+"_"+(Number(bean[2])-1)+"_"+bean[3];
				var preno = $("#"+pre).attr("seatno");
				var preclass = $("#"+pre).attr("class");
				var nextno = $("#"+next).attr("seatno");
				var nextclass = $("#"+next).attr("class");
				var premouseover = $("#"+pre).attr("onmouseover");
				var nextmouseover = $("#"+next).attr("onmouseover");
				
				// seat_done, seat_selected
				if(nextno != undefined && nextclass != "seat_done" && nextmouseover == "") {
					var nextcheck = $("#"+next).attr("style").split(" ")[5].split("px")[0];
					if(nextpx == nextcheck) {
						$("#"+next).attr("class","seat_normal");
						$("#"+next).attr("title",$("#"+next).attr("seatgroup")+$("#"+next).attr("seatno")+"(일반석)");
					    $("#"+next).attr("onmouseover","BookingSeatDatas.seatMouseOver(\"seat_"+$("#"+next).attr("seatgroup")+"_"+$("#"+next).attr("seatno")+"_10\")");
					    $("#"+next).attr("onmouseout","BookingSeatDatas.seatMouseOut(\"seat_"+$("#"+next).attr("seatgroup")+"_"+$("#"+next).attr("seatno")+"_10\")");
					    $("#"+next).attr("onclick","BookingSeatDatas.checkSeat(this)");
					    $("#"+next).attr("onkeypress","BookingSeatDatas.seatMouseOver(\"seat_"+$("#"+next).attr("seatgroup")+"_"+$("#"+next).attr("seatno")+"_10\")");
					    $("#seat_"+group+"_"+no+"_10").attr("class","seat_normal");
					    $("#seat_"+group+"_"+no+"_10").attr("title",$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"(일반석)");
					    $("#seat_"+group+"_"+no+"_10").attr("onmouseover","BookingSeatDatas.seatMouseOver(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
					    $("#seat_"+group+"_"+no+"_10").attr("onmouseout","BookingSeatDatas.seatMouseOut(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
					    $("#seat_"+group+"_"+no+"_10").attr("onclick","BookingSeatDatas.checkSeat(this)");
					    $("#seat_"+group+"_"+no+"_10").attr("onkeypress","BookingSeatDatas.seatMouseOver(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
					    selInwon -= 2;
					    var delSeat1 = $("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+',';
					    var delSeat2 = $("#"+next).attr("seatgroup")+$("#"+next).attr("seatno")+',';
					    selSeat = selSeat.replace(delSeat1,'');
					    selSeat = selSeat.replace(delSeat2,'');
					    $("#r_seat").attr("value",selSeat);
					    var del1 = '<li data-seat-num=\"'+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+'">'+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+'</li>';
					    var del2 = '<li data-seat-num=\"'+$("#"+next).attr("seatgroup")+$("#"+next).attr("seatno")+'">'+$("#"+next).attr("seatgroup")+$("#"+next).attr("seatno")+'</li>';
					    seat_html = seat_html.replace(del1,'');
					    seat_html = seat_html.replace(del2,'');
					    $("#selectedSeatNumbers1").html(seat_html);
					} else if(preno != undefined && preclass != "seat_done" && premouseover == "") {
						$("#"+pre).attr("class","seat_normal");
						$("#"+pre).attr("title",$("#"+next).attr("seatgroup")+$("#"+next).attr("seatno")+"(일반석)");
					    $("#"+pre).attr("onmouseover","BookingSeatDatas.seatMouseOver(\"seat_"+$("#"+next).attr("seatgroup")+"_"+$("#"+next).attr("seatno")+"_10\")");
					    $("#"+pre).attr("onmouseout","BookingSeatDatas.seatMouseOut(\"seat_"+$("#"+next).attr("seatgroup")+"_"+$("#"+next).attr("seatno")+"_10\")");
					    $("#"+pre).attr("onclick","BookingSeatDatas.checkSeat(this)");
					    $("#"+pre).attr("onkeypress","BookingSeatDatas.seatMouseOver(\"seat_"+$("#"+next).attr("seatgroup")+"_"+$("#"+next).attr("seatno")+"_10\")");
					    $("#seat_"+group+"_"+no+"_10").attr("class","seat_normal");
					    $("#seat_"+group+"_"+no+"_10").attr("title",$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"(일반석)");
					    $("#seat_"+group+"_"+no+"_10").attr("onmouseover","BookingSeatDatas.seatMouseOver(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
					    $("#seat_"+group+"_"+no+"_10").attr("onmouseout","BookingSeatDatas.seatMouseOut(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
					    $("#seat_"+group+"_"+no+"_10").attr("onclick","BookingSeatDatas.checkSeat(this)");
					    $("#seat_"+group+"_"+no+"_10").attr("onkeypress","BookingSeatDatas.seatMouseOver(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
					    selInwon -= 2;
					    var delSeat1 = $("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+',';
					    var delSeat2 = $("#"+pre).attr("seatgroup")+$("#"+pre).attr("seatno")+',';
					    selSeat = selSeat.replace(delSeat1,'');
					    selSeat = selSeat.replace(delSeat2,'');
					    $("#r_seat").attr("value",selSeat);
					    var del1 = '<li data-seat-num=\"'+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+'">'+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+'</li>';
					    var del2 = '<li data-seat-num=\"'+$("#"+pre).attr("seatgroup")+$("#"+pre).attr("seatno")+'">'+$("#"+pre).attr("seatgroup")+$("#"+pre).attr("seatno")+'</li>';
					    seat_html = seat_html.replace(del1,'');
					    seat_html = seat_html.replace(del2,'');
					    $("#selectedSeatNumbers1").html(seat_html);
					}
				} else if(preno != undefined && preclass != "seat_done" && premouseover == "") {
					var precheck = $("#"+pre).attr("style").split(" ")[5].split("px")[0];
					if(prepx == precheck) {
						$("#"+pre).attr("class","seat_normal");
						$("#"+pre).attr("title",$("#"+next).attr("seatgroup")+$("#"+pre).attr("seatno")+"(일반석)");
					    $("#"+pre).attr("onmouseover","BookingSeatDatas.seatMouseOver(\"seat_"+$("#"+pre).attr("seatgroup")+"_"+$("#"+pre).attr("seatno")+"_10\")");
					    $("#"+pre).attr("onmouseout","BookingSeatDatas.seatMouseOut(\"seat_"+$("#"+pre).attr("seatgroup")+"_"+$("#"+pre).attr("seatno")+"_10\")");
					    $("#"+pre).attr("onclick","BookingSeatDatas.checkSeat(this)");
					    $("#"+pre).attr("onkeypress","BookingSeatDatas.seatMouseOver(\"seat_"+$("#"+pre).attr("seatgroup")+"_"+$("#"+pre).attr("seatno")+"_10\")");
					    $("#seat_"+group+"_"+no+"_10").attr("class","seat_normal");
					    $("#seat_"+group+"_"+no+"_10").attr("title",$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"(일반석)");
					    $("#seat_"+group+"_"+no+"_10").attr("onmouseover","BookingSeatDatas.seatMouseOver(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
					    $("#seat_"+group+"_"+no+"_10").attr("onmouseout","BookingSeatDatas.seatMouseOut(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
					    $("#seat_"+group+"_"+no+"_10").attr("onclick","BookingSeatDatas.checkSeat(this)");
					    $("#seat_"+group+"_"+no+"_10").attr("onkeypress","BookingSeatDatas.seatMouseOver(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
					    selInwon -= 2;
					    var delSeat1 = $("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+',';
					    var delSeat2 = $("#"+pre).attr("seatgroup")+$("#"+pre).attr("seatno")+',';
					    selSeat = selSeat.replace(delSeat1,'');
					    selSeat = selSeat.replace(delSeat2,'');
					    $("#r_seat").attr("value",selSeat);
					    var del1 = '<li data-seat-num=\"'+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+'">'+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+'</li>';
					    var del2 = '<li data-seat-num=\"'+$("#"+pre).attr("seatgroup")+$("#"+pre).attr("seatno")+'">'+$("#"+pre).attr("seatgroup")+$("#"+pre).attr("seatno")+'</li>';
					    seat_html = seat_html.replace(del1,'');
					    seat_html = seat_html.replace(del2,'');
					    $("#selectedSeatNumbers1").html(seat_html);
					} else {
						$("#seat_"+group+"_"+no+"_10").attr("class","seat_normal");
					    $("#seat_"+group+"_"+no+"_10").attr("title",$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"(일반석)");
					    $("#seat_"+group+"_"+no+"_10").attr("onmouseover","BookingSeatDatas.seatMouseOver(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
					    $("#seat_"+group+"_"+no+"_10").attr("onmouseout","BookingSeatDatas.seatMouseOut(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
					    $("#seat_"+group+"_"+no+"_10").attr("onclick","BookingSeatDatas.checkSeat(this)");
					    $("#seat_"+group+"_"+no+"_10").attr("onkeypress","BookingSeatDatas.seatMouseOver(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
					    selInwon -= 1;
					    var delSeat1 = $("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+',';
					    selSeat = selSeat.replace(delSeat1,'');
					    $("#r_seat").attr("value",selSeat);
					    var del1 = '<li data-seat-num=\"'+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+'">'+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+'</li>';
					    seat_html = seat_html.replace(del1,'');
					    $("#selectedSeatNumbers1").html(seat_html);
					}
				} else {
					$("#seat_"+group+"_"+no+"_10").attr("class","seat_normal");
				    $("#seat_"+group+"_"+no+"_10").attr("title",$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"(일반석)");
				    $("#seat_"+group+"_"+no+"_10").attr("onmouseover","BookingSeatDatas.seatMouseOver(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
				    $("#seat_"+group+"_"+no+"_10").attr("onmouseout","BookingSeatDatas.seatMouseOut(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
				    $("#seat_"+group+"_"+no+"_10").attr("onclick","BookingSeatDatas.checkSeat(this)");
				    $("#seat_"+group+"_"+no+"_10").attr("onkeypress","BookingSeatDatas.seatMouseOver(\"seat_"+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+"_"+$("#seat_"+group+"_"+no+"_10").attr("seatno")+"_10\")");
				    selInwon -= 1;
				    var delSeat1 = $("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+',';
				    selSeat = selSeat.replace(delSeat1,'');
				    $("#r_seat").attr("value",selSeat);
				    var del1 = '<li data-seat-num=\"'+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+'">'+$("#seat_"+group+"_"+no+"_10").attr("seatgroup")+$("#seat_"+group+"_"+no+"_10").attr("seatno")+'</li>';
				    seat_html = seat_html.replace(del1,'');
				    $("#selectedSeatNumbers1").html(seat_html);

				    
				}
			
			/*
			var seatgroup = $(data).attr("seatgroup");
			var seatno = $(data).attr("seatno");
			*/
		}
}


function reserveCheck() {
	var theater = document.getElementById("theaterTemp").value;
	var scrno = document.getElementById("scrnoTemp").value;
	var start = document.getElementById("timeTemp").value;
	var test = $("#seat_A_1_10").attr("class");

	$.ajax({
		url: "seatReserveCheck.do",
		data: "theater=" + $("#theaterTemp").val() + "&scrno=" + $("#scrnoTemp").val()+"&start="+ $("#timeTemp").val(),
		dataType: "json",
		type: "GET",
		success: function(data) {
			var reserveString = data.reserveSeat;
			var reserveSplit = reserveString.split(",");
			for(var i=0; i<reserveSplit.length; i++) {
				var group = reserveSplit[i].substring(0,1);
				var no = reserveSplit[i].substring(1);
				$("#seat_"+group+"_"+no+"_10").attr("title",group+no+"(선택불가)");
				$("#seat_"+group+"_"+no+"_10").attr("class","seat_done");
				$("#seat_"+group+"_"+no+"_10").attr("onmouseover","");
				$("#seat_"+group+"_"+no+"_10").attr("onmouseout","");
				$("#seat_"+group+"_"+no+"_10").attr("onclick","");
				$("#seat_"+group+"_"+no+"_10").attr("onkeyup","");
				$("#seat_"+group+"_"+no+"_10").attr("onblur","");
				$("#seat_"+group+"_"+no+"_10").attr("onkeypress","");
				$("#seat_"+group+"_"+no+"_40").attr("title",group+no+"(선택불가)");
				$("#seat_"+group+"_"+no+"_40").attr("class","seat_done");
				$("#seat_"+group+"_"+no+"_40").attr("onmouseover","");
				$("#seat_"+group+"_"+no+"_40").attr("onmouseout","");
				$("#seat_"+group+"_"+no+"_40").attr("onclick","");
				$("#seat_"+group+"_"+no+"_40").attr("onkeyup","");
				$("#seat_"+group+"_"+no+"_40").attr("onblur","");
				$("#seat_"+group+"_"+no+"_40").attr("onkeypress","");
			}
		}
	})
}


function next() {
	var adult = $("#ticketTypeCode_01").val();
	var youth = $("#ticketTypeCode_02").val();
	var i = Number(adult) + Number(youth);
	var inwon2 = Number(seatCheck.split(",").length) - 1;
	var loginCheck = document.reserveForm.r_id.value;
	var seatCheck = document.reserveForm.r_seat.value;
	
	if(loginCheck = "") {
		alert("로그인 후 이용가능합니다.");
	} else if(seatCheck = "") {
		alert("좌석을 선택해주세요.");
	} else if(i != inwon2) {
		alert("인원만큼 좌석을 선택해주세요.");
	} else {
		document.reserveForm.submit();
	}
}
