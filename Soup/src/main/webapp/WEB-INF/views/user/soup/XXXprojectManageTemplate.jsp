<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<!-- Custom CSS -->
<link href="resources/css/projectManage.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/fullcalendar.css">
<script src="resources/js/jquery-ui.js"></script>

<div class="projectManage">
    <div class="column projectHead" style="margin-left: 50px;">공지사항 <span class="addBoard">+</span></div>
    <div class="column projectHead">참고/공유 <span class="addBoard">+</span></div>
    <div class="column projectHead">할 일 <span class="addBoard">+</span></div>
    <div class="column projectHead">진행 중 <span class="addBoard">+</span></div>
    <div class="column projectHead">완료 <span class="addBoard">+</span></div>

    <br style="clear: both;" />

    <div class="column" style="margin-left: 40px;">

        <div class="widget wlightblue">
            <div class="widget-head portlet-header">
                <div class="pull-left">프로젝트 공지!</div>
                <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a> 
                </div>
                <div class="clearfix"></div>
            </div>             
            <div class="widget-content" style="display: none;">
                <div class="padd">
            Lorem ipsum dolor sit amet, consectetur adipisieserunt mollit anim id est laborum.
                </div>
            </div>
        </div>
    </div>

    <div class="column">

        <div class="widget wblue">
            <div class="widget-head portlet-header">
                <div class="pull-left">얍!</div>
                <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a> 
                </div>
                <div class="clearfix"></div>
            </div>             
            <div class="widget-content" style="display: none;">
                <div class="padd">
                    Lorem ipsum dolor sit amet, consectetur adipisieserunt mollit anim id est laborum.
                </div>
            </div>
        </div>

        <div class="widget wblue">
            <div class="widget-head portlet-header">
                <div class="pull-left">얍!</div>
                <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a> 
                </div>
                <div class="clearfix"></div>
            </div>             
            <div class="widget-content" style="display: none;">
                <div class="padd">
                    Lorem ipsum dolor sit amet, consectetur adipisieserunt mollit anim id est laborum.
                </div>
            </div>
        </div>

        <div class="widget wblue">
            <div class="widget-head portlet-header">
                <div class="pull-left">얍!</div>
                <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a> 
                </div>
                <div class="clearfix"></div>
            </div>             
            <div class="widget-content" style="display: none;">
                <div class="padd">
                    Lorem ipsum dolor sit amet, consectetur adipisieserunt mollit anim id est laborum.
                </div>
            </div>
        </div>
    </div>

    <div id="worange" class="column movableBoard todo">

		<div class="widget worange">
			<input class="order" type="text" name="order" value="1">
			<input class="bNo" type="text" name="borderNo" value="bNo:1">
			<div class="widget-head portlet-header">
				<div class="pull-left">1번 게시물</div>
				<div class="widget-icons pull-right">
					<a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a> 
				</div>
				<div class="clearfix"></div>
			</div>             
			<div class="widget-content" style="display: none;">
				<div class="padd">
					Lorem ipsum dolor sit amet, consectetur adipisieserunt mollit anim id est laborum.
				</div>
			</div>
		</div>

    </div>

    <div id="wviolet" class="column movableBoard inProgress">

		<div class="widget wviolet">
			<input class="order" type="text" name="order" value="1">
			<input class="bNo" type="text" name="borderNo" value="bNo:2">
			<div class="widget-head portlet-header">
				<div class="pull-left">2번 게시물</div>
				<div class="widget-icons pull-right">
					<a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a> 
				</div>
				<div class="clearfix"></div>
			</div>             
			<div class="widget-content" style="display: none;">
				<div class="padd">
					Lorem ipsum dolor sit amet, consectetur adipisieserunt mollit anim id est laborum.
				</div>
			</div>
		</div>
		
		<div class="widget wviolet">
			<input class="order" type="text" name="order" value="2">
			<input class="bNo" type="text" name="borderNo" value="bNo:3">
			<div class="widget-head portlet-header">
				<div class="pull-left">3번 게시물</div>
				<div class="widget-icons pull-right">
					<a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a> 
				</div>
				<div class="clearfix"></div>
			</div>             
			<div class="widget-content" style="display: none;">
				<div class="padd">
					Lorem ipsum dolor sit amet, consectetur adipisieserunt mollit anim id est laborum.
				</div>
			</div>
		</div>
    </div>

    <div id="wred" class="column movableBoard done">

		<div class="widget wred">
			<input class="order" type="text" name="order" value="1">
			<input class="bNo" type="text" name="borderNo" value="bNo:4">
			<div class="widget-head portlet-header">
				<div class="pull-left">4번 게시물</div>
				<div class="widget-icons pull-right">
					<a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a> 
				</div>
				<div class="clearfix"></div>
			</div>             
			<div class="widget-content" style="display: none;">
				<div class="padd">
					Lorem ipsum dolor sit amet, consectetur adipisieserunt mollit anim id est laborum.
				</div>
			</div>
		</div>
		<div class="widget wred">
			<input class="order" type="text" name="order" value="2">
			<input class="bNo" type="text" name="borderNo" value="bNo:5">
			<div class="widget-head portlet-header">
				<div class="pull-left">5번 게시물</div>
				<div class="widget-icons pull-right">
					<a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a> 
				</div>
				<div class="clearfix"></div>
			</div>             
			<div class="widget-content" style="display: none;">
				<div class="padd">
					Lorem ipsum dolor sit amet, consectetur adipisieserunt mollit anim id est laborum.
				</div>
			</div>
		</div>
		<div class="widget wred">
			<input class="order" type="text" name="order" value="3">
			<input class="bNo" type="text" name="borderNo" value="bNo:6">
			<div class="widget-head portlet-header">
				<div class="pull-left">6번 게시물</div>
				<div class="widget-icons pull-right">
					<a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a> 
				</div>
				<div class="clearfix"></div>
			</div>             
			<div class="widget-content" style="display: none;">
				<div class="padd">
					Lorem ipsum dolor sit amet, consectetur adipisieserunt mollit anim id est laborum.
				</div>
			</div>
		</div>
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
				<li><a class="drawer-brand">하즈아</a></li>
				<li><a class="drawer-menu-item">팀원 목록</a></li>
				<li><a class="drawer-menu-item">신청 목록</a></li>
				<hr style="width: 90%;" />
				<li class="drawer-dropdown"><a class="drawer-menu-item"
					data-target="#" href="#" data-toggle="dropdown" role="button"
					aria-expanded="false"> 프로젝트 메뉴 <span class="drawer-caret"></span>
				</a>
					<ul class="drawer-dropdown-menu">
						<li><a class="drawer-dropdown-menu-item"
							href="./navbar-top.html">Top</a></li>
						<li><a class="drawer-dropdown-menu-item"
							href="./navbar-left.html">Left</a></li>
						<li><a class="drawer-dropdown-menu-item"
							href="./navbar-right.html">Right</a></li>
					</ul></li>
				<hr style="width: 90%;" />
				<li><a class="drawer-menu-item">활동 내역</a></li>
			</ul>
		</nav>
	</header>
</div> 


<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.2.0/iscroll.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="resources/js/drawer.min.js" charset="utf-8"></script>
<!-- Full Google Calendar - Calendar -->
<script src="resources/js/moment.min.js"></script>
<script src="resources/js/fullcalendar.min.js"></script> 
<script src="resources/js/ko.js" type="text/javascript">
<!--

//-->
</script>
<!-- Custom JS -->
<script src="resources/js/projectManage.js"></script>
