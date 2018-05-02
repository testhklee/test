<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<!DOCTYPE html>
<html>

<head>
	<tiles:insertAttribute name="header"/>
</head>

<body>
    <div id="wrapper">

        <!-- Navigation -->
        
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">하즈아 관리자 페이지</a>
            </div>
            <!-- /.navbar-header -->

			<tiles:insertAttribute name="nav"/>
            <!-- /.navbar-top-links -->
			
			<tiles:insertAttribute name="left"/>
            <!-- /.navbar-static-side -->
        </nav>
		<div id="page-wrapper">
			<tiles:insertAttribute name="content"/>
		</div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
</body>

</html>
