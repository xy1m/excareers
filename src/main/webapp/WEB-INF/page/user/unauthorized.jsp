<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/header.jsp" flush="true">
	<jsp:param name="title" value="unauthorized" />
</jsp:include>
</head>
<body>
	<%@ include file="/common/navbar.jsp"%>
	<div class="container">
		<div class="page-header">
			<h1>没有权限 ${e.getMessage() }</h1>
		</div>
	</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>
