<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
*{ padding: 0; margin: 0; text-decoration: none; color: #000; }
.fa-shopping-cart, .fa-box{
	color : white;
}
.top-menu{
	position : relative;
}
.memberName{
	position : absolute; top: 2vh; right : 0;
	color : white; margin-right : 20px;
}
	
</style>
</head>
	<body>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark top-menu">
			<ul class="navbar-nav">
				<a class="navbar-brand" href="<%=request.getContextPath()%>/" style="color: white;">HOME</a>
			<c:if test="${user == null}">
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/member/signin" style="color: white;">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/member/signup" style="color: white;">회원가입</a>
				</li>
			</c:if>
			<c:if test="${user != null}">
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/member/signout" style="color: white;">로그아웃</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/member/mypage" style="color: white;">마이페이지</a>
				</li>
			</c:if>
			<c:if test="${user.me_authority == 'USER' || user.me_authority == null}">
				<li class="nav-item">
					<a class="nav-link" href="#" style="color: white;"><i class="fas fa-box"></i>주문/배송조회</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#" style="color: white;"><i class="fas fa-shopping-cart"></i>장바구니</a>
				</li>
			</c:if>
			<c:if test="${user.me_authority == 'SUPER ADMIN' || user.me_authority == 'ADMIN'}">
				<li class="nav-item">
					<a class="nav-link" href="#" style="color: white;"><i class="fas fa-user-cog"></i>관리자전용메뉴</a>
				</li>
			</c:if>
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/board/notice/list" style="color: white;">고객센터</a>
			</li>
			<li>
				<c:if test="${user != null}">
					<div class="memberName">${user.me_name} 님 반갑습니다 !</div>
				</c:if>
			</li>
			
			</ul>
		</nav>
		<ul class="nav justify-content-end mt-3">
			<li class="nav-item">
				<a class="nav-link" href="#" style="color: black">풋살화</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="# "style="color: black">의류</a>
			</li>
			<form class="form-inline" action="/action_page.php">
				<input class="form-control mr-sm-2" type="text">
				<button class="btn btn-outline-white" type="submit"><i class="fas fa-search"></i></button>
			</form>
		</ul>
		<hr>
</body>
</html>
