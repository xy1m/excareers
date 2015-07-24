<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/header.jsp" flush="true">
	<jsp:param name="title" value="Employee history ExCareers" />
</jsp:include>
</head>
<link href="/static/css/fileupload.css" rel="stylesheet">
<body>
	<%@ include file="/common/navbar.jsp"%>
	<div class="container">
		<jsp:include page="/common/navbar_profile.jsp" flush="true">
			<jsp:param name="tag" value="employee" />
		</jsp:include>
		<div class="col-md-9">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h1 class="panel-title">
						<b><spring:message code="employee_history"></spring:message></b>
						<a class="btn btn-default" href="/emp/edit">
							<span class="glyphicon glyphicon-edit"></span>
							<span class="text"><spring:message code="post"></spring:message></span>
						</a>
					</h1>
				</div>
				<div class="list-group">
				  <a href="#" class="list-group-item">
						<div class="row">
							<div class="col-md-3">
								<img class="img-circle img_200" src="https://s3-us-west-1.amazonaws.com/excareers/mole2.jpg">
							</div>
							<div class="col-md-9">
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
<!-- 				<c:forEach var="emp" items="${employeeList}" varStatus="index">
	<div class="list-group">
	  <a href="#" class="list-group-item">
			<div class="row">
				<div class="col-lg-3 text-center">
					<img class="img-circle img_160" src="${emp.picture }">
				</div>
				<div class="col-lg-9">
					<h4>${emp.company }</h4>
					<p><i class="fa fa-calendar fa-lg fa-fw"></i><span class="text">${emp.startDate }</span></p>
					<p><i class="fa fa-wrench fa-lg fa-fw"></i><span class="text">${emp.position }</span></p>
					<blockquote class="blockquote">
						${emp.comment }
					</blockquote>
				</div>
			</div>
	  </a>
	</div>
</c:forEach> -->
			</div>
		</div>
	</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>
