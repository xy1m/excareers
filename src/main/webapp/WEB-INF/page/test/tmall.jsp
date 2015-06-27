<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/header.jsp" flush="true">
  <jsp:param name="title" value="双11天猫爆款清单" />
  <jsp:param name="description" value="天猫爆款清单 2014天猫爆款 双11爆款 2014天猫内部爆款文件 " />
  <jsp:param name="keywords" value="天猫双11非官方最全爆款清单 你懂的 " />
</jsp:include>
<body>
  <div id="wrap">
    <%@ include file="/common/navbar.jsp"%>
    <div class="container marketing">
      <div class="panel panel-default">
		  <!-- Default panel contents -->
		  <div class="panel-heading">双11天猫爆款清单-你懂的</div>
		  <div class="panel-body">
		    <p>江湖谣传天猫内部爆款文件，作者不负责真实性</p>
		    
			<!-- Split button -->
            <c:forEach var="t" items="${typemap}" varStatus="index">
				<div class="btn-group">
				  <a class="btn btn-primary" href="/s11/tmall/${t.value[0].cid }.html">${t.key}</a>
				  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
				    <span class="caret"></span>
				    <span class="sr-only">Toggle Dropdown</span>
				  </button>
				  <ul class="dropdown-menu" role="menu">
				    <c:forEach var="v" items="${t.value}" varStatus="index">
				        <li><a href="/s11/tmall/${v.tid}.html">${v.type}</a></li>
				    </c:forEach>
				  </ul>
				</div>
            </c:forEach>
		  </div>
		
		  <!-- Table -->
			<table class="table table-hover table-bordered table-condensed">
				<thead>
					<tr>
						<th class="text-center" style="width:10%">品类</th>
						<th class="text-center" style="width:20%">名称</th>
						<th class="text-center" style="width:10%">市场价</th>
						<th class="text-center" style="width:10%">双11价</th>
						<th class="text-center" style="width:10%">折扣</th>
						<th class="text-center" style="width:40%">推荐理由</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${result}" varStatus="index">
						<tr>
							<td class="text-center"><a href="/s11/tmall/${p.tid }.html" target="_blank">${p.type }</a></td>
							<td class="text-center"><a href="${p.link }" target="_blank">${p.name }</a></td>
							<td class="text-right"><c:if test="${p.pricem>0}">${p.pricem}</c:if><c:if test="${p.pricem<0}">无数据</c:if></td>
							<td class="text-right"><c:if test="${p.price11>0}">${p.price11}</c:if><c:if test="${p.price11<0}">无数据</c:if></td>
							<td class="text-right">${p.discount }</td>
							<td class="text-justify">${p.suggestion }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
    </div>
  </div>
  <%@ include file="/common/footer.jsp"%>
</body>
</html>