<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link href="/static/bootstrap3.03/css/signin.css" rel="stylesheet">

<%@ include file="/common/header.jsp"%>
	<div class="container">
	    <form class="form-signin" role="form">
	    	<p>建议使用LinkedIn登录</p>
	    	<button class="btn btn-primary"><script type="IN/Login" data-onAuth="onLogin" data></script></button>
	     
	    </form>
    </div>
<%@ include file="/common/footer.jsp"%>

<script type="text/javascript" src="http://platform.linkedin.com/in.js">
  api_key: 75behd12ztnmus
</script>
<script>
function onLogin(){
	IN.API.Profile("me").fields(["id","first-name","last-name","picture-url","email-address","phone-numbers","last-modified-timestamp","positions:(company:(id,name))"]).result(function(result) { 
		var data = result.values[0];
		var params={};
		$.each(data,function(i,v){
			if(i == "positions" || i == "phoneNumbers"){
				params[i]=JSON.stringify(v.values);
			}else{
				params[i]=v;
			}
		});
		$.ajax({
		    type : 'POST',
		    url : "/linkedin/login?_=" + new Date().getTime(),
		    data : params ,
		    dataType : "json",
		    success : function(result) {
		    	window.location.href="/employee/write";
		    },
		    error:function(){
		    	alert('error!');
		    }
		});
	});
}
</script>
