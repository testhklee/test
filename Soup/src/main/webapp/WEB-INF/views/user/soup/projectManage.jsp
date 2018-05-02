<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Custom CSS -->
<link rel="stylesheet" href="resources/css/projectManage.css?ver=4">
<link rel="stylesheet" href="resources/css/fullcalendar.css">
<link rel="stylesheet" href="resources/css/soup.css">
<script src="resources/js/jquery-ui.js?ver=3"></script>
<script type="text/javascript" src="resources/js/prettydate.js"></script>
<script type="text/javascript" src="resources/js/date.js"></script>

<div id="frmnotice" class="form-group" style="display: none;">
	<input type="text" class="form-control" name="boardTitle" placeholder="공지할 것을 적어주세요">
  	<textarea class="form-control" name="boardContent" placeholder="간단한 설명을 적어주세요"></textarea>
  	<button class="btn btn-success insertBoardBtn">등록</button> <button class="btn btn-danger addBoardCancelBtn">취소</button>
</div>

<div id="frmresource" class="form-group" style="display: none;">
	<input type="text" class="form-control" name="boardTitle" placeholder="참고할 자료를 적어주세요">
 	<textarea class="form-control" name="boardContent" placeholder="간단한 설명을 적어주세요"></textarea>
 	<button class="btn btn-success insertBoardBtn">등록</button> <button class="btn btn-danger addBoardCancelBtn">취소</button>
</div>

<div id="frmtodo" class="form-group" style="display: none;">
  	<input type="text" class="form-control" name="boardTitle" placeholder="어떤 것을 해야 되나요?">
  	<textarea class="form-control" name="boardContent" placeholder="간단한 설명을 적어주세요"></textarea>
  	<button class="btn btn-success insertBoardBtn">등록</button> <button class="btn btn-danger addBoardCancelBtn">취소</button>
</div>

