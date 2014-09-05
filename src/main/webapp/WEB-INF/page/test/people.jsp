<html>
<head>
<title>Profile App Example</title>

<script type="text/javascript" src="http://platform.linkedin.com/in.js">
  api_key: 75behd12ztnmus
  authorize: true
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.5b1.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.7/jquery-ui.min.js"></script>  

<script type="text/javascript">

function loadData() {
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
<script type="IN/Login" data-onAuth="loadData"></script>
</body>
</html>