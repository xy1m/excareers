<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/common/header.jsp" flush="true">
	<jsp:param name="title" value="404" />
</jsp:include>
<body>
		<%@ include file="/common/navbar.jsp"%>
			<div class="jumbotron">
				<div class="text-center">
				  <h1>404</h1>
				  <p>The requested URL was not found on this server.</p>
				  <p><footer>Thas is all we know.</footer></p>
				  <p><a class="btn btn-primary btn-lg" href="/" role="button">Return home</a></p>
				</div>
			</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>