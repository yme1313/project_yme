<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>

<style>
*{
  margin: 0px;
  padding: 0px;
  text-decoration: none;
}
.main-box{
	position: absolute; top : 2%; left : 16%; width : 80%;
}
.right-board-box{
	position: relative;
}
.right-board-box h3{
  text-align: center;
  margin-bottom : 50px;
}
.out-box {
  position:absolute;
  width:300px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:400px;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}
.ckeck-pw{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}
.required-box{
	margin-bottom : 20px;
}
.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}
.out-btn {
  position:relative;
  left:26%;
  transform: translateX(-50%);
  margin-top: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#000000,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}
.out-btn:hover {
  background-position: right;
	color: white;
}
.out-text-box {
	text-align: center;
	font-weight : bold; color : red;
}
</style>
</head>
<body>
	<br>
	<div class="container main-box">
		<div class="right-board-box">	
			<div class="container board-box">
				<h3>회원 탈퇴</h3>
					<div class="out-text-box"> 
						※ 회원 탈퇴시 저장된 모든 정보는 삭제됩니다.<br><br>
						※ 재가입 하더라도 기존 정보는 복원되지 않습니다.
					</div>
				  	<form class=out-box method="post" action="<%=request.getContextPath()%>/member/memberout">
					  	 <div class="form-check required-box">
							  <label class="form-check-label">
							     <input type="checkbox" class="form-check-input" name="agree"> 위 안내 사항에 동의 합니다.
							  </label>
						</div>
				        <div class="check-pw">
				          <input type="password" class="pw form-control" placeholder="비밀번호 재확인" name="me_pw">
				        </div>
				        <button type="button" class="out-btn col-6">
				          Good Bye !
				        </button>       
		  		    </form> 			 
			</div>     
		</div>	
	</div>	
<script>
$(function(){
	$('.out-btn').click(function(e){
		e.preventDefault();
		var me_pw = $('.check-pw [name=me_pw]').val();
		var agree = $('[name=agree]').is(":checked");
		var data = {me_pw : me_pw, agree : agree};
		$.ajax({
			type : 'post',
			url : '<%=request.getContextPath()%>/member/outcheck',
			data : JSON.stringify(data),
			contentType : "application/json; charset:utf-8",
			success : function(res){
					if(res== 'OK'){
						alert('회원 탈퇴에 성공했습니다.')
						$('.out-box').submit();
					} else if (res=='FAIL2') {
						alert('안내 사항에 동의해야합니다.')
						
					} else if (res=='FAIL') {
						alert('비밀번호를 확인하세요.')
					} 
				}
		})
	})
})
</script>
</body>
</html>