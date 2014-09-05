<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>LinkedIn JavaScript API Sample Application</title>

<!-- Load in the JavaScript framework and register a callback function -->
<script type="text/javascript" src="http://platform.linkedin.com/in.js">
  api_key: 75behd12ztnmus
  onLoad: onLinkedInLoad
  authorize: true
 </script>

<script type="text/javascript">

 function onLinkedInLoad() {
     // Listen for an auth event to occur
     IN.Event.on(IN, "auth", onLinkedInAuth);
 } 

 function onLinkedInAuth() {
     // After they've signed-in, print a form to enable keyword searching
     var div = document.getElementById("sendMessageForm");

     div.innerHTML = '<h2>Send a Message To Yourself</h2>';
     div.innerHTML += '<form action="javascript:SendMessage();">' +
                 '<input id="message" size="30" value="You are awesome!" type="text">' +
                  '<input type="submit" value="Send Message!" /></form>';
 }
 
 function SendMessage(keywords) {
     var message = document.getElementById('message').value; 
     var BODY = {
        "recipients": {
           "values": [{
             "person": {
                "_path": "/people/~",
             }
          }]
         },
       "subject": "JSON POST from JSAPI",
       "body": message
     }

     IN.API.Raw("/people/~/mailbox")
           .method("POST")
           .body(JSON.stringify(BODY)) 
           .result(displayMessageSent)
           .error(function error(e) { alert ("No dice") });
 }

 function displayMessageSent() {
     var div = document.getElementById("sendMessageResult");
      div.innerHTML += "Yay!";
 }

 </script>
</head>
<body>
	<script type="IN/Login"></script>
	<div id="sendMessageForm"></div>
	<div id="sendMessageResult"></div>
</body>
</html>
