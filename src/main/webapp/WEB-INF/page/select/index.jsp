<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/header.jsp" flush="true">
  <jsp:param name="title" value="Gallery ExCareers" />
</jsp:include>
<link href="/static/bootstrap3.03/css/marketing.css" rel="stylesheet"></head>
<body>
  <div id="wrap">
    <%@ include file="/common/navbar.jsp"%>
    <div class="container marketing">
      <div class="jumbotron">
        <h1></h1>
        <blockquote class="blockquote-reverse">
          <p>All is riddle,and the key to a riddle is another riddle</p>
          <p>Emerson</p>
        </blockquote>
      </div>
      <c:forEach var="i" items="${result}" varStatus="index">
      <div class="col-lg-4">
        <img class="img-circle" src="${i.pic }_z200" alt="${i.name }-${i.companyName}" style="width: 200px; height: auto;">
        <div class="caption">
          <h3>${i.name }</h3>
          <p>${i.comment }</p>
          <p>
          <span class="label label-primary">${i.companyName}</span>
          </p>
        </div>
      </div>
      </c:forEach>
    </div>
  </div>
  <%@ include file="/common/footer.jsp"%>
</body>
</html>