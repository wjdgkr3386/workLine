<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크라인</title>
<style>
	body{
	    margin: 0;
	    padding: 0;
	    overflow-x: hidden;
	}
	
	img{
		width:100%;
		height:100%;
		object-fit:fill;
	}
	.image{
		margin-right: 10px;
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
		background-color: rgba(255, 255, 0, 0.4); /* 노란색 + 50% 투명 */
		z-index: -1;
		padding: 20px;
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
		left: 0;
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
	
	.chat-container .image{
		display: flex;
		height: 50px;
		width: 50px;
		border-radius: 50%;
		overflow: hidden;
	}
	
	.chat-you-box{
		display: flex;
	}
	
	.chat-another-you{
		margin-left: 60px;
	}
	
	.pannel.login-switch-n{
		display: flex;
		justify-content: center;
		align-items: center;
		cursor: pointer;
		background-color: #FCECDD;
		margin: 0;
		font-size: 1.5em;
	}
	
	.pannel.login-switch-y{
		display: none;
		margin: 0;
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
			
			
			<!-- 로그인 o  -->
			<div class="my-profile pannel login-switch-y">
				<div class="image">
					<img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTsN1nJc-HPt3I659Bq0tb_p30Hpa3jZDNIvFxWSx0LTWIYxjGo78l3z70jF2o4k32xHTZfqv33wOJQgubqQkKCcvnW1yNb5wAW4LJBLHFUDg">
				</div>
				<div class="info">
					고양이
				</div>
			</div>
			
			<!-- 로그인 x -->
			<div class="my-profile pannel login-switch-n" onclick="location.replace('/login')">
				 로그인 하기
			</div>
			
			
			
			
			
			
		</div>
		
		<!-- 채팅공간 -->
		<div class="chat-container">
		
			<!-- 상대방 채팅 -->
			<div class="chat-you-box">
				<div class="image">
					<img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTsN1nJc-HPt3I659Bq0tb_p30Hpa3jZDNIvFxWSx0LTWIYxjGo78l3z70jF2o4k32xHTZfqv33wOJQgubqQkKCcvnW1yNb5wAW4LJBLHFUDg">
				</div>
				<div style="width:100%;">
					<span class="name">이름</span>
					<div class="chat-row">
						<div class="chat-you chat">dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</div>
						<span class="time">오전 9시</span>
					</div>
				</div>
			</div>
			
			<!-- 내 채팅 -->
			<div class="chat-row me">
				<span class="time">오후 9시</span>
				<div class="chat-me chat">dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</div>
			</div>
		</div>
		<!-- 끝 채팅공간 -->
	</div>
	
	
	
	
	
<!-- <button type="button" onclick="location.href='/login'">로그인</button> -->
</body>
</html>