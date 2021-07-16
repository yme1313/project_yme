<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>

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
		<textarea class="form-control" name="contents" rows="5">${board.contents}</textarea>
	</div>
	<div class="form-group">
        <label>첨부파일</label>
        <input type="file" class="form-control mb-1" name="files"/>
        <input type="file" class="form-control mb-1" name="files"/>
        <input type="file" class="form-control mb-1" name="files"/>
    </div>
	<button type="submit" class="btn btn-outline-danger">등록</button>
	<a href="<%=request.getContextPath()%>/board/list"><button type="button" class="btn btn-outline-danger">목록</button></a>
</form>
</body>