<div class="projectManage">
    <div class="column projectHead" style="margin-left: 50px;">공지사항 <span id="addnotice" class="addBoard">+</span></div>
    <div class="column projectHead">참고/공유 <span id="addresource" class="addBoard">+</span></div>
    <div class="column projectHead">할 일 <span id="addtodo" class="addBoard">+</span></div>
    <div class="column projectHead">진행 중</div>
    <div class="column projectHead">완료</div>

    <br style="clear: both;" />

    <div class="column notice" style="margin-left: 40px;">
		<c:forEach items="${projectBoardNoticeList }" var="notice">
	        <div class="widget wlightblue">
	        	<input class="bNo board${notice.projectBoardNo }" type="hidden" name="boardNo" value="${notice.projectBoardNo }">
	            <div class="widget-head portlet-header">
	                <div class="pull-left">${notice.projectBoardTitle }</div>
	                <div class="widget-icons pull-right">
	                    <a href="#" class="wminimize">
	                    	<i class="fa fa-chevron-down"></i>
	                    </a> 
	                </div>
	                <div class="status">
		                <br>
		                <c:if test="${notice.projectBoardStartDate != null }">
			                <i class="fa fa-calendar"></i>
		                </c:if>
		                <c:if test="${notice.projectBoardChecklistName != null }">
			                <i class="fa fa-check-square-o"></i>  
		                </c:if>
		                <c:if test="${notice.projectBoardFixed == 'Y' }">
			                <span class="glyphicon glyphicon-pushpin"></span>
		                </c:if>
	                </div>
	                <div class="clearfix"></div>
	            </div>             
	            <div class="widget-content" style="display: none;">
	                <div class="padd">
	            		${notice.projectBoardContent }
	                </div>
	                <div class="boardToolBox">
		                <i class="fa fa-search-plus" data-toggle="modal" data-target="#detailModal"></i> <i class="fa fa-times deleteBoard"></i>
	                </div>
	            </div>
	        </div>
		</c:forEach>
    </div>

    <div class="column resource">
		<c:forEach items="${projectBoardResourceList }" var="resource">
	        <div class="widget wblue">
	        	<input class="bNo board${resource.projectBoardNo }" type="hidden" name="boardNo" value="${resource.projectBoardNo }">
	            <div class="widget-head portlet-header">
	                <div class="pull-left">${resource.projectBoardTitle }</div>
	                <div class="widget-icons pull-right">
	                    <a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a> 
	                </div>
	                <div class="status">
		                <br>
		                <c:if test="${resource.projectBoardStartDate != null }">
			                <i class="fa fa-calendar"></i>
		                </c:if>
		                <c:if test="${resource.projectBoardChecklistName != null }">
			                <i class="fa fa-check-square-o"></i>  
		                </c:if>
		                <c:if test="${resource.projectBoardFixed == 'Y' }">
			                <span class="glyphicon glyphicon-pushpin"></span>
		                </c:if>
	                </div>
	                <div class="clearfix"></div>
	            </div>             
	            <div class="widget-content" style="display: none;">
	                <div class="padd">
	            		${resource.projectBoardContent }
	                </div>
	                <div class="boardToolBox">
		                <i class="fa fa-search-plus" data-toggle="modal" data-target="#detailModal"></i> <i class="fa fa-times deleteBoard"></i>
	                </div>
	            </div>
	        </div>
		</c:forEach>
    </div>

    <div id="worange" class="column movableBoard todo">
		<c:forEach items="${projectBoardTodoList }" var="todo">
	        <div class="widget worange">
				<input class="order" type="hidden" name="order" value="${todo.projectBoardOrder }">
				<input class="bNo board${todo.projectBoardNo }" type="hidden" name="boardNo" value="${todo.projectBoardNo }">
	            <div class="widget-head portlet-header">
	                <div class="pull-left">${todo.projectBoardTitle }</div>
	                <div class="widget-icons pull-right">
	                    <a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a> 
	                </div>
	                <div class="status">
		                <br>
		                <c:if test="${todo.projectBoardStartDate != null }">
			                <i class="fa fa-calendar"></i>
		                </c:if>
		                <c:if test="${todo.projectBoardChecklistName != null }">
			                <i class="fa fa-check-square-o"></i>  
		                </c:if>
		                <c:if test="${todo.projectBoardFixed == 'Y' }">
			                <span class="glyphicon glyphicon-pushpin"></span>
		                </c:if>
	                </div>
	                <div class="clearfix"></div>
	            </div>             
	            <div class="widget-content" style="display: none;">
	                <div class="padd">
	            		${todo.projectBoardContent }
	                </div>
	                <div class="boardToolBox">
		                <i class="fa fa-search-plus" data-toggle="modal" data-target="#detailModal"></i> <i class="fa fa-times deleteBoard"></i>
	                </div>
	            </div>
	        </div>
		</c:forEach>
    </div>

    <div id="wviolet" class="column movableBoard inProgress">
		<c:forEach items="${projectBoardProgressList }" var="progress">
	        <div class="widget wviolet">
				<input class="order" type="hidden" name="order" value="${progress.projectBoardOrder }">
				<input class="bNo board${progress.projectBoardNo }" type="hidden" name="boardNo" value="${progress.projectBoardNo }">
	            <div class="widget-head portlet-header">
	                <div class="pull-left">${progress.projectBoardTitle }</div>
	                <div class="widget-icons pull-right">
	                    <a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a> 
	                </div>
	                <div class="status">
		                <br>
		                <c:if test="${progress.projectBoardStartDate != null }">
			                <i class="fa fa-calendar"></i>
		                </c:if>
		                <c:if test="${progress.projectBoardChecklistName != null }">
			                <i class="fa fa-check-square-o"></i>  
		                </c:if>
		                <c:if test="${progress.projectBoardFixed == 'Y' }">
			                <span class="glyphicon glyphicon-pushpin"></span>
		                </c:if>
	                </div>
	                <div class="clearfix"></div>
	            </div>             
	            <div class="widget-content" style="display: none;">
	                <div class="padd">
	            		${progress.projectBoardContent }
	                </div>
	                <div class="boardToolBox">
		                <i class="fa fa-search-plus" data-toggle="modal" data-target="#detailModal"></i> <i class="fa fa-times deleteBoard"></i>
	                </div>
	            </div>
	        </div>
		</c:forEach>
    </div>

    <div id="wred" class="column movableBoard done">
		<c:forEach items="${projectBoardDoneList }" var="done">
	        <div class="widget wred">
				<input class="order" type="hidden" name="order" value="${done.projectBoardOrder }">
				<input class="bNo board${done.projectBoardNo }" type="hidden" name="boardNo" value="${done.projectBoardNo }">
	            <div class="widget-head portlet-header">
	                <div class="pull-left">${done.projectBoardTitle }</div>
	                <div class="widget-icons pull-right">
	                    <a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a> 
	                </div>
	                <div class="status">
		                <br>
		                <c:if test="${done.projectBoardStartDate != null }">
			                <i class="fa fa-calendar"></i>
		                </c:if>
		                <c:if test="${done.projectBoardChecklistName != null }">
			                <i class="fa fa-check-square-o"></i>  
		                </c:if>
		                <c:if test="${done.projectBoardFixed == 'Y' }">
			                <span class="glyphicon glyphicon-pushpin"></span>
		                </c:if>
	                </div>
	                <div class="clearfix"></div>
	            </div>             
	            <div class="widget-content" style="display: none;">
	                <div class="padd">
	            		${done.projectBoardContent }
	                </div>
	                <div class="boardToolBox">
		                <i class="fa fa-search-plus" data-toggle="modal" data-target="#detailModal"></i> <i class="fa fa-times deleteBoard"></i>
	                </div>
	            </div>
	        </div>
		</c:forEach>
    </div>

    <div class="column" style="width: 25%; margin-left: 30px; margin-top: 30px;">
        <div id="calendar" ></div>
    </div>

