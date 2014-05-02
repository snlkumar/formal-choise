//Save brand
$(document).on("click","#save_color",function(event){
	event.preventDefault();
	var token= $('meta[name="csrf-token"]').attr('content');
	var url="colors";
	var name=$("#color_name").val();
	var status=$("input[name='status']:checked").val();
	var inputData={
		"color[name]" : name,
		"authenticity_token": token,		
		"color[status]" : status
	};
	$.post(url,inputData,function(data){
		 $(".alert").show();
		 $(".alert").empty();
		if (data.valid){		
		 $(".alert").addClass("alert-success");
		 $(".alert").html(data.message);
		 $("#color-list").empty();		
		 $("#color-list").html(data.html);
		}else{
			$(".alert").addClass("alert-error");
		    $(".alert").html("Name:"+data.message.name);
		}
		resetColorForm();
	});
});

$(document).on('click',"#edit_color",function(event){
	event.preventDefault();
	var name=$(this).attr("name");
	var status=$(this).attr("status");
	var id=$(this).attr('color_id');
	$("#color_name").val(name);
	if (status=="false"){		
		$('#inactive_status').prop('checked', true);
	}else{
		$('#active_status').prop('checked', true);
	}
	$("#color_status").val(status);
	$("#update_color").attr("color_id",id);
	$("#update_color").attr("disabled",false);
	$("#save_color").attr("disabled",true);
});
// clear form
$(document).on('click','#clear_color',function(e){
	e.preventDefault();
	resetColorForm();
	
	
});

//update brand
$(document).on("click","#update_color",function(event){
	var token= $('meta[name="csrf-token"]').attr('content');
	event.preventDefault();
	var id=$(this).attr("color_id");
	var url="colors/"+id;
	var name=$("#color_name").val();
	var status=$("input[name='status']:checked").val();
	var inputData={
		"color[name]" : name,
		"authenticity_token": token,
		"color[status]" : status
	};
			$.ajax({
		   url: url,
		   type: 'PUT',
		   data: inputData,
		   dataType: "json",
		   success: function(data) {
				 $(".alert").show();
				 $(".alert").empty();
				if (data.valid){		
				 $(".alert").addClass("alert-success");
				 $(".alert").html(data.message);
				 $("#color-list").empty();		
				 $("#color-list").html(data.html);
				}else{
					$(".alert").addClass("alert-error");
				    $(".alert").html("Name:"+data.message.name);
				}
				resetColorForm();
		   }
		});
   });
   
   
 $(document).ready(function(){ 	 	
 	resetColorForm();
 	 $(".alert").hide();
 }) ; 
   
 $(document).on("click","#delete_color",function(event){
	event.preventDefault();
	var id=$(this).attr("color_id");	
	var url="colors/"+id;	
			$.ajax({
		   url: url,
		   type: 'delete',
		   success: function(data) {
		     $(".alert").show();
				 $(".alert").empty();
				if (data.valid){		
				 $(".alert").addClass("alert-success");
				 $(".alert").html(data.message);
				 $("#color-list").empty();		
				 $("#color-list").html(data.html);
				}else{
					$(".alert").addClass("alert-error");
				    $(".alert").html("Name:"+data.message.name);
				}
				resetColorForm();
		   }
		});
   });  
   
 function resetColorForm(){
 	$("#color_name").val("");
	$('#active_status').prop('checked', true);
	$("#update_color").attr("disabled",true);
	$("#update_color").attr("color_id","");
	$("#save_color").attr("disabled",false);
 }  
