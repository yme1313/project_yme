<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			       <td>${order.or_state}</td>   
			     </tr>
			</c:forEach>
		   </tbody>
		 </table>
		 <ul class="pagination justify-content-center">
		 	<c:if test="${pm.prev}">
		   		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/admin/order/list?page=${pm.startPage-1}&type=${pm.criteria.type}&search=${pm.criteria.search}">이전</a></li>
		    </c:if>
		    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
		   		<li class="page-item <c:if test="${pm.criteria.page == index}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/admin/user/list?page=${index}&type=${pm.criteria.type}&search=${pm.criteria.search}">${index}</a></li>	    
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
</body>
</html>