<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/common/header.jsp" flush="true">
  <jsp:param name="title" value="Regist ExCareers" />
</jsp:include>
<link href="http://cdn.bootcss.com/bootstrap-validator/0.5.0/css/bootstrapValidator.min.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/bootstrap-validator/0.5.0/js/bootstrapValidator.min.js"></script>
</head>
<body>
  <div id="wrap">
    <%@ include file="/common/navbar.jsp"%>
    <div class="container">
      <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-warning">
          <div class="panel-heading">
            <h3 class="panel-title">Regist module is comming soon!</h3>
          </div>
          <div class="panel-body">
            <form class="form-horizontal" id="registrationForm" method="POST" role="form">
              <div class="form-group">
                <label for="username" class="col-md-3 control-label">Username</label>
                <div class="col-md-9">
                  <input type="text" class="form-control" name="username"></input>
                </div>
              </div>         
              <div class="form-group">
                <label for="email" class="col-md-3 control-label">Email</label>
                <div class="col-md-9">
                  <input type="email" class="form-control" name="email"></input>
                </div>
              </div>        
              <div class="form-group">
                <label for="password" class="col-md-3 control-label">Password</label>
                <div class="col-md-9">
                  <input type="password" class="form-control" name="password" ></input>
                </div>
              </div>          
              <div class="form-group">
                  <div class="col-md-9 col-md-offset-3">
                      <button class="col-md-offset-9 btn btn-primary" type="submit">Regist!</button>
                  </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="/common/footer.jsp"%>
  <script src="/static/js/min/regist.min.js"></script>
</body>
</html>