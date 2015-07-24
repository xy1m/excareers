<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-xs-4">
					<h4><spring:message code="about"></spring:message></h4>
					<ul class="fa-ul">
						<li><i class="fa-li fa fa-link"></i> <a href="/help"><spring:message code="help"></spring:message></a> </li>
						<li><i class="fa-li fa fa-link"></i> <a href="/about"><spring:message code="about"></spring:message></a> </li>
						<li><i class="fa-li"></i> <a href="/language?lan=en">English</a> </li>
						<li><i class="fa-li"></i> <a href="/language?lan=zh_cn">中文</a> </li>
					</ul>
				</div>
				<div class="col-xs-4">
					<h4><spring:message code="friend_link"></spring:message></h4>
					<ul class="fa-ul">
						<li><i class="fa-li fa fa-link"></i> <a target="_blank" href="http://v3.bootcss.com/">Bootstrap</a> </li>
						<li><i class="fa-li fa fa-link"></i> <a target="_blank" href="http://glyphicons.com/">Glyphicons</a> </li>
						<li><i class="fa-li fa fa-link"></i> <a target="_blank" href="http://open.bootcss.com/">OpenCDN</a> </li>
						<li><i class="fa-li fa fa-link"></i> <a target="_blank" href="http://fontawesome.io/">Font-awesome</a> </li>
					</ul>
				</div>
				<div class="col-xs-4">
					<h4><spring:message code="contact"></spring:message></h4>
					<ul class="fa-ul">
						<li><i class="fa-li fa fa-envelope fa-fw fa-lg"></i><a href="mailto:zhangzhpeng@gmail.com">zhangzhpeng@gmail.com</a> </li>
						<li><i class="fa-li fa fa-linkedin fa-fw fa-lg"></i><a target="_blank" href="https://ca.linkedin.com/in/zhangzhpeng">zhenpengzhang</a> </li>
						<li><i class="fa-li fa fa-twitter fa-fw fa-lg"></i><a target="_blank" href="https://twitter.com/zhangzhpeng">@zhangzhpeng</a> </li>
						<li><i class="fa-li fa fa-weibo fa-fw fa-lg"></i><a target="_blank" href="http://weibo.com/barbabravo/">@barbabravo</a> </li>
					</ul>
				</div>
			</div>
			<div class="row">
				<p class="text-center"><i class="fa fa-copyright fa-lg fa-fw"></i>2015 excareers. All rights reserved.</p>
			</div>
		</div>
	</footer>


	<script src="//cdn.jsdelivr.net/jquery/2.1.4/jquery.min.js"></script>
  <script src="//cdn.jsdelivr.net/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="//cdn.jsdelivr.net/jquery.bootstrapvalidator/0.4.5/js/bootstrapValidator.min.js"></script>
