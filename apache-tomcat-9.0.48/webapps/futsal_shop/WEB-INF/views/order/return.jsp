<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>교환/반품정보입력</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
h2{
	color : red;
	font-weight : bold;
}
.bold{
	font-weight : bold;
	font-size : 20px;
}
</style>
<body>
<h2 class="mt-2 ml-2">아래에 교환/반품 정보를 꼭 읽어주세요.</h2>
<h4 class="mt-2 ml-2">1:1문의 게시판에 말머리(교환/반품) 선택하시고</h4>
<h4 class="mt-2 ml-2">내용에 [주문번호]를 꼭 기재해주세요.</h4>
<hr>
<div class="mt-3 ml-2">
	<div>
		<div class="bold mb-2 mt-3">교환/반품 안내</div>
			<div class="mb-1">* 교환은 사이즈 교환만 가능합니다.</div>
			<div>* 상품하자 이외 사이즈, 색상교환 등 단순 변심에 의한 교환/반품 </div>
			<div class="mb-1">택배비 고객부담으로 왕복택배비가 발생합니다.</div>
			<div>* 제품을 받으신 날부터 7일 이내에 접수해주시기 바랍니다.</div>
			<div class="mb-1">(상품불량인 경우 30일)</div>
			<div>* 접수 후 14일 이내에 상품이 반품지로 도착하지 않을 경우 </div>
			<div class="mb-1">접수가 취소됩니다. (배송 지연 제외)</div><br>
		<div class="bold mb-2">교환반품(환불)이 불가능한 경우</div>
			<div class="mb-1">* 신발/의류를 외부에서 착용한 경우</div>
			<div>* 제품을 사용 또는 훼손한 경우, 상품 TAG</div>
			<div class="mb-1">보증서, 상품 부자재가 제거 혹은 분실된 경우</div>
			<div>* 밀봉포장을 개봉했거나 내부 포장재를 훼손 또는 분실한 경우</div>
			<div class="mb-1">(단, 제품확인을 위한 개봉 제외)</div>
			<div class="mb-1">* 브랜드 박스 분실/훼손된 경우</div>
			<div class="mb-1">* 고객 부주의로 상품이 훼손,변경된 경우</div><br>
		<div class="bold mb-2">교환/반품(환불) 시 박스 포장 예</div>
			<div>* 브랜드 박스(신발 박스)의 훼손이 없도록</div>
			<div class="mb-1"> 택배 박스 및 타 박스로 포장하여 발송해주시기 바랍니다.</div><br>
			<img id="change_box_type" alt="" src="<%=request.getContextPath()%>/resources/img/기타/택배포장방법.PNG">
		<div class="bold mb-2">교환/반품(환불) 배송비 안내</div>
			<div>* 왕복 택배비 : 최초 배송비(2,500원) + 반품 배송비(2,500원)</div>
			<div> = 총 5,000원이 부과됩니다.</div>	
			<div class="mb-1">(택배비 미동봉 시 결제금액에서 차감)</div><br><br>
	</div>
</div>
<div class="row justify-content-center mb-2"> 
	<button type="button" class="btn btn-outline-dark close-btn">닫기</button>
</div>
<script type="text/javascript">
$(function(){	
	$('.close-btn').click(function(){
		window.close()
	})
})

</script>
</body>
</html>