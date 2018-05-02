
$(function() {
//pageSubmit
	$(".cd-select").click(function() {
		moveon.pageSubmitFor($(this).attr("id"));
	});
	
});

var moveon = {
		pageSubmitFor : function(pagemoveName) {
			$("#moveFrm").attr("action", pagemoveName+".do");
			$("#pagemoveName").val(pagemoveName);
			$("#moveFrm").submit();
		}
	};