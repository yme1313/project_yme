<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style>
.main-box{
	position: absolute; top : 0%; left : 16%; width : 80%;
}
.right-board-box{
	position: relative;
}
.mod-list{
	border : 1px solid black; color : #212529;
}
.mod-list:hover{
	color : white; background : #212529;
}
</style>
</head>
<body>
	<br>
	<div class="container main-box">
		<div class="right-board-box">
			<form class="container" method="post" action="<%=request.getContextPath()%>/board${type}/modify">
					<div class="form-group">
						<label>제목</label>
						<input type="text" class="form-control" name="bd_title" value="${board.bd_title}">
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input type="text" class="form-control" name="bd_me_id" value="${board.bd_me_id}" readonly>
					</div>
					<div class="form-group">
						<label>작성일</label>
						<input type="text" class="form-control" name="dateTime" value="${board.dateTime}" readonly>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea id="summernote" class="form-control" name="bd_contents">${board.bd_contents}</textarea>
					</div>
					<div class="input-group">
						<input type="hidden" name="bd_num" value="${board.bd_num}">
						<button type ="submit" class="btn btn-outline-dark">등록</button>
						<a href="<%=request.getContextPath()%>/board${type}/list">
							<button type="button" class="btn btn-outline-drak mod-list ml-2">목록</button>
						</a>
					</div>
			</form>
		</div>
	</div>
<script type="text/javascript">
$(function(){
    $('#summernote').summernote({
        placeholder: '내용을 입력하세요.',
        tabsize: 2,
        height: 500
     });
})
</script>	
</body>
</html>