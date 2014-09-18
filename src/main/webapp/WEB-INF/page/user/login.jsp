<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/header.jsp" flush="true">
  <jsp:param name="title" value="Login ExCareers" />
</jsp:include>
</head>
<body>
  <div id="wrap">
    <%@ include file="/common/navbar.jsp"%>  
      <div class="container">
        <div class="col-md-6 col-md-offset-3">
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Login is comming soon!Now support LinkedIn</h3>
            </div>
            <div class="panel-body">
              <div class="col-md-8 col-md-offset-2">
                <form class="form-horizontal" action="/user/login" method="POST" role="form">
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span>
                      <input class="form-control" name="username" type="text" placeholder="Email address">
                      </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
                      <input class="form-control" name="password" type="password" placeholder="Password">
                    </div>
                  </div>
                  <div class="form-group pull-right">
                    <script type="IN/Login" data-onAuth="onLogin"></script>
                    <button class="btn btn-primary" type="submit">Login</button>
                    <a href="/n/user/regist" class="btn btn-success">RegistNow</a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
  </div>
  <%@ include file="/common/footer.jsp"%>
  <script type="text/javascript" src="http://platform.linkedin.com/in.js">api_key: 75behd12ztnmus</script>
  <script src="/static/js/min/login.min.js"></script>
</body>
</html>
