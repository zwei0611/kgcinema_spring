function video(mvs_no){
	$.ajax({
		url:"videopopup.do",
		data: "mvs_no="+mvs_no,
		dataType: "json",
		type: "GET",
		success: function(data){
			$(".layer_popup_open .jp-video video").eq(0).attr('src', '/cinema/resources/storage/' +data.mvs_video);
			
			$.magnificPopup.open({
				  items: {
				      src: '.layer_popup_open',
				      type: 'inline',
				  },
				 closeBtnInside: true
			});

		},//sucess end
		error: function(data){
			alert("실패"+data.e_no);
			console.log(data);
		}
	
	});
	
}
