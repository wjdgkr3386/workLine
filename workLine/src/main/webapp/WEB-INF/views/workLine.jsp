<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크라인</title>
<style>
	div{
		border: 1px solid black;
	}
	
	#main-container{
		display: flex;
		height: 100%;
		margin: 0 auto;
	}
	
	#main-container .user-list{
		position: relative;
		width: 20%;
	}
	
	#main-container .chat-bax{
		width: 80%;
	}
	
	.user-list .my-profile{
		display: flex;
		position: absolute;
		width: 100%;
		height: 10%;
		bottom: 0;
	}
	
	.my-profile .image{
		width: 30%;
		height: 100%;
	}
	
	.my-profile .info{
		width: 70%;
		height: 100%;
	}
</style>
<script>

</script>
</head>
<body>
	<div id="main-container">
		<div class="user-list">
			<div class="my-profile">
				<div class="image">
					
				</div>
				<div class="info">
					
				</div>
			</div>
		</div>
		<div class="chat-bax">
		</div>
	</div>
	
	
	
	
	
<!-- <button type="button" onclick="location.href='/login'">로그인</button> -->
</body>
</html>