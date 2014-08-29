<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Fixed navbar -->
<div class="navbar-wrapper">
	<div class="container">
		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"></span>肥脸羊</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="/select/index"><span class="glyphicon glyphicon-search"></span>Galley</a></li>
						<li><a href="/oper/index"><span class="glyphicon glyphicon-edit"></span>上传</a></li>
						<li><a href="/linkedin/upload"><span class="glyphicon glyphicon-edit"></span>LinkedIn</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li id="loginBtn"><a href="javascript:void(0);"><script type="IN/Login" data-onAuth="showOrHide"></script></a></li>
						<li id="meBtn" class="dropdown" style="display:none">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Me<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/user/login">LinkedIn</a></li>
								<li><a href="/user/logout">Logout</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
</div>
