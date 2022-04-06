<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>엔터정보기술</title>
<style>
.box{
	margin-left : 6vw;
	margin-top : 60px;
	float : left
}
.nike,.adidas,.puma{
	width : calc(95% / 3);
}
.box .logo,.person{
	width: 90%;
	height : 450px;
}
.
.person{
	height : 550px;
}
</style>
</head>
<body>
	<div class="box">
		<label class="nike">
			<a href="<%=request.getContextPath()%>/goods/nike/list2">
				<img class="person" src="<%=request.getContextPath()%>/resources/img/main/호날두.png">
				<img class="logo" src="<%=request.getContextPath()%>/resources/img/main/나이키.jpg">
			</a>
		</label>
		<label class="adidas">
			<a href="<%=request.getContextPath()%>/goods/adidas/list2">
				<img class="person" src="<%=request.getContextPath()%>/resources/img/main/메시.png">
				<img class="logo" src="<%=request.getContextPath()%>/resources/img/main/아디다스.jpg">
			</a>
		</label>
		<label class="puma">
			<a href="<%=request.getContextPath()%>/goods/puma/list2">
				<img class="person" src="<%=request.getContextPath()%>/resources/img/main/네이마르.jpg">
				<img class="logo" src="<%=request.getContextPath()%>/resources/img/main/푸마.png">
			</a>
		</label>
	</div>
</body>
</html>
