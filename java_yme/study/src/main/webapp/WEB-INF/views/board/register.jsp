<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
<form class="container" method="post" action="<%=request.getContextPath()%>/board/register" enctype="multipart/form-data">
	<h1>게시글 등록</h1>
	<div class="form-group">
		<label>제목</label>
		<input type="text" class="form-control" name="title">
	</div>
	<div class="form-group">
		<label>내용</label>
		<textarea id="summernote" name="contents"></textarea>
	</div>
	<div class="form-group">
		<input type="file" name="fileList" class="form-control mb-1">
		<input type="file" name="fileList" class="form-control mb-1">
		<input type="file" name="fileList" class="form-control mb-1">
	</div>
	<button type="submit" class="btn btn-outline-success">등록</button>
	<a href="<%=request.getContextPath()%>/board/list"><button type="button" class="btn btn-outline-success">목록</button></a>
</form>
<script type="text/javascript">
$(function(){
    $('#summernote').summernote({
        placeholder: '내용을 입력하세요.',
        tabsize: 2,
        height: 300
      });
})
</script>
</body>