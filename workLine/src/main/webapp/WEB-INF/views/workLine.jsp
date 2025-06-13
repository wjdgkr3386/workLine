<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크라인</title>
<style>
	#main-container{
		width: 480px;
		height: 100%;
		margin: 0 auto;
	}
</style>
<script>
setInterval(function(){location.reload();} , 3 * 1000 );


</script>
</head>
<body>
	<div id="main-container">
		<button type="button" onclick="location.href='/login'">로그인</button>
	</div>
</body>
</html>