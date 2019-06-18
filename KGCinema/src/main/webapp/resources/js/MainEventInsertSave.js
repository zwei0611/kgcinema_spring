function eventdetail(e_no){
	$.ajax({
		url:"eventdetail.do",
		data: "e_no="+e_no,
		dataType: "json",
		type: "GET",
		success: function(data){
			$(".eventpopup .e_title").html("<h3>"+data.e_title+"</h3>");
			$(".eventpopup .e_middle img").eq(0).attr('src', '/cinema/resources/storage/' +data.e_content);
			
			$.magnificPopup.open({
				  items: {
				      src: '.eventpopup',
				      type: 'inline',
				  },
				 closeBtnInside: true
			});

		},//sucess end
		error: function(data){
			alert("실패"+data.e_no);
			console.log(data);
		}
	
	});//eventdetail end	
	
}
