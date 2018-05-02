<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>






<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="resources/js/validityCheck.js"></script>
<script type="text/javascript" src="resources/js/prettydate.js"></script>
<script type="text/javascript">
$(function() {
		
	//알림버튼
	$(".alarmHead").click(function() {
		setTimeout(function() {
	   		$(".alarmOpen").addClass("open");
	    }, 1);
	});
	//pageSubmit
	$(".navMenu").click(function() {
		nav.pageSubmitFn($(this).attr("id"));		
	});
	//네비게이션 하이라이트
	var pageName = "<c:out value='${param.pageName}'/>"
	var customerService = ["notice", "ask", "faq"];
	var apply = ["teacherApply", "businessApply"];
	
	if (customerService.includes(pageName)) {
		$("#customerService").addClass("active");
	} else if (apply.includes(pageName)) {
		$("#apply").addClass("active");
	} else if (pageName == "") {
		$("#home").addClass("active");
	}else {
		$("#"+pageName).addClass("active");
	}
	
});

//페이지 변경
var nav = {
	pageSubmitFn : function(pageName) {
		$("#navFrm").attr("action", pageName+".do");
		$("#pageName").val(pageName);
		$("#navFrm").submit();
	}
};


function logout(){
	 var con = confirm("접속을 종료하시겠습니까?");
	 if(con == true){
		location.href="logout.do";
	 }else{
		 
	}
}



$(function() {

	var scWidth = screen.availWidth;
	var scHeight = screen.availHeight;
	var left = (parseInt(scWidth) - 410) / 2; //창의 왼쪽 간격
	var top = (parseInt(scWidth) -1400) / 2; // 창의 높이를

	$("#idSearch").click(function() {
		//팝업창에 출력될 페이지 URL
		var idpopUrl = "idSearch.do";
		//팝업창 옵션(optoin)
		var idpopOption = window.open(idpopUrl, 'id찾기', 'width=370, height=360,top=' + top + ',left=' + left);
		idpopOption.focus();
	});

	$("#pwSearch").click(function() {
		//팝업창에 출력될 페이지 URL
		var pwpopUrl = "pwSearch.do";
		//팝업창 옵션(optoin)
		var pwpopOption = window.open(pwpopUrl, '비밀번호찾기', 'width=370, height=360,top=' + top + ',left=' + left);
		pwpopOption.focus();
	});

});
</script>


<style type="text/css">

.placestyle {
	margin-bottom: 15px;
}

.modal-backdrop.fade {
	opacity: 0.5;
}

.maionLgBtn {
	width: 350px;
}


#modalct {
	margin-top: 200px;
	
}

#margot{
	margin-bottom: 25px;
}

#loginBtn {
	margin-bottom: 25px;
}

.inputCenter{
	width:350px; 
	margin:0 auto;
}

.logJoWid{
	margin:0 auto;
	width:500px;
}

.iconSpace{
	padding-left:10px;
}

.input-Form{
	padding-left:30px;
}

#modalJoin{
	margin-top:50px;
}

#modalft{
	text-align: center;
}

#joinBtn{
	margin-bottom: 25px;
}

#file{
	font-size:10px; 
	color:lightgray; 
	width:200px;
	float: right;
}

</style>

<form id="navFrm" method="post">
	<input type="hidden" id="pageName" name="pageName">
</form>

