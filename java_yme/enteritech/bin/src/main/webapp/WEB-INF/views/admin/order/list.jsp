<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script><!-- jQuery CDN --->
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
	position : absolute; top 50px; right :0;
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
.board-box h3{
	margin-bottom : 1rem;
}
</style>
</head>
<body>
<div class="container main-box"> 
	<div class="right-board-box">	
 		<form class="form-inline search-box" action="<%=request.getContextPath()%>/admin/order/list">
		 	 <select class="form-control mr-2 col-4" name="type">
		 	    <option value="0" <c:if test="${pm.criteria.type == 0}">selected</c:if>>주문번호</option>
			  	<option value="1" <c:if test="${pm.criteria.type == 1}">selected</c:if>>아이디</option>
		  	</select>
			<input class="form-control mr-sm-2 col-6" type="text" name="search" value="<c:out value="${pm.criteria.search}"/>">
			<button class="btn btn-outline-white" type="submit"><i class="fas fa-search"></i></button>
		</form> 
		<div class="container board-box">   
		<h3>주문 관리</h3>
	  	<c:if test="${list.size() != 0 }">
		 <table class="table table-striped">   
		   <thead>
		     <tr>
		     	<th>주문번호</th>
			    <th>아이디</th>
			    <th>주문날짜</th>
				<th>결제방법</th>
			    <th>주문상태</th>  
			    <th>교환/반품</th>
			    <th>환불하기</th> 
		     </tr>
		   </thead>
		   <tbody>
		   <c:forEach items="${list}" var="order">
			     <tr>
			       <td>
			       		<a href="<%=request.getContextPath()%>/admin/order/detail?num=${order.or_num}">	
			       			${order.or_title}
			       		</a>
			       </td>	
			       <td>${order.or_me_id}</td>	 
			       <td>${order.or_DateStr}</td>
			       <td>${order.payStr}</td>
			       <td>${order.stateStr}</td>  
			       <td>${order.or_returntype}</td> 
			       <td class="refund-box">
	       			  <c:if test="${(order.stateStr == '주문취소' || order.stateStr == '재고부족' || order.or_returntype == '반품') && order.or_refund == 'N'}">
	       			  		<button class="btn btn-outline-danger btn-sm return-btn">환불</button>
	       			  		<input type="hidden" name="or_price" value="${order.or_price}">
	       			  		<input type="hidden" name="or_num" value="${order.or_num}">
	       			  </c:if>
 			  	      <c:if test="${(order.stateStr == '주문취소' || order.stateStr == '재고부족' || order.or_returntype == '반품') && order.or_refund == 'Y'}">
	       			  		<div class="btn btn-danger btn-sm">환불완료</div>
	       			  </c:if>
			       </td>
			     </tr>
			</c:forEach>
		   </tbody>
		 </table>
		 <ul class="pagination justify-content-center">
		 	<c:if test="${pm.prev}">
		   		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/admin/order/list?page=${pm.startPage-1}&type=${pm.criteria.type}&search=${pm.criteria.search}">이전</a></li>
		    </c:if>
		    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
		   		<li class="page-item <c:if test="${pm.criteria.page == index}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/admin/order/list?page=${index}&type=${pm.criteria.type}&search=${pm.criteria.search}">${index}</a></li>	    
		   </c:forEach>
		    <c:if test="${pm.next}">
		   		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/admin/order/list?page=${pm.endPage+1}&type=${pm.criteria.type}&search=${pm.criteria.search}">다음</a></li>
		    </c:if>
		  </ul>
  		 </c:if>
	  	 <c:if test="${list.size() == 0 }">
			주문 내역이 없습니다.
		 </c:if>
		</div>
	</div>	
</div>
<script>

$(function(){
	$('.return-btn').click(function(){
		var or_num = $(this).siblings('[name=or_num]').val()
		var btn = $(this).parent()
		var data = {or_num : or_num}
		var confirm_val = confirm('정말 환불하시겠습니까?')
		var price = '100'
		var str = '<div class="btn btn-danger btn-sm">환불완료</div>'
		if(confirm_val){
			$.ajax({
				type : 'post',
				url : '<%=request.getContextPath()%>/admin/order/refund',
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				success : function(res){
					if(res == 'OK'){
						alert('환불이 완료되었습니다.')
						canclePay(price);
						btn.html(str)
					} else {
						alert('환불에 실패했습니다.')
					}
				}
			})	
		}
	})
})
function canclePay(price) {
  	jQuery.ajax({
    	"url": "{환불요청을 받을 서비스 URL}", // 예: http://www.myservice.com/payments/cancel
    	"type": "POST",
    	"contentType": "application/json",
    	"data": JSON.stringify({
      		"merchant_uid": "1630894279954", // 예: ORD20180131-0000011
      		"cancel_request_amount": price, // 환불금액
      		"reason": "테스트 결제 환불", // 환불사유
      		"refund_holder": "", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
      		"refund_bank": "", // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
      		"refund_account": "" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
    	}),
    	"dataType": "json"
  });
}
</script>
</body>
</html>