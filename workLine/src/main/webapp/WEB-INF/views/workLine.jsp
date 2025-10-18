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
	    overflow: hidden;
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
		min-width: 280px;
		min-height: 850px;
	}
	
	#main-container .chat-container{
		border: 1px solid black;
		border-left: none;
		width: 85%;
		height: 100%;
		box-sizing: border-box;
	}
	
	.chat-container .chat-list{
		height: calc(100% - 50px); 
		background-color: rgba(255, 255, 0, 0.4); /* 노란색 + 50% 투명 */
		padding: 20px;
		box-sizing: border-box;
		overflow-y: auto;
	}
	
	.user-container .tab-list{
		width: 100%;
		height: 88%;
		overflow-y: auto;
		overflow-x: hidden;
	}
	
	.tab-list .pannel:hover{
		background: #FFF7DD;
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
		font-size: 14px;
		font-weight: 450;
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
		width: calc(100% - 12px);
		height: 38px;
		padding: 6px;
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
	
	.chat-input{
		height: 50px;
		width: 100%;
		display: flex;
		border-right: none;
		padding: 0 50px 0 0;
	}
	
	.input-wrapper{
		display: flex;
		position: relative;
	}
	
	.send-button{
		position: absolute;
	    top: 50%;
	    right: 5px;
	    transform: translateY(-50%);
	    color: #4CAF50;
	    font-size: 24px;
	    cursor: pointer;
	    padding: 5px;
	    display: flex;
	    align-items: center;
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
	
	.btn{
		cursor: pointer;
		display:inline-block;
		width: 70px;
		padding: 5px;
		text-align:center;
		border-radius: 8px;
	}
	
	.btn:hover{
		scale: 1.1;
	}
	
	.btn.btn-select{
		background-color: lightgrey;
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
					$('.my-profile-image').attr('src', e.target.result);
					//$("[name='is_select']").val('1');
				}
				
				reader.readAsDataURL(file);
			}
		});
		
		//엔터를 눌렀을때 폼 제출 방지
		$("[name='chatForm'] input[name='content']").on('keydown', function(event) {
		    if (event.key === 'Enter') {
		        //폼 제출 방지
		        event.preventDefault();
		        saveChat();
		    }
		});
	}

	function saveChat(){
		var formObj = $("[name='chatForm']");
		var content = formObj.find("input[name='content']").val().trim();
		
		//값이 들어있는지 확인
        if (!content) {
            return;
        }
		
		ajax(
			     "/saveChatProc",
			     "post",
			     formObj,
			     function (response) {
			    	 if(response.status === 1){
						$("#chat-list").append(`
							    <div class="chat-row me">
							        <span class="time">response.time</span>
							        <div class="chat-me chat">content</div>
							    </div>
							`);
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
	
	function selectBnt(n) {
	    if (n === 1) {
	        $("#toolFriend").removeClass('btn-select');
	        $("#toolChat").addClass('btn-select');
	    } else if (n === 2) {
	        $("#toolChat").removeClass('btn-select');
	        $("#toolFriend").addClass('btn-select');
	    }
	}
	
	function clipboard(){
		if(${empty sessionScope.uuid}){
			return;
		}
		const text = "${sessionScope.uuid}";

		// 임시 input 생성
		const tempInput = document.createElement("input");
		tempInput.value = text;
		document.body.appendChild(tempInput);

		// 선택 후 복사
		tempInput.select();
		document.execCommand("copy");

		// 임시 input 제거
		document.body.removeChild(tempInput);
		
		alert("복사되었습니다");
	}
	
	function searchFriend(){
		var inputText = prompt("친구의 코드를 넣어 추가하세요.").trim();

		if (!inputText || typeof inputText !== "string") {
		    alert("정확한 친구 코드를 입력해주세요.");
		    return;
		}
		
		$("[name='friendCode']").val(inputText);
		var formObj = $("[name='friendForm']");
		ajax(
			     "/addFriendProc",
			     "post",
			     formObj,
			     function (cnt) {
			    	 if(cnt == 1){
			    		 alert("성공");
			    	 }else if(cnt == 0){
			    		 alert("해당 친구 코드에 해당하는 계정이 없습니다.");
			    	 }else if(cnt == -1){
			    		 alert("로그인 해주세요");
			    	 }else if(cnt == -2){
			    		 alert("정확한 친구 코드를 입력해주세요.");
			    	 }else if(cnt == -3){
			    		 alert("이미 친구입니다.");
			    	 }else{
			    		 alert("알 수 없는 문제 발생! 관리자에게 문의 주세요.");
			    	 }
			     }
			);
	}
	
	function getChatroomDirect(friendCode){
 		$("[name='friendCode']").val(friendCode);
		var formObj = $("[name='friendForm']");
		ajax(
			     "/getChatroomDirectProc",
			     "post",
			     formObj,
			     function (response) {
			         const chatList = response.chatList;
			         const myUuid = response.uuid;
			         let prevUuid = "";
			    	 
			    	 chatList.forEach(i => {
						if (i.MEMBER_UUID === myUuid) {
							// 내 채팅
							$("#chat-list").append(`
							    <div class="chat-row me">
							        <span class="time">${i.CREATE_DATE}</span>
							        <div class="chat-me chat">${i.CONTENT}</div>
							    </div>
							`);
						} else if(i.MEMBER_UUID === prevUuid){
							// 같은 사람 채팅
							$("#chat-list").append(`
							    <div class="chat-you-box">
							        <div class="image-div">
							            <img src="${i.IMG}">
							        </div>
							        <div style="width:100%;">
							            <span class="name">${i.NAME}</span>
							            <div class="chat-row">
							                <div class="chat-you chat">${i.CONTENT}</div>
							                <span class="time">${i.CREATE_DATE}</span>
							            </div>
							        </div>
							    </div>
							`);
						} else{
							// 다른 사람 채팅
							$("#chat-list").append(`
								<div class="chat-you-box">
									<div style="width:60px; display:flex;"></div>
									<div style="width:100%;">
										<div class="chat-row">
											<div class="chat-you chat">${i.CONTENT}</div>
											<span class="time">${i.CREATE_DATE}</span>
										</div>
									</div>
								</div>
			                 `);
			             }
			         });
			     }
			);
	} 
</script>
</head>
<body>
	<div id="main-container">
		<div class="user-container">
			<div class="toolbar">
				<span>
					<span class="btn btn-select" id="toolChat" onclick="selectBnt(1)">채팅</span>
					<span class="btn" id="toolFriend" onclick="selectBnt(2)">친구</span>
				</span>
				<span style="display:flex; gap:15px;">
					<i class="fi fi-rr-search" title="검색"></i>
					<i class="fi fi-rr-comments" title="새로운 채팅" onclick="newchat()"></i>
				</span>
			</div>
			
			<!-- 반복할 채팅방 목록 -->
			<div class="tab-list" id="chatroom-list" style="display:none;">
				<c:forEach var="i" items="${friendMapList}">
					<div class="pannel">
						<div class="image-div">
							<img src="${i.IMG}">
						</div>
						<div class="info">
							${i.NAME}
						</div>
					</div>
				</c:forEach>
			</div>
			
			<!-- 반복할 친구 목록 -->
			<div class="tab-list" id="friend-list">
				<c:forEach var="i" items="${friendMapList}">
					<div class="pannel" onclick="getChatroomDirect('${i.FRIENDCODE}')">
						<div class="image-div">
							<img src="${i.IMG}">
						</div>
						<div class="info">
							${i.NAME}
						</div>
					</div>
				</c:forEach>
			</div>
			
			<!-- 내 프로필 -->
			<div class="my-profile pannel">
				<div class="image-div">
					<img class="my-profile-image" src="${requestScope.myInfoMap.IMG}" style="cursor:pointer;" onclick="$('#fileInput').click();">
					<input type="file" id="fileInput" name="img" style="display:none;">
				</div>
				<div class="info">
					<span>${requestScope.myInfoMap.NAME}</span>
					<span style="font-size:24px; cursor:pointer;" class="menu-outline" onclick="menu()">
						<ion-icon name="menu-outline"></ion-icon>
					</span>
				</div>
			</div>
				
		</div>
			
		<!-- 채팅공간 -->
		<div class="chat-container">
			<div class="chat-list" id="chat-list">
			</div>
			
			<!-- 채팅창 -->
			<form name="chatForm">
				<div class="input-wrapper">
				    <input type="text" name="content" class="chat-input" placeholder="메시지 입력">
				    <span class="send-button" onclick="saveChat()">
				        <ion-icon name="send" class="send-button"></ion-icon>
				    </span>
			    </div>
			</form>
			
			
		</div><!-- 채팅공간 끝 -->
	</div><!-- main-container 끝 -->
	
	
	<!-- 안보이는 데이터 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	<div class="menu-modal">
	    <div class="menu">
			<div onclick="clipboard()">내 고유 코드</div>
			<div onclick="searchFriend()">친구 추가</div>
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
	
	<form name="friendForm">
		<input type="hidden" name="friendCode">
	</form>
</body>
</html>