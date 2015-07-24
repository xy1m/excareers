<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<jsp:include page="/common/header.jsp" flush="true">
	<jsp:param name="title" value="Profile Excareers" />
</jsp:include>
</head>
<link href="/static/css/fileupload.css" rel="stylesheet">
<link href="//cdn.jsdelivr.net/bootstrap.datepicker-fork/1.3.0/css/datepicker.css" rel="stylesheet">
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
						<b>Employee</b>
					</h1>
				</div>
				<div class="panel-body">
					<form id="empForm" class="form-horizontal" action="/emp/save" method="POST" role="form">
						<div class="form-group">
							<label class="col-md-2 col-xs-6 control-label">
								<spring:message code="avatar"></spring:message>
								<i class="fa fa-image fa-lg fa-fw"></i>
							</label>
							<div class="col-md-4 col-xs-6">
								<div class="thumbnail">
									<img id="preview" class="img-responsive" src="${emp.picture}"></img>
									<input type="hidden" id="picture" name="picture" value="${emp.picture }"></input>
									<input type="hidden" name="username" value="${emp.username }"></input>
									<div class="caption">
										<button id="selectBtn" class="btn btn-primary fileinput-button">
											<i class="fa fa-plus fa-lg fa-fw"></i>
											<span><spring:message code="select"></spring:message></span>
											<input id="fileupload" type="file" name="file">
										</button>
										<button id="uploadBtn" 
														class="btn btn-success" 
														data-loading-text="<i class='fa fa-refresh fa-lg fa-spin'></i>" 
														disabled="disabled">
											<i class="fa fa-upload fa-lg fa-fw"></i>
											<span><spring:message code="upload"></spring:message></span>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">Name</label>
							<div class="col-md-10">
								<input class="form-control" name="name" type="text" value="${user.name }" readonly></input>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">Company</label>
							<div class="col-md-10">
								<input class="form-control" name="companyName" type="text" value="${emp.companyName }"></input>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">Position</label>
							<div class="col-md-10">
								<input class="form-control" name="position" type="text" value="${emp.position }"></input>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">StartDate</label>
							<div class="col-xs-10">
								<div class="input-group">
									<input class="form-control datepicker" name="startDate" type="text" 
													value="<fmt:formatDate value='${emp.startDate}' pattern='yyyy-MM-dd'/>"></input>
									<div class="input-group-addon">EndDate</div>
									<input class="form-control datepicker" name="endDate" type="text" 
													value="<fmt:formatDate value='${emp.startDate}' pattern='yyyy-MM-dd'/>"></input>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">Comment</label>
							<div class="col-md-10">
								<textarea class="form-control" name="comment" rows="5">${emp.comment }</textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<button class="btn btn-danger" type="submit"><spring:message code="save"></spring:message></button>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<div class="alert hidden" role="alert"></div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/common/footer.jsp"%>

	<script src="/static/js/lib/jquery.ui.widget.js"></script>
	<script src="/static/js/lib/jquery.iframe-transport.js"></script>
	<script src="/static/js/lib/jquery.fileupload.js"></script>

	<script src="//cdn.jsdelivr.net/bootstrap.datepicker-fork/1.3.0/js/bootstrap-datepicker.min.js"></script>

	<script src="/static/js/service/employee_edit.js"></script>
</body>
</html>
