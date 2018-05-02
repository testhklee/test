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
			<form action="studyBoardDelete.do" method="post">
				<input type="hidden" name="board_no" value="${BoardDetail.boardNo }">
				<input type="hidden" name="soup_no" value="${soupNo}">
				<h4><strong>${BoardDetail.title }</strong></h4>
				<table class="table">
					<colgroup>
						<col width="60%">
						<col width="10%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th><span class="glyphicon glyphicon-user"></span>&ensp;${BoardDetail.name == login.memberName?"나":BoardDetail.name }</th>
							<th class="text-right"><span class="glyphicon glyphicon-eye-open"></span>&ensp;${BoardDetail.hits }</th>
							<th class="text-right"><span class="glyphicon glyphicon-time"></span>&ensp;${dateCreated }</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3">${BoardDetail.contents }</td>
						</tr>
					</tbody>
				</table>
				<button type="button" class="btn btn-default go_List" aria-label="Justify"><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>&ensp;목록</button>
				<c:choose>
					<c:when test="${BoardDetail.memberNo == login.memberNo }">
						<input class="btn btn-warning del" type="submit" value="삭제">
					</c:when>
					<c:otherwise>
						<c:if test="${myPosition == 'L' }">
							<input class="btn btn-warning del" type="submit" value="삭제">
						</c:if>
					</c:otherwise>
				</c:choose>
			</form>
		</div>
	</div>   
</section>
