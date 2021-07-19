<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>

</head>
<body>
<form class="container" method="post" action="<%=request.getContextPath()%>/board/modify" enctype="multipart/form-data">
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
		<textarea class="form-control" name="contents" rows="5">${board.contents}</textarea>
	</div>
	<div class="form-group file-box">
		<label>첨부파일</label>
		<c:forEach items="${fileList}" var="file">
			<div class="form-control mb-1">
				<span>${file.ori_name}</span>
				<input type="hidden" value="${file.num}" name="fileNums">
				<button type="button" class="btn btn-outline-danger del-btn">x</button>
			</div>
		</c:forEach>
		<c:forEach begin="1" end="${3 - fileList.size()}">
			<input type="file" class="form-control mb-1" name="files">
		</c:forEach>
	</div>
	<input type="hidden" value="${board.num}" name="num">
	<button type="submit" class="btn btn-outline-danger">수정</button>
	<a href="<%=request.getContextPath()%>/board/list"><button type="button" class="btn btn-outline-danger">목록</button></a>
</form>
<script type="text/javascript">
$(function(){
	$('.del-btn').click(function(){
		$(this).parent().remove();
		$('.file-box').append('<input type="file" class="form-control mb-2" name="files">');
	})
})
</script>
</body>