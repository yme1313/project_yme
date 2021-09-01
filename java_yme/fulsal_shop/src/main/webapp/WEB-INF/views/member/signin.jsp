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

.login-box {
  position:absolute;
  width:350px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.login-box h2{
  text-align: center;
  margin: 30px;
}

.login-id{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.login-pw{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}
.auto-login{
	float : left; margin-left: 30px;
}
.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
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

.login-btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
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

.login-btn:hover {
  background-position: right;
	color: white;
}

.no-id {
  text-align: center;
}
</style>
</head>
<body>
  <form class=login-box method="post" action="<%=request.getContextPath()%>/member/signin">
      <h2>로그인</h2>
      <div class="login-id">
        <input type="text" class="id form-control" placeholder="ID" name="me_id">
      </div>
      <div class="login-pw">
        <input type="password" class="pw form-control" placeholder="PW" name="me_pw">
      </div>
      <label class="auto-login form-group">
		<input type="checkbox" name="useCookie" value="true"> 자동 로그인
	  </label>
      <button type="submit" class="login-btn">
        Let's Go!
      </button>
 
      <div class="no-id">
        아이디가 없으신가요? <a href="<%=request.getContextPath()%>/member/signup">회원가입</a><br>
        비밀번호를 잊으셨나요? <a href="<%=request.getContextPath()%>/findPw">비밀번호찾기</a>
      </div>
   </form> 
</body>
</html>