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
.main-box{
	position: absolute; top : 2%; left : 16%; width : 80%;
}
.right-board-box{
	position: relative;
}
.error{
	color : red;
	font-size : 10px;
}
.modifyUser h3{
	margin-bottom : 20px;
}
</style>
</head>
<body>
	<br>
	<div class="container main-box">
		<div class="right-board-box">
			<form class="container modifyUser" method="post" action="<%=request.getContextPath()%>/admin/user/modify">
				<h3>개인정보수정</h3>
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
						<td><input type="text" class="form-control col-12" name="me_name" value="${user.me_name}"></td>
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
								<option value="M" <c:if test="${user.me_gender == 'M'}">selected</c:if>>남성</option>
								<option value="F" <c:if test="${user.me_gender == 'F'}">selected</c:if>>여성</option>
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
<script type="text/javascript">
	$(function(){
		$(".modifyUser").validate({
	        rules: {
	            me_pw: {
	                required : true,
	                regex: /^[a-z0-9!@#]{8,16}$/i
	            },
	            me_pw2: {
	                required : true,
	                equalTo : me_pw
	            },
	            me_phone: {
	            	required : true,
	            	maxlength : 11,
	            	regex : /^010([1-9]{1})([0-9]{3})([1-9]{1})([0-9]{3})$/
	            },
	            me_brith: {
	                required : true,
	                maxlength : 8,
	                regex : /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/mg
	            },
	            me_email: {
	            	required : true,
	            	email : true
	            },
	        },
	        //규칙체크 실패시 출력될 메시지
	        messages : {
		            me_pw: {
		                required : "필수항목 입니다.",
		                regex: "8~16자 영문 대 소문자, 숫자, 특수문자(!@#)를 사용하세요."
		            },
		            me_pw2: {
		                required : "필수항목 입니다.",
		                equalTo : "비밀번호가 일치하지 않습니다."
		            },
		            me_phone: {
		            	required : "필수항목 입니다.",
		            	maxlength : "최대 11자리이하이어야 합니다.",
		            	regex : "전화번호를 확인하세요."
		            },
		            me_brith: {
		                required : "필수항목 입니다.",
		                maxlength : "최대 8자리이하이어야 합니다.",
		                regex : "생년월일 확인하세요."
		            },
		            me_email: {
		            	required : "필수항목 입니다.",
		            	email : "메일규칙에 어긋납니다"
		            }
	        }
	    })
		$('.modifyUser').submit(function(){
			var me_pw = $('[name=me_pw]').val();
			var me_pw2 = $('[name=me_pw2]').val();
			if(me_pw == me_pw2){
				return true;
			} else {
				alert('비밀번호와 비밀번호 확인이 다릅니다.');
				return false;
			}
		})
	})
$.validator.addMethod(
    "regex",
    function(value, element, regexp) {
        var re = new RegExp(regexp);
        return this.optional(element) || re.test(value);
    },
    "Please check your input."
);	
</script>	
</body>
</html>