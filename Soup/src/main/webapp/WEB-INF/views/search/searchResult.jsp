<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="resources/css/search.css?ver=1" rel="stylesheet"/>

<script type="text/javascript">

	function soupCreate(soupGubun){
		if(${login==null}){
			$("#loginForm").click();
			alert("login 해주세요");
		}else{
			if(soupGubun!=null){
				location.href="createSoup.do?gubun="+soupGubun;
			}else{
				return false;
			}
		}
	}

</script>

<section id="price" class="price sections">
	<c:choose>
		<c:when test="${not empty list.get(0).soupTitle}">
			<c:forEach items="${list }" var="list" begin="0" end="0">
				<c:choose>
					<c:when test="${list.soupGubun=='PS' }">
						<div class="head_title text-center">
							<h1>유료 스터디</h1>
							<c:if test="${login.memberGrade == 'TEACHER' }">
								<button class="btn btn-success" onclick="soupCreate('${list.soupGubun}');">스터디 생성하기</button>
							</c:if>
						</div>
					</c:when>
					<c:when test="${list.soupGubun=='FS' }">
						<div class="head_title text-center">
							<h1>무료 스터디</h1>
							<button class="btn btn-success" onclick="soupCreate('${list.soupGubun}');">스터디 생성하기</button>
						</div>
					</c:when>
					<c:when test="${list.soupGubun=='P' }">
						<div class="head_title text-center">
							<h1>프로젝트</h1>
							<button class="btn btn-success" onclick="soupCreate('${list.soupGubun}');">프로젝트 생성하기</button>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>	
		
		
		<!-- Example row of columns -->
		<div class="cd-pricing-container cd-has-margins">
			<ul class="cd-pricing-list cd-bounce-invert">
			<c:forEach items="${list }" var="list">
				<c:choose>
					<c:when test="${list.soupGubun=='PS' }">
						<li>
							<ul class="cd-pricing-wrapper">
								<li data-type="monthly" class="is-visible">
									<header	class="cd-pricing-header" style="padding-top: 5px; padding-bottom: 5px;">
										<h2>${list.soupAddr2}/${list.soupField2}</h2>
										<h2>${list.soupPrice}￦</h2>
									</header> <!-- .cd-pricing-header -->
									<header	class="cd-pricing-header">
										<div class="cd-price">
											<c:choose>
												<c:when test="${list.memberFace != null}">
													<img alt="" class="cardImg" src="${list.memberFace}">
												</c:when>
												<c:otherwise>
													<img alt="" class="cardImg" src="resources/upload/memberFace/anonymous.jpg">
												</c:otherwise>
											</c:choose>
										</div>
										<div>
											${list.currentMember }/${list.soupMemberMax }
										</div>
										<div>
											<fmt:parseNumber var="endDate_n" value="${list.soupEndDate.time/(1000*60*60*24)}" integerOnly="true"/>
											<fmt:parseNumber var="startDate_n" value="${list.soupStartDate.time/(1000*60*60*24)}" integerOnly="true"/>
											<fmt:parseNumber var="giganDate" value="${(endDate_n - startDate_n)/7}" integerOnly="true"/>
											${giganDate}주
										</div>
									</header> <!-- .cd-pricing-header -->
			
									<div class="cd-pricing-body">
										<ul class="cd-pricing-features">
											<li class="li-title">${list.soupTitle }</li>
										</ul>
									</div> 
									<hr class="myhr"/>
									<div class="cd-pricing-body">
										<ul class="cd-pricing-features">
											<li class="li-etc"><fmt:formatDate var="strDate" value="${list.soupStartDate }" pattern="MM월 dd일 (E)"/>${strDate}<br/>
											${list.soupStartTime }~${list.soupEndTime }<br/>
											첫 시작</li>
										</ul>
									</div> <!-- .cd-pricing-body --> <footer class="cd-pricing-footer">
										<a class="cd-select" href="detailForm.do?soupNo=${list.soupNo }">상세보기</a>
									</footer> <!-- .cd-pricing-footer -->
								</li>
							</ul> <!-- .cd-pricing-wrapper -->
						</li>
					</c:when>
					
					<c:when test="${list.soupGubun=='FS' }">
						<li>
							<ul class="cd-pricing-wrapper">
								<li data-type="monthly" class="is-visible">
									<header	class="cd-pricing-header" style="padding-top: 5px; padding-bottom: 5px;">
										<h2>${list.soupAddr2}/${list.soupField2}</h2>
									</header> <!-- .cd-pricing-header -->
									<header	class="cd-pricing-header">
										<div class="cd-price">
											<c:choose>
												<c:when test="${list.memberFace != null}">
													<img alt="" class="cardImg" src="${list.memberFace}">
												</c:when>
												<c:otherwise>
													<img alt="" class="cardImg" src="resources/upload/memberFace/anonymous.jpg">
												</c:otherwise>
											</c:choose>
										</div>
										<div>
											${list.currentMember }/${list.soupMemberMax }
										</div>
										<div>
											<fmt:parseNumber var="endDate_n" value="${list.soupEndDate.time/(1000*60*60*24)}" integerOnly="true"/>
											<fmt:parseNumber var="startDate_n" value="${list.soupStartDate.time/(1000*60*60*24)}" integerOnly="true"/>
											<fmt:parseNumber var="giganDate" value="${(endDate_n - startDate_n)/7}" integerOnly="true"/>
											${giganDate}주
										</div>
									</header> <!-- .cd-pricing-header -->
			
									<div class="cd-pricing-body">
										<ul class="cd-pricing-features">
											<li class="li-title">${list.soupTitle }</li>
										</ul>
									</div> 
									<hr class="myhr"/>
									<div class="cd-pricing-body">
										<ul class="cd-pricing-features">
											<li class="li-etc"><fmt:formatDate var="strDate" value="${list.soupStartDate }" pattern="MM월 dd일 (E)"/>${strDate}<br/>
											${list.soupStartTime }~${list.soupEndTime }<br/>
											첫 시작</li>
										</ul>
									</div> <!-- .cd-pricing-body --> <footer class="cd-pricing-footer">
										<a class="cd-select" href="detailForm.do?soupNo=${list.soupNo }">상세보기</a>
									</footer> <!-- .cd-pricing-footer -->
								</li>
							</ul> <!-- .cd-pricing-wrapper -->
						</li>
					</c:when>
					
					<c:when test="${list.soupGubun=='P' }">
						<li>
							<ul class="cd-pricing-wrapper">
								<li data-type="monthly" class="is-visible">
									<header	class="cd-pricing-header" style="padding-top: 5px; padding-bottom: 5px;">
										<h2>${list.soupField2}</h2>
									</header> <!-- .cd-pricing-header -->
									<header	class="cd-pricing-header">
										<div class="cd-price">
											<c:choose>
												<c:when test="${list.memberFace != null}">
													<img alt="" class="cardImg" src="${list.memberFace}">
												</c:when>
												<c:otherwise>
													<img alt="" class="cardImg" src="resources/upload/memberFace/anonymous.jpg">
												</c:otherwise>
											</c:choose>
										</div>
										<div>
											${list.currentMember }/${list.soupMemberMax }
										</div>
										<div>
											<fmt:parseNumber var="endDate_n" value="${list.soupEndDate.time/(1000*60*60*24)}" integerOnly="true"/>
											<fmt:parseNumber var="startDate_n" value="${list.soupStartDate.time/(1000*60*60*24)}" integerOnly="true"/>
											<fmt:parseNumber var="giganDate" value="${(endDate_n - startDate_n)/7}" integerOnly="true"/>
											${giganDate}주
										</div>
									</header> <!-- .cd-pricing-header -->
			
									<div class="cd-pricing-body">
										<ul class="cd-pricing-features">
											<li class="li-title">${list.soupTitle }</li>
										</ul>
									</div> 
									<hr class="myhr"/>
									<div class="cd-pricing-body">
										<ul class="cd-pricing-features">
											<li class="li-etc"><fmt:formatDate var="strDate" value="${list.soupStartDate }" pattern="MM월 dd일 (E)"/>${strDate}<br/>
											첫 시작</li>
										</ul>
									</div> <!-- .cd-pricing-body --> <footer class="cd-pricing-footer">
										<a class="cd-select" href="detailForm.do?soupNo=${list.soupNo }">상세보기</a>
									</footer> <!-- .cd-pricing-footer -->
								</li>
							</ul> <!-- .cd-pricing-wrapper -->
						</li>
					</c:when>
				</c:choose>
			</c:forEach>
			</ul>
		</div>
		</c:when>
		<c:otherwise>
			<div class="head_title text-center">
				<h1>검색 결과가 없습니다</h1>
				<c:choose>
					<c:when test="${list.get(0).soupGubun == 'PS'}">
						<c:choose>
							<c:when test="login.memberGrade=='TEACHER'">
								<button class="btn btn-success" onclick="soupCreate('${list.get(0).soupGubun}');">유료 스터디 생성하기</button>
							</c:when>
							<c:otherwise>
								<div class="head_title text-center">
									<h5>
										(유료 스터디 모집은 '티쳐' 등급만 가능합니다)
									</h5>
								</div>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:when test="${list.get(0).soupGubun == 'FS'}">
						<button class="btn btn-success" onclick="soupCreate('${list.get(0).soupGubun}');">무료 스터디 생성하기</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-success" onclick="soupCreate('${list.get(0).soupGubun}');">프로젝트 생성하기</button>				
					</c:otherwise>
				</c:choose>
			</div>
		</c:otherwise>
	</c:choose>
</section>
