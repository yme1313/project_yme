<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<title>Home</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-info navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="#">Logo</a>

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/board/list">게시판</a>
    </li>

    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        더 보기
      </a>
      <div class="dropdown-menu">
      	<c:if test="${user == null}">
	       <a class="dropdown-item" href="<%=request.getContextPath()%>/signin">로그인</a>
	       <a class="dropdown-item" href="<%=request.getContextPath()%>/signup">회원가입</a>
	    </c:if> 
	    <c:if test="${user != null}">
	       <a class="dropdown-item" href="<%=request.getContextPath()%>/mypage">마이 페이지</a>
	       <a class="dropdown-item" href="<%=request.getContextPath()%>/signout">로그아웃</a>
	     </c:if> 
      </div>
    </li>
  </ul>
</nav>
	<script type="text/javascript">
	$(function(){
		var msg = '${msg}';
		printMsg(msg);
		history.replaceState({},null,null);
	})
	function printMsg(msg){
		if(msg == '' || history.state){
			return ;
		}
		alert(msg);
	}
	</script>
</body>
</html>
