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
$(function(){init();});
function init(){
	//입력 필드 가져오기
	$("[name='username']").val("김정학");
	$("[name='mid']").val("wjdgkr3386");
	$("[name='pwd']").val("kjh3765!");
	$("[name='pwdCheck']").val("kjh3765!");
	$("[name='phone1']").val("010");
	$("[name='phone2']").val("4614");
	$("[name='phone3']").val("3386");
	$("[name='email']").val("wjdgkr3386@naver.com");
}


function signup(){
	//유효성 검사
	if (!isValid()) {
	    return;
	}
	
	const formObj = $("[name='infoForm']");
	ajax(
	     "/signupProc",
	     "post",
	     formObj,
	     function (cnt) {
			if(cnt==1){
				location.replace("/login");
			} else if(cnt==-1){
				alert("실패");
			}else if(cnt==-2){
				alert("이미 있는 아이디입니다.");
			}else{
				alert("오류가 생겼습니다.\n관리자에게 문의주세요.");
			}
	     }
	);
}

//유효성 검사 메서드
function isValid() {
	var isValid = true;
	
	//입력 필드 가져오기
	var username = $("[name='username']").val().trim();
	var mid = $("[name='mid']").val().trim();
	var pwd = $("[name='pwd']").val().trim();
	var pwdCheck = $("[name='pwdCheck']").val().trim();
	var phone1 = $("[name='phone1']").val().trim();
	var phone2 = $("[name='phone2']").val().trim();
	var phone3 = $("[name='phone3']").val().trim();
	var email = $("[name='email']").val().trim();
	
    if (username === "") {
        alert("이름을 입력하세요.");
        isValid = false;
        return isValid;
    } else if (!/^[가-힣]+$/.test(username)) { // 한글만 허용
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
        isValid = false;
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
	
	if (email === "") {
	    alert("이메일을 입력하세요.");
	    isValid = false;
	    //첫 문자는 영어, @ 나오기 전까지는 영어+숫자 4~12자리, @ 하나, 영어+숫자 하나 이상, . 하나 , 소문자 2~4자리 
	} else if (!/^([a-zA-Z][a-zA-Z0-9]{4,16})@([a-z0-9]+\.)[a-z]{2,4}$/.test(email)) { // 이메일 형식
	    alert("유효한 이메일 주소를 입력하세요.");
	    isValid = false;
	}
    
    return isValid;
}

</script>
</head>
<body>
<form name="infoForm">
	<div class="signup-container">
		<input type="text" class="input-field" name="username" placeholder="이름" maxlength="10">
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
		<input type="email" class="input-field" name="email" placeholder="이메일" maxlength="30">
		<div class="btn-div">
			<button type="button" class="signup-btn btn" onclick="signup()">회원가입</button>
			<button type="button" class="cancle-btn btn" onclick="location.replace('/login')">취소</button>
		</div>
	</div>
</form>
</body>
</html>