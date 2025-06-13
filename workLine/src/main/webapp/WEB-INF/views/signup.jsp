<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	.signup-container{
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
		margin-top: 10px;
		border: 1px solid #FCECDD;
		border-radius: 4px;
	}
	.input-phone-field{
		width: 30%;
		height: 50px;
		padding: 10px;
		border: 1px solid #FCECDD;
		border-radius: 4px;
		text-align: center;
	}
	.phone-div{
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-top: 10px;
	}
	.btn-div{
		display: flex;
		margin-top: 10px;
		gap: 0 40px;
		justify-content: center;
	}
	.btn{
		width: 45%;
		height: 50px;
		cursor: pointer; 
		border: none;
		border-radius: 4px;
	}
</style>
<script>
setInterval(function(){location.reload();} , 3 * 1000 );
$(function(){init();});
function init(){}

function signup(){
	//유효성 검사
	if (!isValid()) {
	    return;
	}
}

//유효성 검사 메서드
function isValid() {
	var isValid = true;
	
	//입력 필드 가져오기
	var name = $("[name='name']").val().trim();
	var mid = $("[name='mid']").val().trim();
	var pwd = $("[name='pwd']").val().trim();
	var pwdCheck = $("[name='pwdCheck']").val().trim();
	var phone1 = $("[name='phone1']").val().trim();
	var phone2 = $("[name='phone2']").val().trim();
	var phone3 = $("[name='phone3']").val().trim();
	
    if (name === "") {
        alert("이름을 입력하세요.");
        isValid = false;
        return isValid;
    } else if (!/^[가-힣]+$/.test(name)) { // 한글만 허용
        alert("이름은 한글만 입력할 수 있습니다.");
        isValid = false;
        return isValid;
    }
    
    if (mid === "") {
    	alert("아이디를 입력하세요.");
        isValid = false;
        return isValid;
    } else if (!/^[a-zA-Z0-9]{6,15}$/.test(mid)) { // 영어+숫자 6~10자리
    	alert("아이디는 영어와 숫자로 6~15자리여야 합니다.");
        isValid = false;
        return isValid;
    }
    
    if (pwd === "") {
    	alert("비밀번호를 입력하세요.");
        isValid = false;
        return isValid;
    } else if (!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/.test(pwd)) { // 영어+숫자+특수문자 8~15자리
    	alert("비밀번호는 영어, 숫자, 특수문자를 포함한 8~20자리여야 합니다.");
        isValid = false;
        return isValid;
    }
    
    if(pwdCheck !== pwd){
    	alert("비밀번호가 일치하지 않습니다.");
    	return isValid;
    }
	
    if (phone1 === "" || phone2 === "" || phone3 === "") {
    	alert("전화번호를 입력하세요.");
        isValid = false;
        return isValid;
    } else if (!/^\d{2,3}-\d{3,4}-\d{4}$/.test(phone1 + '-' + phone2 + '-' + phone3)) { // 전화번호 형식
    	alert("전화번호는 9~11자리의 숫자만 입력 가능합니다.");
        isValid = false;
        return isValid;
    }
    
    return isValid;
}

</script>
</head>
<body>
	<div class="signup-container">
		<input type="text" class="input-field" name="name" placeholder="이름" maxlength="10">
		<input type="text" class="input-field" name="mid" placeholder="아이디" maxlength="10">
		<input type="password" class="input-field" name="pwd" placeholder="비밀번호" maxlength="20">
		<input type="password" class="input-field" name="pwdCheck" placeholder="비밀번호 확인" maxlength="12">
		<div class="phone-div">
			<input type="text" class="input-phone-field" name="phone1" placeholder="핸드폰 번호" maxlength="3">
			-
			<input type="text" class="input-phone-field" name="phone2" placeholder="핸드폰 번호" maxlength="4">
			-
			<input type="text" class="input-phone-field" name="phone3" placeholder="핸드폰 번호" maxlength="4">
		</div>
		<div class="btn-div">
			<button type="button" class="signup-btn btn" onclick="signup()">회원가입</button>
			<button type="button" class="cancle-btn btn">취소</button>
		</div>
	</div>
</body>
</html>