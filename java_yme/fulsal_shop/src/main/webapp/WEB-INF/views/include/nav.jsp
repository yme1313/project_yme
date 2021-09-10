<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
*{ padding: 0; margin: 0; text-decoration: none; color: #000; }
.white-img{
	color : white;
}
.fa-search{
	font-size : 25px;
}
.top-menu{
	position : relative; 
	justify-content : flex-end
}
.btn-outline-white{
	padding : 5px;
}
.gohome{
	position : absolute; 
	top : 0.3vh; left : 1vw;
	display : flex;
}
.fa-home{
	font-size : 40px;
	color: white;
}
.userName{
	color : white;
}
	
</style>
</head>
	<body>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark top-menu">
			<ul class="navbar-nav">
			<li class="nav-item">
				<div class="gohome">
					<a class="navbar-brand" href="<%=request.getContextPath()%>/"><i class="fas fa-home"></i></a>
					<c:if test="${user != null}">
						<div class="userName ml-2 mt-3">[${user.me_name}] 님 반갑습니다 !</div>
					</c:if>	
				</div>
			</li>
			<c:if test="${user == null}">
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/member/signin" style="color: white;">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/member/signup" style="color: white;">회원가입</a>
				</li>
			</c:if>
			<c:if test="${user != null}">
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/member/signout" style="color: white;">로그아웃</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/member/mypage" style="color: white;">마이페이지</a>
				</li>
			</c:if>
			<c:if test="${user.me_authority == 'USER' || user.me_authority == null}">
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/cart/list" style="color: white;"><i class="fas fa-shopping-cart white-img"></i>장바구니</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/order/list" style="color: white;"><i class="fas fa-box white-img"></i>주문/배송조회</a>
				</li>
			</c:if>
			<c:if test="${user.me_authority == 'SUB ADMIN' || user.me_authority == 'ADMIN'}">
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/admin/user/list" style="color: white;"><i class="fas fa-user-cog white-img"></i>관리자전용메뉴</a>
				</li>
			</c:if>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/board/notice/list" style="color: white;">고객센터</a>
				</li>
			</ul>
		</nav>
		<ul class="nav justify-content-end mt-3">
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/goods/shoes/list" style="color: black">풋살화</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/goods/cloth/list" style="color: black">의류</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/goods/ball/list" style="color: black">풋살공</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/goods/hands/list" style="color: black">골키퍼장갑</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/goods/bag/list" style="color: black">스포츠가방</a>
			</li>
			<li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown" style="color : black">
		        브랜드
		      </a>
		      <div class="dropdown-menu">
		        <a class="dropdown-item" href="<%=request.getContextPath()%>/goods/nike/list2">나이키</a>
		        <a class="dropdown-item" href="<%=request.getContextPath()%>/goods/adidas/list2">아디다스</a>
		        <a class="dropdown-item" href="<%=request.getContextPath()%>/goods/puma/list2">퓨마</a>
		      </div>
		    </li>
			<li class="nav-item">
				<form class="form-inline" action="<%=request.getContextPath()%>/goods/all">
					<input class="form-control mr-sm-2" type="text" id="goods_text" name="search" value="<c:out value="${pm.criteria.search}"/>">
					<button class="btn btn-outline-white" type="submit" id="goods_search"><i class="fas fa-search"></i></button>
				</form>
			</li>	
		</ul>
		<hr>
<script type="text/javascript">
$(function(){
	$('#goods_search').click(function(e){
		var search = $('#goods_text').val()
		if(search == ''){
			e.preventDefault()
			alert('검색어를 입력하세요.')
		}
	})
})
</script>		
</body>
</html>
