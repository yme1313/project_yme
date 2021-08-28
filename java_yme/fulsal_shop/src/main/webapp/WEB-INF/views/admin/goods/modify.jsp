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
.mod-box{
	position : absolute; top 0; left :10%;
}
.fa-times{
	margin-left : 5px; cursor : pointer;
}
</style>
</head>
<body>
<div class="container main-box"> 
	<div class="right-board-box">	
 		<form class="mod-box" method= "post" action="<%=request.getContextPath()%>/admin/goods/modify">
 		<h3>상품등록</h3><hr>
	    <div class="input-group mb-3">
	      	<div class="input-group-prepend">
	      	  <span class="input-group-text">상품타입</span>
			<input type="text" class="form-control mr-2" name="fu_type" value="${futsal.fu_type}" readonly>
	   	   </div>
	   	   <div class="input-group-prepend brand">
	   	  	 <span class="input-group-text">브랜드</span>
			<input type="text" class="form-control mr-2" name="fu_brand" value="${futsal.fu_brand}" readonly>	
	      </div>
	    </div>  
   	    <div class="input-group mb-3">   
	   	   <div class="input-group-prepend">
	   	  	 <span class="input-group-text">상품이름</span>
			<input type="text" class="form-control mr-2" name="fu_name" value="${futsal.fu_name}">
	      </div>
	      <div class="input-group-prepend">
	      	 <span class="input-group-text">가격</span>
	      	 <input type="text" class="form-control mr-2 col-6" name="fu_price" value="${futsal.fu_price}">
	      </div>
 	  </div>   
		<div class="form-group">
			<label>상품정보</label>
			<textarea id="summernote" class="form-control" name="fu_info" rows="10">${futsal.fu_info}</textarea>
		</div>
		<div class="form-group img-box">
			<label>이미지</label>
			<div class="form-control img-form">
				<span>${futsal.fu_img}</span>
				<i class="fas fa-times"></i>
			</div>
		</div>
		<input type="hidden" name="fu_num" value="${futsal.fu_num}">
		<button class="btn btn-outline-dark">수정</button>
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
    $('.fa-times').click(function(){
    	var img = '<input type="file" name="fu_img" class="form-control">'
    	$('.img-form').remove()
    	$('.img-box label').after(img)
    })
})
</script>
</body>
</html>