<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>  
<%response.setContentType("text/html; charset=UTF-8");%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="resources/css/jjimApply.css">
<!-- 신청목록 -->
<section id="business" class="portfolio sections">
	<div class="container">
		<div class="head_title text-left">
			<h1>신청한 스프</h1>
		</div>
		
		<div class="row">
			<div class="portfolio-wrapper text-center">
				<c:choose>
					<c:when test="${empty applyList}">
						<h3>신청한 스프가 없습니다</h3> 
					</c:when>
					<c:otherwise>
						<c:forEach items="${applyList }" var="apply">
							<div class="col-md-3 col-sm-6 col-xs-12 jjimApply">
								<input type="hidden" class="soupNo" value="${apply.soupNo }">
								<div class="community-edition">
									<h6>${apply.soupGubun == 'P' ? 'PROJECT' : 'STUDY'}</h6>
									<h4>${apply.soupTitle }</h4>
									<h6 style="font-weight: bold">${apply.soupField1 } ${apply.soupField2 }</h6>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>                                                                                                                                                                                                                                                                                                                                                                                             	</div>
</section>

<!-- 찜한 스프 -->
<section id="business" class="portfolio sections">
	<div class="container">
		<div class="head_title text-left">
			<h1>찜한 스프</h1>
		</div>
		
		<div class="row">
			<div class="portfolio-wrapper text-center">
				<c:choose>
					<c:when test="${empty jjimList}">
						<h3>찜한 스프가 없습니다</h3> 
					</c:when>
					<c:otherwise>
						<c:forEach items="${jjimList }" var="jjim">
							<div class="col-md-3 col-sm-6 col-xs-12 jjimApply">
								<input type="hidden" class="soupNo" value="${jjim.soupNo }">
								<div class="community-edition">
									<h6>${jjim.soupGubun == 'P' ? 'PROJECT' : 'STUDY'}</h6>
									<h4>${jjim.soupTitle }</h4>
									<h6 style="font-weight: bold">${jjim.soupField1 } ${jjim.soupField2 }</h6>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>                                                                                                                                                                                                                                                                                                                                                                                             	</div>
</section>

<script type="text/javascript" src="resources/js/jjimApply.js"></script>