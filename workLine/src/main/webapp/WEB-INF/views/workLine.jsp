<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkLine</title>
<style>
	.main-container{
		display: flex;
		height: 100%;
	}
	.list-container{
		display: flex;
		flex-direction: column;
		min-width: 250px;
		max-width: 250px;
	}
	.button-container{
		display: flex;
		height: 50px;
	}
	.button-container > button{
		margin: 0;
		width: 50%;
		height: 100%;
		border-radius: 1px;
		background-color: #FFEDED;
	}
	.button-container > .selected{
		background-color: #F0CECE;
	}
	.button-container > button:hover{
		cursor: pointer;
		background-color: #F0CECE;
	}
	.friend-container{
		flex-grow: 1;
	}
	.friend-container .friend-ul{
		list-style-type: none;
		margin:0;
		padding:0;
	}
	.friend-ul .friend-li{
		height: 50px;
		display: flex;
		padding: 4px 0;
		border: 1px solid black;
	}
	.friend-li .img{
		height: 46px;
		width: 46px;
		margin: 2px;
		border-radius: 8px;
	}
	.friend-li .friend-info{
    	display: flex;
    	flex-direction: column;
		width: calc(100% - 54px);
	}
	.friend-li .name{
    	font-weight: bold;
		height: 25px;
	}
	.friend-info .content{
	    flex-grow: 1;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	.my-info-container{
		height: 66px;
		display: flex;
	}
	.my-info-container .img{
		height: 62px;
		width: 62px;
		margin: 2px;
		border-radius: 8px;
	}
	.my-info-container .my-info{
		display: flex;
		width: calc(100% - 50px);
		flex-direction: column;
	}
	.my-info .name{
    	font-weight: bold;
		height: 25px;
	}
	.my-info .content{
		display: flex;
	    flex-grow: 1;
		white-space: nowrap;        /* 한 줄로만 표시 (줄바꿈 X) */
		overflow: hidden;           /* 박스 넘치는 글자는 안 보이게 */
		text-overflow: ellipsis;
		align-items: center;
	}
	.chat-container{
		display: flex;
		flex-grow: 1;
		flex-direction: column;
	}
	.chat-area{
		flex-grow: 1;
		overflow-y: auto;
		padding: 20px;
	}
	.chat-input{
		min-height: 66px;
		max-height: 250px;
		overflow-y: auto;
		padding: 5px;
		box-sizing: border-box;
		white-space: pre-wrap;      /* 줄바꿈 허용 + 공백 유지 */
		word-wrap: break-word;      /* 긴 단어가 박스 밖으로 못 나가게 */
		word-break: break-word;     /* 한국어나 영어 긴 문자열 줄바꿈 */
	}
	.chat-container .chat-ul{
		list-style-type: none;
		margin:0;
		padding:0;
	}
	.chat-ul .chat-li{
		border: 1px solid black;
		display: flex;
		min-height: 50px;
		max-width: 80%;
	}
	.chat-li .img-in-div{
		min-height: 100%;
		max-height: 100%;
		width: 50px;
	}
	.img-in-div .img{
		width: 46px;
		height: 46px;
		border-radius: 8px;
		white-space: pre-wrap;
		word-wrap: break-word;
		word-break: break-word;
	}
	.chat-li .chat-info{
		flex-grow: 1;
	}
	.chat-info .name{
		margin: 0 0 0 5px;
		font-weight: 700;
	}
	.chat-info .content{
		display: flex;
		white-space: pre-wrap;
		word-wrap: break-word;
		word-break: break-word;
		margin: 0 0 0 5px;
		padding: 5px;
	}
	.chat-li .my-chat{
		flex-direction: row-reverse;
	}
	.my-chat .content{
		flex-direction: row-reverse;
	}
</style>
</head>
<body>
	<div class="main-container">
	
	
		<div class="list-container">
		
			<div class="button-container">
				<button type="button" class="btn selected">채팅방</button>
				<button type="button" class="btn">친구</button>
			</div>
		
			<div class="friend-container">
			
				<ul class="friend-ul">
					<li class="friend-li">
						<img src="/img/user_profile.png" class="img">
						<div class="friend-info">
							<div class="name">김정학</div>
							<div class="content">contentcontentcontentcontent</div>
						</div>
					</li>
				</ul>
				
			</div>
			
			<div class="my-info-container">
				<img src="/img/user_profile.png" class="img">
				<div class="my-info">
					<div class="name">김정학</div>
					<div class="content">content</div>
				</div>
			</div>
			
		</div><!-- list-container -->
		
		
		
		<div class="chat-container">
			<div class="chat-area">
			
				<ul class="chat-ul">
				
					<li class="chat-li you-chat">
						<div class="img-in-div">
							<img src="/img/user_profile.png" class="img">
						</div>
						<div class="chat-info">
							<div class="name">김정학</div>
							<div class="content">contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent</div>
						</div>
					</li>
					
					
					
					<li class="chat-li my-chat">
						<div class="chat-info">
							<div class="content">contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent</div>
						</div>
					</li>
				</ul>
				
			</div>
			<div class="chat-input" contenteditable="true" spellcheck="false"></div>
		</div>
		
		
	</div>
</body>
<script>

	$(".button-container .btn").click(function(){
		const thisObj = $(this);
		thisObj.siblings().removeClass("selected");
		thisObj.addClass("selected");
	});
	
	/* setInterval(function(){location.reload();} , 5 * 1000 );
	 */
</script>
</html>