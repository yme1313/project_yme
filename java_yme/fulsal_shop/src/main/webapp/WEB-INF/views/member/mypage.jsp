<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>

<style>
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
.menu-font{
	font-size: 15px; font-style:initial;
	text-decoration : none;
}
 a:hover{
	text-decoration : none;	
}
.reg-btn{
	position: absolute; top: 0; right: 0;
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
			<div class="left-menu-box"><a hreg="#" class="menu-font">1:1문의 내역</a></div>
			<div class="left-menu-box"><a hreg="#" class="menu-font">회원 탈퇴</a></div>
		</div>
		<div class="right-board-box">
			<form class="container signupCheck" method="post" action="<%=request.getContextPath()%>/member/mypage">
				<h3>개인정보수정</h3><br>
					<table class="table">
				<thead>
				</thead>
				<tbody>
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" class="form-control col-12" name="me_id" value="${user.me_id}" readonly>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" class="form-control col-12" name="me_pw" id="me_pw"></td>
						<td></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" class="form-control col-12" name="me_pw2"></td>
						<td></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" class="form-control col-12" name="me_name" value="${user.me_id}" readonly></td>
						<td></td>
					</tr>
					<tr>
						<td>휴대폰번호</td>
						<td><input type="text" class="form-control col-12" name="me_phone" value="${user.me_phone}"></td>
						<td><span class="ml-2">[숫자만 입력하세요. 예) 01012345678]</span></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="text" class="form-control col-12" id="birth" name="me_birth" maxlength="8" value="${user.me_birth}"></td>
						<td><span class="ml-2">[숫자만 입력하세요. 예) 20000101]</span></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>	
							<select class="form-control" name="me_gender">
								<option value="M" <c:if test="${member.gender == 'M'}">selected</c:if>>남성</option>
								<option value="F" <c:if test="${member.gender == 'F'}">selected</c:if>>여성</option>
							</select>
					</td>
						<td></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" class="form-control col-12" name="me_email" value="${user.me_email}"></td>
						<td></td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<input type="text" class="form-control col-12 mb-2" id="sample4_postcode" name="me_postnum" value="${user.me_postnum}" readonly placeholder="우편번호">
							<input type="text" class="form-control col-12 mb-2" id="sample4_roadAddress" name="me_add1" value="${user.me_add1}" placeholder="도로명주소">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" class="form-control col-12" id="sample4_detailAddress" name="me_add2" value="${user.me_add2}" placeholder="상세주소">
							
						</td>
						<td>
							<input type="button" class="btn btn-outline-dark mb-2" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" class="form-control col-12 mb-2" id="sample4_jibunAddress" name="me_add3" value="${user.me_add3}" placeholder="지번주소">
							<input type="text" class="form-control col-12" id="sample4_extraAddress" name="me_add4" value="${user.me_add4}" placeholder="참고항목">
						</td>
					</tr>
				</tbody>
			</table>
			<div class="row text-center" style="width:100%">
				<div style="width:30% float:none; margin:0 auto" >
					<button class="btn btn-outline-dark mb-4">정보수정</button>
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>