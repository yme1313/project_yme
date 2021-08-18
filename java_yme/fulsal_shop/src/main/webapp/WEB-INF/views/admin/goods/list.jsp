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
.reg-btn{
	position : absolute;
	top : 0; left : 17vh;
}
</style>
</head>
<body>
<div class="container main-box"> 
	<div class="right-board-box">	
 		<form class="form-inline search-box" action="<%=request.getContextPath()%>/admin/goods/list">
		 	 <select class="form-control mr-2 col-4" name="type">
		 	    <option value="0" <c:if test="${pm.criteria.type == 0}">selected</c:if>>전체</option>
			  	<option value="1" <c:if test="${pm.criteria.type == 1}">selected</c:if>>타입</option>
			  	<option value="2" <c:if test="${pm.criteria.type == 2}">selected</c:if>>상품이름</option>
			  	<option value="3" <c:if test="${pm.criteria.type == 3}">selected</c:if>>브랜드</option>
		  	</select>
			<input class="form-control mr-sm-2 col-6" type="text" name="search" value="<c:out value="${pm.criteria.search}"/>">
			<button class="btn btn-outline-white" type="submit"><i class="fas fa-search"></i></button>
		</form> 
		<div class="container board-box">   
		<h3>상품 관리</h3> 
		<form class="form-inline reg-btn" action="<%=request.getContextPath()%>/admin/goods/register">
			<button class="btn btn-outline-dark btn-sm mt-1">상품등록</button>
		</form>	
	  <c:if test="${list.size() != 0 }">
		 <table class="table table-striped">   
		   <thead>
		     <tr>
			     <th>타입</th>
			     <th>상품이름</th>
				 <th>브랜드</th>
			     <th>기격</th>
			     <th>사이즈</th>  
   			     <th>재고</th> 
   				 <th>상세보기</th> 			      
		     </tr>
		   </thead>
		   <tbody>
		   <c:forEach items="${list}" var="futsal">
			     <tr>
			       <td>${futsal.fu_type}</td>	
				   <td>${futsal.fu_name}</td>	 
			       <td>${futsal.fu_brand}</td>
			       <td>${futsal.fu_price}</td>     
			       <td>${futsal.fu_size}</td>
			       <td>${futsal.fu_stock}</td>  
			       <td>
					  <a href="<%=request.getContextPath()%>/admin/goods/detail?num=${futsal.fu_num}">
						 <button type="button" class="btn btn-outline-dark btn-sm">상세보기</button>
					  </a>
			       </td>
			     </tr>
			</c:forEach>
		   </tbody>
		 </table>
		 <ul class="pagination justify-content-center">
		 	<c:if test="${pm.prev}">
		   		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/admin/user/goods?page=${pm.startPage-1}&type=${pm.criteria.type}&search=${pm.criteria.search}">이전</a></li>
		    </c:if>
		    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
		   		<li class="page-item <c:if test="${pm.criteria.page == index}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/admin/user/goods?page=${index}&type=${pm.criteria.type}&search=${pm.criteria.search}">${index}</a></li>	    
		   </c:forEach>
		    <c:if test="${pm.next}">
		   		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/admin/user/goods?page=${pm.endPage+1}&type=${pm.criteria.type}&search=${pm.criteria.search}">다음</a></li>
		    </c:if>
		  </ul>
  		 </c:if>
	  	 <c:if test="${list.size() == 0 }">
			 <table class="table table-striped">   
			   <thead>
			     <tr>
				     <th>타입</th>
				     <th>상품이름</th>
					 <th>브랜드</th>
				     <th>기격</th>  	
			     </tr>
			   </thead>
			   </table>
		 </c:if>
		</div>
	</div>	
</div>
</body>
</html>