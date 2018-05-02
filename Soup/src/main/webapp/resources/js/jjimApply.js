$(function() {
	$(".jjimApply").click(function() {
		var soupNo = $(this).find(".soupNo").val();
		location.href = "detailForm.do?soupNo=" + soupNo;
	})
});