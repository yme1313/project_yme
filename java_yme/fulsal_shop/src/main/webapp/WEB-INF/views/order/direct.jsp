<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
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
*{ 
   list-style:none;
}
.main-box{
	height : 200px;
}
.round-box{
	width : 120px; height : 120px;
	text-align : center; 
}
.img-box{
	display : flex;  
	margin-left: 25%;
    margin-right: 13%;
    justify-content: space-around;
}    
.img-box .round-box{
	margin-right : 200px; z-index : 10;
}
.round-box:last-child{
	marigin-right : 0; 
}
.img-box .round-box .fas{
	font-size : 90px; margin-top : 20px; color : #343a40;
}
.round-box .fas.fa-calculator{
	color : red;
}
.num-box{
	margin-top : 3px;
	font-weight : bold;
}
.order-box{
	width : 1000px;
	height : 700px;
	margin-left : auto;
	margin-right : auto;
}
.title-box{
	font-size : 30px;
	font-weight : bold;
}
.waring-box{
	font-size : 12px;
}
.waring-box .title{
	font-size : 20px;
	font-weight : bold;
	color : gray
}
.bold-text{
	font-weight : bold;
	color : gray
}
.veryimpo-box{
	font-size : 18px;
	font-weight : bold;
	color : blue;
}
img{
	width : 70px; height : 90px;
}
td{
	line-height : 100px;
}
.cart-price{
	float : right;
}
.delivery-text{
	float : right; color : blue;
}
.price-box{
	height : 60px;
	font-size : 25px;
}
.title-th{
	line-height :40px;
}
.order-table tbody tr td{
	width : 20px;
	line-height : 20px;
}
.bottom-box{
	display : flex;
	height : 200px;
	justify-content: space-between;
}
.end-price, .paytype{
	width : 420px;
	height : 100%;
}
.end-price{
	border : 1px solid #dee2e6;
}
.paytype{
	width :550px;
	height : 105px;
	border : 1px solid #dee2e6;
}
.end-price tbody tr td{
	line-height : 20px;
}
.pay-option{
	font-size : 13px;
}
</style>
</head>
<body>
<form id="direct_order" method="post" action="<%=request.getContextPath()%>/order/orderDirectOk">
<!-- order 테이블에 저장할 내용 -->
<input type="hidden" class="form-control" name="or_me_id" value="${user.me_id}">
<input type="hidden" name="or_fuNums" value="${futsal.fu_num}">
<input type="hidden" name="or_goodsname" value="${futsal.fu_name} ${futsal.size}/${cart.ca_count}개">
<input type="hidden" name="or_count" value="${cart.ca_count}">
<input type="hidden" name="or_size" value="${futsal.op_size}">
	<div class="main-box">
		<ul class="img-box">
			<li class="round-box">
				<i class="fas fa-shopping-cart mb-1"></i><br>장바구니
				<div class="num-box">01</div>
			</li>
			<li class="round-box">
				<i class="fas fa-calculator mb-1"></i><br>주문/결제
				<div class="num-box">02</div>
			</li>
			<li class="round-box">
				<i class="fas fa-check-square mb-1"></i><br>결제완료
				<div class="num-box">03</div>
			</li>
		</ul>
	</div>	
	<div class="order-box">
		<div class="title-box">02.주문/결제</div>
		<hr style="background:#343a40;">
		<div class="veryimpo-box mb-2">※ 주문량이 많은 상품은 주문 도중에도 재고 수량이 부족할 수 있습니다.</div>
		 <table class="table">
		    <thead>
		      <tr>
		        <th>상품명</th>
		        <th>상품금액</th>
		        <th>옵션</th>
		        <th>수량</th>
		        <th>합계금액</th>
		      </tr>
		    </thead>
		    <tbody>
		    <c:set var="sum" value="0" />
		      <tr class="list-box">
		        <td><img alt="" class="mr-2" src="<%=request.getContextPath()%>/resources/img/${futsal.fu_img}">${futsal.fu_name}</td>
		        <td>
		        	<fmt:formatNumber pattern="###,###,###" value="${futsal.fu_price}" />원
		        </td>
		        <td>${futsal.size}</td>
		        <td>${cart.ca_count}</td>
		        <td>
		        	<fmt:formatNumber pattern="###,###,###" value="${futsal.fu_price * cart.ca_count}" />원
		        </td>
		      </tr> 
		      <c:set var="sum" value="${sum + (futsal.fu_price * cart.ca_count)}" />
		    </tbody>
	  	 </table>
	  	 <div class="delivery-text mt-2">※ 10만원 이상 구매시 배송비 무료 !</div>
	  	 <div class="row justify-content-end mt-5 price-box ">
			<div>총 주문 금액 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
				<i class="fas fa-plus"></i> 배송비 : 
				<c:choose>
					<c:when test="${sum >= 100000}">
						<span class="delivery">0 원</span>
					</c:when>
					<c:otherwise>
						<span class="delivery">2,500 원</span>
					</c:otherwise>
				</c:choose>
				<i class="fas fa-equals mr-1"></i>결제 금액 : <span class="order-price">2,500 원</span>
			 </div>
		 </div>
		<table class="table order-table">
		    <thead>
		      <tr>
		        <th class="title-th">배송정보</th>
		        <th>
					<label><input type="radio" class="mr-1 basic" name="choice-box" checked><span class="mr-3">주문고객 정보 동일</span></label>
					<label><input type="radio" class="mr-1 new" name="choice-box">새로 입력</label>
		        </th>
		        <th></th>
		        <th></th>
		      </tr>
		    </thead>
		    <tbody>
					<tbody class="orderinfo">
			      <tr>
			        <td >이름</td>
			        <td>${user.me_name}<input type="hidden" class="form-control" name="or_name" value="${user.me_name}"></td>
			       	<td></td>
			        <td></td>
			      </tr>
			      <tr>
			      	<td>이메일</td>
			        <td>${user.me_email}<input type="hidden" class="form-control" name="or_email" value="${user.me_email}"></td>
			        <td></td>
			        <td></td>
			      </tr>
			      <tr>
			        <td>전화번호</td>
			        <td>${user.me_phone}<input type="hidden" class="form-control" name="or_phone" value="${user.me_phone}"></td>
			        <td></td>
			        <td></td>
			      </tr>
			      <tr>
		    		    <td>주소</td>
			        <td>${user.me_postnum}<br>
			        	${user.me_add1} / ${user.me_add2} <br>
			        	${user.me_add3} / ${user.me_add4}
			        </td>
			        <td>
			        	<input type="hidden" class="form-control" name="or_postnum" value="${user.me_postnum}">
			        	<input type="hidden" class="form-control" name="or_add1" value="${user.me_add1}">
			        	<input type="hidden" class="form-control" name="or_add2" value="${user.me_add2}">
			        	<input type="hidden" class="form-control" name="or_add3" value="${user.me_add3}">
			        	<input type="hidden" class="form-control" name="or_add4" value="${user.me_add4}">
			        </td>
			        <td></td>
				 </tbody>
		    	  <tr>
		        <td>배송<br>메시지</td>
		        <td>
		        	<select class="form-control mess-box mb-2" name="mess-box">
		        		<option value="">(직접 입력)</option>
		        		<option value="부재시 경비실에 맡겨 주세요.">부재시 경비실에 맡겨 주세요.</option>
		        		<option value="부재시 문 앞에 두고 가주세요.">부재시 문 앞에 두고 가주세요.</option>
		        	</select>
		        	<textarea class="form-control" style="height : 150px" name="or_message"></textarea>
		        </td>
		        <td></td>
		        <td></td>
		      </tr>
		         <tr>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		      </tr>
		    </tbody>
		   </table>
		   <div class="bottom-box">
		   	<div class="end-price">
		   	  <table class="table" style="width :420px;">
			    <thead>
			      <tr>
			        <th style="width:150px;">결제금액</th>
			        <th></th>
			        <th></th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			        <td>총 결제 금액</td>
			        <td id="final-price" ></td>
			        <td><input type="hidden" name="or_price" value=""></td>
			      </tr>
			      <tr>
			        <td></td>
			        <td id="final_detail">
		
			        </td>
			        <td></td>
			      </tr>
			    </tbody>
			  </table>
		   	</div>
		    	<div class="paytype">
		  	    <table class="table" style="width :550px;">
				    <thead>
				      <tr>
				        <th style="width:100px;">결제방법</th>
				        <th></th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td></td>
				        <td style="line-height : 20px;">
				       		<label class="pay-option mr-2"><input class="mr-1" type="radio" name="or_paytype" value="kakaopay" checked>카카오페이</label>
				        	<label class="pay-option mr-2"><input class="mr-1" type="radio" name="or_paytype" value="card" checked>카드결제</label>
				        	<label class="pay-option mr-2"><input class="mr-1" type="radio" name="or_paytype" value="real-time">실시간 계좌이체</label>
				        	<label class="pay-option mr-2"><input type="radio" name="or_paytype" value="without-bankbook">무통장 입금</label>
				        </td>
				      </tr>
				      <tr>
				        <td></td>
				        <td></td>
				      </tr>
				    </tbody>
			    </table>
		   	    </div>
		    </div>
	  	 <div class="row justify-content-center">
		 	<button type="button" class="btn btn-danger btn-lg mt-3" id="buy_btn">결제하기</button>
	 	</div>
 	</div>
