<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
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
</style>
</head>
<body>
<div class="container main-box"> 
	<div class="right-board-box">	
 		<form class="reg-box" method= "post" action="<%=request.getContextPath()%>/admin/goods/register">
 		<h3>상품등록</h3><hr>
	    <div class="input-group mb-3">
	      	<div class="input-group-prepend">
	      	  <span class="input-group-text">상품타입</span>
     		<select class="form-control fu_type mr-2" name="fu_type">
				<option value="풋살화">풋살화</option>
				<option value="의류">의류</option>
	     	</select>
	   	   </div>
	   	   <div class="input-group-prepend brand">
	   	  	 <span class="input-group-text">브랜드</span>
	     		<select class="form-control mr-2" name="fu_brand">
					<option value="나이키">나이키</option>
					<option value="아디다스">아디다스</option>
					<option value="푸마">푸마</option>
		     	</select>	
	      </div>	
	    </div>  
   	    <div class="input-group mb-3">   
	   	   <div class="input-group-prepend">
	   	  	 <span class="input-group-text">상품이름</span>
			<input type="text" class="form-control mr-2" name="fu_name">	
	      </div>
	      <div class="input-group-prepend">
	      	 <span class="input-group-text">가격</span>
	      	 <input type="text" class="form-control mr-2 col-6" name="fu_price">
	      </div>
 	  </div>   
		<div class="form-group">
			<label>상품정보</label>
			<textarea id="summernote" class="form-control" name="fu_info" rows="10"></textarea>
		</div>
		<div class="form-group">
			<label>이미지</label>
			<input type="file" name="fu_img" class="form-control">
		</div>
		<button class="btn btn-outline-dark">등록</button>
		<a href="<%=request.getContextPath()%>/admin/goods/list"><button type="button" class="btn btn-outline-dark">목록</button></a>
		</form> 	 
	</div>	
</div>
<script type="text/javascript">
var contextPath = '<%=request.getContextPath()%>';
$(function(){
    $('#summernote').summernote({
        placeholder: '내용을 입력하세요.',
        tabsize: 2,
        height: 350
      });
})
</script>
</body>
</html>