<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<title>나의 페이지</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<h2>나의 정보</h2>
	<div class="form-group">
		<label>아이디</label>
		<input type="text" class="form-control" name="id" value="${member.id}" readonly>
	</div>
	<div class="form-group">
		<label>비밀번호</label>
		<input type="text" class="form-control" name="pw" value="${member.pw}" readonly>
	</div>
	<div class="form-group">
		<label>성별</label>
		<input type="text" class="form-control" name="gender" value="${member.gender}" readonly>
	</div>
	<div class="form-group">
		<label>이메일</label>
		<input type="text" class="form-control" name="email" value="${member.email}" readonly>
	</div>
	<div class="form-group">
		<label>이름</label>
		<input type="text" class="form-control" name="name" value="${member.name}" readonly>
	</div>
</div>
</body>