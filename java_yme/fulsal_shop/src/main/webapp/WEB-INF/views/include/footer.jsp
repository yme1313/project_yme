<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
.jumbotron{
	margin-bottom : 0;
	height : 100px;
	font-size : 20px;
}
.jumbotron .text{
	
}
.go-top {
	display:none;
	position:fixed;
	bottom:30px;
	right:30px;
	z-index:999;
	border:1px solid #ccc;
	outline:none;
	background-color:white;
	color:#333;
	cursor:pointer;
	padding:15px 20px;
	border-radius:100%;
}
</style>
</head>
<body>
	<div class="footer">
	  <div class="jumbotron">
		<div class="text">포트폴리오 작업중입니다.</div>
	    <span class="go-top">
			TOP
		</span>
	  </div>
	</div>
<script>
$(window).scroll(function(){
	if ($(this).scrollTop() > 200){
		$('.go-top').show();
	} else{
		$('.go-top').hide();
	}
});
$('.go-top').click(function(){
	$('html, body').animate({scrollTop:0},200);
	return false;
});
</script>	
</body>
</html>
