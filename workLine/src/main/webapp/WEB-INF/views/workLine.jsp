<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크라인</title>
<style>
	
	img{
		width: 100%;
	}
	
	#main-container{
		display: flex;
		height: 100%;
		margin: 0 auto;
	}
	
	#main-container .user-container{
		border: 1px solid black;
		position: relative;
		width: 20%;
	}
	
	#main-container .chat-bax{
		border: 1px solid black;
		border-left: none;
		width: 80%;
	}
	
	.user-container .user-list{
		width: 100%;
		height: 93%;
		overflow-y: auto;
	}
	
	.user-container .image{
		width: 20%;
		height: auto;
		border-radius: 50%;
		overflow : hidden;
		display: flex;
		justify-content: center;
	}
	
	.user-container .info{
		padding: 10px;
		width: 80%;
		height: auto;
	}
	
	.user-container .pannel{
		display: flex;
		width: 100%;
		height: 7%;
		margin-top: 5px;
	}
	
	.user-container .my-profile{
		border-top: 1px solid black;
		display: flex;
		position: absolute;
		bottom: 0;
	}
</style>
<script>

</script>
</head>
<body>
	<div id="main-container">
		<div class="user-container">
			<div class="user-list">
				
				<!-- 반복할 유저 목록 -->
				<div class="pannel">
					<div class="image">
						<img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTsN1nJc-HPt3I659Bq0tb_p30Hpa3jZDNIvFxWSx0LTWIYxjGo78l3z70jF2o4k32xHTZfqv33wOJQgubqQkKCcvnW1yNb5wAW4LJBLHFUDg">
					</div>
					<div class="info">
						고양이
					</div>
				</div>
				
			</div>
			
			<!-- 내 프로필 나타낼 공간 //아래 고정 -->
			<div class="pannel my-profile">
				<div class="image">
					<img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTsN1nJc-HPt3I659Bq0tb_p30Hpa3jZDNIvFxWSx0LTWIYxjGo78l3z70jF2o4k32xHTZfqv33wOJQgubqQkKCcvnW1yNb5wAW4LJBLHFUDg">
				</div>
				<div class="info">
					고양이
				</div>
			</div>
		</div>
		<div class="chat-bax">
		</div>
	</div>
	
	
	
	
	
<!-- <button type="button" onclick="location.href='/login'">로그인</button> -->
</body>
</html>