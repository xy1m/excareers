<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/common/header.jsp"%>
	<div class="jumbotron">
	  <div class="container-fluid">
		<h1>工牌都到碗里来！</h1>
		<p>晒晒你曾经工作过的地方...</p>
	  </div>
	</div>
	<div class="row">
		<c:forEach var="i" items="${result}" varStatus="index">
		<c:if test="${index.index%3==0}">
		</div>
		<div class="row">
		</c:if>
			<div class="col-lg-4">
				<img class="img-circle" src="${i.pic }_z200" alt="${i.name }-${i.companyName}" style="width: 200px; height: auto;"
				onerror="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
				>
				<div class="caption">
					<h3>${i.name }</h3>
					<p>${i.comment }</p>
					<p><span class="label label-warning">${i.companyName }</span></p>
					<p><a class="btn btn-default" href="#" role="button">详情</a></p>
				</div>
			</div>
		</c:forEach>
	</div>
<%@ include file="/common/footer.jsp"%>