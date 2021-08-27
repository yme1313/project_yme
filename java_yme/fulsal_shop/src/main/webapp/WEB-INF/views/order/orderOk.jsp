<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
*{
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  list-style : none;
}
.order-img-box {

}
.fa-gifts{
	font-size : 500px;
	text-align : center; 
	color : red;
	margin-bottom : 10px;
}
.gift-box{
	text-align: center;
}
.main-box{
	height : 200px;
}
.round-box{
	width : 120px; height : 120px;
	text-align : center; 
}
.img-box{
	display : flex;  
	margin-left: 25%;
    margin-right: 13%;
    justify-content: space-around;
}    
.img-box .round-box{
	margin-right : 200px; z-index : 10;
}
.round-box:last-child{
	marigin-right : 0; 
}
.img-box .round-box .fas{
	font-size : 90px; margin-top : 20px; color : #343a40;
}
.round-box .fas.fa-check-square{
	color : red;
}
.num-box{
	margin-top : 3px;
	font-weight : bold;
}
.ok-box{
	width : 1000px;
	height : 700px;
	margin-left : auto;
	margin-right : auto;
}
.order-text{
	font-weight: bold;
	font-size : 20px;
}
</style>
</head>
<body>
<div class="main-box">
	<ul class="img-box">
		<li class="round-box">
			<i class="fas fa-shopping-cart mb-1"></i><br>장바구니
			<div class="num-box">01</div>
		</li>
		<li class="round-box">
			<i class="fas fa-calculator mb-1"></i><br>주문/결제
			<div class="num-box">02</div>
		</li>
		<li class="round-box">
			<i class="fas fa-check-square mb-1"></i><br>결제완료
			<div class="num-box">03</div>
		</li>
	</ul>
</div>	
<div class="ok-box">
	<div class="title-box">03.결제완료</div>
	<hr style="background:#343a40;">
	<div class="order-img-box">
		<div class="gift-box">
		<i class="fas fa-gifts"></i><br>
		<div class="order-text mb-2">
			결제가 완료 되었습니다.<br>
			자세한 주문내역은 주문내역 확인하기 버튼을 클릭해주세요.
		</div>
		</div>
	</div>
	 <div class="row justify-content-center"> 
		<a href="<%=request.getContextPath()%>/goods/shose">
		    <button type="button" class="btn btn-dark btn-lg mr-2">계속 쇼핑하기</button>
		 </a>
		<a href="<%=request.getContextPath()%>/order/list">
		 <button type="submit" class="btn btn-danger btn-lg order-btn">주문 내역 확인</button>
		 </a>
	 </div>
</div>

</body>
</html>