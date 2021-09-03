<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
 a{
 	color : black
 }
.main-box{
	position: absolute; top : 2.5%; left : 16%; width : 80%;
}
.right-board-box{
	position: relative;
}
.search-box{
	position : absolute; 
	top : 0; right :3%;
}
 a:hover{
	text-decoration : none;	
}
.page-link{
	color : black;
}
.pagination .page-item.active a {
      background-color: darkslategray;
      border : darkslategray;
}
h3{
	margin-bottom : 1rem;
}
.board-box{
	display : flex;
}
.order-list-box{
	width : 800px; height : 650px;
}
.order-title-text{
	font-size : 20px;
	font-weight : bold;
}
.fa-newspaper{
	font-size : 30px;
}
.state-text{
	color : red;
	font-weight : bold;
}
.btn-sm{
	float : right;
	margin-top : 10px; margin-right : 10px;
}
</style>
</head>
<body>
	<br>
	<form method="post" action="<%=request.getContextPath()%>/admin/order/ok">
	<!-- input hidden -->	
	<input type="hidden" name="or_num" value="${order.or_num}">
	<input type="hidden" name="or_fuNums" value="${order.or_fuNums}">
	<input type="hidden" name="or_count" value="${order.or_count}">
	<input type="hidden" name="or_size" value="${order.or_size}">
	<div class="container main-box">
		<div class="right-board-box">	
			<h3>주문 내역</h3> 
			<div class="container board-box">    	 
				<div class="order-list-box mr-4 mb-3">
					<div class="order-title-box mb-2">
						<i class="far fa-newspaper mr-3 ml-3 mt-1"></i>
						<span class="order-title-text mr-2">${order.or_title}</span>
						<span>[</span><span class="state-text">${order.or_state}</span><span>]</span>
						<c:if test="${order.or_cancle == 'N' && order.or_state == '주문확인중' }">
							<button id="order_ok_btn" class="btn btn-outline-dark btn-sm">주문접수</button>
							<button type="button" id="stock_zero_btn" class="btn btn-outline-danger btn-sm">재고량부족</button>
						</c:if>				
					</div>
					<div class="container">
					  <table class="table table-bordered">
					    <tbody>
					      <tr>
					        <td>상품명</td>
					        <td>${order.or_goodsname}</td>
					      </tr>
					      <tr>
					        <td>가격</td>
					        <td><fmt:formatNumber pattern="###,###,###" value="${order.or_price}" />원</td>
					      </tr>
					      <tr>
					        <td>결제방법</td>
					        <td>${order.payStr}</td>
					      </tr>
					      <tr>
					        <td>받는사람</td>
					        <td>${order.or_name}</td>
					      </tr>
					      <tr>
					        <td>전화번호</td>
					        <td>${order.or_phone}</td>
					      </tr>
					      <tr>
					        <td style="width : 120px;">이메일주소</td>
					        <td>${order.or_email}</td>
					      </tr>
					      <tr>
					        <td>주문날짜</td>
					        <td>${order.or_DateStr}</td>
					      </tr>
					      <tr>
					        <td>도로명주소</td>
					        <td>${order.or_add1}, ${order.or_add2} / ${order.or_add4}</td>
					      </tr>
					      <tr>
					        <td>지번주소</td>
					        <td>${order.or_add3}, ${order.or_add2}</td>
					      </tr>
					      <tr>
					        <td>배송메시지</td>
					        <td>${order.or_message}</td>
					      </tr>
					    </tbody>
					  </table>
					</div>  
				</div>	  
			</div>
		</div>
	</div>	
	</form>
<script>
$(function(){
	$('#stock_zero_btn').click(function(){
		var or_num = $('[name=or_num]').val()
		var data = {or_num : or_num}
		var confirm_val = confirm("정말 취소하시겠습니까?");		
		  if(confirm_val) {
		   $.ajax({
			    type : "post",
			    url : '<%=request.getContextPath()%>/admin/order/stockZero',
				data: JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
			    success : function(res){
						if(res== 'OK'){
							alert('주문이 취소되었습니다.')
							$('.state-text').text('재고부족');
							$('#order_ok_btn').remove();
							$('#stock_zero_btn').remove();
						} else {
							alert('주문취소에 실패했습니다.')
						}
					}
			})
		}
	})
})
</script>
</body>
</html>