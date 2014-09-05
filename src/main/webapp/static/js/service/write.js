	$(function () {
	    $('#fileupload').fileupload({
	    	url:"/pic/upload",
	        dataType: 'json',
	        done: function (e, data) {
	        	if(data.result.status=="success"){
	        		$.each(data.result.result, function (i, v) {
	        			$("#photoView").attr("src",v);
	        			$("#pictureUrl").val(v);
	        		});
	        	}else{
	        		alertMsg("alert-danger",data.result.msg);
	        	}
	        },
	        progressall: function (e, data) {
	            var progress = parseInt(data.loaded / data.total * 100, 10);
	            $('#progress .progress-bar').css('width',progress + '%');
	        }
	    });
	});
	
	$(document).ready(function() {
		$('input').iCheck({
			checkboxClass : 'icheckbox_square-red',
			radioClass : 'iradio_square-red',
			increaseArea : '20%' // optional
		});
	});
	
	function alertMsg(type,msg){
		$(".alert").removeClass().addClass("alert").addClass(type);
		$(".alert p").text(msg);
		$(".alert").show();
	}
	
	function validate(obj){
		var type = obj[0].type;
		if($.trim(obj.val())==""){
			obj.focus();
			obj.parent().addClass("has-error");
			obj.next("span").addClass("glyphicon-remove");
			alertMsg("alert-danger","Please input "+obj.attr("name"));
			return true;
		}else if((type=="textarea"&&obj.val().length> 500) || (type!="textarea"&&obj.val().length> 50)){
			obj.focus();
			obj.parent().addClass("has-error");
			obj.next("span").addClass("glyphicon-remove");
			alertMsg("alert-danger",obj.attr("name")+" too long");
			return true;
		}else{
			obj.parent().removeClass("has-error").addClass("has-success");
			obj.next("span").removeClass("glyphicon-remove").addClass("glyphicon-ok");
			$(".alert").hide();
			return false;
		}
	}
	
	$(".has-feedback .form-control").on("blur",function(){
		validate($(this));
	});
	
	$("#submitBtn").click(function(event) {
		var empname = $("#empname");
		var comment = $("#comment");
		var companyName = $("#companyName");
		var pictureUrl = $("#pictureUrl");
		if(validate(empname)){
			return;
		}
		
		var companyChecked = $("input[name='companyId']:checked");
		var statusChecked = $("input[name='status']:checked");
		
		if(companyChecked.length > 0){
			companyName.val(companyChecked.attr("data-val"));
		}
		
		if(companyName.val() == ""){
			alertMsg("alert-danger","Please choose your company");
			return;
		}
		
		if(statusChecked.length == 0){
			alertMsg("alert-danger","Please choose your work status");
			return;
		}
		if(pictureUrl.val()==""){
			alertMsg("Please upload a pictureUrl");
			return;
		}
		if(validate(comment)){
			return;
		}
		
		var btn = $("#submitBtn");
		btn.attr('disabled','disabled');
		btn.children("i").addClass("fa fa-refresh fa-spin");
		
		var params = {};
		params["empname"] = empname.val();
		params["companyId"] = companyChecked.val();
		params["companyName"] = companyName.val();
		params["status"] = statusChecked.val();
		params["comment"] = comment.val();
		params["pictureUrl"] = pictureUrl.val();
		
		$.ajax({
			type : 'POST',
			url : "/employee/add",
			dataType : 'json',
			data : params,
			success : function(data) {
				alertMsg("alert-success","success");
				window.location.href="/select/index";
			},
			error : function(data) {
				alertMsg("alert-danger","On,snap!");
			}
		}).always(function(){
			btn.removeAttr("disabled");
			btn.children("i").removeClass();
		});
	});
