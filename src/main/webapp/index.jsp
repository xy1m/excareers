<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/common/header.jsp"%>
<div class="row">
	<c:forEach var="i" items="${result}" varStatus="index">
		<div class="col-lg-4">
			<img class="img-circle"
				src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
				alt="张振鹏-搜狐" style="width: 200px; height: 200px;">
			<h2>张振鹏</h2>
			<p>感谢在最美好的年华遇见了你</p>
			<p>
				<a class="btn btn-primary" href="#" role="button">详情 &raquo;</a>
			</p>
		</div>
	</c:forEach>
</div>
<!-- /.row -->
<%@ include file="/common/footer.jsp"%>