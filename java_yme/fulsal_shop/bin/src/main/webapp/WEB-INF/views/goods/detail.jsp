<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/review.js"></script>
<meta charset="UTF-8">
</head>
<style>
*{
	list-style : none;
}
.main-box{
	display : flex;
}
.main-img-box img{
	width : 500px; height : 500px; margin-right : 70px; margin-bottom : 50px;
}
.page-link{
	color : black;
}
.pagination .page-item.active a {
      background-color: darkslategray;
      border : darkslategray;
}
.title{
	font-weight: bold; margin-bottom : 20px;
	font-size : 50px;
}
.first{
	width : 100px;
}
.caution{
    color : red;
}
.fa-caret-up, .fa-caret-down{
	cursor : pointer;
	margin : 3px;
	font-size : 20px;
}
.fa-window-close{
	cursor : pointer;
	margin : 3px;
}
.num-box{
	width : 50px; text-align : center;
}
.sub-menu-box{
	margin : 0;
	width : 200%; height : 40px; line-height : 40px;
	display : flex;
}
.sub-menu-box li{
	width : calc(200% / 4);
	border-bottom : 1px solid gray;
	text-align : center;
	z-index : 100;
}
.sub-menu-box:hover{
	cursor : pointer;
}
.select{
	border : 1px solid gray;
	border-bottom : none !important;
}
.view{
	border-top : none;
	overflow : auto;
	width: 200%; height: 900px;
}
.review,.delivery,.change{
	display : none;
}
.box{
	display: flex;
}
.box1{
	display: flex;
}
.left-box{
	width : 25%;
	height : 100%;
	text-align: center;
}
.right-box{
	width: 75%;
	height : 100%;
}
.right-text-box{
	margin-left: 10%;
}
#change_box_type{
	margin : 0;
	height : 70%;
	width : 450px;
}
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2rem;
  line-height: 2rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color:  #fff58c;
}
.main-img-box, text-box {
	height : 50%;
}
.sub-box{
	width : 35%;
	margin-left : 15%;
}



.bold{
	font-weight : bold;
	font-size : 20px;
}
.right{
	float : right;
}
</style>
</head>
<body>
<form class="container main-box" method="post" action="<%=request.getContextPath()%>/order/direct">
<!-- input hidden -->
<input type="hidden" name="fu_num" value="${futsal.fu_num}">
<input type="hidden" name="ca_me_id" value="${user.me_id}">
	<div class="main-img-box">
		<img alt="" src="<%=request.getContextPath()%>/resources/img/${futsal.fu_img}">	
	</div>
	<div class="text-box">
		<div class="title">${futsal.fu_name}</div>
		  <table class="table table-borderless">
		    <tbody>
		      <tr>
		        <td class="first">브랜드 :</td>
		        <td>${futsal.fu_brand}</td>
		      </tr>
		      <tr>
		        <td class="first">가격 :</td>
		        <td><fmt:formatNumber pattern="###,###,###" value="${futsal.fu_price}" />원</td>
		      </tr>
		    </tbody>
		  </table>
		  <hr>
		  <div class="option-box">
	 		  <table class="table table-borderless">
			    <tbody>		    
			      <tr>	      
			        <td class="first">사이즈 :</td>
			        <td>		        
			        	<select class="form-control col-8 ml-2 select-box" name="size">
			        		<option value="choice" selected>옵션 선택</option>
			        		<c:forEach items="${list}" var="option">
								<option value="${option.op_size}">${option.size}<c:if test="${option.op_count == 0}">(품절)</c:if></option>
							</c:forEach>	
		     			</select>	
						<span class="caution">주문량이 많은 상품은 주문완료시 품절이 될 수 있습니다.</span>
			        </td>
			      </tr>
			    </tbody>
			  </table>	
			 <hr>
		 </div> 
		 <span class="btn-box mr-5">
			 <a href="#"><button type="button" class="btn btn-outline-dark mr-1 cart-add">장바구니</button></a>
		     	<button type="submit" class="btn btn-outline-dark go-buy">구매하기</button>
		 </span>
	 	 <span>총 가격 : </span><span class="total">0 원</span>
	</div>
