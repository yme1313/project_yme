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
.round-box .fas.fa-shopping-cart{
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
<form method="post" action="<%=request.getContextPath()%>/order/cart_order">
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
	<div class="title-box">01.장바구니</div>
	<hr style="background:#343a40;">
	<div class="waring-box mb-2">
		<div class="title">장바구니 유의사항</div><br>
		장바구니에 담긴 상품은 30일까지만 저장됩니다.(이후 삭제)<br>
		구매하실 상품을 장바구니에 담으시고, 주문하기를 눌러주지 않으시면, 주문이 전혀 안됩니다.<br>
		주문하실 다른 물건이 있으면, 하단에 <span class="bold-text">"쇼핑계속하기"</span> 버튼을 클릭 하셔서 이용해주세요.
	</div>
	<div class="veryimpo-box">※ 주문량이 많은 상품은 주문 도중에도 재고 수량이 부족할 수 있습니다.</div>
	 <table class="table">
	    <thead>
	      <tr>
	      	<th><input type="checkbox" id="allCheck"></th>
	        <th>상품명</th>
	        <th>상품금액</th>
	        <th>옵션</th>
	        <th>수량</th>
	        <th>합계금액</th>
	        <th>비고</th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${list}" var="cart">
	      <tr class="list-box">
	      	<td><input type="checkbox" class="ckBox" name="ca_num" data-target="${cart.ca_price}" value="${cart.ca_num}"></td>
	        <td><img alt="" class="mr-2" src="<%=request.getContextPath()%>/resources/img/${cart.fu_img}">${cart.fu_name}</td>
	        <td>
	        	<fmt:formatNumber pattern="###,###,###" value="${cart.fu_price}" />원
	        </td>
			<td>${cart.size}</td>
	        <td>총 : ${cart.ca_count}개</td>
	        <td>
	        	<fmt:formatNumber pattern="###,###,###" value="${cart.ca_price}" />원
	        </td>
	        <td>
	        	<button class="btn btn-outline-danger btn-sm del-btn">삭제</button>
	        	<input type="hidden" id="ca_num" value="${cart.ca_num}">	
	        	<input type="hidden" name="fu_num" value="${cart.fu_num}">
	        	<input type="hidden" name="ca_me_id" value="${cart.ca_me_id}">
	        </td>
	      </tr> 
	     </c:forEach>
	    </tbody>
  	 </table>
  	 <div class="cart-price">
	     <span>합계금액 :</span>
	     <span class="total">0 원</span>
     </div>
     <div class="cart-btn-box">
		 <button class="btn btn-outline-danger btn-sm all-sel-btn">전체 상품 선택</button>
		 <button class="btn btn-outline-danger btn-sm sel-del-btn">선택 삭제</button>
	 </div>
	 <div class="delivery-text mt-2">※ 10만원 이상 구매시 배송비 무료 !</div>
  	 <div class="row justify-content-center mt-5 price-box ">
		<div>총 주문 금액 : <span class="total">0 원</span>
		<i class="fas fa-plus"></i> 배송비 : 
		<span class="delivery">2500 원</span>
		<i class="fas fa-equals mr-1"></i>결제 금액 : <span class="order-price">2500 원</span>
		</div>
	 </div>
	 <div class="row justify-content-center"> 
		<a href="<%=request.getContextPath()%>/goods/shoes">
		    <button type="button" class="btn btn-dark btn-lg mr-2">계속 쇼핑하기</button>
		 </a>
		
		 <button type="submit" class="btn btn-danger btn-lg order-btn">주문하기</button>
	 </div>
</div>
</form>


<script type="text/javascript">
var contextPath = '<%=request.getContextPath()%>';
$(function(){
	$('#allCheck').click(function(){
		var chk = $('#allCheck').prop("checked");
		if(chk){
			$('.ckBox').prop("checked",true)
			itemSum();
		} else {
			$('.ckBox').prop("checked",false)
			itemSum();
		}
	})
	
	$('.all-sel-btn').click(function(){
		$('#allCheck').prop("checked",true)
		$('.ckBox').prop("checked",true)
		itemSum();
	})
	
	$('.ckBox').click(function(){
		$('#allCheck').prop("checked",false)
		var ddd = $(this).attr('data-target')
		itemSum();
	})
	
	$('.del-btn').click(function(){
		$(this).parent().parent().remove()
		var ca_num = $(this).siblings('#ca_num').val()
		var data = {ca_num : ca_num}
	   $.ajax({
		    type : "post",
		    url : contextPath + '/cart/del',
			data: JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
		    success : function(res){
					if(res== 'OK'){
						alert('삭제 완료!')
					}
				}
		})
	})
	
	$('.sel-del-btn').click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");		
		  if(confirm_val) {
			   var checkArr = new Array();
			   
			   $("input[class='ckBox']:checked").each(function(){
			    checkArr.push($(this).val());
			   })

			   $.ajax({
				    type : "post",
				    url : contextPath + '/cart/selectDel',
				    data : { chbox : checkArr },
				    success : function(res){
					     if(res == 'OK'){
					    	 alert('삭제에 성공했습니다.')
					     } else {
					    	 alert('삭제에 실패했습니다.')
					     }
				    }
				})
		 } 
	})
	$('.order-btn').click(function(e){
		var length = $('input:checkbox[name=ca_num]:checked').length
		if(length == 0){
			e.preventDefault()
			alert('구매할 물건을 선택하세요.')
		} 
	})

	
})

function itemSum(){
	var str = "";
	var sum = 0;
	var free= "0 원";
	var basic = "2,500 원"
	var count = $('.ckBox').length
	var regex = /[^0-9]/g;	
	for (var i = 0; i < count; i++) {
		if ($('.ckBox')[i].checked == true) {
			sum += parseInt($('.ckBox')[i].getAttribute('data-target'));
		}
	}	
	if(sum >= 100000){
		$('.delivery').text(free)
	} else {
		$('.delivery').text(basic)
	}
	var deprice = $('.delivery').text()
	var price = deprice.replace(regex, "");
	var intprice = parseInt(price)
	var orderprice = sum + intprice
	
	$('.total').html(sum + ' 원')
	$('.order-price').html(orderprice + ' 원')
}

</script>
</body>
</html>