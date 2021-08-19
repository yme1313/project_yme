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
.contents-box{
	position : absolute; top 0; left :10%;
}
.info-box{
	width: 800px; height : 200px;
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
	      	 <div class="form-control mr-2">${futsal.fu_price}</div>	
	      </div>
 	  </div>     
 	  <form class="option-box" method= "post" action="<%=request.getContextPath()%>/admin/goods/optionadd">
 	   <div class="input-group mb-3">
	 	   <c:if test="${futsal.fu_type == '풋살화'}">
	 	      <div class="input-group-prepend">
		   	  	 <span class="input-group-text">사이즈</span>
		     		 <select class="form-control col-6 mr-2" name="op_size">
						<option value="220">220</option>
						<option value="225">225</option>
						<option value="230">230</option>
						<option value="235">235</option>
						<option value="240">240</option>
						<option value="245">245</option>
						<option value="250">250</option>
						<option value="255">255</option>
						<option value="260">260</option>
						<option value="265">265</option>
						<option value="270">270</option>
						<option value="275">275</option>
						<option value="280">280</option>
		     		</select>
		      </div>
	      </c:if>
	      <c:if test="${futsal.fu_type == '의류'}">
	 	      <div class="input-group-prepend">
		   	  	 <span class="input-group-text">사이즈</span>
		     		<select class="form-control col-6 mr-2" name="op_size">
						<option value="80(XXS)">80(XXS)</option>
						<option value="85(XS)">85(XS)</option>
						<option value="90(S)">90(S)</option>
						<option value="95(M)">95(M)</option>
						<option value="100(L)">100(L)</option>
						<option value="105(XL)">105(XL)</option>
						<option value="110(XXL)">110(XXL)</option>
		     		</select>
		      </div>
	      </c:if>
	      <div class="input-group-prepend">
	      	 <span class="input-group-text">수량</span>
	      	 <input type="text" class="form-control col-4" name="op_count">
	      </div>
	      <button class="btn btn-outline-dark">옵션 추가</button>
	    </div>
	    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
	  </form>  
		<div class="form-group">
			<label>상품정보</label>
			<div class="form-control info-box">${futsal.fu_info}</div>
		</div>
		<div class="form-group">
			<img alt="" src="<%=request.getContextPath()%>/resources/img/${futsal.fu_img}" width="100%" height="300">
		</div>		
		<div class="form-group">
			<label>이미지파일</label>
			<div class="form-control">${futsal.fu_img}</div>
		</div>
		<a href="<%=request.getContextPath()%>/admin/goods/list"><button type="button" class="btn btn-outline-dark">목록</button></a>
		</div> 	 
	</div>	
</div>
</body>
</html>