</form>	
<div class="sub-box">
	<ul class="sub-menu-box">
		<li class="menu-info select">정보</li>
		<li class="menu-review">리뷰</li>
		<li class="menu-delivery">배송정보</li>
		<li class="menu-change">교환/반품</li>
	</ul>
	<div class="info view"><br>${futsal.fu_info}</div>
	<!-- 리뷰 시작 -->
	<div class="review view"><br>
		<div class="container mb-3">
			<h1 class="mb-2" style="font-weight : bold;">리뷰</h1>
			<hr>
		</div>
		<div class="container">
			<div class="review-list form-group">

			</div>
		</div>
		<ul class="pagination justify-content-center">

		</ul>
		<div class="container">
			<div class="star-rating space-x-4 ml-3 mb-2">
				<input type="radio" id="5-stars" name="rv_star" value="5">
				<label for="5-stars" class="star pr-4">★</label>
				<input type="radio" id="4-stars" name="rv_star" value="4">
				<label for="4-stars" class="star">★</label>
				<input type="radio" id="3-stars" name="rv_star" value="3">
				<label for="3-stars" class="star">★</label>
				<input type="radio" id="2-stars" name="rv_star" value="2">
				<label for="2-stars" class="star">★</label>
				<input type="radio" id="1-star" name="rv_star" value="1"/>
				<label for="1-star" class="star">★</label>
			</div>
			<textarea style="height : 80px;" class="form-control mb-2" name="rv_contents"></textarea>
			<button type ="button" class="btn btn-outline-dark btn-sm rev-add-btn right">등록</button>
		</div>
	</div>
	<!-- 리뷰 끝 -->
	<div class="delivery view"><br>
		<div class="box">
			<div class="left-box bold">
				<br>배송정보
			</div>
			<div class="right-box mt-3">
				<div class="right-text-box">
					<div class="bold mb-2 mt-3">배송비</div>
					<div class="mb-1">* 10만원 미만 구매시 2,500원</div>
					<div class="mb-1">* 10만원 이상 구매시 전액 무료(제주도 및 기타 도선료 추가 지역포함)</div><br>
					<div class="bold mb-2">평균 배송일</div>
					<div class="mb-1">* 평일 오후 2시 이전 주문 당일 출고됩니다.</div>
					<div class="mb-1">* 결제완료 후 평균 2일 소요됩니다. (주말 및 공휴일 제외)</div>
					<div class="mb-1">* 택배사의 사정에 따라 다소 지연될 수 있습니다. (우체국 1588-1300)</div>
				</div>
			</div>
		</div>
	</div>
	<div class="change view"><br>
		<div class="box1">
			<div class="left-box bold">
				<br>교환/반품
			</div>
			<div class="right-box mt-3">
				<div class="right-text-box">
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
		</div>
	</div>