<c:if test="${login == null }">
	<!-- 로그인 / 회원가입 폼 -->
	<!--Login  -->
	<form action="memberLogin.do" method="post">
		<div class="modal fade" id="soupLogin" role="dialog">
			<div class="modal-dialog logJoWid">

				<div class="modal-content" id="modalct">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="text-align:center; font-size:30px"><b>SOUP</b></h4>
					</div>
					<div class="modal-body">
						<div class="form-group inputCenter">
							<input type="" required="required" placeholder="Enter email" class="placestyle form-control input-Form" name="memberEmail"> 
							<span class="glyphicon glyphicon-user iconSpace" style="position: absolute; top: 33px;"></span>
						</div>
						<div class="form-group inputCenter">
							<input type="password" required="required" placeholder="Enter password"class="placestyle form-control input-Form" name="memberPw"> 
							<span class="glyphicon glyphicon-lock iconSpace" style="position: absolute; top: 90px;"></span>
						</div>

					</div>
					<div style="text-align:right; margin-right:50px">
						
						<ins><span  id="idSearch" data-dismiss="modal"><a href="#">이메일 찾기 </a></span>/<span id="pwSearch"  data-dismiss="modal" ><a href="#"> 비밀번호 찾기</a></span></ins>
						</div>
						
						<div class="modal-footer" id="modalft">
						<div>
							<button type="submit" name="go"
								class="btn btn-primary btn-block maionLgBtn" style="background:#82ca9c" id="loginBtn">Login
								Now</button>
						</div>
						<div>
							<button type="button" data-dismiss="modal"
								class="btn btn-primary btn-block maionLgBtn" style="background:#82ca9c">Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>



	<!-- Join -->
	<form action="join.do" method="post" enctype="multipart/form-data">
		<div class="modal fade" id="soupJoin" role="dialog">
			<div class="modal-dialog logJoWid">

				<div class="modal-content" id="modalJoin">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="text-align:center; font-size:30px"><b>SOUP</b></h4>
					</div>	
								
					<div class="modal-body">
					
						<div class="form-group inputCenter">
							<input type="email" required="required" placeholder="Enter email" class="placestyle form-control input-Form" name="memberEmail" id="memberEmail"/> 
							<span class="glyphicon glyphicon-user iconSpace" style="position: absolute; top: 33px;"></span>
							<p id="emailCkMsg"></p>
						</div>			
						<div class="form-group inputCenter">
							<input type="password" required="required" placeholder="Enter password"class="placestyle form-control input-Form" name="memberPw" id="memberPw"> 
							<span class="glyphicon glyphicon-lock iconSpace" style="position: absolute; top: 90px;"></span>
							<p id="pwCkMsg"></p>
						</div>
						
						<div class="form-group inputCenter">
							<input type="password" required="required" placeholder="Confirm password"class="placestyle form-control input-Form" name="memberPwCk" id="memberPwCk"> 
							<span class="glyphicon glyphicon-lock iconSpace" style="position: absolute; top: 150px;"></span>
							<p id="pwRe"></p>
						</div>
						
						<div class="form-group inputCenter">
							<input type="text" required="required" placeholder="Enter name"class="placestyle form-control input-Form" name="memberName" id="memberName"> 
							<span class="glyphicon glyphicon-pushpin iconSpace" style="position: absolute; top: 210px;"></span>							
							<p id="nameCk"></p>
						</div>
						
						<div class="form-group inputCenter">
							<input type="text" required="required" placeholder="Enter H.P"class="placestyle form-control input-Form" name="memberTel" id="memberTel" maxlength="11"> 
							<span class="glyphicon glyphicon-phone iconSpace" style="position: absolute; top: 272px;"></span>
							<div id="telCkMsg"></div>
						</div>
						
						<div class="form-group inputCenter">			
								
							<img id=preview src="resources\upload\studyRoom\초기 사진.jpg" style="width: 140px; height: 140px;">
							<input type="file" name="file" id="file" accept="image/*" class="placestyle form-control input-Form" style="margin-right:1px;"> <br/>
						</div>
					
					</div>
						<div class="modal-footer" style="text-align: left; font-size:10px; color:#A4A4A4;">
						
						<div style="margin-left:35px; font-weight:bold">
						※ 이메일은 비밀번호 찾기에 활용되오니  현재 사용중인 이메일을 기재해 주십시오.<br /> 
						※ 비밀번호는 영문,숫자, 특수문자를 포함하여 8~15글자까지 가능합니다.<br/>					
						※이미지를 제외한 모든 항목이 필수 항목입니다.
						</div>
						</div>
						<div class="modal-footer" id="modalft">
						<div>
							<button type="submit" id="joinBtn" disabled="disabled" class="btn btn-primary btn-block maionLgBtn" style="background:#82ca9c">Join Now</button>
						</div>
						<div>
							<button type="button" data-dismiss="modal" class="btn btn-primary btn-block maionLgBtn" style="background:#82ca9c">Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</form>


