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

.findPw-box {
  position:absolute;
  width:350px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:55%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}
.findPw-box h2{
  text-align: center;
  margin: 30px;
}

.check-id{
  border-bottom: 2px solid #adadad;
  margin: 50px;
  padding: 10px 10px;
}
.inputSt {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.findPw-btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 20px;
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

.findPw-btn:hover {
  background-position: right;
	color: white;
}
.no-id {
  text-align: center;
}
.spinner-border{
	color : red;
}
.wait-text{
	font-size : 30px;
	font-wetght : bold;
	color : red;
}
.warning-text{
	font-weight : bold;
	color : red;
}
</style>
</head>
<body>
 <div class=findPw-box>
    <h2>비밀번호 찾기</h2>
    <div class="warning-text">※ 새 비밀번호는 가입시 등록 했던 <br>이메일주소로 발송됩니다.</div>
    <div class="check-id">
      <input type="text" class="inputSt form-control" placeholder="아이디" name="id">
    </div>
    <button type="button" class="findPw-btn">
     비밀번호 찾기
    </button>
    <div class="container mb-2 no-id wait-box">
    </div>
     <div class="no-id">
        아이디가 없으신가요? <a href="<%=request.getContextPath()%>/member/signup">회원가입</a>
     </div>
</div>    
   


<script type="text/javascript">
$(function(){
	$('.findPw-btn').click(function(){
		if($('[name=id]').val() == ""){
			alert('아이디를 입력하세요.')
			return;
		}
		var id = $('[name=id]').val();
		var Str = '<span class="spinner-border"></span><span class="wait-text ml-2">전송중입니다.</span>'
		$('.wait-box').html(Str);
		   $.ajax({
			    type : "get",
			    url : '<%=request.getContextPath()%>/find/pw/' + id,
			    success : function(res){
			    	$('.wait-box').html('')
					if(res == 'OK'){
						alert('새 비밀번호가 발급됩니다.')
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