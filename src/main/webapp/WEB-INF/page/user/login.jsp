<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/header.jsp" flush="true">
	<jsp:param name="title" value="Sign in Excareers" />
</jsp:include>
</head>
<body>
	<%@ include file="/common/navbar.jsp"%>
	<div class="container">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h1 class="panel-title">
						<b><spring:message code="signin"></spring:message></b>
					</h1>
				</div>
				<div class="panel-body">
					<form id="loginForm" action="" method="POST" role="form">
						<div class="form-group">
							<label><spring:message code="username"></spring:message></label>
							<div class="input-group">
								<span class="input-group-addon">
									<i class="fa fa-envelope-o fa-fw"></i>
								</span>
								<input class="form-control" name="username" type="text" placeholder="<spring:message code="username"></spring:message>"></input>
							</div>
						</div>
						<div class="form-group">
							<label><spring:message code="password"></spring:message>
								<a href="/user/forget-password">(<spring:message code="forget_password"></spring:message>)</a>
							</label>
							<div class="input-group">
								<span class="input-group-addon">
									<i class="fa fa-key fa-fw"></i>
								</span>
								<input class="form-control" name="password" type="password" placeholder="<spring:message code="password"></spring:message>"></input>
							</div>
						</div>
						<div class="form-group pull-left">
							<button class="btn btn-success" type="submit"><spring:message code="signin"></spring:message></button>
							<script type="IN/Login" data-onAuth="onLogin"></script>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/common/footer.jsp"%>
	<script src="/static/js/service/login.js"></script>
	<script type="text/javascript" src="http://platform.linkedin.com/in.js">
		api_key: 75behd12ztnmus
	</script>
	<script src="/static/js/service/linkedinLogin.js"></script>
</body>
</html>
