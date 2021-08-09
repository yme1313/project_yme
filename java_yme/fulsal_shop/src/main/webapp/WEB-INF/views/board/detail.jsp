<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>

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
	position: absolute; top: 0; left: 30%; width : 60vw;
}
.menu-font{
	font-size: 15px; font-style:initial;
	text-decoration : none; 
}
.reg-btn{
	position: absolute; top: 0; right: 0;
}
</style>
</head>
<body>
	<br>
	<div class="container main-box">
		<div class="left-board-box">
			<h3>고객센터</h3>
			<hr>
			<div class="left-menu-box"><a href="<%=request.getContextPath()%>/board/list" class="menu-font">공지사항</a></div>
			<div class="left-menu-box"><a href="<%=request.getContextPath()%>/board${type}/list" class="menu-font">1:1문의</a></div>
		</div>
		<div class="right-board-box">
			<div class="container">
				<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control" name="bd_title" value="${board.bd_title}" readonly>
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
					<div class="form-control" style="min-height:400px;">${board.bd_contents}</div>
				</div>
				<div class="input-group">
					<a href="<%=request.getContextPath()%>/board${type}/list" class="mr-2"><button class="btn btn-outline-dark mb-2">목록</button></a>
					<c:if test="${user != null && user.me_id == board.bd_me_id }">
						<a href="<%=request.getContextPath()%>/board${type}/modify?num=${board.bd_num}">
							<button class="btn btn-outline-dark mr-2">수정</button>
						</a>
						<a href="<%=request.getContextPath()%>/board${type}/delete?num=${board.bd_num}">
							<button class="btn btn-outline-dark mr-2">삭제</button>
						</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>