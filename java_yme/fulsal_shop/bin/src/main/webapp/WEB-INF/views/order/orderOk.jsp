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
.title-box{
	font-size : 30px;
	font-weight : bold;
}
.fa-gifts{
	font-size : 300px;
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
.order-info{
	text-align : left;
	width : 375px;
	margin-left : auto;
	margin-right : auto;
}
.info-bold{
	font-weight : bold;
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
			<i class="fas fa-gifts mb-2"></i><br>
			<div class="order-info mb-3">
				<div class="info-bold">주문번호 : ${order.or_title}</div>
				<div class="info-bold">주문가격 : <fmt:formatNumber pattern="###,###,###" value="${order.or_price}" />원</div>
			</div>
		<div class="order-text mb-4">
			결제가 완료 되었습니다.<br>
			자세한 주문내역은 주문내역 확인하기 버튼을 클릭해주세요.
		</div>
		</div>
	</div>
	 <div class="row justify-content-center"> 
		<a href="<%=request.getContextPath()%>/goods/shoes/list">
		    <button type="button" class="btn btn-dark btn-lg mr-2">계속 쇼핑하기</button>
		 </a>
		<a href="<%=request.getContextPath()%>/order/list">
		 <button type="submit" class="btn btn-danger btn-lg order-btn">주문 내역 확인</button>
		 </a>
	 </div>
</div>
<script>
function NotReload(){
	if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
		event.keyCode = 0; 
		event.cancelBubble = true; 
		event.returnValue = false; 
		} 
	} 
document.onkeydown = NotReload;
</script>
</body>
</html>