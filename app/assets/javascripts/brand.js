//Save brand
$(document).on("click","#save_brand",function(event){
	event.preventDefault();
	var token= $('meta[name="csrf-token"]').attr('content');
	var url="brands";
	var name=$("#brand_name").val();
	var status=$("input[name='status']:checked").val();
	var inputData={
		"brand[name]" : name,
		"brand[status]" : status,
		"authenticity_token": token	
	};
	$.post(url,inputData,function(data){
		 $(".alert").show();
		 $(".alert").empty();
		if (data.valid){		
		 $(".alert").addClass("alert-success");
		 $(".alert").html(data.message);
		 $("#brand-list").empty();		
		 $("#brand-list").html(data.html);
		}else{
			$(".alert").addClass("alert-error");
		    $(".alert").html(data.message);
		}
		resetBrandForm();
	});
});

$(document).on('click',"#edit-brand",function(event){
	event.preventDefault();
	var token= $('meta[name="csrf-token"]').attr('content');
	var name=$(this).attr("name");
	var status=$(this).attr("status");
	var id=$(this).attr('brand_id');
	$("#brand_name").val(name);
	if (status=="false"){		
		$('#inactive_status').prop('checked', true);
	}else{
		$('#active_status').prop('checked', true);
	}
	$("#brand_status").val(status);
	$("#update_brand").attr("brand_id",id);
	$("#update_brand").attr("disabled",false);
	$("#save_brand").attr("disabled",true);
});
// clear form
$(document).on('click','#clear_brand',function(e){
	e.preventDefault();
	resetBrandForm();
	
	
});

//update brand
$(document).on("click","#update_brand",function(event){
	var token= $('meta[name="csrf-token"]').attr('content');
	event.preventDefault();
	var id=$(this).attr("brand_id");
	var url="brands/"+id;
	var name=$("#brand_name").val();
	var status=$("input[name='status']:checked").val();
	var inputData={
		"brand[name]" : name,
		"brand[status]" : status,
		"authenticity_token": token	
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
				 $("#brand-list").empty();		
				 $("#brand-list").html(data.html);
				}else{
					$(".alert").addClass("alert-error");
				    $(".alert").html(data.message);
				}
				resetBrandForm();
		   }
		});
   });
   
   
 $(document).ready(function(){ 	 	
 	resetBrandForm();
 	 $(".alert").hide();
 }) ; 
   
 $(document).on("click","#delete_brand",function(event){
	event.preventDefault();
    var token= $('meta[name="csrf-token"]').attr('content');
	var id=$(this).attr("brand_id");	
	var url="brands/"+id;	
			$.ajax({
		   url: url,
		   type: 'delete',
		   success: function(data) {
		     $(".alert").show();
				 $(".alert").empty();
				if (data.valid){		
				 $(".alert").addClass("alert-success");
				 $(".alert").html(data.message);
				 $("#brand-list").empty();		
				 $("#brand-list").html(data.html);
				}else{
					$(".alert").addClass("alert-error");
				    $(".alert").html(data.message);
				}
				resetBrandForm();
		   }
		});
   });  
   
 function resetBrandForm(){
 	$("#brand_name").val("");
	$('#active_status').prop('checked', true);
	$("#update_brand").attr("disabled",true);
	$("#update_brand").attr("brand_id","");
	$("#save_brand").attr("disabled",false);
 }  
