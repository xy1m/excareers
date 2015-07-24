$(function() {
  // File upload
	$('#fileupload').fileupload({
		url : "/upload/avatar",
		dataType : 'json',
        autoUpload: false,
        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
        maxFileSize: 999000,
        disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator.userAgent),
        previewMaxWidth: 200,
        previewMaxHeight: 200,
        previewCrop: true,
        add : function(e, data) {
        	e.preventDefault();
			previewFile(data.files[0]);
			$('#uploadBtn').prop('disabled','').on('click',function(e){
				e.preventDefault();
				uploadLoading();
				data.submit();
			});
		},
		done : function(e, data) {
			e.preventDefault();
			if (data.result.status == "success") {
				$("#picture").val(data.result.img);
				$(".alert").removeClass().addClass("alert alert-success").text("Upload Success");
			} else {
				$(".alert").removeClass().addClass("alert alert-danger").text("Upload Fail");
			}
			uploadReset();
		}
	});
  // date time picker binding
  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd'
  });
});

function uploadLoading(){
  $('#selectBtn').button('loading');
  $('#uploadBtn').button('loading');
}
function uploadReset(){
  $('#selectBtn').button('reset');
  $('#uploadBtn').button('reset');
}
function previewFile(file){
  var img = document.getElementById("preview");
  img.file = file;
  var reader = new FileReader();
  reader.onload = (function(aImg){
    return function(e){
      aImg.src = e.target.result;
    };
  })(img);
  reader.readAsDataURL(file);
}

function format(time, format){
  var t = new Date(time);
  var tf = function(i){return (i < 10 ? '0' : '') + i;};
  return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a){
    switch(a){
      case 'yyyy': return tf(t.getFullYear());
      case 'MM': return tf(t.getMonth()+1);
      case 'mm': return tf(t.getMinutes());
      case 'dd': return tf(t.getDate());
      case 'HH': return tf(t.getHours());
      case 'ss': return tf(t.getSeconds());
    }
  });
}

function dateformat(val) {
  return format(val,'yyyy/MM/dd HH:mm:ss');
}

//work with jQuery 1.x
$.fn.serializeObject=function(){
  var obj={};
  $.each(this.serializeArray(),function(index,param){
    if(!(param.name in obj)){
      obj[param.name]=param.value;
    }
  });
  return obj;
};

$(document).ready(function() {
    $('#empForm').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
    	exclued: [':disabled', ':hidden', ':not(:visible)'],
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        live: "enabled",
        message: "This value is not valid",
        submitButtons: [type="submit"],
        submitHandler: function(validator, form, submitButton){
          var params=form.serializeObject();
    			$.ajax({
    				type : "POST",
    				url : form.attr('action'),
    				data : params,
            dataType: "json",
    				success : function(result) {
    					if(result.status=="success"){
    						$(".alert").removeClass().addClass("alert alert-success").text("Save success");
    					}else{
    						$(".alert").removeClass().addClass("alert alert-danger").text("Save fail");
    					}
    				},
    				error : function(result){
    					$(".alert").removeClass().addClass("alert alert-danger").text("Server side error.");
    				}
    			});
        },
        threshold:null,
        trigger:"blur",
        fields: {

        }
    });
});


