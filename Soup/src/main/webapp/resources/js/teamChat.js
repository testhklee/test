$(function() {
	
	var sock = new SockJS('teamChatSocket.do');
	
	sock.onopen = function() {
		alert("채팅방에 접속하였습니다."); 
	}
	
	sock.onmessage = function(evt) {
		teamChat.receive(evt);
	}
	
	//보내기 버튼 클릭 시
	$("#sendBtn").click(function(){
		
		if ($("#btn-input").val() !== "") {
			sock.send($("#btn-input").val());
			teamChat.send();
		}
		
	});
	
	//엔터키 누를 시
	$(window).keydown(function(event){
		
	    if(event.keyCode == 13 && $("#btn-input").val() !== "") {
	    	sock.send($("#btn-input").val());
	    	teamChat.send();
	    }

	});
	
});

var teamChat = {

	send : function() {
		var date = new Date();
		date.setHours(date.getHours()+9);
		var time = date.toISOString().slice(11,19);
		
		$("#chatContent").append('<li class="right clearfix"><span class="chat-img pull-right">\
	        <img src="' + memberFace + '" class="img-circle" />\
	    </span>\
	        <div class="chat-body clearfix">\
	            <div class="header">\
	                <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>' + time + '</small>\
	                <strong class="pull-right primary-font">나</strong>\
	            </div>\
	            <p>' + $("#btn-input").val() + '</p>\
	        </div>\
	    </li>');
		
		$("#btn-input").val("");
		rolldown();
		
	},
	
	receive : function(evt) {
		var data = JSON.parse(evt.data);
		
		var date = new Date();
		date.setHours(date.getHours()+9);
		var time = date.toISOString().slice(11,19);
		
		$("#chatContent").append('<li class="left clearfix"><span class="chat-img pull-left">\
                <img src="' + data.face + '" class="img-circle" />\
            </span>\
                <div class="chat-body clearfix">\
                    <div class="header">\
                        <strong class="primary-font">' + data.sender + '</strong> <small class="pull-right text-muted">\
                            <span class="glyphicon glyphicon-time"></span>' + time + '</small>\
                    </div>\
                    <p>' + data.content + '</p>\
                </div>\
            </li>');
		
		rolldown();
	},
	
	
		
}


function rolldown(){
	var chatScrroll = $(".panel-body");
	chatScrroll.scrollTop(chatScrroll.prop("scrollHeight"));
}