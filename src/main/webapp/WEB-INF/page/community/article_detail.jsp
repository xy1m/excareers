<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/header.jsp" flush="true">
	<jsp:param name="title" value="Employee history ExCareers" />
</jsp:include>
<link rel="stylesheet" href="/static/css/blog.css"></link>
</head>

<body>
	<%@ include file="/common/navbar.jsp"%>
	<div class="container">
		<div class="col-md-9">
			<div class="posts">
				<div class="blog-post">
					<h2 class="blog-post-title">Greater control over forks of your private repositories</h2>
					<ul class="blog-post-meta">
						<li class="meta-item"><span class="fa fa-calendar fa-lg fa-fw"></span>2015-01-10 00:00:00</li>
						<li class="meta-item">
						<img class="avatar" src="/static/img/sheep.png"></img>
						<a href="#">zhangzhpeng</a></li>
						<li class="meta-item"><span class="fa fa-folder fa-lg fa-fw"></span>All</li>
					</ul>
					<ul class="blog-post-tags">
						<li class="tag-item"><span class="fa fa-tags"></span></li>
						<li class="tag-item"><a href="#" class="label label-info">标签</a></li>
						<li class="tag-item"><a href="#" class="label label-info">标签</a></li>
						<li class="tag-item"><a href="#" class="label label-info">标签</a></li>
						<li class="tag-item"><a href="#" class="label label-info">标签</a></li>
					</ul>
					<p class="blog-post-body">Previously, if you removed collaborator permissions from someone contributing to a private repository on your personal account, that person would retain their fork (if they had created one).
Today, we're changing that behavior: if you remove a collaborator's permissions from one of your private repositories, their fork will be deleted, giving you greater control over access to your private code. This matches the behavior of organization-owned forks, which hasn't changed.</p>
<img class="img-responsive thumbnail" src="https://cloud.githubusercontent.com/assets/72919/8550515/dfcf3b52-2485-11e5-8c0b-479f4bdf8573.jpg"></img>
				</div>
			</div>
			

			<!-- comment begin-->
			<div class="comments">
				<div class="comment row">
					<div class="col-xs-3">
						<ul class="list-unstyled">
							<li class="comment-avatar">
								<img class="img-circle" src="/static/img/default.png"></img>
							</li>
							<li class="comment-user">zhangzhpeng</li>
						</ul>
					</div>
					<div class="col-xs-9">
						<div class="comment-body">
							<p>The apartment is beautiful, cosy and clean, just like in the pictures. The location was perfect for people who want to do some sightseeing because the metro station is about 3 minutes away. The neighbourhood is also very friendly. There are some good restaurants, bakeries and shops. Claudia is a lovely and helpful person. She gave us a lot of useful tips we needed. It was good to have such a host. Thank you Claudia! :)</p>
						</div>
						<div class="comment-time">2015-01-10 00:00:00</div>
					</div>
				</div>

				<div class="comment row">
					<div class="col-xs-3">
						<ul class="list-unstyled">
							<li class="comment-avatar">
								<img class="img-circle" src="/static/img/default.png"></img>
							</li>
							<li class="comment-user">zhangzhpeng</li>
						</ul>
					</div>
					<div class="col-xs-9">
						<div class="comment-body">
							<p>The apartment is beautiful, cosy and clean, just like in the pictures. The location was perfect for people who want to do some sightseeing because the metro station is about 3 minutes away. The neighbourhood is also very friendly. There are some good restaurants, bakeries and shops. Claudia is a lovely and helpful person. She gave us a lot of useful tips we needed. It was good to have such a host. Thank you Claudia! :)</p>
						</div>
						<div class="comment-time">2015-01-10 00:00:00</div>
					</div>
				</div>

			</div>
			<!-- comment end-->

			<nav>
			  <ul class="pagination">
			    <li class="disabled"><a href="#"><span aria-hidden="true">Previous</span></a></li>
			    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li><a href="#"><span aria-hidden="true">Next</span></a></li>
			  </ul>
			</nav>
		</div>
		<jsp:include page="/common/navbar_articles.jsp" flush="true"/>
	</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>
