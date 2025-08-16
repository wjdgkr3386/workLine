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
<script>

</script>
</head>
<body>
	<div class="login-container">
		<input type="text" class="input-field" placeholder="아이디" maxlength="10">
		<input type="password" class="input-field" placeholder="비밀번호" maxlength="12">
		<button type="button" class="btn">로그인</button>
		<span class="signup-span" onclick="location.href='/signup'">
			<i class="fa-solid fa-arrow-right-to-bracket"></i>
			<a>회원가입</a>
		</span>
	</div>
</body>
</html>