<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
.dropdown-menu{
	width : 50px;
}

</style>
</head>
	<body>
		<nav class="navbar navbar-expand-sm bg-info navbar-dark top-menu">
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
					<a class="nav-link" href="<%=request.getContextPath()%>/member/signin" style="color: white;">오시는 길</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/member/signup" style="color: white;">갤러리</a>
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
			<c:if test="${user.me_authority == 'SUB ADMIN' || user.me_authority == 'ADMIN'}">
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/admin/user/list" style="color: white;"><i class="fas fa-user-cog white-img"></i>관리자전용메뉴</a>
				</li>
			</c:if>
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/member/signup" style="color: white;">로그인</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/member/signup" style="color: white;">회원가입</a>
			</li>
			</ul>
		</nav>
		<ul class="nav justify-content-around mt-3">
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/goods/newGoods/list" style="color: black">예약하기</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/goods/shoes/list" style="color: black">자유게시판</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<%=request.getContextPath()%>/goods/cloth/list" style="color: black">묻고 답하기</a>
			</li>
		</ul>
		<hr>
		
<script type="text/javascript">
</script>		
</body>
</html>
