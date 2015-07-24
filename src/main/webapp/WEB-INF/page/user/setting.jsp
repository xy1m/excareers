<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/header.jsp" flush="true">
	<jsp:param name="title" value="Setting Excareers" />
</jsp:include>
</head>
<body>
	<%@ include file="/common/navbar.jsp"%>
	<div class="container">
    <jsp:include page="/common/navbar_profile.jsp" flush="true">
      <jsp:param name="tag" value="setting" />
    </jsp:include>
		<shiro:principal />
		的设置
	</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>
