<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/header.jsp" flush="true">
	<jsp:param name="title" value="找不到页面啦" />
</jsp:include>
<body>
	<div id="wrap">
		<%@ include file="/common/navbar.jsp"%>
		<div class="jumbotron text-center">
			<h1>404</h1>
			<p>找不到页面啦</p>
			<img src="http://resignwall.qiniudn.com/4926fd65jw1elp1i6ptctg208h06ox6p.gif"/>
		</div>
	</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>