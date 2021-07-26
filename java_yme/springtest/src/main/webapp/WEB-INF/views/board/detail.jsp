<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/reply.js"></script>
<style>
	.re-btn{
	font-size : 40px; color : skyblue;
	}
	.fa-thumbs-down{
		transform : rotateY(180deg);
	}
</style>
</head>
<body>
<div class="container">
	<h1>게시판</h1>
	<div class="form-group">
		<label>제목</label>
		<input type="text" class="form-control" name="title" value="${board.title}" readonly>
	</div>
	<div class="form-group">
		<label>작성자</label>
		<input type="text" class="form-control" name="writer" value="${board.writer}" readonly>
	</div>
	<div class="form-group">
		<label>작성일</label>
		<input type="text" class="form-control" name="dateTime" value="${board.dateTime}" readonly>
	</div>
	<div class="form-group">
		<label>조회수</label>
		<input type="text" class="form-control" name="views" value="${board.views}" readonly>
	</div>
	<div class="form-group">
		<a href="#" class="re-btn up">
			<c:choose>
				<c:when test="${recommend != null && recommend.state == 1 }">
					<i class="fas fa-thumbs-up"></i>
				</c:when>
				<c:otherwise>
					<i class="far fa-thumbs-up"></i>
				</c:otherwise>
			</c:choose>
		</a>
		<a href="#" class="re-btn down">
			<c:choose>
				<c:when test="${recommend != null && recommend.state == -1 }">
					<i class="fas fa-thumbs-down"></i>
				</c:when>
				<c:otherwise>
					<i class="far fa-thumbs-down"></i>
				</c:otherwise>
			</c:choose>
		</a>
	</div>
	<div class="form-group">
		<label>내용</label>
		<div class="form-control" style="height:auto;">${board.contents}</div>
	</div>
	<c:if test="${fileList.size() != 0 }">
		<div class="form-group">
			<label>첨부파일</label>
				<c:forEach items="${fileList}" var="file">
					<a href="<%=request.getContextPath()%>/board/download?fileName=${file.name}" class="form-control mb-1">${file.ori_name}</a>
				</c:forEach>
		</div>
	</c:if>
		<div class="reply form-group">
			<label>댓글</label>
			<div class="contents">
				<div class="reply-list form-group"></div>
				  <ul class="pagination justify-content-center">

				  </ul>
				<div class="reply-box form-group">
					<textarea class="reply-input form-control mb-2" ></textarea>
					<div class="float-right">
						<button type="button" class="reply-btn btn btn-outline-info">등록</button>
					</div>	
				</div>
			</div>
		</div>
		<div class="input-group">
			<a href="<%=request.getContextPath()%>/board/list" class="mr-2"><button class="btn btn-outline-info">목록</button></a>
			<c:if test="${board != null && user.id == board.writer }">
				<a href="<%=request.getContextPath()%>/board/modify?num=${board.num}" class="mr-2"><button class="btn btn-outline-info">수정</button></a>
					<form action="<%=request.getContextPath()%>/board/delete" method="post" class="mr-2">
						<input type="hidden" value="${board.num }" name="num">
					<button class="btn btn-outline-info">삭제</button>
				</form>
			</c:if>
		</div>
	</div>
	<script type="text/javascript">
	//전역변수
	//게시글 번호
	var rp_bd_num = '${board.num}'
	//아이디
	var id = '${user.id}'
	//프로젝트명
	var contextPath = '<%=request.getContextPath()%>'
	$(function(){
		var msg = '${msg}';
		printMsg(msg);
		history.replaceState({},null,null);
		
		$('.re-btn').click(function(e){
			e.preventDefault();
			var board = '${board.num}';
			var state = $(this).hasClass('up') ? 1 : -1;
			$.ajax({
				type:'get',
				url : '<%=request.getContextPath()%>/board/recommend/'+board +'/' +state,
				success : function(result, status, xhr){
					$('.re-btn i').removeClass('fas').addClass('far');
					if(result == 'UP'){
						alert('해당 게시글을 추천했습니다.');
						$('.re-btn.up i').addClass('fas');
					}else if(result == 'DOWN'){
						alert('해당 게시글을 비추천했습니다.');
						$('.re-btn.down i').addClass('fas');
					}else if(result == 'GUEST'){
						alert('추천/비추천을 하려면 로그인을 하세요.');
					}else if(result == 'CANCEL'){
						if(state == 1){
							alert('추천을 취소했습니다.')
						}else{
							alert('비추천을 취소했습니다.');
						}
					}
				},
				error : function(xhr, status, e){
					console.log('에러 발생');
				}
			})
		})
	})
	$(function(){
		replyService.list(contextPath, rp_bd_num, 1, id);
		$('.reply-btn').click(function(){
			var rp_bd_num = '${board.num}';
			var rp_content = $('.reply-input').val();
			var rp_me_id = '${user.id}';
			if(rp_me_id == ''){
				alert('로그인 하세요.');
				return;
			}
			var data = {
					'rp_bd_num' : rp_bd_num,
					'rp_content': rp_content,
					'rp_me_id'  : rp_me_id
			};
			replyService.insert(contextPath, data);
		})
		$(document).on('click','.pagination .page-item',function(){
			var page = $(this).attr('data');
			replyService.list(contextPath, rp_bd_num, page, id);
		})
		$(document).on('click','.mod-btn', function(){
			var contentObj = $(this).parent().prev().children().last();
			var rp_num = $(this).attr('data');
			var str = 
				'<div class="reply-mod-box form-group">'+
					'<textarea class="reply-input form-control mb-2" >'+contentObj.text()+'</textarea>'+
					'<button type="button" class="reply-mod-btn btn btn-outline-info" data="'+rp_num+'">등록</button>'+
				'</div>';
			contentObj.after(str).remove();
			
			$(this).parent().remove();
		});
		$(document).on('click','.reply-mod-btn',function(){
			var rp_content = $(this).siblings('.reply-input').val();
			var rp_num = $(this).attr('data');
			var data = {
					rp_content : rp_content,
					rp_me_id : id,
					rp_num : rp_num,
					rp_bd_num : rp_bd_num
				};
			var page = $('.pagination .active a').text();
			replyService.modify(contextPath, data, page);
		})
		$(document).on('click','.del-btn',function(){
			var rp_num = $(this).attr('data');
			var data = {
					rp_num : rp_num,
					rp_me_id : id,
					rp_num : rp_num,
					rp_bd_num : rp_bd_num
				};
			var page = $('.pagination .active a').text();
			replyService.deleteReply(contextPath, data, page);
		})
	})

	function printMsg(msg){
			if(msg == '' || history.state){
				return ;
			}
			alert(msg);
	}
	</script>
</body>