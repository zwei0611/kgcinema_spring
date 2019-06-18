function mainEventEdit1(me_no){
	$.ajax({
		url:"maineventwrite.do",
		data: "me_no="+me_no,
		dataType: "json",
		type: "GET",
		success: function(data){
			alert("성공");
			$(".eventpopup .e_middle").html(
					"<input type="+"file"+" name="+"upload_file1"+" id="+"file1"+">"    +
					"<input type="+"hidden"+" name="+"me_file1"+" value="+"data.me_file1"+">" +
					"<input type="+"file"+" name="+"upload_file2"+" id="+"filenone"+">" +
					"<input type="+"hidden"+" name="+"me_file2"+" value="+"data.me_file2"+">"      +
					"<input type="+"file"+" name="+"upload_file3"+" id="+"filenone"+">" +
					"<input type="+"hidden"+" name="+"me_file3"+" value="+"data.me_file3"+">"      +
					"<input type="+"file"+" name="+"upload_file4"+" id="+"filenone"+">" +
					"<input type="+"hidden"+" name="+"me_file4"+" value="+"data.me_file4"+">"      +
					"<input type="+"file"+" name="+"upload_file5"+" id="+"filenone"+">" +
					"<input type="+"hidden"+" name="+"me_file5"+" value="+"data.me_file5"+">"      +
					"<input type="+"file"+" name="+"upload_file6"+" id="+"filenone"+">" +
					"<input type="+"hidden"+" name="+"me_file6"+" value="+"data.me_file6"+">"      +
					"<input type="+"file"+" name="+"upload_file7"+" id="+"filenone"+">" +
					"<input type="+"hidden"+" name="+"me_file7"+" value="+"data.me_file7"+">"      +
					"<input type="+"file"+" name="+"upload_file8"+" id="+"filenone"+">" +
					"<input type="+"hidden"+" name="+"me_file8"+" value="+"data.me_file8"+">"      +
					"<input type="+"file"+" name="+"upload_file9"+" id="+"filenone"+">" +
					"<input type="+"hidden"+" name="+"me_file9"+" value="+"data.me_file9"+">"      
			);
			
			$.magnificPopup.open({
				  items: {
				      src: '.mainEventEdit',
				      type: 'inline',
				  },
				 closeBtnInside: true
			});

		},//sucess end
		error: function(data){
			alert("실패"+data.e_no);
			console.log(data);
		}
	
	});//mainEventInsert1 end	
	
}
