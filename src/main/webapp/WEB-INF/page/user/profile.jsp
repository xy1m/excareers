<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="/common/header.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.5b1.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.7/jquery-ui.min.js"></script>  

<script type="text/javascript" src="https://platform.linkedin.com/in.js">
	api_key: 75behd12ztnmus
	authorize: true
</script>

<script type="text/javascript">
function onLinkedInAuth() {
  IN.API.Profile("me")
    .result( displayProfiles);
}
function displayProfiles(profiles) {
    member = profiles.values[0];
    document.getElementById("profiles").innerHTML = 
         "<p id=\"" + member.id + "\">Hello " +  member.firstName + " " + member.lastName + "</p><img src='"+member.pictureUrl+"'></img>";
}
function getID() {
	   IN.API.Profile("me")
	   .result(function(result) { 
	      $("#profile").html("<script type='IN/FullMemberProfile' data-id='" + result.values[0].id + "'/>");
	      IN.parse(document.getElementById("profile"))
	   })
	}
</script>
</head>
<body class="yui3-skin-sam     yui-skin-sam">

<div id="profile"></div>
<script type="IN/Login" data-onAuth="getID"></script>
</body>
</html>
<%-- <%@ include file="/common/footer.jsp"%> --%>
