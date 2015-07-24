<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

		<div class="col-md-3">
			<div class="panel panel-default">
				<div class="panel-heading">Categroies</div>
				<div class="panel-body">
					<ul class="nav nav-pills nav-stacked">
						<li role="presentation"
							<c:if test="${cate==null || cate=='all'}">class="active"</c:if>>
							<a href="?cate=all">All</a>
						</li>
						<li role="presentation"
							<c:if test="${cate=='careers'}">class="active"</c:if>>
							<a href="?cate=careers">Careers</a>
						</li>
						<li role="presentation"
							<c:if test="${cate=='technology'}">class="active"</c:if>>
							<a href="?cate=technology">Technology</a>
						</li>
						<li role="presentation"
							<c:if test="${cate=='activity'}">class="active"</c:if>>
							<a href="?cate=activity">Activity</a>
						</li>
					</ul>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">Tags</div>
				<div class="panel-body">
					
				</div>
			</div>
		</div>
