	$(function () {
	    $('#fileupload').fileupload({
	    	url:"/pic/upload",
	        dataType: 'json',
	        done: function (e, data) {
	        	if(data.result.status=="success"){
	        		$.each(data.result.result, function (i, v) {
	        			$("#photoView").attr("src",v+"_z200");
                        $("#photo").val(v);
	        			$("#photo").change();
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
        $form = $('#empForm');
        $form.bootstrapValidator({
            // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                empName: {
                    message: 'The empName is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The empName is required and cannot be empty'
                        },
                        stringLength: {
                            min: 1,
                            max: 50,
                            message: 'The empName must be more than 1 and less than 50 characters long'
                        }
            /*  regexp: {
                            regexp: /^[a-zA-Z0-9]+$/,
                            message: 'The username can only consist of alphabetical and number'
                        }*/
                    }
                },
                companyId: {
                    validators: {
                        notEmpty: {
                            message: 'The company is required and cannot be empty'
                        }
                    }
                },
                companyName: {
                    validators: {
                        notEmpty: {
                            message: 'The companyName is required and cannot be empty'
                        }
                    }
                },
                status: {
                    validators: {
                        notEmpty: {
                            message: 'The status is required'
                        }
                    }
                },
                photo: {
                    excluded :false,
                    trigger:"change",
                    validators: {
                        notEmpty: {
                            message: 'The photo is required and cannot be empty'
                        }
                    }
                },
                comment: {
                    validators: {
                        notEmpty: {
                            message: 'The comment is required and cannot be empty'
                        }
                    },
                    stringLength: {
                        min: 1,
                        max: 500,
                        message: 'The comment must be more than 1 and less than 50 characters long'
                    }
                }
            }
        })
        .on('success.form.bv', function(e) {
            // Prevent form submission
            e.preventDefault();
            // Get the form instance
            var $form = $(e.target);
            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            $('#errors').addClass("hidden");

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
                if(result.status=="success"){
                    window.location.href="/select/index";
                }else{
                    $("#errors").text(result.msg);
                    $('#errors').removeClass("hidden");
                    //reset the form
                    $form.data('bootstrapValidator').resetForm();
                }
            }, 'json');
        })
        .find('input[name="status"], input[name="companyId"]')
        // Init iCheck elements
        .iCheck({
            checkboxClass: 'icheckbox_square-red',
            radioClass: 'iradio_square-red'
        })
        // Called when the radios/checkboxes are changed
        .on('ifChanged', function(e) {
            // Get the field name
            var field = $(this).attr('name');
            $form.bootstrapValidator('revalidateField', field);
        });
});