</div>
<div class="drawer drawer--right">
	<header role="banner">
		<button type="button" class="drawer-toggle drawer-hamburger">
			<span class="drawer-hamburger-icon"></span>
		</button>

		<nav class="drawer-nav" role="navigation">
			<ul class="drawer-menu">
				<li><a class="drawer-brand">${projectInfo.soupTitle }</a></li>
				<li>
					<a class="drawer-menu-item">팀원 목록</a>
					<div class="projectMemberList">
						<c:forEach items="${memberList }" var="member">
							<div class="imgCircleBack projectMembers" data-toggle="modal" data-target="#memberModal">
								<input type="hidden" class="memberName" value="${member.memberName }">
								<input type="hidden" class="memberNo" value="${member.memberNo }">
								<c:choose>
									<c:when test="${member.memberFace == null }">
										<img src="resources/upload/memberFace/anonymous.jpg" title="${member.memberName }">
									</c:when>
									<c:otherwise>
										<img src="${member.memberFace }" title="${member.memberName }">
									</c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</li>
				<c:if test="${projectInfo.leaderNo == login.memberNo && projectInfo.soupStatus == 'RECRUIT'}">
					<li>
						<a class="drawer-menu-item">신청 목록</a>
						<div class="projectApplyList">
							<c:choose>
								<c:when test="${empty applyList }">
									<h4>신청 인원이 없습니다</h4>
								</c:when>
								<c:otherwise>
									<c:forEach items="${applyList }" var="apply">
										<div class="imgCircleBack applyMembers" data-toggle="modal" data-target="#applyModal">
											<input type="hidden" class="applyName" value="${apply.memberName }">
											<input type="hidden" class="applyNo" value="${apply.memberNo }">
											<input type="hidden" class="applyContent" value="${apply.soupApplyIntro }">
											<c:choose>
												<c:when test="${apply.memberFace == null }">
													<img src="resources/upload/memberFace/anonymous.jpg" title="${apply.memberName }">
												</c:when>
												<c:otherwise>
													<img src="${apply.memberFace }" title="${apply.memberName }">
												</c:otherwise>
											</c:choose>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
				</c:if>
				<hr style="width: 90%;" />
				<li class="drawer-dropdown"><a class="drawer-menu-item"
					data-target="#" href="#" data-toggle="dropdown" role="button"
					aria-expanded="false"> 프로젝트 메뉴 <span class="drawer-caret"></span>
				</a>
					<ul class="drawer-dropdown-menu">
						<li>
							<a class="drawer-dropdown-menu-item teamChatBtn" href="#">팀채팅</a>
							<form class="teamChatFrm" action="teamChat.do" method="post">
								<input type="hidden" name="soupNo" value="<c:out value="${param.soupNo }"/>">
							</form>
						</li>
						<c:choose>
							<c:when test="${projectInfo.leaderNo == login.memberNo }">
								<li id="projectEndBtn"><a class="drawer-dropdown-menu-item" href="#">프로젝트 완료</a></li>
								<li id="projectDropBtn"><a class="drawer-dropdown-menu-item" href="#">프로젝트 폐지</a></li>
								<c:if test="${projectInfo.soupStatus == 'RECRUIT'}">
									<li id="projectDoneBtn"><a class="drawer-dropdown-menu-item" href="#">프로젝트 모집 종료</a></li>
								</c:if>
							</c:when>
							<c:otherwise>
								<li id="projectRunBtn"><a class="drawer-dropdown-menu-item" href="#">프로젝트 나가기</a></li>
							</c:otherwise>
						</c:choose>
					</ul></li>
				<hr style="width: 90%;" />
				<li>
					<a class="drawer-menu-item">활동 내역</a>
					<div style="height: 20%; overflow-y: auto; ">
						<ul class="activityList">
							<c:forEach items="${activityList }" var="activity">
								<li class="activity">
									<div class="activityImgCircleBack" style="float: left;">
										<c:choose>
											<c:when test="${activity.memberFace == null }">
												<img src="resources/upload/memberFace/anonymous.jpg">
											</c:when>
											<c:otherwise>
												<img src="${activity.memberFace }" title="${activity.memberName}">
											</c:otherwise>
										</c:choose>
									</div>
									<span class="activityContent">
										<span class="memberName">${activity.memberName }</span> : ${activity.projectActivityContent }
										<span prettydate class="date">
											<fmt:formatDate value="${activity.projectActivityDate }" pattern="yyyy MM dd HH:mm:ss"/>
										</span>
									</span>
								</li>
							</c:forEach>
						</ul>
					</div>
				</li>
			</ul>
		</nav>
	</header>
