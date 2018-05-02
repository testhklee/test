<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
  } );

  </script>
<style>
.ui-tabs-vertical {
	width: 58em;
}

.ui-tabs-vertical .ui-tabs-nav {
	padding: .2em .1em .2em .2em;
	float: left;
	width: 12em;
}

.ui-tabs-vertical .ui-tabs-nav li {
	clear: left;
	width: 100%;
	border-bottom-width: 1px !important;
	border-right-width: 0 !important;
	margin: 0 -1px .2em 0;
}

.ui-tabs-vertical .ui-tabs-nav li a {
	display: block;
}

.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active {
	padding-bottom: 0;
	padding-right: .1em;
	border-right-width: 1px;
}

.ui-tabs-vertical .ui-tabs-panel {
	float: right;
	width: 40em;
}
</style>

<div class="container" style="height: 1400px;">
	<h2 style="margin-top: 50px;">
		<b style="font-size: 80%; margin-left: 50px; color: #92e3af">FAQ</b>
	</h2>

	<div
		style="border: 1.4px solid #92e3af; background-color: #92e3af; width: 18%; height: 1px; float: left">
	</div>

	<div
		style="border: 1.4px solid #92e3af; background-color: #F7817E; margin-botton: 100px; width: 77%; height: 1px; margin-left: 55px; float: left">
	</div>
	<div id="tabs" style="margin-top: 80px;'">
		<ul>
			<li><a class="btn btn-primary btn-lg" href="#tabs-1">사이트</a></li>
			<li><a class="btn btn-primary btn-lg" href="#tabs-2">스터디</a></li>
			<li><a class="btn btn-primary btn-lg" href="#tabs-3">프로젝트</a></li>
			<li><a class="btn btn-primary btn-lg" href="#tabs-4">결제</a></li>
			<li><a class="btn btn-primary btn-lg" href="#tabs-5">환불</a></li>
			<li><a class="btn btn-primary btn-lg" href="#tabs-6">기타</a></li>
		</ul>
		<div id="tabs-1">
			<c:forEach items="${faqList}" var="faqList" varStatus="i">
				<c:if test="${faqList.faqGubun eq 'site'}">
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-default" style="width: 140%;">
							<div style="background-color: #82ca9c;" class="panel-heading" role="tab" id="heading${i.index}">
								<h4 class="panel-title">
									<a style="color: white;" data-toggle="collapse" data-parent="#accordion"
										href="#collapse${i.index}" aria-expanded="true"
										aria-controls="collapse${i.index}"> ${faqList.faqQuestion}
									</a>
								</h4>
							</div>
							<div id="collapse${i.index}" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="heading${i.index}">
								<div class="panel-body">${faqList.faqAnswer }</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div id="tabs-2">
			<c:forEach items="${faqList}" var="faqList" varStatus="i">
				<c:if test="${faqList.faqGubun eq 'study' }">
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-default" style="width: 140%;">
							<div style="background-color: #82ca9c;" class="panel-heading" role="tab" id="heading${i.index}">
								<h4 class="panel-title">
									<a style="color: white;" data-toggle="collapse" data-parent="#accordion"
										href="#collapse${i.index}" aria-expanded="true"
										aria-controls="collapse${i.index}"> ${faqList.faqQuestion}
									</a>
								</h4>
							</div>
							<div id="collapse${i.index}" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="heading${i.index}">
								<div class="panel-body">${faqList.faqAnswer }</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div id="tabs-3">
			<c:forEach items="${faqList}" var="faqList" varStatus="i">
				<c:if test="${faqList.faqGubun eq 'project' }">
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-default" style="width: 140%;">
							<div style="background-color: #82ca9c;" class="panel-heading" role="tab" id="heading${i.index}">
								<h4 class="panel-title">
									<a style="color: white;" data-toggle="collapse" data-parent="#accordion"
										href="#collapse${i.index}" aria-expanded="true"
										aria-controls="collapse${i.index}"> ${faqList.faqQuestion}
									</a>
								</h4>
							</div>
							<div id="collapse${i.index}" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="heading${i.index}">
								<div class="panel-body">${faqList.faqAnswer }</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div id="tabs-4">
			<c:forEach items="${faqList}" var="faqList" varStatus="i">
				<c:if test="${faqList.faqGubun eq 'pay' }">
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-default" style="width: 140%;">
							<div style="background-color: #82ca9c;" class="panel-heading" role="tab" id="heading${i.index}">
								<h4 class="panel-title">
									<a style="color: white;" data-toggle="collapse" data-parent="#accordion"
										href="#collapse${i.index}" aria-expanded="true"
										aria-controls="collapse${i.index}"> ${faqList.faqQuestion}
									</a>
								</h4>
							</div>
							<div id="collapse${i.index}" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="heading${i.index}">
								<div class="panel-body">${faqList.faqAnswer }</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div id="tabs-5">
			<c:forEach items="${faqList}" var="faqList" varStatus="i">
				<c:if test="${faqList.faqGubun eq 'refund' }">
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true" >
						<div class="panel panel-default"style="width: 140%;">
							<div style="background-color: #82ca9c;" class="panel-heading" role="tab" id="heading${i.index}">
								<h4 class="panel-title">
									<a style="color: white;" data-toggle="collapse" data-parent="#accordion"
										href="#collapse${i.index}" aria-expanded="true"
										aria-controls="collapse${i.index}"> ${faqList.faqQuestion}
									</a>
								</h4>
							</div>
							<div id="collapse${i.index}" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="heading${i.index}">
								<div class="panel-body">${faqList.faqAnswer }</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div id="tabs-6">
			<c:forEach items="${faqList}" var="faqList" varStatus="i">
				<c:if test="${faqList.faqGubun eq 'etc' }">
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-default"style="width: 140%;">
							<div style="background-color: #82ca9c;" class="panel-heading" role="tab" id="heading${i.index}">
								<h4 class="panel-title">
									<a style="color: white;" data-toggle="collapse" data-parent="#accordion"
										href="#collapse${i.index}" aria-expanded="true"
										aria-controls="collapse${i.index}"> ${faqList.faqQuestion}
									</a>
								</h4>
							</div>
							<div id="collapse${i.index}" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="heading${i.index}">
								<div class="panel-body">${faqList.faqAnswer }</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</div>