</c:if>

<nav class="navbar navbar-default">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home.do"><img src="resources/images/soup.png" width="90px"  alt="Logo" /> 
			</a>
			<img src="resources/images/SoupFont.PNG" width="300px"  alt="Font" />
			
			
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav navbar-right">
				<li class="navMenu" id="home"><a href="#">Home</a></li>
				<li class="navMenu" id="search"><a href="#">참여</a></li>
				<li class="navMenu" id="studyRoom"><a href="#">스터디룸</a></li>
                <li>
               		<div class="navigation">
						<ul>
							<li id="customerService" class="dropdown-icon">
								<a href="#" class="title">고객문의</a>
								<ul>
									<li class="navMenu" id="noticeList"><a href="#">공지사항</a></li>
									<li class="navMenu" id="questionInsertForm"><a href="#">1:1 문의</a></li>
									<li class="navMenu" id="faqList"><a href="#">FAQ</a></li>
								</ul>	
							</li>
						</ul>
					</div>
                </li>
				<li>
               		<div class="navigation">
						<ul>
							<li id="apply" class="dropdown-icon">
								<a href="#" class="title">신청</a>
								<ul>
									<li class="navMenu" id="teacherApply"><a href="#">티쳐 신청</a></li>
									<li class="navMenu" id="businessApply"><a href="#">비지니스 신청</a></li>
								</ul>	
							</li>
						</ul>
					</div>
                </li>
                
                <c:choose>
                	<c:when test="${login == null}">
                		<li class="login"><a href="#" id="loginForm" data-toggle="modal" data-target="#soupLogin">Login</a></li>
						<li class="login"><a href="#" id="joinForm" data-toggle="modal" data-target="#soupJoin">Join</a></li>
                	</c:when>
                	<c:otherwise>
		                <li>
		                	<ul class="nav navbar-nav navbar-right">
						      <li class="alarmOpen">
						        <a href="javascript:;" class="alarm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						          <i style="font-size: 25px; color: black;" class="fa fa-bell-o" aria-hidden="true"></i>
						        </a>
						        <ul class="dropdown-menu dropdown-usermenu pull-right">
						        	
						        	<!-- Notification box starts -->
									<div class="slide-box">
							
										<div class="slide-content">
											<ul class="nav nav-tabs">
											  <!-- Tab links -->
											  <li class="alarmHead active"><a href="#tab1" data-toggle="tab"><i class="fa fa-envelope"></i></a></li>
											  <li class="alarmHead"><a href="#tab2" data-toggle="tab"><i class="fa fa-pencil-square-o"></i></a></li>
											  <li class="alarmHead"><a href="#tab3" data-toggle="tab"><i class="fa fa-user"></i></a></li>
											</ul>
							
											<!-- Tab content -->
											<div class="tab-content">
							
												  <div class="tab-pane active alarmMessage" id="tab1">
													<c:forEach items="${alarmMessageList }" var="alarmMessage">
													<div class = "${alarmMessage.alarmChecked eq 'N'? 'messageN':'messageY' }" style="cursor:pointer" onclick="window.open('targetOne.do?messageNo=${alarmMessage.alarmDetailNo}', '_blank', 'width=370,height=320,left=750, top=250');top.window.close();">
														<div class="slide-data">
													  		${alarmMessage.alarmContent }
													  		<span class="date" style="float: right; font-size: 0.8em;" prettydate><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${alarmMessage.alarmDate }"/></span>
														</div>
													</div>
													</c:forEach>
													
													<div class="slide-data-text" style="text-align: center;"><a href="messageTargetList.do">모든 쪽지 보기</a></div>
												  </div>
			
												  <div class="tab-pane alarmSoup" id="tab2">
												  	<c:forEach items="${alarmSoupList }" var="alarmSoup">
														<div class="slide-data">
													  		${alarmSoup.alarmContent }
													  		<span style="float: right; font-size: 0.8em;" prettydate><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${alarmSoup.alarmDate }"/></span>
														</div>
													</c:forEach>
													<div class="slide-data-text" style="text-align: center;">모든 스프 알림 보기</div>
												  </div>
							
												  <div class="tab-pane alarmMember" id="tab3">
													  <c:forEach items="${alarmUserList }" var="alarmUser">
														  <div class = "${alarmUser.alarmChecked eq 'N'? 'messageN':'messageY' }" style="cursor:pointer" onclick="location.href='answer.do?questionNo=${alarmUser.alarmDetailNo}'">
																<div class="slide-data">
															  		${alarmUser.alarmContent }
															  		<span style="float: right; font-size: 0.8em;" prettydate><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${alarmUser.alarmDate }"/></span>
																</div>
															</div>
														</c:forEach>
													<div class="slide-data-text" style="text-align: center;">모든 회원 보기</div>
												  </div>              
		
											</div>
							
										</div>
							      
									</div>
						        	
						        </ul>
						      </li>
						    </ul>
		                </li>
		                
		                <li><a></a></li>
		                
		                <li>
		                 <c:choose>
		                <c:when test="${login.memberGrade =='ADMIN'}">
                		<div class="navFace">
			                	<ul>
							      <li>
							        <a href="javascript:;" style="color: black; font-weight: bold;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							          <c:choose>
							          	<c:when test="${login.memberFace != null}">
								          <img src="${login.memberFace }">${login.memberName }
							          	</c:when>
							          	<c:otherwise>
							          		<img src="resources/upload/memberFace/anonymous.jpg">${login.memberName }
							          	</c:otherwise>
							          </c:choose>
							          
							          <span class=" fa fa-angle-down"></span>
							        </a>
							        <ul class="dropdown-menu dropdown-usermenu pull-right">
							          <li class="navMenu" id="adminMain"><a href="#">관리자 페이지</a></li>
							          <li class="navMenu" id="messageTargetList"><a href="#">쪽지</a></li>
							          <li><hr/></li>
							          <li><a href="#" onclick="logout();"><i class="fa fa-sign-out pull-right"></i>로그아웃</a></li>
							        </ul>
							      </li>
							    </ul>
			                </div> 		
                		</c:when>
		                <c:otherwise>
			                <div class="navFace">
			                	<ul>
							      <li>
							        <a href="javascript:;" style="color: black; font-weight: bold;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							          <c:choose>	
							   
							          	<c:when test="${login.memberFace != null}">
							          		<img src="${login.memberFace }">
							          	</c:when>

							          	<c:otherwise>
							          		<img src="resources/upload/memberFace/anonymous.jpg">
							          	</c:otherwise>
							          </c:choose>
							          		${login.memberName }
									        <span class=" fa fa-angle-down"></span>
							        </a>
							        <ul class="dropdown-menu dropdown-usermenu pull-right">
							          <li class="navMenu" id="pwCheck"><a href="#">내 정보</a></li>
							          <li class="navMenu" id="payment"><a href="#">결제 내역</a></li>
							          <c:if test="${login.memberGrade == 'BUSINESS' }">
							          	<li class="navMenu" id="studyRoomInsertForm"><a href="#">스터디룸 소개글 작성</a></li>
							          </c:if>
							          <li class="navMenu" id="jjimApply"><a href="#">찜/신청한 스프</a></li>
							          <li class="navMenu" id="soup"><a href="#">내 스프</a></li>
							          <li class="navMenu" id="questionUserList"><a href="#">내 문의내역</a></li>
							          <li class="navMenu" id="messageTargetList"><a href="#">쪽지</a></li>
							          <li><hr/></li>
							          <li><a href="#" onclick="logout();"><i class="fa fa-sign-out pull-right"></i>로그아웃</a></li>
							        </ul>
							      </li>
							    </ul>
			                </div>
			                 </c:otherwise>
			             </c:choose>
			            </li>
	            	</c:otherwise>
                </c:choose>
			</ul>

		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>

<script type="text/javascript" src="resources/js/vendor/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        
	    
	        reader.onload = function (e) {
	          $('#preview').attr('src', e.target.result); 	      
	        }        
	        reader.readAsDataURL(input.files[0]);
	    }	 
	}; 	
	   $("#file").change(function(){
		    readURL(this); 
	    
	    });
}) ;
</script>


