<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/common/header.jsp"%>
<div class="row">
	<c:forEach var="i" items="${result}" varStatus="index">
		<div class="col-lg-4">
			<div class="thumbnail">
				<img class="img-circle" src="${i.pic }" alt="${i.name }-${i.companyName}" style="width: 200px; height: auto;">
				<div class="caption">
					<h2>${i.name }</h2>
					<p>${i.comment }</p>
					<p><img class="img-thumbnail" src="${i.companyLogo }" alt="${i.name }-${i.companyName}" style="width: 100px; height: auto;">
					</p>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<!-- /.row -->
<%@ include file="/common/footer.jsp"%>