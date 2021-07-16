<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>

</head>
<body>
<div class="container">
	<h1>게시판</h1>
	<div class="form-group">
		<label>제목</label>
		<input type="text" class="form-control" name="title" value="${board.title}" readonly>
	</div>
	<div class="form-group">
		<label>작성자</label>
		<input type="text" class="form-control" name="writer" value="${board.writer}" readonly>
	</div>
	<div class="form-group">
		<label>작성일</label>
		<input type="text" class="form-control" name="dateTime" value="${board.dateTime}" readonly>
	</div>
	<div class="form-group">
		<label>조회수</label>
		<input type="text" class="form-control" name="views" value="${board.views}" readonly>
	</div>
	<div class="form-group">
		<label>내용</label>
		<textarea class="form-control" name="contents" rows="5" readonly>${board.contents}</textarea>
	</div>
	<c:if test="${fileList.size() != 0 }">
		<div class="form-group">
			<label>첨부파일</label>
				<c:forEach items="${fileList}" var="file">
					<a href="<%=request.getContextPath()%>/board/download?fileName=${file.name}" class="form-control mb-1">${file.ori_name}</a>
				</c:forEach>
		</div>
	</c:if>
		<div class="input-group">
			<a href="<%=request.getContextPath()%>/board/list" class="mr-2"><button class="btn btn-outline-danger">목록</button></a>
			<c:if test="${board != null && user.id == board.writer }">
				<a href="<%=request.getContextPath()%>/board/modify?num=${board.num}" class="mr-2"><button class="btn btn-outline-danger">수정</button></a>
					<form action="<%=request.getContextPath()%>/board/delete" method="post" class="mr-2">
						<input type="hidden" value="${board.num }" name="num">
					<button class="btn btn-outline-danger">삭제</button>
				</form>
			</c:if>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
		var msg = '${msg}';
		printMsg(msg);
		history.replaceState({},null,null);
	})
	function printMsg(msg){
		if(msg == '' || history.state){
			return ;
		}
		alert(msg);
	}
	</script>
</body>