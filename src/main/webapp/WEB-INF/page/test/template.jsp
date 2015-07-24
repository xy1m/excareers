<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/header.jsp" flush="true">
	<jsp:param name="title" value="Employee history ExCareers" />
</jsp:include>
</head>
<link href="/static/css/fileupload.css" rel="stylesheet">
<style>
.img160 {
width:160px;
height:160px;
bolder:1px;
}
</style>
<body>
	<%@ include file="/common/navbar.jsp"%>
	<div class="container">
		<jsp:include page="/common/nav_left.jsp" flush="true">
			<jsp:param name="pos" value="employee" />
		</jsp:include>
		<div class="col-md-9">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h1 class="panel-title">
						<b><spring:message code="employee_history"></spring:message></b>
					</h1>
				</div>
				<div class="list-group">
				  <a href="#" class="list-group-item">
						<div class="row">
							<div class="col-lg-3 text-center">
								<img class="img-circle img160" src="https://s3-us-west-1.amazonaws.com/excareers/mole2.jpg">
							</div>
							<div class="col-lg-9">
								<h4>SOHU.com</h4>
								<p><i class="fa fa-calendar fa-lg fa-fw"></i><span class="text">2013-08</span></p>
								<p><i class="fa fa-wrench fa-lg fa-fw"></i><span class="text">Software Engineer</span></p>
								<blockquote class="blockquote">
									SOHU is a nice company,SOHU is a nice company,SOHU is a nice company,SOHU is a nice company
								</blockquote>
							</div>
						</div>
				  </a>
				</div>
				<div class="list-group">
				  <a href="#" class="list-group-item">
						<div class="row">
							<div class="col-lg-3 text-center">
								<img class="img-circle img160" src="https://s3-us-west-1.amazonaws.com/excareers/zhangzhpeng_286c9ae3-b616-4b9c-a0ed-1abc3b311989">
							</div>
							<div class="col-lg-9">
								<h4>Thunisoft</h4>
								<p><i class="fa fa-calendar fa-lg fa-fw"></i><span class="text">2011-04</span></p>
								<p><i class="fa fa-magic fa-lg fa-fw"></i><span class="text">Designer</span></p>
								<blockquote class="blockquote">
									SOHU is a nice company,SOHU is a nice company,SOHU is a nice company,SOHU is a nice company
								</blockquote>
							</div>
						</div>
				  </a>
				</div>
				<div class="list-group">
				  <a href="#" class="list-group-item">
						<div class="row">
							<div class="col-lg-3 text-center">
								<img class="img-circle img160" src="https://s3-us-west-1.amazonaws.com/excareers/zhangzhpeng_286c9ae3-b616-4b9c-a0ed-1abc3b311989">
							</div>
							<div class="col-lg-9">
								<h4>Jilin</h4>
								<p><i class="fa fa-calendar fa-lg fa-fw"></i><span class="text">2007-09</span></p>
								<p><i class="fa fa-bomb fa-lg fa-fw"></i><span class="text">Producter</span></p>
								<blockquote class="blockquote">
									SOHU is a nice company,SOHU is a nice company,SOHU is a nice company,SOHU is a nice company
								</blockquote>
							</div>
						</div>
				  </a>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>
