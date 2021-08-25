<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
*{ 
   list-style:none;
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
.round-box .fas.fa-calculator{
	color : red;
}
.num-box{
	margin-top : 3px;
	font-weight : bold;
}
.cart-box{
	width : 1000px;
	height : 700px;
	margin-left : auto;
	margin-right : auto;
}
.title-box{
	font-size : 30px;
	font-weight : bold;
}
.waring-box{
	font-size : 12px;
}
.waring-box .title{
	font-size : 20px;
	font-weight : bold;
	color : gray
}
.bold-text{
	font-weight : bold;
	color : gray
}
.veryimpo-box{
	font-size : 18px;
	font-weight : bold;
	color : blue;
}
img{
	width : 70px; height : 90px;
}
td{
	line-height : 100px;
}
.cart-price{
	float : right;
}
.delivery-text{
	float : right; color : blue;
}
.price-box{
	height : 100px;
	font-size : 25px;
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
<div class="cart-box">
	<div class="title-box">02.주문/결제</div>
	<hr style="background:#343a40;">
	<div class="veryimpo-box">※ 주문량이 많은 상품은 주문 도중에도 재고 수량이 부족할 수 있습니다.</div>
	 <table class="table">
	    <thead>
	      <tr>
	        <th>상품명</th>
	        <th>상품금액</th>
	        <th>옵션</th>
	        <th>수량</th>
	        <th>합계금액</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr class="list-box">
	        <td><img alt="" class="mr-2" src="<%=request.getContextPath()%>/resources/img/${futsal.fu_img}">${futsal.fu_name}</td>
	        <td>
	        	<fmt:formatNumber pattern="###,###,###" value="${futsal.fu_price}" />원
	        </td>
	        <c:choose>
	        	<c:when test="${futsal.op_size <= 130}">
	        		<td>${futsal.op_size} /(의류)</td>
	        	</c:when>
	        	<c:otherwise>
	        		<td>${futsal.op_size}</td>
	        	</c:otherwise>
	        </c:choose>
	        <td>총 : 2개</td>
	        <td>
	        	<fmt:formatNumber pattern="###,###,###" value="${futsal.fu_price * 2}" />원
	        </td>
	      </tr> 
	    </tbody>
  	 </table>
  	 <div class="delivery-text mt-2">※ 10만원 이상 구매시 배송비 무료 !</div>
  	 <div class="row justify-content-end mt-5 price-box ">
		<div>총 주문 금액 : <span class="total">0 원</span>
		<i class="fas fa-plus"></i> 배송비 : 
		<span class="delivery">2,500 원</span>
		<i class="fas fa-equals mr-1"></i>결제 금액 : <span class="order-price">2500 원</span>
		</div>
	 </div>
</div>