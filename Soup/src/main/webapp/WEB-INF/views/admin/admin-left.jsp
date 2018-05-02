<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse">
	    <ul class="nav" id="side-menu">
	        <li>
	            <a href="adminMain.do"><i class="fa fa-desktop fa-fw"></i> 메인</a>
	        </li>
	        <li>
	            <a href="adminMember.do"><i class="fa fa-user fa-fw"></i> 회원</a>
	        </li>
	        <li>
	            <a href="adminSales.do"><i class="fa fa-bar-chart-o fa-fw"></i> 매출</a>
	        </li>
	        <li>
	            <a href="#"><i class="fa fa-dollar fa-fw"></i>결제 / 환불<span class="fa arrow"></span></a>
	            <ul class="nav nav-second-level">
	                <li>
	                    <a href="adminPay.do">결제 내역</a>
	                </li>
	                <li>
	                    <a href="adminRefund.do">환불 내역</a>
	                </li>
	            </ul>
	            <!-- /.nav-second-level -->
	        </li>
	        <li>
	        	<a href="#"><i class="fa fa-briefcase fa-fw"></i> 신청<span class="fa arrow"></span></a>
	            <ul class="nav nav-second-level">
	                <li>
	                    <a href="adminApplyTeacher.do">티쳐 신청 내역</a>
	                </li>
	                <li>
	                    <a href="adminApplyBusiness.do">비지니스 신청 내역</a>
	                </li>
	            </ul>
	            <!-- /.nav-second-level -->
	        </li>
	        <li>
	            <a href="#"><i class="fa fa-headphones fa-fw"></i> 고객문의<span class="fa arrow"></span></a>
	            <ul class="nav nav-second-level">
	                <li>
	                    <a href="adminNotice.do">공지사항</a>
	                </li>
	                <li>
	                    <a href="questionAdminList.do">1:1 문의</a>
	                </li>
	                <li>
	                    <a href="adminFaq.do">FAQ</a>
	                </li>
	            </ul>
	            <!-- /.nav-second-level -->
	        </li>
	    </ul>
	</div>
	<!-- /.sidebar-collapse -->
</div>