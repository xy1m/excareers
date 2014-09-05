<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="description" content="Share Your Employee Cad">
	<meta name="author" content="zhenpengzhang@sohu-inc.com">
	<link rel="icon" type="image/png" href="/static/img/sheep.png">
	
	<title>ShareEmpCard</title>

	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
	
	<!-- iCheck -->
	<link href="/static/iCheck-master/skins/square/red.css" rel="stylesheet">
	<!-- font-awesome -->
	<link href="http://cdn.bootcss.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	
	<link href="/static/bootstrap3.03/css/sticky-footer-navbar.css" rel="stylesheet">
	
	<link href="/static/bootstrap3.03/css/marketing.css" rel="stylesheet">
	
	<style>
		.fileinput-button {
		  position: relative;
		  overflow: hidden;
		}
		.fileinput-button input {
		  position: absolute;
		  top: 0;
		  right: 0;
		  margin: 0;
		  opacity: 0;
		  -ms-filter: 'alpha(opacity=0)';
		  font-size: 200px;
		  direction: ltr;
		  cursor: pointer;
		}
	</style>
</head>
<body>
	<div id="wrap">
	<%@ include file="/common/navbar.jsp"%>
		<div class="container marketing">