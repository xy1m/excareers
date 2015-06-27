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
			<a class="navbar-brand" href="/"><span class="glyphicon glyphicon-home"></span></a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="/employee/index">gallery</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li id="menu" class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">zhenpeng<b class="caret"></b></a>
					<ul class="dropdown-menu" role="menu">
            <li class="dropdown-header">myself</li>
						<li><a href="/user/login"> <span class=""></span>login</a></li>
						<li><a href="/employee/write"> <span class="glyphicon glyphicon-edit"></span>edit</a></li>
						<li><a href="/n/skill/tree">skilltree</a></li>
						<li class="divider"></li>
						<li><a href="/user/logout">logout</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>