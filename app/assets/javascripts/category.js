//Save brand
$(document).on("click","#save_category",function(event){
	event.preventDefault();
	var url="categories";
	var token= $('meta[name="csrf-token"]').attr('content');
	var name=$("#category_name").val();
	var status=$("input[name='status']:checked").val();
	var inputData={
		"category[name]" : name,
		"authenticity_token": token,
		"category[status]" : status
	};
	$.post(url,inputData,function(data){
		 $(".alert").show();
		 $(".alert").empty();
		if (data.valid){		
		 $(".alert").addClass("alert-success");
		 $(".alert").html(data.message);
		 $("#category-list").empty();		
		 $("#category-list").html(data.html);
		}else{
			$(".alert").addClass("alert-error");
		    $(".alert").html("Name:"+data.message.name);
		}
		resetCategoryForm();
	});
});

$(document).on('click',"#edit_cat",function(event){
	event.preventDefault();
	var name=$(this).attr("name");
	var status=$(this).attr("status");
	var id=$(this).attr('category_id');
	$("#category_name").val(name);
	if (status=="false"){		
		$('#inactive_status').prop('checked', true);
	}else{
		$('#active_status').prop('checked', true);
	}
	$("#category_status").val(status);
	$("#update_category").attr("category_id",id);
	$("#update_category").attr("disabled",false);
	$("#save_category").attr("disabled",true);
});
// clear form
$(document).on('click','#clear_category',function(e){
	e.preventDefault();
	resetCategoryForm();
	
	
});

//update brand
$(document).on("click","#update_category",function(event){
	event.preventDefault();
	var token= $('meta[name="csrf-token"]').attr('content');
	var id=$(this).attr("category_id");
	var url="categories/"+id;
	var name=$("#category_name").val();
	var status=$("input[name='status']:checked").val();
	var inputData={
		"category[name]" : name,
		"authenticity_token": token,
		"category[status]" : status
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
				 $("#category-list").empty();		
				 $("#category-list").html(data.html);
				}else{
					$(".alert").addClass("alert-error");
				    $(".alert").html("Name:"+data.message.name);
				}
				resetCategoryForm();
		   }
		});
   });
   
   
 $(document).ready(function(){ 	 	
 	resetCategoryForm();
 	 $(".alert").hide();
 }) ; 
   
 $(document).on("click","#delete_category",function(event){
	event.preventDefault();
	var id=$(this).attr("category_id");	
	var url="categories/"+id;	
			$.ajax({
		   url: url,
		   type: 'delete',
		   success: function(data) {
		     $(".alert").show();
				 $(".alert").empty();
				if (data.valid){		
				 $(".alert").addClass("alert-success");
				 $(".alert").html(data.message);
				 $("#category-list").empty();		
				 $("#category-list").html(data.html);
				}else{
					$(".alert").addClass("alert-error");
				    $(".alert").html("Name:"+data.message.name);
				}
				resetCategoryForm();
		   }
		});
   });  
   
 function resetCategoryForm(){
 	$("#category_name").val("");
	$('#active_status').prop('checked', true);
	$("#update_category").attr("disabled",true);
	$("#update_category").attr("brand_id","");
	$("#save_category").attr("disabled",false);
 }  
