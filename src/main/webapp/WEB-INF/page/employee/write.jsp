<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/common/header.jsp"%>
	<form id="emp-form" class="form-horizontal" role="form">
		<fieldset class="well">
			<div class="form-group has-feedback">
				<label for="empname" class="col-md-2 control-label">Name</label>
				<div class="col-md-4">
					<input type="text" class="form-control" id="empname" name="empname" placeholder="empname" value="${firstName}${lastName}"></input>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group has-feedback">
				<label for="companyId" class="col-md-2 control-label">Company</label>
				<div class="controls col-md-4">
					<c:if test="${positions!=null}">
						<ul class="list-inline">
							<c:forEach var="i" items="${positions}" varStatus="index">
								<li><input type="radio" name="companyId" value="${i.company.id }" data-val="${i.company.name}"></input> <label>${i.company.name}</label></li>
							</c:forEach>
						</ul>
					</c:if>
					<input type="text" class="<c:if test="${positions==null}">form-control</c:if> <c:if test="${positions!=null}">hidden</c:if>" placeholder="companyName" id="companyName" name="companyName"></input>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group">
				<label for="status" class="col-md-2 control-label">Status</label>
				<div class="controls col-md-4">
					<input type="radio" name="status" value="1"></input> 
					<label for="status">In</label> 
					<input type="radio" name="status" value="0"></input>
					<label for="status">Out</label>
				</div>
			</div>
			<div class="form-group">
				<label for="pic" class="col-md-2 control-label">Photo</label>
				<div class="col-md-10">
					<img id="photoView" class="img-thumbnail" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" style="width: 200px; height: auto;">
					<input type="hidden" id="pictureUrl"></input>
				</div>
				<div class="col-md-offset-2 col-md-2">
					<span class="btn btn-success fileinput-button">
				        <i class="glyphicon glyphicon-plus"></i>
				        <span>Select File</span>
				        <input id="fileupload" type="file" name="pic">
				    </span>
				</div>
				<div class="col-md-offset-2 col-md-10">
				    <div id="progress" class="progress">
				        <div class="progress-bar progress-bar-success"></div>
				    </div>
				</div>
			</div>
			<div class="form-group has-feedback">
				<label for="comment" class="col-md-2 control-label">Comment</label>
				<div class="col-md-10">
					<textarea class="form-control" rows="3" id="comment" name="comment" placeholder="comment"></textarea>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<div class="alert" role="alert" hidden="true">
						<p>Oh snap!</p>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<button id="submitBtn" type="button" class="btn btn-primary">Submit <i></i></button>
				</div>
			</div>
		</fieldset>
	</form>
<%@ include file="/common/footer.jsp"%>

<script src="/static/js/lib/jquery.ui.widget.js"></script>
<script src="/static/js/lib/jquery.iframe-transport.js"></script>
<script src="/static/js/lib/jquery.fileupload.js"></script>
<script src="/static/js/service/write.js"></script>
