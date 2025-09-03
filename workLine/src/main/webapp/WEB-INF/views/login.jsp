<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<meta charset="UTF-8">
<title>로그인</title>
<style>
	.login-container{
		width: 480px;
		margin: 0 auto;
		padding: 30px;
		box-sizing: border-box;
	}
	.input-field{
		display: block;
		width: 100%;
		height: 50px;
		padding: 10px;
		border: 1px solid #FCECDD;
		border-radius: 4px;
	}
	.btn{
		display: block;
		width: 100%;
		height: 50px;
		background-color: #FCECDD;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}
	.signup-span{
		font-size: 13px;
		color: lightgrey;
		cursor: pointer;
	}
	
</style>
</head>
<body>
	<div class="login-container">
		<form name="loginForm">
			<input type="text" class="input-field" name="mid" placeholder="아이디" maxlength="10">
			<input type="password" class="input-field" name="pwd" placeholder="비밀번호" maxlength="12">
		</form>
		<button type="button" class="btn" onclick="login()">로그인</button>
		<span class="signup-span" onclick="location.href='/signup'">
			<i class="fa-solid fa-arrow-right-to-bracket"></i>
			<a>회원가입</a>
		</span>
	</div>
</body>
<script>
	//엔터를 눌렀을때 폼 제출 방지
	$(".input-field").on('keydown', function(event) {
	    if (event.key === 'Enter') {
	        //폼 제출 방지
	        event.preventDefault();
	        login();
	    }
	});

	function login(){
		const formObj = $("[name='loginForm']");
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
</script>
</html>