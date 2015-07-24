<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/header.jsp" flush="true">
	<jsp:param name="title" value="ExCareers" />
</jsp:include>
</head>
<link href="/static/css/carousel.css" rel="stylesheet">
<body>
	<%@ include file="/common/navbar.jsp"%>
	<!-- Carousel
  ================================================== -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class=""></li>
			<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="2" class=""></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item">
				<img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Excarrers in Google"></img>
				<div class="container">
					<div class="carousel-caption">
						<a class="btn btn-lg btn-primary" href="/company/google" role="button">Google Excareers</a>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Excarrers in Facebook">
				<div class="container">
					<div class="carousel-caption">
						<a class="btn btn-lg btn-primary" href="/company/facebook" role="button">Facebook Excareers</a>
					</div>
				</div>
			</div>
			<div class="item active">
				<img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Excareers in Amazon">
				<div class="container">
					<div class="carousel-caption">
						<a class="btn btn-lg btn-primary" href="/company/amazon" role="button">Amazon Excareers</a>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> <span class="sr-only">Previous</span> </a>
		<a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> <span class="sr-only">Next</span> </a>
	</div>
	<!-- /.carousel -->
	
	<div class="container marketing">
		<!-- Three columns of text below the carousel -->
		<div class="row">
			<div class="col-lg-4">
				<img class="img-circle img_160" src="http://resignwall.qiniudn.com/Beta1-cf57c8f5-c1c5-4e8c-bcaf-a47ba3d84954.jpg_z200">
				<a class=" btn-default" href="#" role="button"><h2>张振鹏</h2></a>
				<p><i class="fa fa-wrench fa-lg fa-fw"></i>Software Engineer</p>
				<p>Designed and developed didipai.com</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="img-circle img_160" src="http://resignwall.qiniudn.com/%E4%BB%98%E5%86%89-Oracle-7a355537-52b0-454e-bf2c-f43683cd54d7..jpg_z200">
				<a class=" btn-default" href="#" role="button"><h2>付冉</h2></a>
				<p><i class="fa fa-wrench fa-lg fa-fw"></i>Software Engineer</p>
				<p>Being charge of Oracle china</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="img-circle img_160" src="http://resignwall.qiniudn.com/Beta1-0289041e-2cae-42ce-bbd1-ea04564dd8ce.jpg_z200">
				<a class=" btn-default" href="#" role="button"><h2>李文强</h2></a>
				<p><i class="fa fa-wrench fa-lg fa-fw"></i>Software Engineer</p>
				<p>Developed CET project 2.0</p>
			</div>
			<!-- /.col-lg-4 -->
		</div>
		<!-- /.row -->
	</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>
