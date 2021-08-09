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
.page-link{
	color : black;
}
.pagination .page-item.active a {
      background-color: darkslategray;
      border : darkslategray;
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
			<div class="container">         
				<table class="table table-horver">
						<h3>공지사항</h3>
							<c:if test="${user != null}">
							<!-- 공지이고, 관리자이거나 공지가 아니고 일반 사용자이면 -->
								<c:if test="${(type eq '/notice' && (user.me_authority eq 'ADMIN' || user.me_authority eq 'SUPER ADMIN')) || (type ne '/notice')}">
									<a href="<%=request.getContextPath()%>/board${type}/register">
										<button class="btn btn-outline-dark reg-btn">글쓰기</button>
									</a>
								</c:if>
							</c:if>
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
									<a href="<%=request.getContextPath()%>/board${type}/detail?num=${board.bd_num}">
										${board.bd_title}
									</a>
								</td>	
								<!-- 제목 작성시 <영어> 인 경우 화면 표기 안됨 물어보기 -->
								<td>${board.idStr}</td>
								<td>${board.dateTime}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				  <ul class="pagination justify-content-center">
					  <c:if test="${pm.prev}">
					    <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board${type}/list?page=${pm.startPage-1}">이전</a></li>
					  </c:if> 
					  <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
					  	<c:choose>
						  	<c:when test="${pm.criteria.page == index}">
						    	<li class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/board${type}/list?page=${index}">${index}</a></li>
			    			</c:when>
			    			 <c:otherwise>
			    				<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board${type}/list?page=${index}">${index}</a></li>
			    			</c:otherwise>
		    			</c:choose>
					  </c:forEach> 
					  <c:if test="${pm.next}">
					    <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board${type}/list?page=${pm.endPage+1}">다음</a></li>
					  </c:if>  
				  </ul>
			</div>
		</div>
	</div>
</body>
</html>