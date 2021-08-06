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
	position: absolute; top: 0; left: 30%; width : 55vw;
}
.menu-font{
	font-size: 15px; font-style:initial;
	text-decoration : none;
}
 a:hover{
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
			<div class="left-menu-box"><a hreg="#" class="menu-font">1:1문의</a></div>
		</div>
		<div class="right-board-box">
			<div class="container">         
				<table class="table table-horver">
						<h3>공지사항</h3>
						<a href="<%=request.getContextPath()%>/board/register">
							<button class="btn btn-outline-dark reg-btn">글쓰기</button>
						</a>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="board">
							<tr>
								<td>${board.bd_num}</td>
								<td>
									<a href="<%=request.getContextPath()%>/board/detail?num=${board.bd_num}">
										${board.bd_title}
									</a>
								</td>
								<td>${board.bd_me_id}</td>
								<td>${board.dateTime}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>