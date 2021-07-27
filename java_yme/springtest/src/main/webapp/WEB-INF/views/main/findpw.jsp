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
			<input type="text" class="form-control" placeholder="아이디를 입력하세요." name="id">
		</div>
		<button type="button" id="find_pw_Btn" class="btn btn-outline-info col-12">비밀번호찾기</button>
	</div>
	<div class="wait-box mb-2"></div>
	<script type="text/javascript">
		$(function(){
			$('#find_pw_Btn').click(function(){
				var id = $('[name=id]').val();
				$('.wait-box').text('전송중입니다. 알림창이 나타날때까지 기다려주세요.')
			    $.ajax({	
			        type:'get',
			        url:'<%=request.getContextPath()%>/find/pw/' + id,
			        success : function(res){
			        	$('.wait-box').text('');
			            if(res == "SUCCESS"){
			            	alert('새 비밀번호가 발송되었습니다.');
			            } else {
			            	alert('없는 아이디입니다.')
			            }
			        }
			    })
			})
		})
	</script>
</body>
</html>