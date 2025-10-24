<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkLine</title>
<style>
	/* 전체 레이아웃 설정 */
	.container {
	    display: flex; /* Flexbox를 사용하여 사이드바와 내용을 나란히 배치 */
	    height: 100vh; /* 뷰포트 전체 높이를 사용 */
	    overflow: hidden; /* 전체 컨테이너를 벗어나는 내용은 숨김 */
	}

	/* 사이드바 스타일 */
	.sidebar {
	    width: 300px; /* 사이드바의 너비 */
	    background-color: #f4f4f4; /* 배경색 (약간 회색) */
	    border-right: 1px solid #ddd; /* 오른쪽 경계선 */
	    padding: 10px 0; /* 상하 패딩 */
	    box-sizing: border-box; /* 패딩과 경계선이 너비에 포함되도록 설정 */
	    overflow-y: auto; /* 내용이 길어지면 스크롤바 생성 */
	    flex-shrink: 0; /* 내용 영역의 크기가 변해도 사이드바 크기는 유지 */
	}

	/* 대화 목록 항목 스타일 */
	.chat-list-item {
	    padding: 15px 20px;
	    cursor: pointer; /* 마우스 오버 시 클릭 가능한 모양 */
	    border-bottom: 1px solid #eee;
	    transition: background-color 0.3s; /* 부드러운 전환 효과 */
	}

	/* 마우스 오버 시 스타일 */
	.chat-list-item:hover {
	    background-color: #e9e9e9;
	}

	/* 현재 선택된 항목 스타일 (포인트 색상 적용) */
	.chat-list-item.active {
	    background-color: #007bff; /* 파란색 계열 포인트 색상 */
	    color: white;
	    font-weight: bold;
	}

	/* 메인 내용 영역 스타일 */
	.content {
	    flex-grow: 1; /* 남은 공간을 모두 차지하도록 설정 */
	    padding: 20px;
	    overflow-y: auto; /* 메시지가 많아지면 스크롤바 생성 */
	}
</style>
<script>

</script>
</head>
<body>
	<div class="container">
	    <div class="sidebar">
	        <div class="chat-list-item active">사용자 A</div>
	        <div class="chat-list-item">사용자 B</div>
	        <div class="chat-list-item">사용자 C</div>
	        </div>
	    <div class="content">
	        <h2>메시지 내용</h2>
	        <p>선택된 사용자와의 대화가 표시됩니다.</p>
	    </div>
	</div>
</body>
</html>