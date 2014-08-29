<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/common/header.jsp"%>
<form id="emp-form" class="form-horizontal" role="form"
	action="/oper/upload" method="POST" enctype="multipart/form-data">
	<fieldset class="well">
		<div class="form-group">
			<label for="empname" class="col-md-2 control-label">姓名</label>
			<div class="col-md-4">
				<input type="text" class="form-control" name="empname" id="name"
					placeholder="姓名" value="${firstName } ${lastName}"></input>
			</div>
		</div>
		<img src="${pictureUrl }"></img>
		<div class="form-group">
			<label for="companyId" class="col-md-2 control-label">公司</label>
			<div class="controls col-md-10">
				<ul class="list-inline">
					<c:forEach var="i" items="${result}" varStatus="index">
						<li><input type="radio" name="companyId" value="${i.id }"
							data-val="${i.name}"></input> <label>${i.name }</label></li>
					</c:forEach>
				</ul>
			</div>
			<input type="hidden" name="companyName" id="companyName"></input>
		</div>
		<div class="form-group">
			<label for="companyId" class="col-md-2 control-label">状态</label>
			<div class="controls col-md-4">
				<input type="radio" name="status" value="1"></input> <label
					for="status">在职</label> <input type="radio" name="status" value="0"></input>
				<label for="status">离职</label>
			</div>
		</div>
		<div class="form-group">
			<label for="empno" class="col-md-2 control-label">工号</label>
			<div class="col-md-4">
				<input type="text" class="form-control" name="empno"
					placeholder="工号"></input>
			</div>
		</div>
		<div class="form-group">
			<label for="pic" class="col-md-2 control-label">照片</label>
			<div class="col-md-4">
				<a class="btn btn-default"><i class="fa fa-picture-o"></i> <input
					type="file" name="pic"
					style="opacity: 0; position: absolute; top: 0px; left: 0px; width: 40px; height: 30px;"></input>
				</a>
			</div>
		</div>
		<div class="form-group">
			<label for="comment" class="col-md-2 control-label">评论</label>
			<div class="col-md-10">
				<div id="editor"></div>
				<div class="btn-toolbar" data-role="editor-toolbar"
					data-target="#editor">
					<div class="btn-group">
						<a class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
							<li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
							<li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
						</ul>
					</div>
					<div class="btn-group">
						<a class="btn btn-default" data-edit="bold"
							title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a> <a
							class="btn btn-default" data-edit="italic"
							title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a> <a
							class="btn btn-default" data-edit="strikethrough"
							title="Strikethrough"><i class="fa fa-strikethrough"></i></a> <a
							class="btn btn-default" data-edit="underline"
							title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
					</div>
					<div class="btn-group">
						<a class="btn btn-default" data-edit="insertunorderedlist"
							title="Bullet list"><i class="fa fa-list-ul"></i></a> <a
							class="btn btn-default" data-edit="insertorderedlist"
							title="Number list"><i class="fa fa-list-ol"></i></a> <a
							class="btn btn-default" data-edit="outdent"
							title="Reduce indent (Shift+Tab)"><i class="fa fa-outdent"></i></a>
						<a class="btn btn-default" data-edit="indent" title="Indent (Tab)"><i
							class="fa fa-indent"></i></a>
					</div>
					<div class="btn-group">
						<a class="btn btn-default" data-edit="justifyleft"
							title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
						<a class="btn btn-default" data-edit="justifycenter"
							title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
						<a class="btn btn-default" data-edit="justifyright"
							title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
						<a class="btn btn-default" data-edit="justifyfull"
							title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
					</div>
					<!-- 添加链接、图片暂时去除 -->
					<!-- 					<div class="btn-group">
						<a class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							title="Hyperlink"><i class="fa fa-link"></i></a>
						<div class="dropdown-menu input-append">
							<input class="span2" placeholder="URL" type="text"
								data-edit="createLink" />
							<button class="btn btn-default" type="button">Add</button>
						</div>
						<a class="btn btn-default" data-edit="unlink"
							title="Remove Hyperlink"><i class="fa fa-cut"></i></a>
						<a class="btn btn-default"
							title="Insert picture (or just drag & drop)" id="pictureBtn"><i
							class="fa fa-picture-o"></i> <input type="file"
							data-role="magic-overlay" data-target="#pictureBtn"
							data-edit="insertImage"
							style="opacity: 0; position: absolute; top: 0px; left: 0px; width: 0px; height: 0px;" />
						</a>
					</div> -->
					<div class="btn-group">
						<a class="btn btn-default" data-edit="undo"
							title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a> <a
							class="btn btn-default" data-edit="redo"
							title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
					</div>
				</div>
				<input type="hidden" id="comment" name="comment"></input>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-offset-2 col-md-10">
				<button type="submit" class="btn btn-success">提交</button>
			</div>
		</div>
	</fieldset>
</form>
<%@ include file="/common/footer.jsp"%>
<script>
	$('#editor').wysiwyg();

	$(document).ready(function() {
		$('input').iCheck({
			checkboxClass : 'icheckbox_square-red',
			radioClass : 'iradio_square-red',
			increaseArea : '20%' // optional
		});
	});

	// check信息太简陋了
	$("#emp-form").on("submit", function(event) {
		event.preventDefault();
		
		if($.trim($("#name").val())==""){
			alert("请填写姓名");
			return;
		}
		
		var companyChecked = $("input[name='companyId']:checked");
		var statusChecked = $("input[name='status']:checked");
		
		if(companyChecked.length==0){
			alert("请选择公司");
			return;
		}
		$("#companyName").val(companyChecked.attr("data-val"));
		
		if(statusChecked.length==0){
			alert("请选择目前的工作状态");
			return;
		}
		
		if($.trim($("#editor").text())==""){
			alert("写上一句祝福的话吧!");
			return;
		}
		
		if($("#editor").length>500){
			alert("您写的也太长了吧");
			return;
		}
		
		$("#comment").val($("#editor").text());
		
		this.submit();
	});
</script>
