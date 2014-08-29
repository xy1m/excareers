<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
</div>
</div>
<footer class="footer">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<h4>关于</h4>
				<ul class="list-unstyled">
					<li><a target="_blank" href="javascript:void(0);">关于我们</a></li>
					<li><a target="_blank" href="javascript:void(0);">广告合作</a></li>
				</ul>
			</div>
			<div class="col-md-4">
				<h4>友情链接</h4>
				<ul class="list-unstyled">
					<li><i class="fa fa-link"></i> <a target="_blank"
						href="http://v3.bootcss.com/">Bootstrap中文网</a></li>
					<li><i class="fa fa-link"></i> <a target="_blank"
						href="http://glyphicons.com/">Glyphicons</a></li>
					<li><i class="fa fa-link"></i> <a target="_blank"
						href="http://open.bootcss.com/">OpenCDN</a></li>
					<li><i class="fa fa-link"></i> <a target="_blank"
						href="http://fontawesome.io/">Font-awesome</a></li>
					<li><i class="fa fa-link"></i> <a target="_blank"
						href="http://www.qiniu.com/">七牛云存储</a></li>
				</ul>
			</div>
			<div class="col-md-4">
				<h4>联系方式</h4>
				<ul class="list-unstyled">
					<li><i class="fa fa-envelope"></i> Email:<a
						href="mailto:zhangzhpeng@gmail.com">zhangzhpeng</a></li>
					<li><i class="fa fa-twitter"></i> Twitter:<a target="_blank"
						href="https://twitter.com/zhangzhpeng">@zhangzhpeng</a></li>
					<li><i class="fa fa-weibo"></i> Weibo:<a target="_blank"
						href="http://weibo.com/barbabravo/">@barbabravo</a></li>
					<li><i class="fa fa-wrench"></i> Work:<a target="_blank"
						href="http://www.auto.sohu.com/">搜狐汽车</a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<p class="text-center">&copy;Copyright 2014 FatFaceSheep. All
				rights reserved.</p>
		</div>
	</div>
</footer>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="/static/iCheck-master/icheck.min.js"></script>
<script src="/static/bootstrap-wysiwyg-master/bootstrap-wysiwyg.js"></script>
<script
	src="/static/bootstrap-wysiwyg-master/external/jquery.hotkeys.js"></script>
</body>
</html>
<script type="text/javascript" src="http://platform.linkedin.com/in.js">
  api_key: 75behd12ztnmus
</script>
<script>
function showOrHide(){
	IN.API.Profile("me").result(function(result) { 
	 var me = result.values[0];
	 var id =me.id;
	 var firstName = me.firstName;
	 var secondName = me.secondName;
	 var pictureUrl = me.pictureUrl;
	 var params={};
	  $.ajax({
	      type : 'POST',
	      url : "/user/login4linkedin?_=" + new Date().getTime(),
	      data : result.values[0],
	      dataType : "json",
	      success : function(result) {
	      	alert('success!');
	      },
	      error:function(){
	      	alert('error!');
	      }
	  });
	});
	
	$("#loginBtn").hide();
	$("#meBtn").show();
}
</script>
