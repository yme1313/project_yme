<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.main-box{
	position: absolute; top : 2.5%; left : 16%; width : 80%;
}
.right-board-box{
	position: relative;
}
.contents-box{
	position : absolute; top 0; left :10%;
}
.info-box{
	width: 800px; height : 200px;
}
.option-box{
	width : 60%;
}
#addStock{
	border : 1px solid #dee2e6;
	width :63px;
	height : 27px;
}
</style>
</head>
<body>
<form method="post" action="<%=request.getContextPath()%>/admin/goods/stockadd">
<input type="hidden" name="fu_num" value="${futsal.fu_num}">
	<div class="container main-box"> 
		<div class="right-board-box">	
	 		<div class="contents-box">
	 		<h3>상품상세</h3><hr>
			    <div class="input-group mb-3">
			      	<div class="input-group-prepend">
			      	  <span class="input-group-text">상품타입</span>
		     		<div class="form-control fu_type mr-2">${futsal.fu_type}</div>
			   	   </div>
			   	   <div class="input-group-prepend">
			   	  	 <span class="input-group-text">브랜드</span>
			     		<div class="form-control mr-2">${futsal.fu_brand}</div>	
			      </div>
			    </div>  
		 	    <div class="input-group mb-3">   
			  	   <div class="input-group-prepend">
			  	  	 <span class="input-group-text">상품이름</span>
					<div class="form-control mr-2">${futsal.fu_name}</div>		
			     </div>
			     <div class="input-group-prepend">
			     	 <span class="input-group-text">가격</span>
			     	 <div class="form-control mr-2"><fmt:formatNumber pattern="###,###,###" value="${futsal.fu_price}" />원</div>	
			     </div>
			  </div>     
			  <table class="table table-bordered option-box">
			    <thead>
			      <tr>
			        <th style="{text-align : center;}">사이즈</th>
			        <th style="{text-align : center;}">수량</th>
			        <th style="{text-align : center;}">추가수량</th>
			      </tr>
			    </thead>
				 <c:forEach items="${list}" var="option"> 
				 	<input type="hidden" name="op_num" value="${option.op_num}">
				    <tbody>
				      <tr>
				        <td>${option.size}</td>
				        <td>${option.op_count}</td>
				        <td><input type="text" id="addStock" name="addStock"></td>
				      </tr>
				    </tbody>
				 </c:forEach>    
			  </table>
			  <button type="submit" class="btn btn-outline-dark mr-1">재고추가</button>
			 <a href="<%=request.getContextPath()%>/admin/goods/list"><button type="button" class="btn btn-outline-dark">목록</button></a>
			</div> 	 
		</div>
	</div>
</form>
</body>
</html>