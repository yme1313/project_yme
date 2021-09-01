<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<title>Home</title>
<style>
.box{
	margin-left : 5vw;
	margin-top : 70px;
	display : flex
}
.box .logo,.person{
	margin-right : 20px;
	width: 450px;
	height : 400px;
}
.person{
	height : 550px;
}
</style>
</head>
<body>
	<div class="box">
		<label>
			<a href="<%=request.getContextPath()%>/goods/nike/list2">
				<img class="person" src="<%=request.getContextPath()%>/resources/img/main/호날두.png">
				<img class="logo" src="<%=request.getContextPath()%>/resources/img/main/나이키.jpg">
			</a>
		</label>
		<label>
			<a href="<%=request.getContextPath()%>/goods/adidas/list2">
				<img class="person" src="<%=request.getContextPath()%>/resources/img/main/메시.png">
				<img class="logo" src="<%=request.getContextPath()%>/resources/img/main/아디다스.jpg">
			</a>
		</label>
		<label>
			<a href="<%=request.getContextPath()%>/goods/puma/list2">
				<img class="person" src="<%=request.getContextPath()%>/resources/img/main/네이마르.jpg">
				<img class="logo" src="<%=request.getContextPath()%>/resources/img/main/푸마.png">
			</a>
		</label>
	</div>
</body>
</html>
