var uiui;
/* Widget close */
$(function(){
	
	//캘린더
	projectManage.calendarRefresh();
	
	$('.wclose').click(function(e){
		e.preventDefault();
		var $wbox = $(this).parent().parent().parent();
		$wbox.hide(100);
	});

	/* Widget minimize */
	projectManage.minimizing();

    //사이드바
    $('.drawer').drawer();
    
    //sortable 세팅
    $( ".movableBoard" ).sortable({
        connectWith: ".movableBoard",
        handle: ".portlet-header",
        cancel: ".portlet-toggle",
        placeholder: "portlet-placeholder ui-corner-all",
        stop : function( event, ui) {
			//같은 컬럼 내에서 위치 변경
			if (event.target.classList.value === ui.item.parent().attr('class')) {
				sort.stopPosTop = ui.item.position().top;
				//다른 위치
				if ( !(sort.startPosTop-15 <= sort.stopPosTop && sort.stopPosTop <= sort.startPosTop) ) {
					var classList = ui.item.parent().attr('class');
					var updateJson = {};
					
					if (classList.includes('todo')) {
						sort.setIndex('todo');
						updateJson = sort.getUpdateJson('todo');
					} else if (classList.includes('inProgress')) {
						sort.setIndex('inProgress');
						updateJson = sort.getUpdateJson('inProgress');
					} else {
						sort.setIndex('done');
						updateJson = sort.getUpdateJson('done');
					}
					sort.sendUpdateJson(updateJson);
				}
				
			//다른 컬럼으로 넘어감
		    } else {
		    	console.log("다른 컬럼");
			    ui.item.attr("class", "widget " + ui.item.parent().attr("id"));
			    sort.setIndex('todo');
			    sort.setIndex('inProgress');
			    sort.setIndex('done');
			    var updateJson = {
			    		target 		: 	'whole',
			    		todo 		: 	sort.getUpdateJson('todo'),
			    		inProgress 	: 	sort.getUpdateJson('inProgress'),
			    		done 		: 	sort.getUpdateJson('done')
			    };
			    sort.sendUpdateJson(updateJson);
			    
			    var classList = ui.item.parent().attr('class');
			    var title = ui.item.find(".pull-left").text();
			    var place = "";

			    if (classList.includes('todo')) {
			    	place = "할 일";
			    } else if (classList.includes('inProgress')) {
			    	place = "진행 중";
				} else {
					place = "완료";
				}
			    
			    var activityContent = '"' + title + '" (을)를 "' + place + '"(으)로 이동하였습니다.';
			    projectManage.insertProjectActivity(soupNo1, myNo1, myFace, myName, activityContent);
		    }
	
	       },
	
	     start : function( event, ui) {
	       sort.startPosTop = ui.item.position().top;
	       sort.startPosLeft = ui.item.position().left;
	       
	     }
    });

    $( ".portlet" )
        .addClass( "ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" )
        .find( ".portlet-header" )
        .addClass( "ui-widget-header ui-corner-all" )
        .prepend( "<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");

    $( ".portlet-toggle" ).on( "click", function() {
        var icon = $( this );
        icon.toggleClass( "ui-icon-minusthick ui-icon-plusthick" );
        icon.closest( ".portlet" ).find( ".portlet-content" ).toggle();
    });
    
    //게시물 추가 버튼 클릭
    $(".addBoard").click(function() {
    	var target = $(this).attr("id").slice(3);
    	$(".form-group").hide();
    	$("#frm" + target).show();
    });
    	
    //게시물 추가
    $(".insertBoardBtn").click(function() {
    	var frm = $(this).parent();
    	
    	var title = frm.find("input").val();
    	var content = frm.find("textarea").val();
    	var gubun = frm.attr("id").slice(3);
    	var order = $("." + gubun + " .widget").length + 1;
    	
    	if (title.length && content.length) {
    		$.ajax({
    			url 		: "insertProjectManagerBoard.do",
    			data		: {
	    						soupNo				: soupNo1,
	    						projectBoardTitle	: title,
	    						projectBoardContent : content,
	    						projectBoardGubun 	: gubun.toUpperCase(),
	    						projectBoardOrder	: order
	    					},
    			type 		: "post",
    			dataType	: "text",
    			success : function(bNo) {
    				frm.find("input").val("");
    				frm.find("textarea").val("");
    				frm.hide();
    				
    				var color = "";

    		    	if (gubun === "notice") {
    		    		color = "wlightblue";
    		    	} else if (gubun === "resource") {
    		    		color = "wblue";
    		    	} else if (gubun === "todo") {
    		    		color = "worange";
    		    	}
    		    	
    		    	
    		    	$("<div class='widget " + color + "'>\
    		    			<input class='order' type='hidden' name='order' value='" + order + "'>\
    		    			<input class='bNo board" + bNo + "' type='hidden' name='boardNo' value='" + bNo + "'>\
    		    			<div class='widget-head portlet-header'>\
			                	<div class='pull-left'>" + title + "</div>\
			                	<div class='widget-icons pull-right'>\
			                    	<a href='#' class='wminimize'><i class='fa fa-chevron-up'></i></a>\
			                    </div>\
			                <div class='clearfix'></div>\
			            </div>\
			            <div class='widget-content'>\
			                <div class='padd'>\
			            		" + content +"\
			                </div>\
			            	<div class='boardToolBox'>\
				                <i class='fa fa-search-plus' data-toggle='modal' data-target='#detailModal'></i> <i class='fa fa-times deleteBoard'></i>\
			                </div>\
			            </div>\
			        </div>").appendTo($("." + gubun));
    		    	
    		    	$('.wminimize').unbind("click");
    		    	$('.deleteBoard').unbind("click");
    		    	$('.fa-search-plus').unbind("click");
    		    	$(".fa-edit").unbind("click");
    		    	projectManage.minimizing();
    		    	projectManage.deleteBoard();
    		    	projectManage.projectBoardDetail();
    		    	projectManage.projectBoardUpdateForm();
    		    	
    		    	var place = "";
    		    	
    		    	if (gubun === "notice") {
    		    		place = "공지사항";
    		    	} else if (gubun === "resource") {
    		    		place = "참고/공유";
    		    	} else if (gubun === "todo") {
    		    		place = "할 일"
    		    	}
    		    	
    		    	var activityContent = '"' + title + '"(을)를 "' + place +  '"에 게시하였습니다.';
    		    	projectManage.insertProjectActivity(soupNo1, myNo1, myFace, myName, activityContent);
    		    	
    			}
    		});
    		
    		
    	} else {
    		alert("내용을 입력해주세요!");
    	}
    	
    });
    
    //게시물 추가 취소
    $(".addBoardCancelBtn").click(function() {
    	$(this).parent().hide();
    });
    
    //게시물 삭제
    projectManage.deleteBoard();
    
    //게시물 수정
    projectManage.updateProjectBoard();
    
    //팀채팅
    $(".teamChatBtn").click(function() {
    	$(".teamChatFrm").submit();
    });
    
    $(".teamChatFrm").submit(function() {
    	var w = window.open('about:blank','Popup_Window', 'toolbar=0, scrollbars=0, location=0, statusbar=0, menubar=0, resizable=0, width=500, height=620, left=1200, top=180');
    	this.target = 'Popup_Window';
    });
    
    //프로젝트 완료
    $("#projectEndBtn").click(function() {
    	if (confirm("프로젝트를 완료하시겠습니까?")) {
    		projectManage.updateSoupStatusToEnd();
    	}
    });
    
    //프로젝트 폐기
    $("#projectDropBtn").click(function() {
    	if (confirm("프로젝트를 폐기하시겠습니까?")) {
    		projectManage.updateSoupStatusToDrop();
    	}
    });
    
    //프로젝트 모집 완료
    $("#projectDoneBtn").click(function() {
    	if (confirm("프로젝트 모집을 완료하시겠습니까?")) {
    		projectManage.updateSoupStatusToDone();
    	}
    });
    
    //프로젝트 나가기
    $("#projectRunBtn").click(function() {
    	if (confirm("프로젝트에서 나가시겠습니까?")) {
    		projectManage.updateProjectMemberDropOut();
    		var activityContent = '"' + myName + '"님이 프로젝트에서 나갔습니다.';
    		projectManage.insertProjectActivity(soupNo1, myNo1, myFace, myName, activityContent);
    	}
    })
    
    //게시물 상세정보 모달
    projectManage.projectBoardDetail();
    projectManage.projectBoardUpdateForm();
    
    //수정 date start < end 세팅
    $("#detailModal .updateStartDate").change(function() {
    	var startVal = $("#detailModal .updateStartDate").val();
    	var endVal = $("#detailModal .updateEndDate").val();
    	
    	if (startVal && endVal) {
    		var start = new Date(startVal);
    		var end = new Date(endVal);
    		
    		if (start > end) {
    			alert("시작 날짜는 끝 날짜와 같거나 이전이어야 합니다.");
    			$("#detailModal .updateStartDate").val("");
    		}
    		
    	}
    	
    });
    
    $("#detailModal .updateEndDate").change(function() {
    	var startVal = $("#detailModal .updateStartDate").val();
    	var endVal = $("#detailModal .updateEndDate").val();
    	
    	if (startVal && endVal) {
    		var start = new Date(startVal);
    		var end = new Date(endVal);
    		
    		if (start > end) {
    			alert("끝 날짜는 시작 날짜와 같거나 이후이어야 합니다.");
    			$("#detailModal .updateEndDate").val("");
    		}
    		
    	}

    });
    
    //프로젝트 멤버 모달
    $(".projectMembers").click(function() {
    	var memberNo = $(this).find(".memberNo").val();
    	$("#memberModal h4").text($(this).find(".memberName").val());
    	$("#memberModal .memberNo").val(memberNo);
    	$("#memberModal .messageBtn").attr("href", "message.do?memberNo=" + memberNo);
    });
    
    //멤버에게 쪽지 보내기
    $(".messageBtn").click(function() {
    	targetNo = $(this).parent().find(".memberNo").val();
    	
    	if (targetNo === myNo1) {
    		alert("본인 입니다.");
    		return false;
    	}
    	
    });
    
    //멤버 추방시키기
    $(".projectMemberKickBtn").click(function() {
    	var targetNo = $("#memberModal .memberNo").val();
    	var targetName = $("#memberModal h4").text();
    	
    	if (targetNo === myNo1) {
    		alert("본인 입니다.");
    	} else {
    		
    		if (confirm("해당 멤버를 추방시키겠습니까?")) {
    			projectManage.updateProjectMemberKick(targetNo);
    			var activityContent = '"' + targetName + '"님이 프로젝트에서 추방당했습니다.';
        		projectManage.insertProjectActivity(soupNo1, targetNo, "", "", activityContent);
    		}
    		
    	}
    	
    });
    
    //리더권한 넘기기
    $(".projectLeaderPassBtn").click(function() {
    	targetNo = $("#memberModal .memberNo").val();
    	var targetName = $("#memberModal h4").text();
    	
    	if (targetNo === myNo1) {
    		alert("본인 입니다.");
    	} else {

    		if (confirm("해당 멤버에게 리더권한을 넘기겠습니까?")) {
    			projectManage.updateProjectLeaderPass(targetNo);
    			var activityContent = '"' + targetName + '"님이 프로젝트 리더가 되었습니다.';
        		projectManage.insertProjectActivity(soupNo1, targetNo, "", "", activityContent);
    		}
    	
    	}
    	
    });
    
    //프로젝트 신청인원 모달
    $(".applyMembers").click(function() {
    	var applyMemberNo = $(this).find(".applyNo").val();
    	var applyMemeberName = $(this).find(".applyName").val();
    	$("#applyModal h4").text(applyMemeberName);
    	$("#applyModal h6").text($(this).find(".applyContent").val());
    	$("#applyModal .memberNo").val(applyMemberNo);
    	$("#applyModal .memberName").val(applyMemeberName);
    	$("#applyModal .messageBtn").attr("href", "message.do?memberNo=" + applyMemberNo);
    });
    
    //신청 승낙
    $("#applyModal .acceptBtn").click(function() {
    	var memberNo1 = $("#applyModal .memberNo").val();
    	var memberFace = $("#applyModal .memberFace").val();
    	var memberName = $("#applyModal .memberName").val();
    	var activityContent = '"' + memberName + '"님이 프로젝트에 참여하였습니다.';
    	alert(activityContent);
    	projectManage.soupApplyAccept(memberNo1);
    	projectManage.insertProjectActivity(soupNo1, memberNo1, memberFace, memberName, activityContent);
    });
    
    //신청 거절
    $("#applyModal .rejectBtn").click(function() {
    	var memberNo1 = $("#applyModal .memberNo").val();
    	projectManage.updateSoupApplyReject(memberNo1);
    });
    
});

