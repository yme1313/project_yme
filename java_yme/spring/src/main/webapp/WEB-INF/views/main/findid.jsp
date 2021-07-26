<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
</head>
<body>
	<div class="container mt-2">
		<div class="form-group">
			<input type="text" class="form-control" placeholder="이메일주소" name="email">
		</div>
		<button type="button" id="findidBtn" class="btn btn-outline-success">아이디찾기</button>
	</div>
	<script type="text/javascript">
		$(function(){
			$('#findidBtn').click(function(){
				var email = $('[name=email]').val();
				$.ajax({
					type : 'post',
					url : '<%=request.getContextPath()%>/find/id/',
					data : {email : email},
					success : function(res){
						if(res =="SUCCESS"){
							alert('아이디를 발송했습니다.')
						} else {
							alert('등록되지 않은 이메일입니다.')
						}
					}
					
				})
			})
		})
	</script>
</body>
</html>
