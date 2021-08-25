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
</style>
</head>
<body>
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
		        <th>사이즈</th>
		        <th>수량</th>
		      </tr>
		    </thead>
		  <c:forEach items="${list}" var="option"> 
		    <tbody>
		      <tr>
		        <td>${option.op_size}</td>
		        <td>${option.op_count}</td>
		      </tr>
		    </tbody>
		 </c:forEach>    
		  </table>
		<a href="<%=request.getContextPath()%>/admin/goods/list"><button type="button" class="btn btn-outline-dark">목록</button></a>
		</div> 	 
	</div>	
</div>
</body>
</html>