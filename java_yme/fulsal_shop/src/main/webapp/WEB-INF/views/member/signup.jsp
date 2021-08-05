<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; 
                var extraRoadAddr = ''; 

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<style>
	.error{
		color : red;
	}
</style>	
</head>
<body>

<form class="container" method="post" action="<%=request.getContextPath()%>/member/signup">
		<h1>회원가입</h1>
		<hr>
		<table class="table">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" class="form-control col-12" name="me_id">
					</td>
					<td>
						<button type="button" class="id-dup-btn btn btn-outline-dark ml-1">중복</button>
						<span class="ml-2">[5~10자 영문과숫자 가능]</span>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" class="form-control col-12" name="me_pw" id="pw"></td>
					<td><span class="ml-2">[4~12자 영문과숫자 가능]</span></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" class="form-control col-12" name="me_pw2"></td>
					<td></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" class="form-control col-12" name="me_name"></td>
					<td></td>
				</tr>
				<tr>
					<td>휴대폰번호</td>
					<td><input type="text" class="form-control col-12" name="me_phone"></td>
					<td><span class="ml-2">[숫자만 입력하세요. 예) 01012345678]</span></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" class="form-control col-12" id="birth" name="me_birth" maxlength="8"></td>
					<td><span class="ml-2">[숫자만 입력하세요. 예) 20000101]</span></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>	
						<select class="form-control" name="me_gender">
							<option value="M">남성</option>
							<option value="F">여성</option>
						</select>
				</td>
					<td></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" class="form-control col-12" name="me_email"></td>
					<td></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" class="form-control col-12 mb-2" id="sample4_postcode" name="me_postnum" placeholder="우편번호">
						<input type="text" class="form-control col-12 mb-2" id="sample4_roadAddress" name="me_add1" placeholder="도로명주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" class="form-control col-12" id="sample4_detailAddress" name="me_add2" placeholder="상세주소">
						
					</td>
					<td>
						<input type="button" class="btn btn-outline-dark mb-2" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" class="form-control col-8 mb-2" id="sample4_jibunAddress" name="me_add3" placeholder="지번주소">
						<input type="text" class="form-control col-8" id="sample4_extraAddress" name="me_add4" placeholder="참고항목">
					</td>
			</tbody>
		</table>
		<div class="row text-center" style="width:100%">
			<div style="width:30% float:none; margin:0 auto" >
				<button class="btn btn-outline-dark mb-4">회원가입</button>
			</div>
		</div>
</form>
</body>
</html>