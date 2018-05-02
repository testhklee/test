<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="resources/css/studyManage.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
		
		$( "#testDatepicker" ).datepicker({
	    	dateFormat: "yy-mm-dd"
	    });
		
		function auto_num() {
			
			var num = 1;
			
			if(!$(".container .content .curriculum_list table tbody span:eq(0).curriculum_num").text()) {
				num = 1;
			}else {
				num = parseInt($(".container .content .curriculum_list table tbody tr:last-child span.curriculum_num").text())+1;
			}
			
			$(".container .content .curi_modal input[name=curi_no]").val(num);
			
			$(".container .content .curi_modal h5:eq(0)").text(num + " 회차");
		}
		auto_num();		
	
		$(".container .content table .curriculum_title").on("click", function() {
			
			var splDate = $(this).parent().find(".date_close").text().split("-");			
			var splParseDate = parseInt(splDate[0]) + parseInt(splDate[1])*100 + parseInt(splDate[2]);			
			var date = new Date();			
			var nowDate = date.getFullYear() + (date.getMonth()+1)*100 + date.getDate();	
			
			if(splParseDate-nowDate < 0) {
				alert("작성일이 종료된 커리큘럼 항목입니다.");
			}else {
				var curi_no = $(this).parent().find(".curriculum_num").text();
				
				$.ajax({
					type:"post",
					url:"listMyself.do",
					data:"soup_no=${soupNo }&curi_no=" + curi_no,
					dataType:"json",
					success:function(data) {
					    
						$(".myself_do form .myself_submit").css("display", "block");
						$(".container .content .myself_do table tbody").find("tr").remove();
						
						for(var i = 0; i < data.jsonObjAll.length; i++) {
							
							if(data.writeCheck == "N") {
								if(data.jsonObjAll[i].item == "코멘트") {
									$(".container .content .myself_comment textarea").text("");
								}else {
									$(".container .content .myself_do form").attr("action","addEvaluate.do");
									$(".container .content .myself_do table tbody").prepend("<tr>"
											+"<td><input type='text' name='item' value='" + data.jsonObjAll[i].item + "' readonly='true'></td>"
											+"<td><input type='number' name='itemVal' required='required' min='1' max='100' style='background: none;border:  none;border-bottom: 1px solid #9E9E9E;border-radius: 2px;' value=''> %</td>"
											+"</tr>");
								}								
							}else {
								if(data.jsonObjAll[i].item == "코멘트") {
									$(".container .content .myself_comment textarea").text(data.jsonObjAll[i].itemVal);
								}else {
									$(".container .content .myself_do table tbody").prepend("<tr>"
											+"<td><input type='text' name='item' value='" + data.jsonObjAll[i].item + "' readonly='true'></td>"
											+"<td><input type='number' name='itemVal' required='required' min='1' max='100' style='background: none;border:  none;border-bottom: 1px solid #9E9E9E;border-radius: 2px;' value=" + data.jsonObjAll[i].itemVal + "> %</td>"
											+"</tr>");
								}
							}
							
						}
						
						$(".container .content .myself_do input[name=curi_no]").val(curi_no);
						
					},error:function(statusCode) {
						alert("error : " + statusCode.status);
					}
				});			
			}
						
		});
		
		$(".container .content .curi_modal .curi_modal_plus").on("click", function() {
			
			var last_num = $(".container .content .curi_modal .curi_plus .item").length+1;
			
			if(last_num > 5 ) {
				alert("5개 이상 될 수 없습니다.");
			}else {
				$(".container .content .curi_modal .curi_plus").append("<div class='item'>"
						+"<div><label>항목 " + last_num + " : </label></div>"
						+"<div style='width:85%;float:left;'>"
						+"<input class='form-control' type='text' name='item' required='required'>"								
						+"</div>"
						+"<div style='width:15%;float:left;'>"
						+"<input class='form-control' type='number' name='itemVal' min='1' max='100' placeholder='(%)' required='required'>"		
						+"</div>"
						+"</div>");	
			}
			
		});
		
		$(".container .content .curi_modal .curi_modal_remove").on("click", function() {
			
			if($(".container .content .curi_modal .curi_plus .item").length < 2) {
				alert("1개 이상 항목이 있어야 합니다.");
			}else {
				$(".container .content .curi_modal .curi_plus .item:last-child").remove();
			}
			
		});
		
		$(".container .content .curriculum_list input[type=submit]").on("click", function() {
			
			var change_no = $(this).parents("tr").find("input[name=curi_no]").val();
			
			$(this).parents("tbody").find("input[name=curi_no]").val(change_no);
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
			<div class="curriculum_list">
				<div><h4><strong>커리큘럼</strong></h4></div>
				<div class="table-responsive">
					<form action="removeCurriculum.do" method="post">
						<input type="hidden" name="soup_no" value="${soupNo }">
						<table class="table table-hover">
							<colgroup>								
								<c:choose>
									<c:when test="${myPosition=='L' }">
										<col width="10%">
									    <col width="50%">
									    <col width="15%">
									    <col width="15%">
									    <col width="10%">
									</c:when>
									<c:otherwise>
										<col width="10%">
									    <col width="55%">
									    <col width="15%">
									    <col width="20%">									   
									</c:otherwise>
								</c:choose>								
							</colgroup>
							<thead>
								<tr>
									<th>회차</th>
									<th>커리큘럼 제목</th>
									<th>작성완료</th>
									<th>작성종료일</th>
									<c:if test="${myPosition=='L' }">
										<th>삭제</th>
									</c:if>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty curriculumList }">
										<tr>
											<td colspan="4">커리큘럼을 추가해 주세요<td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${curriculumList }" var="curriculum" varStatus="status">
											<tr>
												<td><input type="hidden" name="curi_no" value="${curriculum.curiNo }"><span class="curriculum_num">${curriculum.curiNo }</span>회차</td>
												<td class="curriculum_title">${curriculum.title }</td>
												<td>${completeEvaluat[status.index] }/5</td>
												<td class="date_close"><fmt:formatDate value="${curriculum.dateClose }" pattern="yyyy-MM-dd"/></td>
												<c:if test="${myPosition=='L' }">
													<td><input class="btn btn-default curriculum_del_btn" type="submit" value="삭제"></td>
												</c:if>												
											</tr>
										</c:forEach>										
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>						
					</form>
				</div>
			</div>
			<div class="myself_do">
				<div><h4><strong>커리큘럼 개인평가</strong></h4></div>
				<div class="table-responsive">
					<form action="updateMyself.do" method="post">
						<input type="hidden" name="soup_no" value="${soupNo }">
						<input type="hidden" name="curi_no" value="">
						<table class="table table-hover">
							<colgroup>
								<col width="70%">
							    <col width="30%">							    
							</colgroup>
							<thead>
								<tr>
									<th>항목</th>
									<th>평점(%)</th>
								</tr>
							</thead>
							<tbody></tbody>							
						</table>
						<div class="myself_comment">
							<h6><strong>코멘트</strong></h6>
							<input type="hidden" name="item" value="코멘트">
							<div><textarea class="form-control" name="itemVal" rows="6" cols="40" required="required"></textarea></div>
						</div>						
						<input class="btn btn-default myself_submit" type="submit" value="평가완료">
					</form>
				</div>
			</div>
			<c:if test="${myPosition=='L' }">
				<button type="button" class="btn btn-default" data-toggle="modal" data-target=".bs-example-modal-sm">커리큘럼 추가</button>			
			</c:if>			
			<div class="modal fade bs-example-modal-sm curi_modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-sm curi_modal_inner">
			    <div class="modal-content curi_modal_content">
			    	<form action="addsCurriculum.do" method="post">
			    		<input type="hidden" name="soup_no" value="${soupNo }">
			    		<input type="hidden" name="curi_no" value="">
			    		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			    		<div class="form-group">		
							<h5>회차</h5>
						</div>
			    		<div class="form-group">		
							<label>커리큘럼 제목 : </label>
							<input class="form-control" type="text" name="curriculum_title" placeholder="제목을 입력해주세요." required="required">
						</div>
						<div class="form-group">		
							<label>종료일 : </label>
							<input class="form-control" id="testDatepicker" type="text" name="curriculum_date" placeholder="종료일을 선택해주세요." required="required">
						</div>
						<div class="form-group">		
							<h5>세부항목</h5>
							<button class="btn btn-info curi_modal_plus" type="button">추가</button>
							<button class="btn btn-warning curi_modal_remove" type="button">삭제</button>
						</div>
						<div class="form-group curi_plus">		
							<div class="item">
								<div><label>항목 1 : </label></div>
								<div style="width:85%;float:left;">
									<input class="form-control" type="text" name="item" placeholder="ex)참여도" required="required">								
								</div>
								<div style="width:15%;float:left;">
									<input class="form-control" type="number" name="itemVal" min="1" max="100" placeholder="(%)" required="required">		
								</div>
							</div>
							<div class="item">
								<div><label>항목 2 : </label></div>
								<div style="width:85%;float:left;">
									<input class="form-control" type="text" name="item" placeholder="ex)만족도" required="required">								
								</div>
								<div style="width:15%;float:left;">
									<input class="form-control" type="number" name="itemVal" min="1" max="100" placeholder="(%)" required="required">		
								</div>
							</div>
							<div class="item">
								<div><label>항목 3 : </label></div>
								<div style="width:85%;float:left;">
									<input class="form-control" type="text" name="item" placeholder="ex)이해도" required="required">								
								</div>
								<div style="width:15%;float:left;">
									<input class="form-control" type="number" name="itemVal" min="1" max="100" placeholder="(%)" required="required">		
								</div>
							</div>
						</div>
						<div class="form-group">		
							<label>코멘트 : </label>
							<input type="hidden" name="item" value="코멘트">
							<textarea class="form-control" name="itemVal" rows="4" cols="20" required="required"></textarea>
						</div>
						<div class="form-group">
							<input class="btn btn-default" type="submit" value="커리큘럼 작성완료">							
						</div>
			    	</form>
			    </div>
			  </div>
			</div>
		</div>
	</div>
   
</section>

