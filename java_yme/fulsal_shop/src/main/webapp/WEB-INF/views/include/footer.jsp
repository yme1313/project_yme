<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
.footer-box{
	position : relative;
}
.footer-box{
	margin-bottom : 0;
	height : 150px;
	font-size : 20px;
	background : #e9ecef;
	position : relative;
}
.footer-box .text{
	margin-left : 5%;
}
.go-top {
	display:none;
	position:fixed;
	bottom:5px;
	right:20px;
	z-index:999;
	cursor:pointer;
	font-size : 80px
}
.company-info{
	position : absolute;
	left : 40%;
	bottom : 27%;
}
.big{
	font-weight : bold;
	font-size : 30px;	
}
.small{
	font-size : 15px;
}
</style>
</head>
<body>
	<div class="footer">
	  <div class="footer-box">
	  	<div class="container text">
		  	<div class="big"><i class="fas fa-phone-alt mr-2"></i>고객센터</div>
			<div class="big">070 - 1234 - 5678</div>
			<div class="small">상담시간 : 10:00 ~ 17:00(토요일,일요일,공휴일 휴무)</div>
			<div class="small">점심시간 : 12:00 ~ 13:00</div>
	  	</div>	
	  	<div class="company-info">
	  		<div class="big mb-2">법인명 : (유)그린풋살</div>
	  		<div class="small mb-1"><span class="mr-4">대표 : 유명은</span><span>사업자등록번호 : 123-45-67890</span></div>
	  		<div class="small">주소 : 충청북도 청주시 서원구 사직대로 109 / 충청북도 청주시 서원구 사창동 148-7</div>
	  	</div>
	    <span class="go-top">
			<i class="far fa-arrow-alt-circle-up"></i>
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
