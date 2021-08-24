<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
 
<html>
<head>
<title>
<c:if test="${title ne null}">${title}</c:if>
<c:if test="${title eq null}">풋살용품샵</c:if>
</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/f9d926306a.js" crossorigin="anonymous"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.body {
	height: 1500px;
	};
</style>
</head>
<body>
    <tiles:insertAttribute name="nav"/>
    <div class="body">
 	   <tiles:insertAttribute name="body" />   
    </div>                                              
    <tiles:insertAttribute name="footer" />
</body>
</html>