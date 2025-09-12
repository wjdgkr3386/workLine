<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
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
</style>
<script>
</script>

<div class="menu-modal">
    <div class="menu">
		<div>친구추가 코드</div>
		<div>친구 검색</div>
		<div>설정</div>
		<div onclick="location.href='/login'">로그아웃</div>
    </div>
</div>
