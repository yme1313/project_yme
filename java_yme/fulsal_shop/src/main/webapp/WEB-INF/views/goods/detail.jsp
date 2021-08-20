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
.far{
	cursor : pointer;
}
.info{
	width: 200%; height: 70%;
	border : 1px solid black;
}
.num-box{
	width : 50px; text-align : center;
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
							<option value="${option.op_size}">${option.op_size}<c:if test="${option.op_count == 0}">(품절)</c:if></option>
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
	  <span>총 가격 : </span><span class="total">0</span>
	</div>
</div>	
<script type="text/javascript">
var name = "${futsal.fu_name}";
var price = "${futsal.fu_price}";
$(function(){
	$('[name=op_size]').change(function(){
		var opt = $(this).val();
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
				  '<div class="opt-count-box mb-2" data-target="'+ opt +'">'  +
				  '<span class="add-opt-box mr-5">' + name + '-' + opt + '</span>' +
				  '<span class="count-box">' +
				  '<input class="mr-2 num-box" type="text" value="1" name="ca_count">' +
				  '<span class="img-box">' +
	    		  '<i class="far fa-window-close"></i>' +
				  '</span>'	+
				  '</span>'	+
				  '</div> ';
			  $('.option-box').append(str)	 
			  $('.select-box').val("choice").attr("selected","selected")
			  $('.total').text(totalpri)
			} else if($('[data-target='+ opt +']').length != 0){
				alert('이미 추가된 옵션입니다.')
				$('.select-box').val("choice").attr("selected","selected")
		}
	})
	
	$(document).on('click','.fa-window-close',function(){
		$(this).parents('.opt-count-box').remove();
	})

})
</script>
</body>
</html>