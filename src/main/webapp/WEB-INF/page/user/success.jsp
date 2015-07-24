<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/header.jsp" flush="true">
	<jsp:param name="title" value="success" />
</jsp:include>
</head>
<body>
	<%@ include file="/common/navbar.jsp"%>
	<div class="container">
		${username } 恭喜您创建用户成功 <a href="/login">登录</a>
	</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>