</div>
<script type="text/javascript">
var name = "${futsal.fu_name}";
var price = "${futsal.fu_price}";
var fu_num = "${futsal.fu_num}";
var id = "${user.me_id}";
var contextPath = '<%=request.getContextPath()%>';
$(function(){
	$('[name=amount]').change(function(){
		var zero = '0';
		$('.opt-count-box').remove()
		$('.total').text(zero)
	})
	
	$('[name=size]').change(function(){
		var opt = $(this).val();
		var opt = parseInt(opt)
		var optext = $('.select-box option:checked').text()
		var soldout = "(품절)";
		var num = $('.opt-count-box').length
		var totalpri = (price * (num+1))
	
		if(optext.indexOf(soldout) != -1) {
			alert('품절된 옵션입니다.')
			$('.select-box').val("choice").attr("selected","selected")
		}
		if(($('[data-target='+ opt +']').length == 0) && (optext.indexOf(soldout) == -1)){
				var str = 
					  '<div class="opt-count-box mb-5" data-target="'+ opt +'">'  +
					  '<span class="add-opt-box mr-5">' + name + '-' + opt + '</span>' +
					  '<span class="count-box">' +
					  '<input class="mr-2 num-box" type="text" value="1" name="ca_count" + readonly>' +
					  '<span class="img-box">' +
					  '<i class="fas fa-caret-up"></i>' +
					  '<i class="fas fa-caret-down"></i>' +
		    		  '<i class="far fa-window-close"></i>' +
					  '</span>'	+
					  '</span>'	+
					  '<input type="hidden" value="'+ opt +'" id="hidden" name="op_size">' +
					  '<input type="hidden" value="'+ opt +'" name="ca_size">' +
					  '</div> ';
					  if(num != 0){
						  alert('한 가지 사이즈만 선택 가능합니다.')
						  $('.select-box').val("choice").attr("selected","selected")
					  } else {
						  $('.option-box').append(str)	 
						  $('.select-box').val("choice").attr("selected","selected")
						  $('.total').text(totalpri.toLocaleString() + " 원")					  
					  }		  
			} else if($('[data-target='+ opt +']').length != 0){
				alert('이미 추가된 옵션입니다.')
				$('.select-box').val("choice").attr("selected","selected")
			} 	
	})
	
	$(document).on('click','.fa-window-close',function(){
		$(this).parents('.opt-count-box').remove();
		var num = $('.opt-count-box').length
		var totalpri = (price * (num))
		$('.total').text(totalpri.toLocaleString() + " 원")
	})
	
	$(document).on('click','.fa-caret-up',function(){
	var n = $(this).index(this);
	var num = $(".num-box:eq("+n+")").val();
	var totalpri = (price * (num*1+1))
	$('.total').text(totalpri.toLocaleString() +"원")
	num = $(".num-box:eq("+n+")").val(num*1+1);

	})
	
	$(document).on('click','.fa-caret-down',function(){
	var n = $(this).index(this);
	var num = $(".num-box:eq("+n+")").val();
	if(num == 1){
		return;
	}
	var totalpri = (price * (num*1-1))
	$('.total').text(totalpri.toLocaleString() + " 원")
	num = $(".num-box:eq("+n+")").val(num*1-1); 
	})

	$('.cart-add').click(function(){
		var ca_count = $('[name=ca_count]').val()
		var regex = /[^0-9]/g;
		var price = $('.total').text()
		var ca_price = parseInt(price.replace(regex, ""))
		var ca_size = $('#hidden').val()
		var ca_me_id = $('[name=ca_me_id]').val()
		var zero = '0 원';
		var data = {
			ca_fu_num : fu_num,
			ca_count : ca_count,
			ca_size : ca_size,
			ca_price : ca_price,
			ca_me_id : ca_me_id
		}
		if($('.num-box').length == 0){
			alert('옵션을 선택하세요.')
		}
		   $.ajax({
			    type : "post",
			    url : contextPath + '/cart/add',
				data: JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
			    success : function(res){
					if(res == 'OK'){
						$('.opt-count-box').remove()		
						alert('장바구니에 등록하였습니다.')
						$('.total').text(zero)
					} else if(res == 'FAIL'){
						alert('로그인이 필요합니다.')
					}
			    }
			})
	
	})
	$('.go-buy').click(function(e){
		if($('.num-box').length == 0){
			e.preventDefault();
			alert('옵션을 선택하세요.')
		} 
	})
	$('.menu-review').click(function(){
		subMenu('.menu-review', '.review' , '.menu-info' , '.info' ,'.menu-delivery' ,'.delivery' ,'.menu-change' ,'.change')
	})
	$('.menu-delivery').click(function(){
		subMenu('.menu-delivery', '.delivery' , '.menu-info' , '.info' ,'.menu-review' ,'.review' ,'.menu-change' ,'.change')
	})
	$('.menu-change').click(function(){
		subMenu('.menu-change', '.change' , '.menu-info' , '.info' ,'.menu-delivery' ,'.delivery' ,'.menu-review' ,'.review')
	})	
	$('.menu-info').click(function(){
		subMenu('.menu-info', '.info' , '.menu-review' , '.review' ,'.menu-delivery' ,'.delivery' ,'.menu-change' ,'.change')
	})
})
$(function(){
	showReview(fu_num ,1);
	$('.rev-add-btn').click(function(){
		var or_me_id = $('[name=ca_me_id]').val()
		var rv_star = $("input[name='rv_star']:checked").val()
		var rv_contents = $('[name=rv_contents]').val()
		var confirm_val = confirm("리뷰 등록하시겠습니까?");
		var data = { 
			or_me_id : or_me_id,
			fu_num : fu_num,
			rv_star : rv_star,
			rv_contents : rv_contents
		}
		if(typeof rv_star == 'undefined' || rv_contents == ''){
			alert('별점과 내용 모두 입력하세요.')
			return;
		}
		if(confirm_val){
			$.ajax({
				type : 'post',
				url : contextPath + '/goods/review',
				data : data,
				success : function(res){
					if(res == 'OK'){
						alert('리뷰가 등록되었습니다.')
						showReview(fu_num,1)
					} else if(res == 'LOGIN'){
						alert('회원만 작성 가능합니다.')
					} else if(res == 'FAIL'){
						alert('구매한 상품이 아니거나 구매 후 3개월 이내에만 작성 가능합니다.')
					}
				}
			})
		}
	})
	
	$(document).on('click','.rev-del-btn',function(){
		var rv_num = $(this).attr("data");
		var confirm_val = confirm("리뷰 삭제하시겠습니까?");
		if(confirm_val){
			$.ajax({
				type : 'post',
				url : contextPath + '/review/delete',
				data: JSON.stringify({rv_num : rv_num}),
				contentType : "application/json; charset=utf-8",
				success : function(res){
					if(res == 'OK'){
						alert('리뷰가 삭제되었습니다.')
						showReview(fu_num, 1);
					} else {
						alert('리뷰 삭제에 실패했습니다.')
					}
				}
			})
		}
	})
	$(document).on('click','.pagination .page-item',function(){
		var page = $(this).attr('data');
		showReview(fu_num, page);
	})
	
})
	
