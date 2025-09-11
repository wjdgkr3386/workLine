<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<style>
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
    width: 150px;
    height: 150px;
    background-color: FBF5DE;
    border: 1px solid black;
    border-radius: 10px;
    position: absolute;
    gap: 15px;
}

.newchat-box .fi{
	user-select: none; /* 텍스트 선택 막기 */
	-webkit-user-select: none; /* 크롬/사파리 */
	-moz-user-select: none; /* 파이어폭스 */
	-ms-user-select: none; /* IE/Edge */
}
</style>

<div class="newchat-box-modal">
    <div class="newchat-box">
		<i class="fi fi-ts-beacon"></i>
		<i class="fi fi-rr-comments"></i>
    </div>
</div>
