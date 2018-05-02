<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>

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
			<a class="navbar-brand" href="#"><img src="resources/images/Souplogo.png" alt="Logo" /></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="#home">Home</a></li>
				<li><a href="#">참여</a></li>
				<li><a href="#">스터디룸</a></li>
                <li>
               		<div class="navigation">
						<ul>
							<li class="dropdown-icon">
								<a href="#" class="title">고객문의</a>
								<ul>
									<li><a href="#">공지사항</a></li>
									<li><a href="#">1:1 문의</a></li>
									<li><a href="#">FAQ</a></li>
								</ul>	
							</li>
						</ul>
					</div>
                </li>
				<li>
               		<div class="navigation">
						<ul>
							<li class="dropdown-icon">
								<a href="#" class="title">신청</a>
								<ul>
									<li><a href="#">티쳐 신청</a></li>
									<li><a href="#">비지니스 신청</a></li>
								</ul>	
							</li>
						</ul>
					</div>
                </li>
                
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
									  <li class="alarmHead active"><a href="#tab1" data-toggle="tab"><i class="fa fa-file-o"></i></a></li>
									  <li class="alarmHead"><a href="#tab2" data-toggle="tab"><i class="fa fa-phone"></i></a></li>
									  <li class="alarmHead"><a href="#tab3" data-toggle="tab"><i class="fa fa-comments"></i></a></li>
									</ul>
					
									<!-- Tab content -->
									<div class="tab-content">
					
										  <div class="tab-pane active" id="tab1">
					
											<div class="slide-data">
											  <div class="slide-data-text">Today Earnings</div>
											  <div class="slide-data-result">$50,000 <i class="fa fa-arrow-up red"></i> </div>
											  <div class="clearfix"></div>
											</div>
					
											<div class="slide-data">
											  <div class="slide-data-text">Yesterday Earnings</div>
											  <div class="slide-data-result">$46,000 <i class="fa fa-arrow-down green"></i> </div>
											  <div class="clearfix"></div>
											</div>     
					
											<div class="slide-data">
											  <div class="slide-data-text">Weeks Earnings</div>
											  <div class="slide-data-result">$43,000 <i class="fa fa-arrow-up red"></i> </div>
											  <div class="clearfix"></div>
											</div> 
					
											<div class="slide-data">
											  <div class="slide-data-text">Months Earnings</div>
											  <div class="slide-data-result">$32,000 <i class="fa fa-arrow-down green"></i> </div>
											  <div class="clearfix"></div>
											</div> 
					
											<div class="slide-data">
											  <div class="slide-data-text">Years Earnings</div>
											  <div class="slide-data-result">$15,000 <i class="fa fa-arrow-up red"></i> </div>
											  <div class="clearfix"></div>
											</div>     
					
											<div class="slide-data">
											  <div class="slide-data-text">모든 쪽지 보기</div>
											  <div class="clearfix"></div>
											</div>                
					
										  </div>
					
										  <div class="tab-pane" id="tab2">
											<h5>Have some content here.</h5>
											<p>Aliquam dui libero, pharetra nec venenatis in, scelerisque quis odio. In hac habitasse platea dictumst. Etiam porta placerat turpis, eget fermentum neque egestas at. Vestibulum ullamcorper, augue a sollicitudin vestibulum, orci purus semper felis, lobortis consequat nisi nunc eu enim. </p>
										  </div>
					
										  <div class="tab-pane" id="tab3">
										<h5>Have some content here.</h5>
										<p>앙기모띠 로렘입섬</p>
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
	                <div class="navFace">
	                	<ul>
					      <li>
					        <a href="javascript:;" style="color: black; font-weight: bold;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					          <img src="resources/images/face.jpg" alt="">John Ber
					          <span class=" fa fa-angle-down"></span>
					        </a>
					        <ul class="dropdown-menu dropdown-usermenu pull-right">
					          <li><a href="#">내 정보</a></li>
					          <li><a href="#">결제 내역</a></li>
					          <li><a href="#">내가 찜한 스프</a></li>
					          <li><a href="#">내 스프</a></li>
					          <li><a href="#">내 문의내역</a></li>
					          <li><a href="#">쪽지</a></li>
					          <li><hr/></li>
					          <li><a href="#"><i class="fa fa-sign-out pull-right"></i>로그아웃</a></li>
					        </ul>
					      </li>
					    </ul>
	                </div>
	            </li>
			</ul>

		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>

<!-- jQuery -->
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(".alarmHead").click(function() {
	setTimeout(function() {
   		$(".alarmOpen").addClass("open");
    }, 1);
});
</script>