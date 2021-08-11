<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/reply.js"></script>
<style>
a{
	color : black
}
a:hover{
	text-decoration : none;	
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
	position: absolute; top: 0; left: 30%; width : 60vw;
}
.menu-font{
	font-size: 15px; font-style:initial;
	text-decoration : none; 
}
.reg-btn{
	position: absolute; top: 0; right: 0;
}
.writer{
	background : #e9ecef;
}
.reply-readonly-input{
	background-color : white;
}
.regtime{
	float : right;
}
</style>
</head>
<body>
	<br>
	<div class="container main-box">
		<div class="left-board-box">
			<h3>고객센터</h3>
			<hr>
			<div class="left-menu-box"><a href="<%=request.getContextPath()%>/board/notice/list" class="menu-font">공지사항</a></div>
			<div class="left-menu-box"><a href="<%=request.getContextPath()%>/board/list" class="menu-font">1:1문의</a></div>
		</div>
		<div class="right-board-box">
			<div class="container">
				<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control" name="bd_title" value="${board.bd_title}" readonly>
				</div>
				<div class="form-group">
					<label>작성자</label>
					<c:if test="${type ne '/notice'}">  
						<input type="text" class="form-control" name="bd_me_id" value="${board.bd_me_id}" readonly>
					</c:if>
					<c:if test="${type eq '/notice'}">  
						<div class="form-control writer">관리자</div>
						<input type="hidden" name="bd_me_id" value="${board.bd_me_id}" readonly>
					</c:if>
				</div>
				<div class="form-group">
					<label>작성일</label>
					<input type="text" class="form-control" name="dateTime" value="${board.dateTime}" readonly>
				</div>
				<div class="form-group">
					<label>내용</label>
					<c:if test="${type ne '/notice'}">  
						<div class="form-control" style="min-height:350px;">${board.bd_contents}</div>
					</c:if>
					<c:if test="${type eq '/notice'}">
						<div class="form-control" style="min-height:550px;">${board.bd_contents}</div>
					</c:if>
				</div>
				<c:if test="${type ne '/notice'}">  
					<hr>
					<div class="reply form-group">
						<label>답변</label>
							<div class="contents">
								<div class="reply-box form-group">
									<c:if test="${user.me_authority == 'SUPER ADMIN' || user.me_authority == 'ADMIN'}">
										<textarea class="reply-input form-control mb-2" rows="7" ></textarea>
										<div class="float-right">
											<button type="button" class="reply-btn btn btn-outline-dark btn-sm">답변등록</button>
										</div>	
									</c:if>
									<c:if test="${user.me_authority == 'USER' || user.me_authority == null}">
										<textarea class="reply-text form-control" rows="7" readonly></textarea>
									</c:if>
								</div>
							</div>
					</div>
				</c:if>
				<div class="input-group">
					<a href="<%=request.getContextPath()%>/board${type}/list" class="mr-2"><button class="btn btn-outline-dark mb-2">목록</button></a>
					<c:if test="${user != null && user.me_id == board.bd_me_id }">
						<a href="<%=request.getContextPath()%>/board${type}/modify?num=${board.bd_num}">
							<button class="btn btn-outline-dark mr-2">수정</button>
						</a>
						<a href="<%=request.getContextPath()%>/board${type}/delete?num=${board.bd_num}">
							<button class="btn btn-outline-dark mr-2">삭제</button>
						</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
<script>
var rp_bd_num = '${board.bd_num}';
var rp_me_id = '${user.me_id}';
var me_authority = '${user.me_authority}'
var contextPath = '<%=request.getContextPath()%>';
$(function(){
	$('.reply-btn').click(function(){
		if(rp_me_id == ''){
			alert("로그인을 하세요.")
			return;
		} 
		var rp_content = $('.reply-input').val();
		var data = {
				rp_bd_num:rp_bd_num, rp_content:rp_content
		}
		replyService.insert(contextPath, data, responseOk ,showReply);
	})
	$(document).on('click','.reply-del-btn',function(){
		var rp_num = $(this).siblings('.rp_num').val();
		var data = {rp_num : rp_num, rp_bd_num : rp_bd_num};
		replyService.deleteReply(contextPath, data, responseOk, basicReply);
		
	})
	$(document).on('click','.reply-mod-btn',function(){
		var rp_content = $('.reply-input').text();
		var rp_num = $('.reply-del-btn').attr('data');
			$('.reply-input').remove();
			var str = '<textarea class="reply-input form-control mb-2" rows="7">' + rp_content + '</textarea>';
			$('.reply-box').prepend(str);
			$('.btn-box').children(this).hide();
			str = '<button class="reply-ok-btn btn btn-outline-dark btn-sm mr-1 ml-2"">등록</button>' +
				  '<button type="button" class="reply-del-btn btn btn-outline-dark btn-sm" data="'+ rp_num+'">삭제</button>'	
			$('.btn-box').prepend(str);	
	})
	$(document).on('click','.reply-ok-btn', function(){
		var rp_num = $('.reply-del-btn').attr('data');
		var rp_content = $('.reply-input').val()
		var data = {
				rp_num     : rp_num, 
				rp_content : rp_content,
				rp_bd_num  : rp_bd_num
				}
			$.ajax({
				type: 'post',
				url : contextPath + '/reply/modify',
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				success : function(res){
					console.log(res)
				}
			})
	})
		
	
	replyService.show(contextPath, {rp_bd_num : rp_bd_num} ,showReply);
})

function responseOk(res, str){
	if(res == 'OK')
		alert('답글이 '+str+'되었습니다.');
	else
		alert('답글 '+str+'에 실패했습니다.');
}
function showReply(res){
		var reply = res.reply;
		var str = reply[0].rp_content;
		var user = 'USER';
		var reg = '';
				reg += '<span class="regtime">' + '답변시간 : ' + reply[0].rp_regDateStr + '</span>'
		var btn = '';
				btn += 	
					''
					if(${user.me_authority == 'USER' || user.me_authority == null}){
						btn +=	''
					} else {
						btn += 
							'<span class="btn-box">' +
							'<button type="button" class="reply-mod-btn btn btn-outline-dark btn-sm mr-1 ml-2" data="'+ reply[0].rp_num+'">수정</button>' +
							'<button type="button" class="reply-del-btn btn btn-outline-dark btn-sm" data="'+ reply[0].rp_num+'">삭제</button>' +
							'<input type="hidden" class="rp_num" value="'+reply[0].rp_num+'">' +
							'</span>'
					}
					
		$('.reply-input').prop('readonly',true)
		$('.reply').children('label').after(btn)
		$('.reply').prepend(reg);	
		$('.reply-input').html(str);
		$('.reply-text').html(str);	
}
function basicReply(res){
		$('.reply-input').prop('readonly',false)
		$('.btn-box').remove()
		$('.regtime').remove()
		$('.reply-input').html('');
		$('.reply-input').html('');
}
</script>
</body>
</html>