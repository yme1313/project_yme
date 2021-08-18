<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
.main-box{
	position: absolute; top : 2.5%; left : 16%; width : 80%;
}
.right-board-box{
	position: relative;
}
.reg-box{
	position : absolute; top 0; left :10%;
}
.info-box{
	width: 800px; height : 300px;
}
</style>
</head>
<body>
<div class="container main-box"> 
	<div class="right-board-box">	
 		<form class="reg-box" method= "post" action="<%=request.getContextPath()%>/admin/goods/modify">
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
   	   	   <div class="input-group-prepend">
	   	  	 <span class="input-group-text">사이즈</span>
	     		<div class="form-control col-6 mr-2">${futsal.fu_size}</div>
	      </div>
	    </div>  
   	    <div class="input-group mb-3">   
	   	   <div class="input-group-prepend">
	   	  	 <span class="input-group-text">상품이름</span>
				<div class="form-control mr-2">${futsal.fu_name}</div>		
	      </div>
	      <div class="input-group-prepend">
	      	 <span class="input-group-text">가격</span>
	      	 <div class="form-control mr-2">${futsal.fu_price}</div>	
	      </div>
   	      <div class="input-group-prepend">
	      	 <span class="input-group-text">재고</span>
	      	 <div class="form-control mr-2">${futsal.fu_stock}</div>	
	      </div>
 	  </div>   
		<div class="form-group">
			<label>상품정보</label>
			<div class="form-control info-box">${futsal.fu_info}</div>
		</div>
		<div class="form-group">
			<img alt="" src="<%=request.getContextPath()%>/resources/img${futsal.fu_img}" width="100%" height="300">
		</div>		
		<div class="form-group">
			<label>이미지파일</label>
			<div class="form-control">${futsal.fu_img}</div>
		</div>
		<button class="btn btn-outline-dark">수정</button>
		<a href="<%=request.getContextPath()%>/admin/goods/list"><button type="button" class="btn btn-outline-dark">목록</button></a>
		</form> 	 
	</div>	
</div>
</body>
</html>