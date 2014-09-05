<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
	<div id="profile"></div>
	<a href="javascript:getFullProfile()">点击</a>
<%@ include file="/common/footer.jsp"%>
<script>
function getFullProfile(){
	   IN.API.Profile("me").result(function(result) { 
	      $("#profile").html("<script type='IN/FullMemberProfile' data-id='" + result.values[0].id + "'/>");
	      IN.parse(document.getElementById("profile"));
	   });
}
window.onload=getFullProfile();
</script>

