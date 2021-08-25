<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</head>
<style>
.item-list{
	list-style: none;	margin: 20px 0;	padding: 0;
}
.item-list::after{
	clear: both; content: ''; display: block;
}
.item-list .item{
	width:calc(100% / 3); float: left; text-align: center;
	box-sizing: border-box; padding : 0 10px;
}
.item-list .item span{
	display: block; width: 100%; margin: 5px 5px 10px 5px; line-height: 20px; 
	height: 20px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
}
.item:hover{
	text-decoration : underline;
}
a{
	color : black
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
</style>
<style>
</style>
</head>
<body>
<div class="container">
	<ul class="item-list">
		<c:if test="${list.size() != 0 }">
			<c:forEach items="${list}" var="futsal">
				<li class="item">
					<a href="<%=request.getContextPath()%>/goods/detail?num=${futsal.fu_num}">
						<img alt="" src="<%=request.getContextPath()%>/resources/img/${futsal.fu_img}" width="100%" height="300">
						<span class="fu_name">${futsal.fu_name}</span>
						<span class="fu_price">가격 : <fmt:formatNumber pattern="###,###,###" value="${futsal.fu_price}" />원</span>
					</a>
				</li>
			</c:forEach>
		</c:if>
		<c:if test="${list.size() == 0 }">	
		등록된 상품이 없습니다.
		</c:if>	
	</ul>
	    <ul class="pagination justify-content-center">
    	<c:if test="${pm.prev}">
	    	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/goods/shoes?page=${pm.startPage-1}">이전</a></li>
	    </c:if>
	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
	    	<c:choose>
	    		<c:when test="${pm.criteria.page == index}">
	    			<li class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/goods/shoes?page=${index}">${index}</a></li>
	    		</c:when>
	    		<c:otherwise>
	    			<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/goods/shoes?page=${index}">${index}</a></li>
	    		</c:otherwise>
	    	</c:choose>
	    </c:forEach>
	    <c:if test="${pm.next}">
	   		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/goods/shoes?page=${pm.endPage+1}">다음</a></li>
	    </c:if>
    </ul>
</div>	
</body>
</html>