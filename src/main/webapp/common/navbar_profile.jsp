<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

		<div class="col-md-3">
			<div class="panel panel-default">
				<div class="panel-heading">
					<spring:message code="personal_information"></spring:message>
				</div>
				<div class="panel-body">
					<ul class="nav nav-pills nav-stacked">
						<li role="presentation"
							<c:if test="${param.tag=='profile'}">class="active"</c:if>>
							<a href="/profile"><spring:message code="profile"></spring:message></a>
						</li>
						<li role="presentation"
							<c:if test="${param.tag=='employee'}">class="active"</c:if>>
							<a href="/employees"><spring:message code="employee"></spring:message></a>
						</li>
						<li role="presentation"
							<c:if test="${param.tag=='setting'}">class="active"</c:if>>
							<a href="/setting">Setting</a>
						</li>
						<li role="presentation"
							<c:if test="${param.tag=='employee_edit'}">class="active"</c:if>>
							<a href="#">Employee edit</a>
						</li>
						<li role="presentation"
							<c:if test="${param.tag=='employee_info'}">class="active"</c:if>>
							<a href="#">Employee Info</a>
						</li>
					</ul>
				</div>
			</div>
		</div>