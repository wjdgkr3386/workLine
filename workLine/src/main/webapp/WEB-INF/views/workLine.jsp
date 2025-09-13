<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-bold-straight/css/uicons-bold-straight.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-thin-straight/css/uicons-thin-straight.css'>
<title>워크라인</title>
<style>
	body{
	    margin: 0;
	    padding: 0;
	    overflow-x: hidden;
	    position: relative;
	}
	
	img{
		width:100%;
		height:100%;
		object-fit:fill;
	}
	.image-div{
		margin-right: 10px;
		user-select: none; /* 텍스트 선택 막기 */
		-webkit-user-select: none; /* 크롬/사파리 */
		-moz-user-select: none; /* 파이어폭스 */
		-ms-user-select: none; /* IE/Edge */
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
		width: 100%;
		height: calc(100% - 50px);
		background-color: rgba(255, 255, 0, 0.4); /* 노란색 + 50% 투명 */
		padding: 20px;
		box-sizing: border-box;
		overflow-y: auto;
	}
	
	.user-container .user-list{
		width: 100%;
		height: 88%;
		overflow-y: auto;
		overflow-x: hidden;
	}
	
	.user-container .toolbar{
		height: 5%;
		overflow: none;
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 10px;
		box-sizing: border-box;
	}
	
	.user-container .image-div{
		width: 50px;
		border-radius: 50%;
		overflow : hidden;
		display: flex;
		justify-content: center;
	}
	
	.user-container .info{
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 10px;
		width: 80%;
		height: auto;
		font-size: 12px;
		white-space: nowrap;        /* 한 줄로만 표시 (줄바꿈 X) */
		overflow: hidden;           /* 박스 넘치는 글자는 안 보이게 */
		text-overflow: ellipsis;    /* 잘린 부분에 ... 표시 */
		user-select: none; /* 텍스트 선택 막기 */
		-webkit-user-select: none; /* 크롬/사파리 */
		-moz-user-select: none; /* 파이어폭스 */
		-ms-user-select: none; /* IE/Edge */
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
		user-select: none; /* 텍스트 선택 막기 */
		-webkit-user-select: none; /* 크롬/사파리 */
		-moz-user-select: none; /* 파이어폭스 */
		-ms-user-select: none; /* IE/Edge */
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
		user-select: none; /* 텍스트 선택 막기 */
		-webkit-user-select: none; /* 크롬/사파리 */
		-moz-user-select: none; /* 파이어폭스 */
		-ms-user-select: none; /* IE/Edge */
	}
	
	.chat-container .image-div{
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
		justify-content: center;
		align-items: center;
		cursor: pointer;
		background-color: #FCECDD;
		margin: 0;
		font-size: 1em;
	}
	
	.pannel.login-switch-y{
		margin: 0;
	}
	
	.chat-input{
		height: 50px;
		width: 100%;
		display: flex;
	}
	
	.fi{
		cursor: pointer;
	}
	
	.menu-modal {
	    width: 100%;
	    height: 100%;
	    z-index: 999;
	    display: none;
	    position: absolute;
	    left: 0;
	    top: 0;
	}
	
	.menu {
	    width: 150px;
	    height: 200px;
	    background-color: FBF5DE;
	    border: 1px solid black;
	    border-radius: 10px;
	    position: absolute;
	}
	
	.menu div{
		margin-top: 10px;
	    padding: 7px;
		user-select: none; /* 텍스트 선택 막기 */
		-webkit-user-select: none; /* 크롬/사파리 */
		-moz-user-select: none; /* 파이어폭스 */
		-ms-user-select: none; /* IE/Edge */
	}
	
	.menu div:hover{
		background-color: F5F0CD;
		cursor: pointer;
	}
		.newchat-box-modal {
	    width: 100%;
	    height: 100%;
	    z-index: 999;
	    display: none;
	    position: absolute;
	    left: 0;
	    top: 0;
	}
	
	.newchat-box {
	    width: 200px;
	    height: 100px;
	    background-color: FBF5DE;
	    border: 1px solid black;
	    border-radius: 10px;
	    position: absolute;
	    gap: 40px;
	    display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.newchat-box .fi{
		user-select: none; /* 텍스트 선택 막기 */
		-webkit-user-select: none; /* 크롬/사파리 */
		-moz-user-select: none; /* 파이어폭스 */
		-ms-user-select: none; /* IE/Edge */
		font-size: 40px;
	}
	
	.newchat-box>span{
		flex-direction: column;
	    display: flex;
		justify-content: center;
		align-items: center;
		cursor: pointer;
	}
</style>
<script>
	$(function(){init();});
	function init(){
		$('#fileInput').on('change', function(event){
			var file = event.target.files[0];
			if(file){
				var reader = new FileReader();
				//파일 읽기가 완료되면 자동으로 실행되는 onload, 그 안에 실행될 함수 지정
				reader.onload = function(e){
					$('.image').attr('src', e.target.result);
					$("[name='is_select']").val('1');
				}
				
				reader.readAsDataURL(file);
			}
		});
	}

	function saveChat(){
		var formObj = $("[name='chatForm']");
		var content = formObj.find("input[name='content']").val().trim();
		
		//값이 들어있는지 확인
        if (content) {
            return;
        }
		
		ajax(
			     "/loginProc",
			     "post",
			     formObj,
			     function (cnt) {
			    	 if(cnt == 1){
			    		 location.replace("workLine");
			    	 }else if(cnt == 0){
			    		 alert("비밀번호가 틀립니다.");
			    	 }else{
			    		 alert("실패했습니다. 관리자에게 문의해주세요.");
			    	 }
			     }
			);
	}
	
	function menu(){		
		var menuModal = $(".menu-modal");
		var menu = $(".menu");
		menuModal.css("display", "block");
		

		var outline = $(".menu-outline");
		var offset = outline.offset();

		menu.css({
		    top : offset.top - menu.outerHeight() - 15 + 'px',
		    left : offset.left + outline.outerWidth() - menu.outerWidth() + 'px'
		});
		
		
		menuModal.on("click",function(event){
			menuModal.css("display", "none");
			menuModal.off("click");
			menu.off("click");
		});
		menu.on("click",function(event){
			event.stopPropagation(); // 메뉴 클릭 시 모달 닫히는 걸 막음
		});
	}
	
	function newchat(){
		newchatModal = $(".newchat-box-modal");
		newchatBox = $(".newchat-box");
		newchatModal.css("display", "block");
		
		var toolbar = $(".toolbar");
		var comments = $(".fi-rr-comments");
		var offset = comments.offset();
		
		newchatBox.css({
		    top : toolbar.outerHeight() + 'px',
		    left : offset.left + comments.outerWidth() - newchatBox.outerWidth() + 'px'
		});
		
		newchatModal.on("click",function(event){
			newchatModal.css("display", "none");
			newchatModal.off("click");
			newchatBox.off("click");
		});
		newchatBox.on("click",function(event){
			event.stopPropagation(); // 메뉴 클릭 시 모달 닫히는 걸 막음
		});
	}
</script>
</head>
<body>
	<div id="main-container">
		<div class="user-container">
			<div class="user-list">
				<div class="toolbar">
					<span>채팅</span>
					<span style="display:flex; gap:15px;">
						<i class="fi fi-rr-search" title="검색"></i>
						<i class="fi fi-rr-comments" title="새로운 채팅" onclick="newchat()"></i>
					</span>
				</div>			
				<!-- 반복할 유저 목록 -->
				<div class="pannel">
					<div class="image-div" onclick="$('#fileInput').click();">
						<input type="file" id="fileInput" name="img" style="display:none;">
						<img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTsN1nJc-HPt3I659Bq0tb_p30Hpa3jZDNIvFxWSx0LTWIYxjGo78l3z70jF2o4k32xHTZfqv33wOJQgubqQkKCcvnW1yNb5wAW4LJBLHFUDg" >
					</div>
					<div class="info">
						고양이
					</div>
				</div>	
			</div>
			
			<c:choose>
			    <c:when test="${not empty sessionScope.uuid}">
					<!-- 로그인 o  -->
					<div class="my-profile pannel login-switch-y">
						<div class="image-div">
							<img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTsN1nJc-HPt3I659Bq0tb_p30Hpa3jZDNIvFxWSx0LTWIYxjGo78l3z70jF2o4k32xHTZfqv33wOJQgubqQkKCcvnW1yNb5wAW4LJBLHFUDg">
						</div>
						<div class="info">
							<span>고양이</span>
							<span style="font-size:24px; cursor:pointer;" class="menu-outline" onclick="menu()">
								<ion-icon name="menu-outline"></ion-icon>
							</span>
						</div>
					</div>
			    </c:when>
			    <c:otherwise>
					<!-- 로그인 x -->
					<div class="my-profile pannel login-switch-n" onclick="location.href='/login'">
						 로그인 하기
					</div>
			    </c:otherwise>
			</c:choose>
				
		</div>
			
		<div style="height:100%; width:100%;">
			<!-- 채팅공간 -->
			<div class="chat-container">
			
				<!-- 상대방 채팅 -->
				<div class="chat-you-box">
					<div class="image-div">
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
			</div> <!-- 채팅공간 끝 -->
			
			<!-- 채팅창 -->
			<form name="chatForm">
				<c:choose>
				    <c:when test="${not empty sessionScope.uuid}">
						<input type="text" name="content" class="chat-input" placeholder="메시지 입력">
				    </c:when>
				    <c:otherwise>
						<input type="text" name="content" class="chat-input" disabled>
				    </c:otherwise>
				</c:choose>
			</form>
		</div>
	</div>
	
	<div class="menu-modal">
	    <div class="menu">
			<div>친구추가 코드</div>
			<div>친구 검색</div>
			<div>설정</div>
			<div onclick="location.href='/login'">로그아웃</div>
	    </div>
	</div>
	
	<div class="newchat-box-modal">
	    <div class="newchat-box">
			<span>
				<i class="fi fi-ts-beacon"></i>
				<span>일반 채팅</span>
			</span>
			<span>
				<i class="fi fi-rr-comments"></i>
				<span>단체 채팅</span>
			</span>
	    </div>
	</div>
</body>
</html>