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
 a{
 	color : black
 }
.main-box{
	float: left;  position: relative;
}
.left-board-box{
	width: 20vw; height: 100vh;
	margin: 0; padding: 0;
}
.left-board-box .left-menu-box{
	margin-bottom : 10px;
}
.right-board-box{
	position: absolute; top: 0; left: 30%; width : 65vw;
}
.right-board-box h3{
  text-align: center;
  margin: 30px;
}
.menu-font{
	font-size: 15px; font-style:initial;
	text-decoration : none;
}
 a:hover{
	text-decoration : none;	
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
		<div class="left-board-box">
			<h3>마이페이지</h3>
			<hr>
			<div class="left-menu-box"><a href="<%=request.getContextPath()%>/member/mypage" class="menu-font">개인정보수정</a></div>
			<c:if test="${user.me_authority == 'USER'}">
				<div class="left-menu-box"><a href="<%=request.getContextPath()%>/member/boardlist" class="menu-font">1:1문의 내역</a></div>
			</c:if>
			<div class="left-menu-box"><a href="<%=request.getContextPath()%>/member/memberout" class="menu-font">회원 탈퇴</a></div>
		</div>
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
							     <input type="checkbox" class="form-check-input" name="agree" value="true"> 위 안내 사항에 동의 합니다.
							  </label>
						</div>
				        <div class="check-pw">
				          <input type="password" class="pw form-control" placeholder="비밀번호 재확인" name="me_pw">
				        </div>
				        <button type="submit" class="out-btn col-6">
				          Good Bye !
				        </button>       
		  		    </form> 			 
			</div>     
		</div>	
	</div>	
<script>
$(function(){
	$('.out-box').click(function(e){
		e.preventDefault();
		var bd_pw = $('.check-pw [name=me_pw]').val();
	})
})
</script>
</body>
</html>