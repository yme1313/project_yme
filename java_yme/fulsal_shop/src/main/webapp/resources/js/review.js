/**
 * 
 */
var reviewService = (function(){
	function list(contextPath, data, callback){
		$.ajax({
			type : 'get',
			url  : contextPath + '/reply/list/' + data.rv_fu_num + '/'+ page,
			dataType : "json",
			success  : function(res){
				if(callback)
					callback(res);
			}
		})
	}
	function add(contextPath, data, callback){
			$.ajax({
				type : 'post',
				url : contextPath + '/goods/review',
				success : function(res){
					if(callback){
					callback(res)
				}
			}	
		})
	}

	return {
		name : '리뷰 서비스',
		list : list
	};
})();