</div> 

<!-- modal : 게시물 상세페이지 -->
<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<input type="hidden" class="projectBoardNo">
			<div class="modal-header">
				<button type="button" class="close closeDetailModal" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title title" id="myModalLabel"></h4>
				<i style="position: absolute; left:90%; top:19px;" class="fa fa-edit close"></i>
				<input type="text" class="updateTitle" style="font-size: 25px; display: none;">
			</div>
			<div class="modal-body">
				<textarea class="form-control content" rows="4" readonly="readonly" style="resize: none; cursor: auto;"></textarea>
				<textarea class="form-control updateContent" rows="4" required="required" style="resize: none; display: none;"></textarea>
				<br>
				<div>
					<span class="date"></span>
					<span class="updateDate" style="display: none; text-align: center;">
						일정 : 
						<input type="date" class="updateStartDate"> ~ 
						<input type="date" class="updateEndDate">
						<br/>
						<span style="font-size: 10px;">시작 날짜, 끝 날짜 모두 설정해야 일정이 적용됩니다.</span>
					</span> 
				</div>
			</div>
			<button type="button" class="btn btn-default btn-sm projectBoardUpdateBtn" style="margin-left: 40%; display: none; margin-bottom: 20px;">수정</button>
		</div>
	</div>
</div>

<!-- modal : 회원얼굴 클릭시 -->
<div class="modal fade" id="memberModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content" style="text-align: center;">
    	<input type="hidden" class="memberNo">
    	<input type="hidden" class="memberName">
    	<input type="hidden" class="memberFace">
    	<h4></h4>
    	<a class="messageBtn" onclick="window.open(this.href, '_blank', 'width=370,height=320,left=750, top=250'); return false;"><button type="button" class="btn btn-default btn-sm">쪽지 보내기</button></a>
		<c:if test="${projectInfo.leaderNo == login.memberNo }">
			<button type="button" class="btn btn-default btn-sm projectMemberKickBtn">팀원 추방시키기</button>
			<button type="button" class="btn btn-default btn-sm projectLeaderPassBtn">리더 권한 넘기기</button>
		</c:if>
    </div>
  </div>
</div>

<c:if test="${projectInfo.leaderNo == login.memberNo }">
	<div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
  			<div class="modal-content" style="text-align: center;">
  				<input type="hidden" class="memberNo">
  				<input type="hidden" class="memberName">
  				<input type="hidden" class="memberFace">
	  			<h4></h4>
				<h6></h6>				
				<button type="button" class="btn btn-default btn-sm acceptBtn">승낙</button>
				<button type="button" class="btn btn-default btn-sm rejectBtn">거부</button>
				<a class="messageBtn" onclick="window.open(this.href, '_blank', 'width=370,height=320,left=750, top=250'); return false;"><button type="button" class="btn btn-default btn-sm">쪽지 보내기</button></a>
	    	</div>
		</div>
	</div>	
</c:if>

<script src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.2.0/iscroll.js"></script>
<script src="resources/js/drawer.min.js" charset="utf-8"></script>
<script src="resources/js/sockjs.js" type="text/javascript"></script>
<!-- Full Google Calendar - Calendar -->
<script src="resources/js/moment.min.js"></script>
<script src="resources/js/fullcalendar.js"></script> 
<script src="resources/js/ko.js" type="text/javascript"></script>
<!-- Custom JS -->
<script src="resources/js/projectManage.js?ver=91"></script>
<script type="text/javascript">
var soupNo1 = "<c:out value="${param.soupNo }"/>";
var myNo1 = "<c:out value="${login.memberNo }"/>";
var myName = "<c:out value="${login.memberName }"/>";
var myFace = "<c:out value="${login.memberFace }"/>";
$(function() {
	/* Calendar set */
	$('#calendar').fullCalendar({
	    header: {
	        left: 'prev',
	        center: 'title',
	        right: 'month,agendaWeek,agendaDay,next'
	    },
	    lang : "ko",
	    contentHeight: 500,
	    editable: false,
	    displayEventTime: false
	});
	
});
</script>
