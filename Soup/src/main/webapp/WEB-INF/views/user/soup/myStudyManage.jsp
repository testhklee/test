<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/studyManage.css">
<script type="text/javascript">

	function memostart() {
		
		$.ajax({
			type:"post",
			url:"startmemo.do",
			data:"soup_no=${soupNo }",
			success:function(msg) {
				if(msg == "성공") {
					$(".memo textarea").attr("readonly", false);
					$(".memo_start_btn").css("display", "none");
					$(".memo").append("<div class='memo_update_btn'>" + 
					"<button class='btn btn-default' onclick='memoupdate()'>저장</button></div>");
				}else {
					alert("메모 활성화에 실패하였습니다.");
				}
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
		
		$(".member_apply .standby").hover(function() {
			$(this).find(".apply_message").css("display", "block");
		}, function() {
			$(this).find(".apply_message").css("display", "none");
		});
		
		$(".memberFace").parent().hover(function() {
			$(this).find(".message_throw").css("display", "block");
			
			$(this).parent().find(".message_throw").on("click", function() {
				
				$(".curi_modal .msg_hidden").find("input[name=memberName]").val($(this).find("input[name=message_memberName]").val());
				$(".curi_modal .msg_hidden").find("input:eq(1)").val($(this).find("input[name=message_memberName]").val() + "(" + $(this).find("input[name=message_memberEmail]").val() + ")");
				$(".curi_modal .msg_hidden").find("input[name=targetNo]").val($(this).find("input[name=message_memberNo]").val());
				
			});
		}, function() {
			$(this).parent().find(".message_throw").css("display", "none");
		});
		
		$(".standby .accept").on("click", function() {
			
			if(${TotalSoupMember.currentNo } == ${TotalSoupMember.soupMemberMax }) {
				alert("스터디 최대 정원 초과입니다.");
			}else {
				var memberNo = $(this).parent().parent().find(".memberNo input[name=memberNo]").val();
				
				$.ajax({
					type:"post",
					url:"soupApplyAccept.do",
					data:"soupNo=${soupNo }&memberNo=" + memberNo,
					success:function(msg) {
						location.reload();
					},error:function(statusCode) {
						alert("error : " + statusCode.status);
					}
				});
			}
			
		});
		
		$(".standby .reject").on("click", function() {
			
			var memberNo = $(this).parent().parent().find(".memberNo input[name=memberNo]").val();
			
			$.ajax({
				type:"post",
				url:"updateSoupApplyReject.do",
				data:"soupNo=${soupNo }&memberNo=" + memberNo,
				success:function(msg) {
					location.reload();
				},error:function(statusCode) {
					alert("error : " + statusCode.status);
				}
			});
			
		});
		
		$(".content .mystudy_inner .drop_out").on("click", function() {
			
			$.ajax({
				type:"post",
				url:"updateProjectMemberDropOut.do",
				data:"soupNo=${soupNo }&memberNo=" + ${login.memberNo},
				success:function(msg) {
					location.href="soup.do";
				},error:function(statusCode) {
					alert("error : " + statusCode.status);
				}
			});
			
		});
		
		$(".content .mystudy_inner .dropAll").on("click", function() {
			
			$.ajax({
				type:"post",
				url:"updateSoupStatusToDrop.do",
				data:"soupNo=${soupNo }",
				success:function(msg) {
					location.href="soup.do";
				},error:function(statusCode) {
					alert("error : " + statusCode.status);
				}
			});
			
		});
		
		$(".curi_modal .msg_btn .msg_btn_submit").on("click", function() {
			
			var memberName = $(".curi_modal .msg_hidden").find("input[name=memberName]").val();
			var targetNo = $(".curi_modal .msg_hidden").find("input[name=targetNo]").val();
			var content = $(".curi_modal").find("textarea[name=content]").val();
			
			if(content == "") {
				alert("내용을 입력해주세요");
			}else {
				$.ajax({
					type:"post",
					url:"msgInsert.do",
					data:"memberName=" + memberName + "&targetNo=" + targetNo + "&content=" + content,
					success:function(msg) {
						alert("쪽지가 발송되었습니다");
						location.reload();
					},error:function(statusCode) {
						alert("error : " + statusCode.status);
					}
				});
			}
			
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
			<h4><strong>스터디 명</strong> : <small>${studyInfo.soupTitle }</small></h4>
			<div class="mystudy_inner">
				<h4><strong>스터디 설명 </strong>: </h4>
				<div class="mystudy_account">${studyInfo.soupContent }</div>
				<h5><strong>스터디 조원</strong> : <small>${TotalSoupMember.currentNo }/${TotalSoupMember.soupMemberMax } 명</small></h5>
				<div class="studyMember clearfix">
					<c:choose>
						<c:when test="${empty studyMember }">
						
						</c:when>
						<c:otherwise>
							<c:forEach items="${studyMember }" var="studyMember">
								<div class="member_each">
									<c:if test="${studyMember.memberNo!=login.memberNo }">
										<div class="message_throw">										
										   	<input type="hidden" name="message_memberName" value="${studyMember.memberName }">
										   	<input type="hidden" name="message_memberEmail" value="${studyMember.memberEmail }">
										   	<input type="hidden" name="message_memberNo" value="${studyMember.memberNo }">										
											<p data-toggle="modal" data-target=".bs-example-modal-sm">쪽지보내기</p>										
										</div>
									</c:if>
									<div class="memberFace"><img alt="" src="${studyMember.memberFace==null?'resources/upload/memberFace/anonymous.jpg':studyMember.memberFace }"></div>
									<div class="memberName"><p>${studyMember.memberName==login.memberName?"나":studyMember.memberName }</p></div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<c:if test="${myPosition=='L' }">
					<div class="member_apply clearfix">
						<h5><strong>스터디 신청 대기 인원</strong> : </h5>
						<c:choose>
							<c:when test="${empty selectSoupApply }">
								<p>스터디 신청 대기 인원이 존재하지 않습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${selectSoupApply }" var="selectSoupApply">
									<div class="standby">
										<div class="apply_message"><p>${selectSoupApply.soupApplyIntro}</p></div>
										<div class="message_throw">										
										   	<input type="hidden" name="message_memberName" value="${selectSoupApply.memberName }">
										   	<input type="hidden" name="message_memberEmail" value="${selectSoupApply.memberEmail }">
										   	<input type="hidden" name="message_memberNo" value="${selectSoupApply.memberNo }">										
											<p data-toggle="modal" data-target=".bs-example-modal-sm">쪽지보내기</p>										
										</div>
										<div class="memberFace"><img alt="" src="${selectSoupApply.memberFace==null?'resources/upload/memberFace/anonymous.jpg':selectSoupApply.memberFace }"></div>
										<div class="memberName"><p>${selectSoupApply.memberName}</p></div>
										<div class="memberNo"><input type="hidden" name="memberNo" value="${selectSoupApply.memberNo }"></div>
										<div><button class="btn btn-info accept" type="button">승인</button></div>
										<div><button class="btn btn-danger reject" type="button">거절</button></div>								
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</c:if>
				<c:choose>
					<c:when test="${myPosition=='L' }">						
						<button class="btn btn-default dropAll" type="button">스터디 폐쇄</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-default drop_out" type="button">스터디 나가기</button>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="modal fade bs-example-modal-sm curi_modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-sm curi_modal_inner">
			    <div class="modal-content curi_modal_content">			    	
		    		<div class="form-group msg_hidden">
					   	<label>받는이</label>
					   	<input type="hidden" name="memberName" value="">
					   	<input type="text" class="form-control" readonly="readonly" value="">
					   	<input type="hidden" class="targetNo" name="targetNo" value="">
					 </div>
					 <div class="form-group">
					   	<label>내용</label>
					   	<textarea name="content" class="form-control" rows="8" required="required" style="resize: none;"></textarea>
					 </div>
					 <div style="text-align: center;" class="msg_btn">
						 <button class="btn btn-success btn-sm msg_btn_submit">보내기</button>
						 <button type="button" class="btn btn-success btn-sm cancelBtn" class="close" data-dismiss="modal" aria-label="Close">취소</button>
					 </div>	    	
			    </div>
			  </div>
			</div>
		</div>
	</div>   
</section>
