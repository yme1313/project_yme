<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
</head>

<style>
 a{
 	color : black
 }
.main-box{
	position: absolute; top : 2.5%; left : 16%; width : 80%;
}
.right-board-box{
	position: relative;
}
 a:hover{
	text-decoration : none;	
}
.page-link{
	color : black;
}
.pagination .page-item.active a {
      background-color: darkslategray;
      border : darkslategray;
}
.board-box h3{
	margin-bottom : 1rem;
}
</style>
</head>
<body>
	<br>
	<div class="container main-box">
		<div class="right-board-box">	
					<div class="container board-box">       
							<table class="table table-horver">
								<h3>1:1문의 관리</h3>
								<thead>
									<tr>
										<th>번호</th>
										<th>답변여부</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</thead>
							<tbody>
								<c:forEach items="${list}" var="board" varStatus="status">
										<tr>
											<c:if test="${board.bd_answer == 'N'}">
											<td>${pm.totalCount - status.index - pm.criteria.pageStart}</td>
												<td>${board.answerStr}</td>
												<c:if test="${user.me_authority != 'ADMIN' || user.me_authority != 'SUB ADMIN'}">
													<td>
														<a href="<%=request.getContextPath()%>/board/detail?num=${board.bd_num}">
															${board.bd_title}
														</a>
													</td>
												</c:if>
												<td>${board.bd_me_id}</td>
												<td>${board.dateTime}</td>
											</c:if>
										</tr>	
								</c:forEach>
							</tbody>
						</table>
					  <ul class="pagination justify-content-center">
						  <c:if test="${pm.prev}">
						    <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/member/boardlist?page=${pm.startPage-1}">이전</a></li>
						  </c:if> 
						  <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
						  	<c:choose>
							  	<c:when test="${pm.criteria.page == index}">
							    	<li class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>//member/boardlist?page=${index}">${index}</a></li>
				    			</c:when>
				    			 <c:otherwise>
				    				<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/member/boardlist?page=${index}">${index}</a></li>
				    			</c:otherwise>
			    			</c:choose>
						  </c:forEach> 
						  <c:if test="${pm.next}">
						    <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/member/boardlist?page=${pm.endPage+1}">다음</a></li>
						  </c:if>  
					  </ul>
				</div>
		</div>
	</div>	
</body>
</html>