var sort = {
	startPosLeft :	0,
	startPosTop :	0,
	stopPosTop :	0,
	setIndex :		function(col) {
						$("." + col + " .order").each(function(index) {
				  			console.log($(this).val(index+1));
				  		});
					},
	getUpdateJson :	function(col) {
				  		var updateJson = {
			  		  		target : col
		  		  		};
		
		  			    $("." + col + " .widget").each(function() {
		  			    	updateJson[$(this).find(".bNo").val()] = $(this).find(".order").val();
		  			    });
		
		  		    	return updateJson;		
					},
	sendUpdateJson : function(updateJson) {
		$.ajax({
			url : "projectManageBoardMove.do",
			type : "post",
			data : {updateData : JSON.stringify(updateJson)}
		});
	}
};

var projectManage = {
	setBoardNo : function(gubun1, order1) {
		$.ajax({
		    url 		: "selectProjectManageBoardNo.do",
		    type 		: "post",
		    data 		: {gubun : gubun1.toUpperCase(),
		                   order : order1.toUpperCase()},
		    dataType	: "json",
		    success 	: function(result) {
		        console.log(result.projectBoardNo);
		        $("." + gubun1).find("boardNo").val(result.projectBoardNo);
		    }

		});
	},
	
	updateSoupStatusToEnd : function() {
		$.ajax({
			url 		: "updateSoupStatusToEnd.do",
		    type 		: "post",
		    data 		: {soupNo : soupNo1},
		    success 	: function() {
		        location.href = "soup.do";
		    }
		});
	},
	
	updateSoupStatusToDrop : function() {
		$.ajax({
			url 		: "updateSoupStatusToDrop.do",
		    type 		: "post",
		    data 		: {soupNo : soupNo1},
		    success 	: function() {
		    	location.href = "soup.do";
		    }
		});
	},
	
	updateSoupStatusToDone : function() {
		$.ajax({
			url 		: "updateSoupStatusToDone.do",
		    type 		: "post",
		    data 		: {soupNo : soupNo1},
		    success 	: function() {
		        location.reload();
		    }
		});
	},
	
	updateProjectMemberDropOut : function() {
		$.ajax({
			url 		: "updateProjectMemberDropOut.do",
		    type 		: "post",
		    data 		: {
		    				soupNo : soupNo1,
		    				memberNo : myNo1
		    				},
		    success 	: function() {
		        location.href = "soup.do";
		    }
		});
	},
	
	soupApplyAccept : function(memberNo1) {
		$.ajax({
			url			: "soupApplyAccept.do",
			type		: "post",
			data		: {
							soupNo 		: soupNo1,
							memberNo 	: memberNo1
							},
			success		: function() {
				location.reload();
			}
		});
	},
	
	updateSoupApplyReject : function(memberNo1) {
		$.ajax({
			url			: "updateSoupApplyReject.do",
			type		: "post",
			data		: {
							soupNo 		: soupNo1,
							memberNo 	: memberNo1
							},
			success		: function() {
				location.reload();
			}
		});
	},
	
	updateProjectMemberKick : function(memberNo1) {
		$.ajax({
			url			: "updateProjectMemberKick.do",
			type		: "post",
			data		: {
							soupNo 		: soupNo1,
							memberNo 	: memberNo1
							},
			success		: function() {
				location.reload();
			}
		});
	},
	
	updateProjectLeaderPass : function(memberNo1) {
		$.ajax({
			url			: "updateProjectLeaderPass.do",
			type		: "post",
			data		: {
							soupNo 		: soupNo1,
							memberNo 	: memberNo1,
							myNo		: myNo1
							},
			success		: function() {
				location.reload();
			}
		});
	},
	
	//게시물 접기 펼치기
	minimizing : function() {
		$('.wminimize').click(function(e){
    		e.preventDefault();
    		var $wcontent = $(this).parent().parent().next('.widget-content');
    		if($wcontent.is(':visible')) 
    		{
    			$(this).children('i').removeClass('fa fa-chevron-up');
    			$(this).children('i').addClass('fa fa-chevron-down');
    		}
    		else 
    		{
    			$(this).children('i').removeClass('fa fa-chevron-down');
    			$(this).children('i').addClass('fa fa-chevron-up');
    		}            
    		$wcontent.toggle(500);
    	}); 
	},
	
	//x누르면 게시물 삭제하도록 하는 함수
	deleteBoard : function() {
		$(".deleteBoard").click(function() {
			
			if (confirm("해당 게시물을 삭제하시겠습니까?")) {
				var target = $(this).parent().parent().parent();
				var bNo = target.find(".bNo").val();
				$.ajax({
					url 		: "deleteProjectManageBoard.do",
					type		: "post",
					data		: {projectBoardNo : bNo},
					success		: function() {
						target.remove();
						projectManage.calendarRefresh();
					}
				});
			}
			
		});
	},
	
	//프로젝트 게시물 상세 누를 때 모달에 상세정보 뿌리기
	projectBoardDetail : function() {
		$(".fa-search-plus").click(function() {
			$("#detailModal .title").show();
			$("#detailModal .updateTitle").hide();
			$("#detailModal .content").show();
			$("#detailModal .updateContent").hide();
			$("#detailModal .date").show();
			$("#detailModal .updateDate").hide();
			$("#detailModal .projectBoardUpdateBtn").hide();
			$("#detailModal .updateStartDate").val("");
			$("#detailModal .updateEndDate").val("");
	    	
			var bNo = $(this).parent().parent().parent().find(".bNo").val();
	    	$.ajax({
	    		url 		: "selectProjectBoard.do",
	    		data 		: {projectBoardNo : bNo},
	    		type		: "post",
	    		dataType	: "json",
	    		success 	: function(data) {
	    			$("#detailModal .title").text(data.projectBoardTitle);
	    			$("#detailModal .updateTitle").val(data.projectBoardTitle);
	    			$("#detailModal .content").text(data.projectBoardContent);
	    			$("#detailModal .updateContent").val(data.projectBoardContent);
	    			$("#detailModal .projectBoardNo").val(data.projectBoardNo);
	    			
	    			if (data.projectBoardStartDate != null) {
	    				var startDate = Date.parse(data.projectBoardStartDate).toString('yyyy-MM-dd');
	    				var endDate = Date.parse(data.projectBoardEndDate).toString('yyyy-MM-dd');
	    				$("#detailModal span.date").text("일정 : " + startDate + " ~ " + endDate);
	    				$("#detailModal .updateStartDate").val(startDate);
	    				$("#detailModal .updateEndDate").val(endDate);
	    			} else {
	    				$("#detailModal span.date").empty();
	    			}
	    			
	    		}
	    	});
	    });
	},
	
	//프로젝트 게시물 업데이트 폼 나오기
	projectBoardUpdateForm : function() {
		$(".fa-edit").click(function() {
			$("#detailModal .title").hide();
			$("#detailModal .updateTitle").show();
			$("#detailModal .content").hide();
			$("#detailModal .updateContent").show();
			$("#detailModal .date").hide();
			$("#detailModal .updateDate").show();
			$("#detailModal .projectBoardUpdateBtn").show();
	    });
	},
	
	//프로젝트 게시물 수정
	updateProjectBoard : function() {
		$("#detailModal .projectBoardUpdateBtn").click(function() {
			var boardNo = $("#detailModal .projectBoardNo").val();
			var widget = $(".board" + boardNo).parent();
			var title = $("#detailModal .updateTitle").val();
			var content = $("#detailModal .updateContent").val();
			var start = new Date($("#detailModal .updateStartDate").val());
			var end = new Date($("#detailModal .updateEndDate").val());

			var target = $(".board" + boardNo).parent();

			if (isNaN(start.getDate()) || isNaN(end.getDate())) {
				start = new Date(2010, 0, 1);
				end = new Date(2010, 0, 1);
				
				target.find(".fa-calendar").remove();
			} else {
				
				if (target.find(".fa-calendar").length === 0) {
					target.find(".status").append("<i class='fa fa-calendar'></i>");
				}
				
			}
			
			
			widget.find(".pull-left").text(title);
			widget.find(".padd").text(content);
			
			$(".closeDetailModal").click();
			
			$.ajax({
				url 		: "updateProjectBoard.do",
				data 		: {
								projectBoardNo 			: boardNo,
								projectBoardTitle 		: title,
								projectBoardContent		: content,
								projectBoardStartDate 	: start,
								projectBoardEndDate 	: end
							},
				type 		: "post",
				success		: function() {
					projectManage.calendarRefresh();
					var activityContent = '"' + title + '" 게시물을 수정하였습니다.';
					projectManage.insertProjectActivity(soupNo1, myNo1, myFace, myName, activityContent);
				}
			});
			
		});
	},
	
	//Calendar set
	calendarRefresh : function() {
		$('#calendar').fullCalendar('removeEvents');
		
		$.ajax({
			url : "fullCalendar.do",
			data : {soupNo : soupNo1},
			type		: "post",
    		dataType	: "json",
    		success 	: function(dateList) {
    			$('#calendar').fullCalendar('addEventSource', dateList);
    		}
		});
		
	},
	
	//활동내역 추가
	insertProjectActivity : function(soupNo1, memberNo1, memberFace, memberName, activityContent) {
		$(".activityList").prepend(
    	'<li class="activity">\
			<div class="activityImgCircleBack" style="float: left;">\
				<img src="' + memberFace +'" title="' + memberName + '">\
			</div>\
			<span class="activityContent">\
				<span class="memberName">' + memberName + '</span> : ' + activityContent + 
				'<span prettydate class="date">' + (new Date).toLongDateString().slice(0, 24) + '</span>\
			</span>\
		</li>');
    	
    	$(".date").prettydate();
		
		$.ajax({
    		url		: "insertProjectActivity.do",
    		data	: {
    					soupNo : soupNo1,
    					memberNo : memberNo1,
    					content : activityContent
    				},
    		type	: "post"
    	});
	}
}
