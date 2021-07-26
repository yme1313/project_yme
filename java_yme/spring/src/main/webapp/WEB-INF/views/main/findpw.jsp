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
			<input type="text" class="form-control" placeholder="아이디" name="id">
		</div>
		<button type="button" id="findpwBtn" class="btn btn-outline-success">비밀번호찾기</button>
	</div>
	<script type="text/javascript">unction(){

		})
		$(function(){
			$('#findpwBtn').click(function(){
				var id = $('[name=id]').val();
				$.ajax({
					type : 'get',
					url : '<%=request.getContextPath()%>/find/pw/' + id ,
					success : function(res){
						if(res == 'SUCCESS'){
							alert('새 비밀번호를 등록된 이메일로 전송했습니다.')
						} else {
							alert('등록된 회원이 아닙니다.')
						}
					}
					
				})
			})
		})
	</script>
</body>
</html>
