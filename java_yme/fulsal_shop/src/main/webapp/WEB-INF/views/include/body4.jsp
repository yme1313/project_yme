<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
a{
	color : black
}
a:hover{
	text-decoration : none;	
}
.menu-box{
	width: 15%; height: 100%;
	margin-left: 15px; padding: 0;
}
.menu-box .sub-menu-box{
	margin-bottom : 10px;
}
.menu-font{
	font-size: 15px; font-style:initial;
	text-decoration : none;
}
</style>
</head>
<body>
	<br>
	<div class="menu-box">
		<h3>관리자 메뉴</h3>
			<hr>
			<div class="sub-menu-box"><a href="#" class="menu-font">회원관리</a></div>
			<div class="sub-menu-box"><a href="#" class="menu-font">상품관리</a></div>
			<div class="sub-menu-box"><a href="#" class="menu-font">1:1문의 관리</a></div>
			<div class="sub-menu-box"><a href="#" class="menu-font">주문관리</a></div>
		</div>	
</body>
</html>
