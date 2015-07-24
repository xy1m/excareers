<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="com.excareers.data.SysUsers"%>
<%
SysUsers user = (SysUsers) SecurityUtils.getSubject().getSession().getAttribute("current_user");
request.setAttribute("user",user);
%>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">ExCareers</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/n/community/articles"><spring:message code="community"></spring:message></a> </li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<shiro:guest>
						<li>
							<button class="btn btn-success navbar-btn" onclick="javascript:window.location.href='/join'">
							<spring:message code="signup"></spring:message>
							</button>
						</li>
						<li><span>&nbsp;</span> </li>
						<li>
							<button class="btn btn-default navbar-btn" onclick="javascript:window.location.href='/login'">
							<spring:message code="signin"></spring:message>
							</button>
						</li>
					</shiro:guest>
					<shiro:user>
						<li>
							<a href="#">
								<span class="glyphicon glyphicon-bell"></span>
								<span class="badge">4</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="glyphicon glyphicon-envelope"></span>
								<span class="badge">12</span>
							</a>
						</li>
						<li id="menu" class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<img class="img-rounded avatar" src="${user.avatar }"></img>
								<b class="caret"></b>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li class="dropdown-header">
									<span class="text">${user.username }</span>
								</li>
								<li class="divider"></li>
								<li>
									<a href="/profile">
										<span class="fa fa-info fa-lg fa-fw"></span>
										<spring:message code="profile"></spring:message>
									</a>
								</li>
								<li>
									<a href="/setting">
										<span class="fa fa-gear fa-lg fa-fw"></span>
										<spring:message code="setting"></spring:message>
									</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="/help">
										<span class="fa fa-question fa-lg fa-fw"></span>
										<spring:message code="help"></spring:message>
									</a>
								</li>
								<li>
									<a href="/logout">
										<span class="fa fa-sign-out fa-lg fa-fw"></span>
										<spring:message code="logout"></spring:message>
									</a>
								</li>
							</ul>
						</li>
						<li>
							<button class="btn btn-primary navbar-btn" onclick="javascript:window.location.href='/n/community/articles_add'">
								<span class="glyphicon glyphicon-edit"></span>
								<span class="text"><spring:message code="post"></spring:message></span>
							</button>
						</li>
					</shiro:user>
				</ul>
			</div>
		</div>
	</div>
