<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/header.jsp" flush="true">
	<jsp:param name="title" value="Profile Excareers" />
</jsp:include>
</head>
<link href="/static/css/fileupload.css" rel="stylesheet">
<body>
	<%@ include file="/common/navbar.jsp"%>
	<div class="container">
		<jsp:include page="/common/navbar_profile.jsp" flush="true">
			<jsp:param name="tag" value="profile" />
		</jsp:include>
		<div class="col-md-9">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h1 class="panel-title">
						<b><spring:message code="public_info"></spring:message></b>
					</h1>
				</div>
				<div class="panel-body">
					<form id="profileForm" class="form-horizontal" action="/modify_profile" method="POST" role="form">
						<div class="form-group">
							<label class="col-md-2 col-xs-6 control-label">
								<spring:message code="avatar"></spring:message>
								<i class="fa fa-image fa-lg fa-fw"></i>
							</label>
							<div class="col-md-4 col-xs-6">
								<div class="thumbnail">
									<img id="preview" class="img-responsive" src="${user.avatar }"></img>
									<input type="hidden" id="avatar" name="avatar" value="${user.avatar }"></input>
									<input type="hidden" name="username" value="${user.username }"></input>
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
							<label class="col-md-2 control-label">
								<spring:message code="email"></spring:message>
								<i class="fa fa-envelope fa-lg fa-fw"></i>
							</label>
							<div class="col-md-10">
								<input class="form-control" name="email" type="text" value="${user.email }" readonly></input>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">
								<spring:message code="name"></spring:message>
								<i class="fa fa-user fa-lg fa-fw"></i>
							</label>
							<div class="col-md-10">
								<input class="form-control" name="name" type="text" value="${user.name }"></input>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">
								<spring:message code="phone"></spring:message>
								<i class="fa fa-phone fa-lg fa-fw"></i>
							</label>
							<div class="col-md-10">
								<input class="form-control" name="phone" type="text" value="${user.phone }"></input>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">
								<spring:message code="address"></spring:message>
								<i class="fa fa-map-marker fa-lg fa-fw"></i>
							</label>
							<div class="col-md-10">
								<input class="form-control" name="address" type="text" value="${user.address }"></input>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">
								<spring:message code="introduce"></spring:message>
							</label>
							<div class="col-md-10">
								<textarea class="form-control" name="introduce" rows="5">${user.introduce }</textarea>
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
	<script src="/static/js/service/profile.js"></script>
</body>
</html>
