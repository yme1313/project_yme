<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
.main-box{
	display : flex;
}
.main-img-box img{
	width : 500px; height : 500px; margin-right : 70px; margin-bottom : 50px;
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
.fas{
	margin : 2px; cursor : pointer;
}
.far{
	cursor : pointer;
}
.info{
	width: 200%; height: 70%;
	border : 1px solid black;
}
</style>
<style>
</style>
</head>
<body>
<div class="container main-box">
	<div class="main-img-box">
		<img alt="" src="<%=request.getContextPath()%>/resources/img/${futsal.fu_img}">
		<div class="info">${futsal.fu_info}</div>
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
		        <td>${futsal.fu_price}</td>
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
		        	<select class="form-control col-8 ml-2 select-box" name="op_size">
		        		<option value="choice" selected>옵션 선택</option>
		        		<c:forEach items="${list}" var="option">
							<c:if test="${option.op_size == '220' && option.op_count == 0}">
								<option value="">220(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '220' && option.op_count != 0}">
								<option value="220">220</option>
							</c:if>
							<c:if test="${option.op_size == '225' && option.op_count == 0}">
								<option value="">225(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '225' && option.op_count != 0}">
								<option value="225">225</option>
							</c:if>
							<c:if test="${option.op_size == '230' && option.op_count == 0}">
								<option value="">230(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '230' && option.op_count != 0}">
								<option value="230">230</option>
							</c:if>
							<c:if test="${option.op_size == '235' && option.op_count == 0}">
								<option value="">235(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '235' && option.op_count != 0}">
								<option value="235">235</option>
							</c:if>
							<c:if test="${option.op_size == '240' && option.op_count == 0}">
								<option value="">240(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '240' && option.op_count != 0}">
								<option value="240">240</option>
							</c:if>
							<c:if test="${option.op_size == '245' && option.op_count == 0}">
								<option value="">245(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '245' && option.op_count != 0}">
								<option value="245">245</option>
							</c:if>
							<c:if test="${option.op_size == '250' && option.op_count == 0}">
								<option value="">250(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '250' && option.op_count != 0}">
								<option value="250">250</option>
							</c:if>
							<c:if test="${option.op_size == '255' && option.op_count == 0}">
								<option value="">255(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '255' && option.op_count != 0}">
								<option value="255">255</option>
							</c:if>
							<c:if test="${option.op_size == '260' && option.op_count == 0}">
								<option value="">260(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '260' && option.op_count != 0}">
								<option value="260">260</option>
							</c:if>
							<c:if test="${option.op_size == '265' && option.op_count == 0}">
								<option value="">265(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '265' && option.op_count != 0}">
								<option value="265">265</option>
							</c:if>
							<c:if test="${option.op_size == '270' && option.op_count == 0}">
								<option value="">270(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '270' && option.op_count != 0}">
								<option value="270">270</option>
							</c:if>
							<c:if test="${option.op_size == '275' && option.op_count == 0}">
								<option value="">275(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '275' && option.op_count != 0}">
								<option value="275">750</option>
							</c:if>
							<c:if test="${option.op_size == '280' && option.op_count == 0}">
								<option value="">280(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '280' && option.op_count != 0}">
								<option value="280">280</option>
							</c:if>
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
		<a href="<%=request.getContextPath()%>/cart/list"><button class="btn btn-outline-dark mr-1">장바구니</button></a>
		<a href="#"><button class="btn btn-outline-dark">구매하기</button></a>
	  </span>
	  <span class="total">총 가격 : 0 </span>
	</div>
</div>	
<script type="text/javascript">
var name = "${futsal.fu_name}";
var price = "${futsal.fu_price}";
$(function(){
	$('[name=op_size]').change(function(){
		var opt = $(this).val();
		var str = 
			  '<div class="opt-count-box mb-2">'  +
			  '<span class="add-opt-box mr-5">' + name + '-' + opt + '</span>' +
			  '<span class="count-box">' +
			  '<input class="col-2 mr-2 num-box" type="text" value="1" name="ca_count" readonly>' +
			  '<span class="img-box">' +
    		  '<i class="fas fa-caret-up"></i><i class="fas fa-caret-down mr-2"></i><i class="far fa-window-close"></i>' +
			  '</span>'	+
			  '</span>'	+
			  '</div> ' 	
		var pricetext = 
			'총 가격 :'+ price
			
		if(opt == "" ){
			alert('품절입니다.')
			$('.select-box').val("choice").attr("selected","selected")	
		} else {
			$('.option-box').append(str)
			$('.total').text(pricetext)
			$('.select-box').val("choice").attr("selected","selected")	
		}
	})
	
	$(document).on('click','.fa-window-close',function(){
		$(this).parents('.opt-count-box').remove();
		$(this).parents('.total').text(text)
	})
	$(document).on('click','.fa-caret-up',function(){
		var n = $('.fa-caret-up').index(this);
		var num = $(".num-box:eq("+ n +")").val();
		var totalprice = (price * (num*1+1));
		var str ="총가격 : " + totalprice
		$('.total').text(str);
		num = $(".num-box:eq("+ n +")").val(num*1+1); 
	})
		$(document).on('click','.fa-caret-down',function(){
		var n = $('.fa-caret-down').index(this);
		var num = $(".num-box:eq("+ n +")").val();
		var totalprice = (price * (num*1-1));
		var str ="총가격 : " + totalprice
		if(num == 1){
			return;
		}
		$('.total').text(str);
		num = $(".num-box:eq("+ n +")").val(num*1-1); 
	})
})
</script>
</body>
</html>