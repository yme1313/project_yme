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
	float: left;  position: relative;
}
.left-board-box{
	width: 20vw; height: 100vh;
	margin: 0; padding: 0;
}
.left-board-box .left-menu-box{
	margin-bottom : 10px;
}
.right-board-box{
	position: absolute; top: 0; left: 30%; width : 60vw;
}
.menu-font{
	font-size: 15px; font-style:initial;
	text-decoration : none; color : black
}
.menu-font:hover{
	text-decoration : none;	
}
.reg-btn{
	position: absolute; top: 0; right: 0;
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
		<div class="left-board-box">
			<h3>고객센터</h3>
			<hr>
			<div class="left-menu-box"><a href="<%=request.getContextPath()%>/board/notice/list" class="menu-font">공지사항</a></div>
			<div class="left-menu-box"><a href="<%=request.getContextPath()%>/board/list" class="menu-font">1:1문의</a></div>
		</div>
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