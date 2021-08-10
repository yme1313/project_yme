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
	float : right; margin-right : -15%;
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
										<c:choose>
											<c:when test="${board.bd_answer == 'N'}">
												<textarea class="reply-input form-control mb-2" rows="7" ></textarea>
												<div class="float-right">
													<button type="button" class="reply-btn btn btn-outline-dark btn-sm">등록</button>
												</div>	
											</c:when>
											<c:otherwise>
												<div class="reply-text form-control" style="min-height:200px;"></div>
											</c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${user.me_authority == 'USER' || user.me_authority == null}">
										<div class="reply-text form-control" style="min-height:200px;"></div>
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
		if(rp_me_id == null){
			alert("로그인을 하세요.")
			return;
		} 
		var rp_content = $('.reply-input').val();
		var data = {
				rp_bd_num:rp_bd_num, rp_content:rp_content
		}
		$.ajax({
			type : 'post',
			url : contextPath + '/reply/insert',
			data: JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				if(res == 'OK'){
					alert('답변 등록이 완료되었습니다.')
				} else {
					alert('답변 등록이 실패했습니다.')
				}
			}
		})
	})
	showReply(rp_bd_num);
})
function showReply(rp_bd_num){
	$.ajax({
		type:'get',
		url : contextPath + '/reply/show/' + rp_bd_num,
		dataType : "json",
		success : function(res){
			var reply = res['reply'];
			var str = reply[0].rp_content;
			var reg = '';
					reg += '<span class="regtime col-6">' + '답변시간 : ' + reply[0].rp_regdate + '</span>'
			var btn ='';
					btn += '<div>';
					btn += '<button type="button" class="reply-mod-btn btn btn-outline-dark btn-sm" data="' + reply[0].rp_num + '">수정</button>';
					btn += '<button type="button" class="reply-mod-btn btn btn-outline-dark btn-sm" data="' + reply[0].rp_num + '">삭제</button>';
					btn += '</div>'
			$('.reply').prepend(reg);	
			$('.reply-text').html(str);	
			$('.float-right').append(btn);
		}
	})
}
</script>
</body>
</html>