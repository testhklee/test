<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/studyManage.css">
<script type="text/javascript" src="https://cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
<script type="text/javascript">

	function memostart() {
		
		$.ajax({
			type:"post",
			url:"startmemo.do",
			data:"soup_no=${soupNo }",
			success:function(msg) {
				$(".memo textarea").attr("readonly", false);
				$(".memo_start_btn").css("display", "none");
				$(".memo").append("<div class='memo_update_btn'><button class='btn btn-default' onclick='memoupdate()'>저장</button></div>");
				
			},error:function(statusCode) {
				alert("error : " + statusCode.status);
			}
		});
	}
	
	function memoupdate() {
		
		var data = $(".memo_area").val();
		
		$.ajax({
			type:"post",
			url:"updatememo.do",
			data:"soup_no=${soupNo }&memo_content=" + data,
			success:function(msg) {
				alert("저장되었습니다.");
			},error:function(statusCode) {
				alert("error : " + statusCode.status);
			}
		});
	}
		
	$( document ).ready(function() {
		
		var delay = (function() {
			
			var timer = 0;
			
			return function(callback, ms) {
				
			clearTimeout (timer);
			timer = setTimeout(callback, ms);
			
			};
			
		})();
		
		$(".memo_area").keyup(function() {
			
			delay(function(){
				
				var data = $(".memo_area").val();
				
				$.ajax({
					type:"post",
					url:"updatememo.do",
					data:"soup_no=${soupNo }&memo_content=" + data,
					success:function(msg) {
					},error:function(statusCode) {
						alert("error : " + statusCode.status);
					}
				});
				
			}, 2000 );
			
		});
				
		CKEDITOR.editorConfig = function( config ) {
		    config.language = 'ko';
		    config.uiColor = '#F7B42C';
		    config.height = 300;
		    config.toolbarCanCollapse = true;
		};
		
		CKEDITOR.replace( 'editor1', {
	        height: 525,
	        width: 915,
	        enterMode:'2',
	        shiftEnterMode:'3',
	        filebrowserImageUploadUrl: 'imageUpload.do'
	    } );

		CKEDITOR.on('dialogDefinition', function( ev ){
	        var dialogName = ev.data.name;
	        var dialogDefinition = ev.data.definition;
	      
	        switch (dialogName) {
	            case 'image': //Image Properties dialog
	                //dialogDefinition.removeContents('info');
	                dialogDefinition.removeContents('Link');
	                dialogDefinition.removeContents('advanced');
	                break;
	        }
	    });
		
		$("#boardWrite").submit( function() {
	        if(CKEDITOR.instances['editor1'].getData() == "") {
	        	alert("내용을 입력하세요");
				return false;
	        }
	        
	    });

		$(".content form .go_List").on("click", function() {
			location.href="studyBoardList.do?soup_no=" + ${soupNo};
		});

	});

</script>
<section class="container">
	<div class="clearfix">
		<ul class="nav navbar-nav navbar-light">
			<li class="navMenu"><a href="myStudy.do?soupNo=${soupNo }">나의 스터디</a></li>
			<li class="navMenu"><a href="studyschedule.do?soup_no=${soupNo }">일정관리</a></li>
			<li class="navMenu"><a href="studyCurriculum.do?soup_no=${soupNo }">커리큘럼</a></li>
			<li class="navMenu"><a href="evaluateChart.do?soup_no=${soupNo }">커리큘럼 차트</a></li>
			<li class="navMenu"><a href="studyBoardList.do?soup_no=${soupNo }">게시판</a></li>
		</ul>				
	</div>
	<div class="inner_container">
		<div class="memo">
			<c:choose>
				<c:when test="${empty memo }">
					<div>				
						<div><textarea class="memo_area form-control" readonly="readonly"></textarea></div>				
					</div>
					<div class="memo_start_btn">
						<div class="memo_start_btn_img"><span class="glyphicon glyphicon-edit"></span></div>
						<p>메모기능을 사용하시려면<br>활성화 시켜셔야 합니다.<br>활성화 버튼을 누르시고<br>메모기능을 사용하시기<br>바랍니다.</p>
						<button class="btn btn-default" onclick="memostart()">메모 활성화</button>
					</div>
				</c:when>
				<c:otherwise>
					<div>				
						<div><textarea class="memo_area form-control">${memo.memoContent }</textarea></div>				
					</div>
					<div class="memo_update_btn">
						<button class="btn btn-default" onclick="memoupdate()">저장</button>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="content">
			<form action="studyBoardWrite.do" method="post" id="boardWrite">
				<input type="hidden" name="soup_no" value="${soupNo }">
				<div class="board_write_header clearfix">
					<div><h4><strong>제목</strong> </h4></div>
					<div><input class="form-control" type="text" name="title" required="required"></div>
					<div><button class="btn btn-info go_List" type="button">취소</button></div>
					<div><input class="btn btn-default" type="submit" value="작성"></div>
				</div>
				<div>
					<textarea name="contents" id="editor1" required="required"></textarea>
				</div>
			</form>
		</div>
	</div>   
</section>
