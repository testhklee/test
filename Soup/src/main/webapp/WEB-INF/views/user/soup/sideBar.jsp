<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<div class="drawer drawer--right">
	<header role="banner">
		<button type="button" class="drawer-toggle drawer-hamburger">
			<span class="drawer-hamburger-icon"></span>
		</button>
		
		<nav class="drawer-nav" role="navigation">
			<ul class="drawer-menu">
		    	<li><a class="drawer-brand">Drawer</a></li>
			    <li><a class="drawer-menu-item" href="#">Top</a></li>
			    <li><a class="drawer-menu-item" href="#">Left</a></li>
			    <li><a class="drawer-menu-item" href="#">Right</a></li>
			    <li class="drawer-dropdown">
		      		<a class="drawer-menu-item" data-target="#" href="#" data-toggle="dropdown" role="button" aria-expanded="false">
		        		Navbar <span class="drawer-caret"></span>
		      		</a>
			      	<ul class="drawer-dropdown-menu">
				        <li><a class="drawer-dropdown-menu-item" href="./navbar-top.html">Top</a></li>
				        <li><a class="drawer-dropdown-menu-item" href="./navbar-left.html">Left</a></li>
				        <li><a class="drawer-dropdown-menu-item" href="./navbar-right.html">Right</a></li>
			      	</ul>
			    </li>
			    <li class="drawer-dropdown">
			      	<a class="drawer-menu-item" data-target="#" href="#" data-toggle="dropdown" role="button" aria-expanded="false">
			        	Fixed navbar <span class="drawer-caret"></span>
			      	</a>
			      	<ul class="drawer-dropdown-menu">
				        <li><a class="drawer-dropdown-menu-item" href="./fixed-navbar-top.html">Top</a></li>
				        <li><a class="drawer-dropdown-menu-item" href="./fixed-navbar-left.html">Left</a></li>
				        <li><a class="drawer-dropdown-menu-item" href="./fixed-navbar-right.html">Right</a></li>
			      	</ul>
			    </li>
		    	<li class="drawer-dropdown">
			    	<a class="drawer-menu-item" href="#" data-toggle="dropdown" role="button" aria-expanded="false">
			        	Sidebar <span class="drawer-caret"></span>
			      	</a>
			      	<ul class="drawer-dropdown-menu">
				        <li><a class="drawer-dropdown-menu-item" href="./sidebar-left.html">Left</a></li>
				        <li><a class="drawer-dropdown-menu-item" href="./sidebar-right.html">Right</a></li>
			      	</ul>
				</li>
			</ul>
		</nav>
	</header>
</div>