<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/reply.js"></script>
<style>
	.re-btn{
	font-size : 40px; color : skyblue;
	}
	.fa-thumbs-down{
		transform : rotateY(180deg);
	}
</style>
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
		<div class="form-control" style="height:auto;">${board.contents}</div>
	</div>
		<div class="form-group">
		<label>첨부파일</label>
		<c:forEach items="${fList}" var="file">
			<a class="form-control" href="<%=request.getContextPath()%>/board/download?fileName=${file.name}">${file.ori_name}</a>
		</c:forEach>
	</div>
	<hr>
		<div class="reply form-group">
			<label>댓글</label>
			<div class="contents">
				<div class="reply-list form-group"></div>
				  <ul class="pagination justify-content-center">

				  </ul>
				<div class="reply-box form-group">
					<textarea class="reply-input form-control mb-2" ></textarea>
					<div class="float-right">
						<button type="button" class="reply-btn btn btn-outline-success">등록</button>
					</div>	
				</div>
			</div>
		</div>
		<div class="input-group">
			<a href="<%=request.getContextPath()%>/board/list" class="mr-2"><button class="btn btn-outline-success mb-2">목록</button></a>
		<c:if test="${user != null && user.id == board.writer }">
			<a href="<%=request.getContextPath()%>/board/modify?num=${board.num}" style="text-decoration: none">
				<button class="btn btn-outline-success mr-2">수정</button>
			</a>
			<a href="<%=request.getContextPath()%>/board/delete?num=${board.num}" style="text-decoration: none">
				<button class="btn btn-outline-success mr-2">삭제</button>
			</a>
		</c:if>
		</div>
		<c:if test="${board.groupOrd == 0 && (user != null && user.authority != 'USER')}">
			<a href="<%=request.getContextPath()%>/board/reply/register?oriNo=${board.num}">
				<button class="btn btn-outline-success">답변</button>
			</a>
		</c:if>

	</div>
</body>