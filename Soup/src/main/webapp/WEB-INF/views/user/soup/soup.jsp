<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="business" class="portfolio sections">
	<div class="container">
		<div class="head_title text-left">
			<h1>진행 중인 스프</h1>
		</div>
		
		<div class="row">
			<div class="portfolio-wrapper text-center">
				<c:choose>
					<c:when test="${empty mySoupList}">
						<h3>아직 진행 중인 스프가 없네요??</h3> 
						<button class="btn btn-default joinSoupBtn">스프 참여하기</button>
					</c:when>
					<c:otherwise>
						<c:forEach items="${mySoupList }" var="mySoup">
							<div id="${mySoup.soupGubun }${mySoup.soupNo }" class="col-md-3 col-sm-6 col-xs-12 mySoup">
								<div class="community-edition">
									<c:if test="${mySoup.soupMemberGubun == 'L'}">
										<span class="glyphicon glyphicon-star"></span>
									</c:if>
									<c:if test="${mySoup.soupGubun == 'PS' && mySoup.soupMemberGubun != 'L'}">
										<span class="glyphicon glyphicon-comment"></span>
									</c:if>
									<h6>${mySoup.soupGubun == 'P' ? 'PROJECT' : 'STUDY'}</h6>
									<h4>${mySoup.soupTitle }</h4>
									<h6 class="feild">${mySoup.soupField1 } ${mySoup.soupField2 }</h6>
									<c:forEach items="${mySoup.memberList }" var="member">
										<div class="face">
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
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>                                                                                                                                                                                                                                                                                                                                                                                             	</div>
</section>

<section id="business" class="portfolio sections">
	<div class="container">
		<div class="head_title text-left">
			<h1>종료된 스프</h1>
		</div>
		
		<div class="row">
			<div class="portfolio-wrapper text-center">
				<c:choose>
					<c:when test="${empty doneSoupList}">
						<h3>중료된 스프가 없습니다</h3>
					</c:when>
					<c:otherwise>
						<c:forEach items="${doneSoupList }" var="doneSoup">
							<div class="col-md-3 col-sm-6 col-xs-12 doneSoup">
								<div class="community-edition">
									<c:if test="${doneSoup.soupMemberGubun == 'L'}">
										<span class="glyphicon glyphicon-star"></span>
									</c:if>
									<c:if test="${doneSoup.soupGubun == 'PS' && doneSoup.soupMemberGubun != 'L'}">
										<span class="glyphicon glyphicon-comment"></span>
									</c:if>
									<h6>${doneSoup.soupGubun == 'P' ? 'PROJECT' : 'STUDY'}</h6>
									<h4>${doneSoup.soupTitle }</h4>
									<h6 class="feild">${doneSoup.soupField1 } ${doneSoup.soupField2 }</h6>
									<c:forEach items="${doneSoup.memberList }" var="member">
										<div class="face">
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
							</div>
							
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</section>

<!-- 클릭 시 해당 스/프로 넘어감 -->
<form id="soupFrm" method="post">
	<input type="hidden" id="soupNo" name="soupNo">
</form>
<!-- 후기작성 폼 -->
<form id="reviewFrm" action="soupReviewWriteCheck.do" method="post">
	<input type="hidden" name="soupNo">
</form>

<link rel="stylesheet" type="text/css" href="resources/css/soup.css?ver=13">
<script type="text/javascript" src="resources/js/soup.js?ver=22"></script>