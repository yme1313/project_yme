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
			<div class="veryimpo-box mb-2">※ 주문,취소,교환/반품내역은 3개월까지만 보관됩니다.</div>
			<form class="form-inline search-box" action="<%=request.getContextPath()%>/order/list">
			 	 <span class="mr-2">주문번호</span>
				<input class="form-control mr-sm-2 col-6" type="text" name="search" value="<c:out value="${pm.criteria.search}"/>">
				<button class="btn btn-outline-white" type="submit"><i class="fas fa-search"></i></button>
			</form> 
	  <c:if test="${list.size() != 0 }">
		 <table class="table table-striped">   
		   <thead>
		     <tr>
		     	<th>주문번호</th>
			    <th>상품명</th>
			    <th>주문날짜</th>
				<th>결제방법</th>
			    <th>주문상태</th>   
		     </tr>
		   </thead>
		   <tbody>
		   <c:forEach items="${list}" var="order">
			     <tr>
			       <td>
			       		<a href="<%=request.getContextPath()%>/order/detail?num=${order.or_num}">	
			       			${order.or_title}
			       		</a>
			       </td>	
			       <td style="width : 300px;">
				        <div style = "height : 23.33px; overflow : hidden;">
				       		<a href="<%=request.getContextPath()%>/order/detail?num=${order.or_num}">	
				       			${order.or_goodsname}
				       		</a>
			      		</div>
			       </td>	 
			       <td>${order.or_DateStr}</td>
			       <td>${order.payStr}</td>
			       <td>${order.or_state}</td>   
			     </tr>
			</c:forEach>
		   </tbody>
		 </table>
			  	<ul class="pagination justify-content-center">
				  <c:if test="${pm.prev}">
				    <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/order/list?page=${pm.startPage-1}">이전</a></li>
				  </c:if> 
				  <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
				  	<c:choose>
					  	<c:when test="${pm.criteria.page == index}">
					    	<li class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/order/list?page=${index}">${index}</a></li>
		    			</c:when>
		    			 <c:otherwise>
		    				<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/order/list?page=${index}">${index}</a></li>
		    			</c:otherwise>
	    			</c:choose>
				  </c:forEach> 
				  <c:if test="${pm.next}">
				    <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/order/list?page=${pm.endPage+1}">다음</a></li>
				  </c:if>  
			 	 </ul>
			 </c:if>
			 <c:if test="${list.size() == 0}">
			 등록된 주문번호가 없습니다.
			 </c:if>	 
		</div>
	</div>	
</body>
</html>