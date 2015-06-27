<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/header.jsp" flush="true">
  <jsp:param name="title" value="edit--excareers" />
</jsp:include>
<link href="http://cdn.bootcss.com/iCheck/1.0.1/skins/square/red.css" rel="stylesheet">
<!-- iCheck -->
<script src="http://cdn.bootcss.com/iCheck/1.0.1/icheck.min.js"></script>
<link href="http://cdn.bootcss.com/bootstrap-validator/0.5.0/css/bootstrapValidator.min.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/bootstrap-validator/0.5.0/js/bootstrapValidator.min.js"></script>
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
    <div class="container">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">Write</h3>
        </div>
        <div class="panel-body">
          <form id="empForm" class="form-horizontal" action="/employee/add" method="POST" role="form">
            <div class="form-group">
              <label for="empName" class="col-md-2 control-label">EmpName</label>
              <div class="col-md-4">
                <input type="text" class="form-control" name="empName" placeholder="EmpName" value="${firstName}${lastName}"></input>
              </div>
            </div>
            <div class="form-group">
              <label for="companyId" class="col-md-2 control-label">Company</label>
              <div class="controls col-md-4">
                <c:if test="${positions!=null}">
                  <ul class="list-inline">
                    <c:forEach var="i" items="${positions}" varStatus="index">
                    <li>
                      <input type="radio" name="companyId" value="${i.company.id }" data-val="${i.company.name}"></input>
                      <label>${i.company.name}</label>
                    </li>
                    </c:forEach>
                  </ul>
                </c:if>
                <input type="text" class="<c:if test="${positions==null}">form-control</c:if>
                <c:if test="${positions!=null}">hidden</c:if>
                " placeholder="CompanyName" name="companyName" id="companyName"/>
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
              <label for="photo" class="col-md-2 control-label">Photo</label>
              <div class="col-md-10">
                <img id="photoView" class="img-thumbnail" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" style="width: 200px; height: auto;">
                <input type="hidden" id="photo" name="photo"></input>
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
            <div class="form-group">
              <label for="comment" class="col-md-2 control-label">Comment</label>
              <div class="col-md-10">
                <textarea class="form-control" rows="3" name="comment" placeholder="Comment"></textarea>
              </div>
            </div>
            <!-- Show the messages in #errors -->
            <div class="form-group">
                <div class="col-md-offset-2">
                    <div class="alert alert-danger hidden" id="errors" role="alert"></div>
                </div>
            </div>
            <div class="form-group">
              <div class="col-md-offset-2 col-md-10">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="/common/footer.jsp"%>

  <script src="/static/js/lib/jquery.ui.widget.js"></script>
  <script src="/static/js/lib/jquery.iframe-transport.js"></script>
  <script src="/static/js/lib/jquery.fileupload.js"></script>
  <script src="/static/js/min/write.min.js"></script>
</body>
</html>