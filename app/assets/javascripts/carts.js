$(document).on("click","#add_to_cart",function(event){
	event.preventDefault();
	var url=$(this).attr("href");
	var token= $('meta[name="csrf-token"]').attr('content');
var data={
		"authenticity_token": token		
	};
	$.post(url,data,function(data){
		$("#user_cart").empty();
		$("#user_cart").html(data);		
	});
	
});