function showReview(rv_fu_num, page){
	$.ajax({
		type : 'get',
		url  : contextPath + '/review/list/' + rv_fu_num + '/'+ page,
		dataType : "json",
		success : function(res){
			var list = res['list'];
			var str = '';
			for(i = 0; i < list.length; i++){
				str += 
					'<div><br>' +
						'<div class="mb-3">'+
							'<span class="mr-2">'+ list[i].rv_me_id +'</span><span class="mr-2" style="color : gold;">'+list[i].starStr+'</span>' +
							'<span style="float : right;">'+list[i].regDateStr+'</span>'+
						'</div>	' +
						'<div class="form-control mb-2">'+list[i].rv_contents +'</div>';
					if(id == list[i].rv_me_id){
					str +=	
						'<div>' +
							'<button type="button" class="btn btn-outline-danger btn-sm rev-del-btn" data="'+list[i].rv_num +'">삭제</button>' +
						'</div>';
					}
				str +=
					'</div>' +
					'<hr style="background: #ced4da;">'
				}

			$('.review-list').html(str);
			
			var pmStr = '';
			var pm = res['pm']
			if(pm.prev){
				pmStr += '<li class="page-item" data="'+(pm.startPage-1)+'"><a class="page-link" href="javascript:void(0);">Prev</a></li>'
			}
			for(i = pm.startPage ; i<= pm.endPage; i++){
			 	if(pm.criteria.page == i){
			 	pmStr += '<li class="page-item active" data="'+ i +'"><a class="page-link" href="javascript:void(0);">'+ i +'</a></li>'
			   } else {
			    pmStr += '<li class="page-item" data="'+ i +'"><a class="page-link" href="javascript:void(0);">'+ i +'</a></li>'
			   }
			}
			if(pm.next){
				pmStr += '<li class="page-item" data="'+(pm.endPage+1)+'"><a class="page-link" href="javascript:void(0);">Next</a></li>'
			}
			$('.pagination').html(pmStr);
		}
	})
}	

function subMenu(showmenu, show , hidemenu1 , hide1, hidemenu2 , hide2, hidemenu3 , hide3){
	$(showmenu).addClass('select')
	$(hidemenu1).removeClass('select')
	$(hidemenu2).removeClass('select')
	$(hidemenu3).removeClass('select')
	$(show).show()
	$(hide1).hide()
	$(hide2).hide()
	$(hide3).hide()
}
</script>
</body>
</html>