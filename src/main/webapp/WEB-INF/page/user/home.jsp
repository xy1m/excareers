<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/common/header.jsp" flush="true">
	<jsp:param name="title" value="Homepage Excareers" />
</jsp:include>
</head>
<body>
	<%@ include file="/common/navbar.jsp"%>
	<div class="container">
		<shiro:principal />的主页
	</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>
