<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link href="/static/bootstrap3.03/css/marketing.css" rel="stylesheet">

<%@ include file="/common/header.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<blockquote>
			  <h2>All is riddle,and the key to a riddle is another riddle...</h2>
			  <footer class="text-right">Emerson </footer>
			</blockquote>
		</div>
	</div>
	<div class="container marketing">
		<div class="row">
			<c:forEach var="i" items="${result}" varStatus="index">
			<c:if test="${index.index%3==0}">
			</div>
			<div class="row">
			</c:if>
				<div class="col-lg-4">
					<img class="img-circle" src="${i.pic }_z200" alt="${i.name }-${i.companyName}" style="width: 200px; height: auto;">
					<div class="caption">
						<h3>${i.name }</h3>
						<p>${i.comment }</p>
						<p><span class="label label-primary">${i.companyName}</span></p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
<%@ include file="/common/footer.jsp"%>