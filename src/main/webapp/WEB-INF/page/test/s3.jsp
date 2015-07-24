<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
AKIAIIXI6YXOTSP4DGGA
yETj3NTxMJgd4kILsZEqry8L/FnY9Zs7r8bmBmWx

<form action="http://pv-excareers.s3.amazonaws.com/" method="post" enctype="multipart/form-data">
    Key to upload: 
    <input type="input"  name="key" value="user/user1/photo.jpg" /><br />
    <input type="hidden" name="acl" value="public-read" />
    Content-Type: 
    <input type="input"  name="Content-Type" value="image/jpeg" /><br />
    <input type="text"   name="X-Amz-Credential" value="AKIAIIXI6YXOTSP4DGGA/20150706/us-west-1/s3/aws4_request" />
    <input type="text"   name="X-Amz-Algorithm" value="AWS4-HMAC-SHA256" />
    <input type="text"   name="X-Amz-Date" value="20150706T000000Z" />

    Tags for File: 
    <input type="hidden" name="Policy" value='eyAiZXhwaXJhdGlvbiI6ICIyMDE2LTAxLTAxVDAwOjAwOjAwLjAwMFoiLAogICJjb25kaXRpb25zIjogWwogICAgeyJidWNrZXQiOiAicHYtbWVhbCJ9LAogICAgWyJzdGFydHMtd2l0aCIsICIka2V5IiwgInVzZXIvdXNlcjEvIl0sCiAgICB7ImFjbCI6ICJwdWJsaWMtcmVhZCJ9LAogICAgWyJzdGFydHMtd2l0aCIsICIkQ29udGVudC1UeXBlIiwgImltYWdlLyJdLAoKICAgIHsieC1hbXotY3JlZGVudGlhbCI6ICJBS0lBSUlYSTZZWE9UU1A0REdHQS8yMDE1MDcwNi91cy13ZXN0LTEvczMvYXdzNF9yZXF1ZXN0In0sCiAgICB7IngtYW16LWFsZ29yaXRobSI6ICJBV1M0LUhNQUMtU0hBMjU2In0sCiAgICB7IngtYW16LWRhdGUiOiAiMjAxNTA3MDZUMDAwMDAwWiIgfQogIF0KfQ==' />
    <input type="hidden" name="X-Amz-Signature" value="998ddb3d222cf6f0cdb9f8fdf6b323809d3c6c8a4db414ab10e2472bc9ca675f" />
    File: 
    <input type="file"   name="file" /> <br />
    <input type="submit" name="submit" value="Upload to Amazon S3" />
  </form>
</body>
</html>