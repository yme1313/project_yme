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
	width : 500px; height : 650px;
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
.veryimpo-box{
	font-size : 18px;
	font-weight : bold;
	color : red;
}	
</style>
</head>
<body>
	<br>
	<div class="container main-box">
		<div class="right-board-box">	
			<h3>주문 내역</h3> 
			<div class="veryimpo-box mb-2">※ 주문내역은 3개월까지만 보관됩니다.</div>
			<c:if test="${list.size() != 0 }">
				<div class="container board-box">    	  
					<c:forEach items="${list}" var="order">
					<div class="order-list-box mr-4 mb-3">
						<div class="order-title-box mb-2">
							<input type="hidden" name="or_num" value="${order.or_num}">
							<i class="far fa-newspaper mr-3 ml-3 mt-1"></i>
							<span class="order-title-text mr-2">${order.or_title}</span>
							<span>[</span><span class="state-text">${order.or_state}</span><span>]</span>
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
					</c:forEach>
				</div>
			  	<ul class="pagination justify-content-center">
				  <c:if test="${pm.prev}">
				    <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/order/cancle_list?page=${pm.startPage-1}">이전</a></li>
				  </c:if> 
				  <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
				  	<c:choose>
					  	<c:when test="${pm.criteria.page == index}">
					    	<li class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/order/cancle_list?page=${index}">${index}</a></li>
		    			</c:when>
		    			 <c:otherwise>
		    				<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/order/cancle_list?page=${index}">${index}</a></li>
		    			</c:otherwise>
	    			</c:choose>
				  </c:forEach> 
				  <c:if test="${pm.next}">
				    <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/order/cancle_list?page=${pm.endPage+1}">다음</a></li>
				  </c:if>  
			 	 </ul>
			 </c:if>
			 <c:if test="${list.size() == 0}">
			 취소된 주문번호가 없습니다.
			 </c:if>	 
		</div>
	</div>	
<script>
</script>
</body>
</html>