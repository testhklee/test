var sock = new SockJS('alarmSocket.do');
$(function() {
	sock.onmessage = function(evt) {
		$(".alarmMessage").children().eq(4).remove()
		
		json = JSON.parse(evt.data);
		var newMessage = json[0];
		a = newMessage;
		var messageClass = "";
		
		if (newMessage.alarmChecked === "Y") {
			messageClass = "messageY";
		} else {
			messageClass = "messageN";
		}

		$(".alarmMessage").prepend(

			'<div class="' + messageClass + '" onclick="location.href=\'targetOne.do?messageNo=' + newMessage.alarmDetailNo + '\'">\
	    		<div class="slide-data">'
			        + newMessage.alarmContent +
			       '<span class="date" style="float: right; font-size: 0.8em;" prettydate>방금 전</span>\
			    </div>\
			</div>'		
		);
		
		$.ajax({
			url		: "setSessionMessageList.do"
		});
	}
});
