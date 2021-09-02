<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>SMS인증</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
.sms-box{
	width : 550px;
}
</style>
<body>
<h2 class="mt-2 ml-4">SMS 인증하기</h2>
<div class="mt-2 ml-4">
<input type="hidden" name="ranNum">
	 <table class="table table-borderless sms-box">
	   <tbody>
		   <tr>
		     <td style="width : 120px;">휴대폰번호 : </td>
		     <td style="width : 320px; margin-left : -20px;">
		     	<input type="text" class="form-control" name="phone" id="chPhone">
		     	<div>※ 숫자만 입력하세요. 예) 01012345678 </div>
		     </td>
		     <td style="width : 120px;"><button type="button" class="btn btn-outline-danger btn-sm" id="send_sms">SMS발송</button></td>
		   </tr>
		   <tr>
		     <td>인증번호 : </td>
		     <td><input type="text" class="form-control" name="sms"></td>
		     <td><button type="button" class="btn btn-outline-danger btn-sm" id="check_sms">확인</button></td>
		   </tr>
	   </tbody>
	 </table>
 	 <div class="row justify-content-center"> 
	 	<button type="button" class="btn btn-outline-dark btn-lg close-btn">닫기</button>
	 </div>	
</div>
<script>

$(function(){
	$('#send_sms').click(function(){
		var phone = $('[name=phone]').val()
	    var randomNumber = "";
	    for (var i = 0; i < 4; i++) {
	    randomNumber += random(0, 9);
	    }
		var data = { 
				toPhone : phone,
				ranNum : randomNumber	
			}
		$.ajax({
			type : 'post',
			url : '<%=request.getContextPath()%>/member/sendSMS',
			data : data,
			success : function(res){
				if(res == 'OK'){
					alert('인증번호가 발송되었습니다.')
					$('[name=ranNum]').val(randomNumber)
				} else if(res == 'FAIL'){
					alert('휴대폰번호를 올바르게 입력하세요.')
				} 
			}
		})
	})
	$('#check_sms').click(function(){
		var phone = $('[name=phone]').val()
		var ranNum = $('[name=ranNum]').val()
		var sms = $('[name=sms]').val()
		if(ranNum == sms){
			alert('인증번호가 일치합니다.')
			$(opener.document).find('#phone').val(phone);
		} else {
			alert('인증번호가 불일치합니다.')
		}
	})
	$('.close-btn').click(function(){
		window.close();
	})
})

function random(n1, n2) {
    return parseInt(Math.random() * (n2 - n1 + 1)) + n1;
}

</script>
</body>
</html>