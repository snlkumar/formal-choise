//Save brand
$(document).on("click","#save_seasion",function(event){
	event.preventDefault();
	var url="seasions";
	var name=$("#seasion_name").val();
	var status=$("input[name='status']:checked").val();
	var inputData={
		"seasion[name]" : name,
		"seasion[status]" : status
	};
	$.post(url,inputData,function(data){
		 $(".alert").show();
		 $(".alert").empty();
		if (data.valid){		
		 $(".alert").addClass("alert-success");
		 $(".alert").html(data.message);
		 $("#seasion-list").empty();		
		 $("#seasion-list").html(data.html);
		}else{
			$(".alert").addClass("alert-error");
		    $(".alert").html("Name:"+data.message.name);
		}
		resetColorForm();
	});
});

$(document).on('click',"#edit_seasion",function(event){
	event.preventDefault();
	var name=$(this).attr("name");
	var status=$(this).attr("status");
	var id=$(this).attr('seasion_id');
	$("#seasion_name").val(name);
	if (status=="false"){		
		$('#inactive_status').prop('checked', true);
	}else{
		$('#active_status').prop('checked', true);
	}
	$("#seasion_status").val(status);
	$("#update_seasion").attr("seasion_id",id);
	$("#update_seasion").attr("disabled",false);
	$("#save_seasion").attr("disabled",true);
});
// clear form
$(document).on('click','#clear_seasion',function(e){
	e.preventDefault();
	resetColorForm();
	
	
});

//update brand
$(document).on("click","#update_seasion",function(event){
	event.preventDefault();
	var id=$(this).attr("seasion_id");
	var url="seasions/"+id;
	var name=$("#seasion_name").val();
	var status=$("input[name='status']:checked").val();
	var inputData={
		"seasion[name]" : name,
		"seasion[status]" : status
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
				 $("#seasion-list").empty();		
				 $("#seasion-list").html(data.html);
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
   
 $(document).on("click","#delete_seasion",function(event){
	event.preventDefault();
	var id=$(this).attr("seasion_id");	
	var url="seasions/"+id;	
			$.ajax({
		   url: url,
		   type: 'delete',
		   success: function(data) {
		     $(".alert").show();
				 $(".alert").empty();
				if (data.valid){		
				 $(".alert").addClass("alert-success");
				 $(".alert").html(data.message);
				 $("#seasion-list").empty();		
				 $("#seasion-list").html(data.html);
				}else{
					$(".alert").addClass("alert-error");
				    $(".alert").html("Name:"+data.message.name);
				}
				resetColorForm();
		   }
		});
   });  
   
 function resetColorForm(){
 	$("#seasion_name").val("");
	$('#active_status').prop('checked', true);
	$("#update_seasion").attr("disabled",true);
	$("#update_seasion").attr("seasion_id","");
	$("#save_seasion").attr("disabled",false);
 }  
