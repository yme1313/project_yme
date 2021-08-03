<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style type="text/css">
.item-list{
	list-style : none;
	margin : 20px 0;
	padding : 0;
}
.item-list::after{
	claer : botn; , content:''; , display:none;	
}
.item-list .item{
	width : calc(100% / 3); text-align: center;
	box-sizing : boder-box; padding: 0 10px;
}
.item-list .item span{
	display : block; width : 100%; margin-top : 5px; line-height : 20px;
	height : 20px; overflow : hidden; text-overflow: ellipsis; white-space : nowrap;
}
</style>
</head>
<body>
<div class="container">         
	<ul class="item-list">
		<c:forEach items="${list }" var="board">
			<li class="item">
				<a href="<%=request.getContextPath()%>/board/image/detail?num=${board.num}">
					<img alt="" src="<%=request.getContextPath()%>/resources/img${board.thumbnail.name}" width="100%" height="300">
					<span class="title">${board.title}</span>
				</a>
			</li>
		</c:forEach>
	</ul>
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
	<c:if test="${user != null}">
	<!-- 공지이고, 관리자이거나 공지가 아니고 일반 사용자이면 -->
		<c:if test="${(type eq '/notice' && (user.authority eq 'ADMIN' || user.authority eq 'SUPER ADMIN')) || (type ne '/notice')}">
			<a href="<%=request.getContextPath()%>/board${type}/register">
				<button class="btn btn-outline-success">글쓰기</button>
			</a>
		</c:if>
	</c:if>
</div>
</body>
</html>
