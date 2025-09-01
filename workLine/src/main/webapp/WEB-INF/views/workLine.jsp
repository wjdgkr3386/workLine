<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크라인</title>
<style>
	img{
		height: 100%;
	}
	
	#main-container{
		display: flex;
		height: 100%;
		margin: 0 auto;
	}
	
	#main-container .user-container{
		border: 1px solid black;
		position: relative;
		width: 15%;
	}
	
	#main-container .chat-container{
		border: 1px solid black;
		border-left: none;
		width: 85%;
		background-color: yellow; 
		opacity: 0.5;
		z-index: -1;
		padding: 0 20px;
		box-sizing: border-box;
		overflow-y: auto;
	}
	
	.user-container .user-list{
		width: 100%;
		height: 93%;
		overflow-y: auto;
		overflow-x: hidden;
	}
	
	.user-container .image{
		width: 50px;
		border-radius: 50%;
		overflow : hidden;
		display: flex;
		justify-content: center;
	}
	
	.user-container .info{
		padding: 10px;
		width: 80%;
		height: auto;
		font-size: 12px;
	}
	
	.user-container .pannel{
		display: flex;
		width: 100%;
		height: 50px;
		margin: 3px;
		padding: 3px;
		box-sizing: border-box;
	}
	
	.user-container .my-profile{
		border-top: 1px solid black;
		display: flex;
		position: absolute;
		bottom: 0;
	}
	
	.name{
		align-items: flex-end;  /* 말풍선과 시간 하단 맞추기 */
	}
	.chat{
		max-width: 80%;
		min-height: 40px;
		margin-top: 5px;
		background-color: white;
		border-radius: 7px;
		display: flex;
		padding: 5px 10px;
		box-sizing: border-box;
		white-space: pre-wrap;     /* 줄바꿈 허용 + 공백 유지 */
		word-wrap: break-word;     /* 긴 단어가 박스 밖으로 못 나가게 */
		word-break: break-word;    /* 한국어나 영어 긴 문자열 줄바꿈 */
	}
	
	.chat-row {
	  display: flex;
	  align-items: flex-end;  /* 말풍선과 시간 하단 맞추기 */
	  margin: 5px 0;
	  gap: 5px;
	}
	
	.chat-row.me { 
	  justify-content: flex-end; /* 오른쪽 정렬 */
	}
	
	.chat-me.chat{
	  background-color: #dcf8c6;
	}
	
	.time{
		display: flex;
		font-size: 12px;
		color: grey;
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
			<div class="my-profile pannel">
				<div class="image">
					<img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTsN1nJc-HPt3I659Bq0tb_p30Hpa3jZDNIvFxWSx0LTWIYxjGo78l3z70jF2o4k32xHTZfqv33wOJQgubqQkKCcvnW1yNb5wAW4LJBLHFUDg">
				</div>
				<div class="info">
					고양이
				</div>
			</div>
		</div>
		<div class="chat-container">
		
			<span class="name">이름</span>
			<div class="chat-row">
				<div class="chat-you chat">dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</div>
				<span class="time">오전 9시</span>
			</div>
			
			<div class="chat-row me">
				<span class="time">오후 9시</span>
				<div class="chat-me chat">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</div>
			</div>
			
		</div>
	</div>
	
	
	
	
	
<!-- <button type="button" onclick="location.href='/login'">로그인</button> -->
</body>
</html>