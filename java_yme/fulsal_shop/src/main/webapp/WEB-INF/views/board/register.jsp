<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style>
a{
	color : black
}
a:hover{
	text-decoration : none;	
}
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
	width : 60vw;
	position: absolute; top: 0; left: 30%;
}
.board-font{
	font-size: 15px; font-style:initial;
	margin-bottom: 10px;
}
.reg-btn{
	position: absolute; top: 0; right: 0;
}
.menu-font{
	font-size: 15px; font-style:initial;
	text-decoration : none;
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
			<c:if test="${type ne '/notice'}">        
				<form class="container" method="post" id="enquiry_reg_btn">
					<div class="form-group">
						<label>제목</label>
						<input type="text" class="form-control" name="bd_title">
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" class="form-control" name="bd_pw">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea id="summernote" class="form-control" name="bd_contents" rows="10">${board.bd_contents }</textarea>
					</div>
					<button class="btn btn-outline-dark">등록</button>
					<a href="<%=request.getContextPath()%>/board${type}/list"><button type="button" class="btn btn-outline-dark">목록</button></a>
				</form>
			</c:if>
			<c:if test="${type eq '/notice'}">  
				<form class="container" method="post">
					<div class="form-group">
						<label>제목</label>
						<input type="text" class="form-control" name="bd_title">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea id="summernote" class="form-control" name="bd_contents" rows="10">${board.bd_contents }</textarea>
					</div>
					<button class="btn btn-outline-dark">등록</button>
					<a href="<%=request.getContextPath()%>/board${type}/list"><button type="button" class="btn btn-outline-dark">목록</button></a>
				</form>
			</c:if>
		</div>
	</div>
	<script type="text/javascript">
$(function(){
	$('#enquiry_reg_btn').submit(function(){
		if($('[name=bd_pw]').val == ''){
			alert('비밀번호를 입력해주세요.')
			return false;
		}
	})
    $('#summernote').summernote({
        placeholder: '내용을 입력하세요.',
        tabsize: 2,
        height: 500
      });
})
</script>
</body>
</html>