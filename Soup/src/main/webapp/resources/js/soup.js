$(function() {
	$(".glyphicon-star").click(function(event) {
		event.stopPropagation();
		var soupCode = $(this).parent().parent().attr("id").slice(0,2);
		var soupNo = 0;
		if (soupCode === "FS" || soupCode === "PS") {
			soupNo = $(this).parent().parent().attr("id").slice(2);
		} else {
			soupNo = $(this).parent().parent().attr("id").slice(1);
		}
		
		location.href = "detailForm.do?soupNo=" + soupNo;
	});
	
	//리뷰쓰기 폼
	$(".glyphicon-comment").click(function(event) {
		event.stopPropagation();
		var soupNo = $(this).parent().parent().attr("id").slice(2);
		$("#reviewFrm input").val(soupNo);
		$("#reviewFrm").submit();
	});
	//리뷰쓰기 팝업
	$("#reviewFrm").submit(function() {
		var w = window.open('about:blank','Popup_Window', 'toolbar=0, scrollbars=0, location=0, statusbar=0, menubar=0, resizable=0, width=500, height=350, left=700, top=180');
    	this.target = 'Popup_Window';
	});
	
	
	$(".mySoup").not(".glyphicon-star").not(".glyphicon-comment").click(function() {
		var soupCode = $(this).attr("id").slice(0,2);
		var soupNo = 0;
		
		if (soupCode === "FS" || soupCode === "PS") {
			$("#soupFrm").attr("action", "myStudy.do");
			soupNo = $(this).attr("id").slice(2);
		} else {
			$("#soupFrm").attr("action", "projectManage.do");
			soupNo = $(this).attr("id").slice(1);
		}

		$("#soupNo").val(soupNo);
		$("#soupFrm").submit();
	});
	
	$(".joinSoupBtn").click(function() {
		location.href = "search.do";
	});
	
});