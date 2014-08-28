<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="/common/header.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://platform.linkedin.com/in.js">
	api_key: 75behd12ztnmus
	authorize: true
</script>

<script type="text/javascript">
function onLinkedInAuth() {
  IN.API.Profile("me")
    .result( function(me) {
      var id = me.values[0].id;
      // AJAX call to pass back id to your server
    });
}
</script>
</head>
<body>
	<script type="in/Login">
Hello, <?js= firstName ?> <?js= lastName ?>.
</script>

<script type="IN/Login" data-onAuth="onLinkedInAuth"></script>
</body>
</html>
<%-- <%@ include file="/common/footer.jsp"%> --%>