</form>


<script>
$(function(){
	$('[name=choice-box]').change(function(){
		var basic = $('.basic').prop("checked")
		var insert = $('.new').prop("checked")
		var basicStr =
		  '<tr>' +
	        '<td >이름</td>' +
	        '<td>${user.me_name}<input type="hidden" class="form-control" name="or_name" value="${user.me_name}"></td>' +
	       	'<td></td>' +
	        '<td></td>' +
	      '</tr>' +
	      '<tr>' +
	      	'<td>이메일</td>' +
	        '<td>${user.me_email}<input type="hidden" class="form-control" name="or_email" value="${user.me_email}"></td>' +
	        '<td></td>' +
	        '<td></td>' +
	      '</tr>' +
	      '<tr>' +
	        '<td>전화번호</td>' +
	        '<td>${user.me_phone}<input type="hidden" class="form-control" name="or_phone" value="${user.me_phone}"></td>' +
	        '<td></td>' +
	        '<td></td>' +
	      '</tr>' +
	      '<tr>' +
 		    '<td>주소</td>' +
	        '<td>${user.me_postnum}<br>' +
	        	'${user.me_add1} / ${user.me_add2} <br>' +
	        	'${user.me_add3} / ${user.me_add4}' +
	        '</td>' +
	        '<td>' +
	        	'<input type="hidden" class="form-control" name="or_postnum" value="${user.me_postnum}">' +
	        	'<input type="hidden" class="form-control" name="or_add1" value="${user.me_add1}">' +
	        	'<input type="hidden" class="form-control" name="or_add2" value="${user.me_add2}">' +
	        	'<input type="hidden" class="form-control" name="or_add3" value="${user.me_add3}">' +
	        	'<input type="hidden" class="form-control" name="or_add4" value="${user.me_add4}">' +
	        '</td>' +
	        '<td></td>'
					
		var insertStr =		
		      '<tr>' +
		        '<td >이름</td>' +
		        '<td style="width:150px;"><input type="text" class="form-control" name="or_name"></td>' +
		       	'<td></td>' +
		        '<td></td>' +
		      '</tr>' +
			  '<tr>' +
		       ' <td >이메일</td>' +
		        '<td><input type="text" class="form-control" name="or_email"></td>' +
		       	'<td></td>' +
		        '<td></td>' +
		      '</tr>' +
		      '<tr>' +
		        '<td>전화번호</td>' +
		        '<td><input type="text" class="form-control" name="or_phone"></td>' +
		        '<td>(숫자만 입력하세요.)</td>' +
		        '<td></td>' +
		      '</tr>' +
		      '<tr>' +
		        '<td>주소</td>' +
				'<td>' +
					'<input type="text" class="form-control mb-2" id="sample4_postcode" name="or_postnum"  readonly placeholder="우편번호">' +
					'<input type="text" class="form-control mb-2" id="sample4_roadAddress" name="or_add1" placeholder="도로명주소">' +
					'<span id="guide" style="color:#999;display:none"></span>' +
					'<input type="text" class="form-control" id="sample4_detailAddress" name="or_add2" placeholder="상세주소">	' +
				'</td>' +
				'<td>' +
					'<input type="button" class="btn btn-outline-dark mb-2" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>' +
					'<input type="text" class="form-control col-8 mb-2" id="sample4_jibunAddress" name="or_add3" placeholder="지번주소">' +
					'<input type="text" class="form-control col-8" id="sample4_extraAddress" name="or_add4" placeholder="참고항목">' +
				'</td>' +
		        '<td></td>' 
			
			
		if(insert){
			$('.orderinfo').html(insertStr)		
		} else if(basic){
			$('.orderinfo').html(basicStr)	
		}
	})
	$('[name=mess-box]').change(function(){
		var text = $(this).val()
		$('[name=or_message]').val(text)
	})
	$('#buy_btn').click(function(){
	    var IMP = window.IMP; // 생략가능
	    IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	    var msg;
	    var goods= $('[name=or_goodsname]').val()
	    var amount = $('[name=or_price]').val()
	    var email = $('[name=or_email]').val()
	    var name = $('[name=or_name]').val()
	    var phone = $('[name=or_phone]').val()
	    var add1 = $('[name=or_add1]').val()
	    var add2 = $('[name=or_add2]').val()
	    var address = add1 + '' + add2;
	    var postnum = $('[name=or_postnum]').val()
	    
		    IMP.request_pay({
		        pg : 'kakaopay',
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name : goods,
		        amount : amount,
		        buyer_email : email,
		        buyer_name : name,
		        buyer_tel : phone,
		        buyer_addr : address,
		        buyer_postcode : postnum,
		    }, function(rsp) {
		        if ( rsp.success ) {
		            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		            jQuery.ajax({
		                url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
		                type: 'POST',
		                dataType: 'json',
		                data: {
		                    imp_uid : rsp.imp_uid
		                    //기타 필요한 데이터가 있으면 추가 전달
		                }
		            }).done(function(data) {
		                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		                if ( everythings_fine ) {
		                    msg = '결제가 완료되었습니다.';
		                    msg += '\n고유ID : ' + rsp.imp_uid;
		                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                    msg += '\결제 금액 : ' + rsp.paid_amount;
		                    msg += '카드 승인번호 : ' + rsp.apply_num;
		                    
		                    alert(msg);
		                } else {
		                    //[3] 아직 제대로 결제가 되지 않았습니다.
		                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		                }
		            });
		            //성공시 이동할 페이지
		            $('#direct_order').submit();
		        } else {
		            msg = '결제에 실패하였습니다.';
		            msg +=  ' <사유> : '  + rsp.error_msg;
		            //실패시 이동할 페이지
		            alert(msg);
		        }
		    });
		})

})
$(document).ready(function(){
	var regex = /[^0-9]/g;
	var deliv = $('.delivery').text()
	var delivery = parseInt(deliv.replace(regex,""))
	var sum = "${sum}"
	var sum = parseInt(sum)
	var orderprice = delivery + sum
	var str = 
    	'<div>총 주문 금액: '+ sum.toLocaleString() +' 원</div>' +
    	'<div>배송비: '+ delivery.toLocaleString() + ' 원</div>'
	$('.order-price').text(orderprice.toLocaleString() + ' 원')
	$('#final-price').text(orderprice.toLocaleString() + ' 원')
	$('[name=or_price]').val(orderprice)
	$('#final_detail').html(str)
});
</script>
</body>
</html>