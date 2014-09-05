<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="javascript:void(0);"><span class="glyphicon glyphicon-home"></span>ShareEmpCard(Beta)</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="/select/index"><span class="glyphicon glyphicon-search"></span>Gallery</a></li>
						<li><a href="/employee/write"><span class="glyphicon glyphicon-edit"></span>Upload</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li id="loginBtn"><a href="/user/login">登录</li>
						<li id="meBtn" class="dropdown hidden">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Me<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/user/logout">Logout</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>