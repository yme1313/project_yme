<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
	.box{
	position : relative;
	}
	img{
	position : absolute; top : 15vh; left : 20vw;
	}
</style>
</head>
<body>
	<div class="box">
		<img src="<%=request.getContextPath()%>/resources/img/winter.gif">
	</div>
</body>
</html>
