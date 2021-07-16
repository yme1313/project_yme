<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>

</head>
<body>
<form class="container" method="post" action="<%=request.getContextPath()%>/board/modify">
	<h1>게시글 수정</h1>
	<div class="form-group">
		<label>제목</label>
		<input type="text" class="form-control" name="title" value="${board.title}" >
	</div>
	<div class="form-group">
		<label>작성자</label>
		<input type="text" class="form-control" name="writer" value="${board.writer}" readonly>
	</div>
	<div class="form-group">
		<label>내용</label>
		<textarea class="form-control" name="contents" rows="10">${board.contents}</textarea>
	</div>
	<input type="hidden" value="${board.num}" name="num">
	<button type="submit" class="btn btn-outline-danger">수정</button>
	<a href="<%=request.getContextPath()%>/board/list"><button type="button" class="btn btn-outline-danger">목록</button></a>
</form>
</body>