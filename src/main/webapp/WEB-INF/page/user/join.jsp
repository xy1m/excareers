<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/header.jsp" flush="true">
	<jsp:param name="title" value="Sign up Excareers" />
</jsp:include>
</head>
<body>
	<%@ include file="/common/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h1 class="panel-title"><b><spring:message code="signup"></spring:message></b></h1>
					</div>
					<div class="panel-body">
						<form id="joinForm" action="/user/join" method="POST" role="form">
							<div class="form-group">
								<label for="username" class="control-label"><spring:message code="username"></spring:message></label>
								<input type="text" class="form-control" name="username"></input>
								<span class="help-block"><spring:message code="label_username"></spring:message></span>
							</div>
							<div class="form-group">
								<label for="email" class="control-label"><spring:message code="email"></spring:message></label>
								<input type="email" class="form-control" name="email"></input>
								<span class="help-block"><spring:message code="label_email"></spring:message></span>
							 </div>
							<div class="form-group">
								<label for="password" class="control-label"><spring:message code="password"></spring:message></label>
								<input type="password" class="form-control" name="password"></input>
								<span class="help-block"><spring:message code="label_password"></spring:message></span>
							</div>
							<div class="form-group">
								<label for="pwconfirm" class="control-label"><spring:message code="password"></spring:message></label>
								<input type="password" class="form-control" name="pwconfirm"></input>
							</div>
							<div class="form-group">
								<span class="help-block">
									<a href="/info/excareers-terms-of-service"><spring:message code="terms_of_service"></spring:message></a>
									<a href="/info/excareers-privacy-policy"><spring:message code="privacy_policy"></spring:message></a>
								</span>
							</div>
							<div class="form-group pull-right">
								<button class="btn btn-success" type="submit"><spring:message code="create_account"></spring:message></button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="list-group">
					<div class="list-group-item">
						<h3 class="list-group-item-heading">文案</h3> </div>
					<div class="list-group-item">
						<ul class="list-unstyled">
							<li>
								<span class="fa fa-check fa-lg fa-fw"></span>
								<span>好处1</span>
							</li>
							<li>
								<span class="fa fa-check fa-lg fa-fw"></span>
								<span>好处2</span>
							</li>
								<li><span class="fa fa-check fa-lg fa-fw"></span>
								<span>好处3</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/common/footer.jsp"%>
	<script src="/static/js/service/regist.js"></script>
</body>
</html>