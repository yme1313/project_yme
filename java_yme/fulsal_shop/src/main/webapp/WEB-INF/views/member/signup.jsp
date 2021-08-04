<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
<style>
	.error{
		color : red;
	}
</style>	
</head>
<body>

<form class="container" method="post" action="<%=request.getContextPath()%>/member/signup">
	<h1>회원가입양식</h1><br>
	<div class="form-inline">
		<label>아이디 : </label>
		<input type="text" class="form-control col-1 ml-3" name="id">
		<button type="button" class="id-dup-btn btn btn-outline-dark ml-1">중복</button>
		<span class="ml-2">(5~10자 영문과숫자 가능)</span>
	</div><br>
	<div class="form-inline">
		<label>비밀번호 :</label>
		<input type="password" class="form-control col-2 ml-3" name="pw" id="pw">
		<span class="ml-2">(4~12자 영문과숫자 가능)</span>
	</div><br>
	<div class="form-inline">
		<label>비밀번호 확인 :</label>
		<input type="password" class="form-control col-2 ml-3" name="pw2">
	</div><br>
	<div class="form-inline">
		<label>이름 : </label>
		<input type="text" class="form-control col-1 ml-3" name="name">
	</div><br>
	<div class="form-inline">
		<label>이메일 : </label>
		<input type="text" class="form-control col-2 ml-3" name="email">
	</div><br>
	<div class="form-inline">
		<label>성별</label>
		<select class="form-control" name="gender">
			<option value="M">남성</option>
			<option value="F">여성</option>
		</select>
	</div>
	<button class="btn btn-outline-dark col-12">회원가입</button>
</form>
</body>
</html>