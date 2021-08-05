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
</style>
</head>
	<body>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
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
					<a class="nav-link" href="<%=request.getContextPath()%>/" style="color: white;">로그아웃</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/" style="color: white;">마이페이지</a>
				</li>
			</c:if>
			<li class="nav-item">
				<a class="nav-link" href="#" style="color: white;"><i class="fas fa-box"></i>주문/배송조회</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#" style="color: white;"><i class="fas fa-shopping-cart"></i>장바구니</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#" style="color: white;">공지사항</a>
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
