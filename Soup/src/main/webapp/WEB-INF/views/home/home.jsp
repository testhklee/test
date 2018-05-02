<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<script type="text/javascript" src="resources/js/pageMove.js"></script>
<script type="text/javascript">

$(function(){	
	$(".filterForm").submit(function(){
		if($(".gubun").val()=="선택"){
			alert("구분을 선택하십시오");
			return false;
		}
	});
});


</script>

<style type="text/css">
.single_service2 {
	margin: 0 auto;
}

#lineColor {
	border-top: 1px solid black;
}

#redfilterBtn {
	float: left;
}

#redfilterBtnBtn {
	margin-top: 95px;
	margin-left: 100px;
	width: 160px;
}

#searchGreenBtn {
	width:60%;
}

#openfilter{
	position: absolute;
	margin-left:100px;
	margin-top:90px;
	width: 150px;
	height: 60px;
	background:#04B45F;
	border: none;
	color: white;

}

.btnSQ{
	margin-right:-1px;
	width: 30%;
	display: inline-block;
	background: #82ca9c;
	color: #fff;
	border: 0px;
	height:60px;
}
#btnPro{
	background:#FE9A2E;
}

#teacherLoc{
	margin-top: 10px;
    height: 40px;
}

.explainLoc{
	position: absolute;
    margin-left: 45.8%;

}
</style>



<!--Home page style-->
<header id="home" class="home">
	<div class="overlay-fluid-block">
		<div class="container text-center">
			<div class="row">
				<div class="home-wrapper">
					<div class="col-md-10 col-md-offset-1">
						<div class="home-content">

							<h1>모든 스터디/프로젝트 스프에서 찾으세요</h1>
							<p>You can have a new concept site, management and
								recruitment that you have not seen before, and you have all the
								projects and studies. Find the project / study you are looking
								for in the soup</p>
							<!-- 구분에 따른 전체 검색 -->
							<form action="mainFilter.do" class="filterForm" method="post">
								<div class="row">
									<div class="btn-group" id="redfilterBtn">									
										<div class="gubunDiv">
											<select class="gubun" id="openfilter" required="required" name="gubun">
												<option class="mainSelectFilter" value="선택" style="font-size:13px">선 택</option>
												<option class="mainSelectFilter" value="PS">유료스터디</option>
												<option class="mainSelectFilter" value="FS">무료스터디</option>
												<option class="mainSelectFilter" value="P">프로젝트</option>
											</select>
										</div>								
									</div>
								</div>
									<div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12" id="searchGreenBtn">
									<div class="home-contact">
									 	<div class="input-group">
											<!-- Example single danger button -->
											<input type="text" class="form-control" placeholder="어떤 스터디/프로젝트를 찾으시나요?" name="soupSearchWord"> 
											<input type="submit" class="btnSQ" value="찾기">
										</div>
									<!-- /input-group -->
									</div>
								</div>
							</form>
						</div>			
					</div>
				</div>
			</div>
		</div>
	</div>	
</header>

<!-- Sections -->
<section id="features" class="features sections">
	<div class="container">
		<div class="row">
			<div class="main_features_content2">

				<div class="col-sm-6">
					<div class="single_features_left text-center">
						<img class="mainImage" src="resources/images/study.jpg" alt="" />
					</div>
				</div>

				<div class="col-sm-6 margin-top-60">
					<div class="single_features_right ">
						<h2>PAY TO STUDY</h2>
						<p>
							기존 스터디에서 당신이 찾는 스터디 리더가 없었다면?<br /> 향상된 지식과 검증된 이력을 바탕으로 한 티쳐가<br />
							이끌어 가는 유료 스터디는 어떠신가요?
						</p>
						<ul>
							<li>저렴한 가격에</li>
							<li>좋은 티쳐분들을</li>
							<li>만나보실 수 있습니다.</li>
						</ul>
						<div class="features_buttom">
							<a href="searchGubun.do?soupGubun=PS" class="btn btn-default">더 보기</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>
<!--End of Features 2 Section -->
<section id="features" class="features sections">
	<div class="container">
		<div class="row">
			<div class="main_features_content2">



				<div class="col-sm-6 margin-top-60">
					<div class="single_features_right ">
						<h2>PROJECT</h2>
						<p>
							프로젝트 진행을 할 때 팀을 구하기 어려우셨나요?<br /> 모집과 관리를 동시에 할 수 있는 이점을 활용하여 <br />하고싶은
							프로젝트를 마음껏 진행하세요
						</p>
						<ul>
							<li>모집과 관리를</li>
							<li>한번에 하여</li>
							<li>번거로움을 줄일 수 있습니다.</li>
						</ul>
						
						<div class="features_buttom">
							<a href="searchGubun.do?soupGubun=P" class="btn btn-default">더 보기</a>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="single_features_left text-center">
						<img class="mainImage" src="resources/images/presentation.jpg"
							alt="" />
					</div>
				</div>

			</div>
		</div>
	</div>
</section>
<!--End of Features 2 Section -->


<section id="price" class="price sections">

	<div class="head_title text-center">
		<h1>STUDY</h1>
		<p>자신에게 알맞는 스터디를 찾아보세요.</p>
	</div>
	<!-- Example row of columns -->
	<div class="cd-pricing-container cd-has-margins">
		<div class="cd-pricing-switcher">
			<p class="fieldset">
				<input type="radio" name="duration-2" value="monthly" id="monthly-2"
					checked> <label for="monthly-2">유료 스터디</label> <input
					type="radio" name="duration-2" value="yearly" id="yearly-2">
				<label for="yearly-2" id="yearly-2">무료 스터디</label> <span
					class="cd-switch"></span>
			</p>
		</div>
		<!-- .cd-pricing-switcher -->

		<ul class="cd-pricing-list cd-bounce-invert">

			<!-- 유료1 -->
			<c:forEach items="${mainPsView1}" var="list">
				<li>
					<ul class="cd-pricing-wrapper">
						<li data-type="monthly" class="is-visible"><header
								class="cd-pricing-header"
								style="padding-top: 5px; padding-bottom: 5px;">
								<b style="font-size: 20px;">${list.soupAddr2}/${list.soupField2}</b><br />
								<span style="font-size: 15px; color: #369F36;"> <fmt:formatNumber
										value="${list.soupPrice}" pattern="#,###" />원
								</span>&nbsp;
								<fmt:parseNumber var="endDate_n"
									value="${list.soupEndDate.time/(1000*60*60*24)}"
									integerOnly="true" />
								<fmt:parseNumber var="startDate_n"
									value="${list.soupStartDate.time/(1000*60*60*24)}"
									integerOnly="true" />
								<fmt:parseNumber var="giganDate"
									value="${(endDate_n - startDate_n)/7}" integerOnly="true" />
								<span style="color: #999999;">${giganDate}주</span>

							</header> <!-- .cd-pricing-header --> <header class="cd-pricing-header">
								<div class="cd-price">
									
									<c:choose>
										<c:when test="${list.memberFace != null}">
											<img alt="" src="${list.memberFace}" width="345px"
												height="240px">
										</c:when>
										<c:otherwise>
											<img alt="" src="resources/upload/memberFace/anonymous.jpg" width="345px"
													height="240px">
										</c:otherwise>
									</c:choose>
								</div>
								<div>2/${list.soupMemberMax }</div>

							</header> <!-- .cd-pricing-header -->

							<div class="cd-pricing-body">
								<ul class="cd-pricing-features">
									<li style="text-align: center;"><b
										style="font-size: 19px;">${list.soupTitle }</b><br /> <fmt:formatDate
											var="strDate" value="${list.soupStartDate }"
											pattern="MM월 dd일 (E)" />${strDate}<br />
										${list.soupStartTime }~${list.soupEndTime }<br /> <b
										style="color: red;">첫 시작</b></li>
								</ul>
							</div> <!-- .cd-pricing-body --> <footer class="cd-pricing-footer">
								<a class="cd-select" href="detailForm.do?soupNo=${list.soupNo }">상세보기</a>
							</footer> <!-- .cd-pricing-footer --></li>


						<!-- 무료1 -->
						<c:forEach items="${mainFsView1}" var="list">
							<li data-type="yearly" class="is-hidden"><header
									class="cd-pricing-header"
									style="padding-top: 5px; padding-bottom: 5px;">
									<b style="font-size: 20px;">${list.soupAddr2}/${list.soupField2}</b><br />

									<fmt:parseNumber var="endDate_n"
										value="${list.soupEndDate.time/(1000*60*60*24)}"
										integerOnly="true" />
									<fmt:parseNumber var="startDate_n"
										value="${list.soupStartDate.time/(1000*60*60*24)}"
										integerOnly="true" />
									<fmt:parseNumber var="giganDate"
										value="${(endDate_n - startDate_n)/7}" integerOnly="true" />
									<span style="color: #999999;">${giganDate}주</span>

								</header> <!-- .cd-pricing-header --> <header class="cd-pricing-header">
									<div class="cd-price">
										
										<c:choose>
											<c:when test="${list.memberFace != null}">
												<img alt="" src="${list.memberFace}" width="345px"
													height="240px">
											</c:when>
											<c:otherwise>
												<img alt="" src="resources/upload/memberFace/anonymous.jpg" width="345px"
													height="240px">
											</c:otherwise>
										</c:choose>
									</div>
									<div>2/${list.soupMemberMax }</div>

								</header> <!-- .cd-pricing-header -->

								<div class="cd-pricing-body">
									<ul class="cd-pricing-features">
										<li style="text-align: center;"><b
											style="font-size: 19px;">${list.soupTitle }</b><br /> <fmt:formatDate
												var="strDate" value="${list.soupStartDate }"
												pattern="MM월 dd일 (E)" />${strDate}<br />
											${list.soupStartTime }~${list.soupEndTime }<br /> <b
											style="color: red;">첫 시작</b></li>
									</ul>
								</div> <!-- .cd-pricing-body --> <footer class="cd-pricing-footer">
									<a class="cd-select" href="detailForm.do?soupNo=${list.soupNo }">상세보기</a>
								</footer> <!-- .cd-pricing-footer --></li>
						</c:forEach>


					</ul> <!-- .cd-pricing-wrapper -->
				</li>
			</c:forEach>

			<!-- 유료2 -->
			<c:forEach items="${mainPsView2}" var="list">
				<li>
					<ul class="cd-pricing-wrapper">
						<li data-type="monthly" class="is-visible"><header
								class="cd-pricing-header"
								style="padding-top: 5px; padding-bottom: 5px;">
								<b style="font-size: 20px;">${list.soupAddr2}/${list.soupField2}</b><br />
								<span style="font-size: 15px; color: #369F36;"> <fmt:formatNumber
										value="${list.soupPrice}" pattern="#,###" />원
								</span>&nbsp;
								<fmt:parseNumber var="endDate_n"
									value="${list.soupEndDate.time/(1000*60*60*24)}"
									integerOnly="true" />
								<fmt:parseNumber var="startDate_n"
									value="${list.soupStartDate.time/(1000*60*60*24)}"
									integerOnly="true" />
								<fmt:parseNumber var="giganDate"
									value="${(endDate_n - startDate_n)/7}" integerOnly="true" />
								<span style="color: #999999;">${giganDate}주</span>

							</header> <!-- .cd-pricing-header --> <header class="cd-pricing-header">
								<div class="cd-price">
								
									<c:choose>
										<c:when test="${list.memberFace != null}">
											<img alt="" src="${list.memberFace}" width="345px"
												height="240px">
										</c:when>
										<c:otherwise>
											<img alt="" src="resources/upload/memberFace/anonymous.jpg" width="345px"
													height="240px">
										</c:otherwise>
									</c:choose>
								</div>
								<div>2/${list.soupMemberMax }</div>

							</header> <!-- .cd-pricing-header -->

							<div class="cd-pricing-body">
								<ul class="cd-pricing-features">
									<li style="text-align: center;"><b
										style="font-size: 19px;">${list.soupTitle }</b><br /> <fmt:formatDate
											var="strDate" value="${list.soupStartDate }"
											pattern="MM월 dd일 (E)" />${strDate}<br />
										${list.soupStartTime }~${list.soupEndTime }<br /> <b
										style="color: red;">첫 시작</b></li>
								</ul>
							</div> <!-- .cd-pricing-body --> <footer class="cd-pricing-footer">
								<a class="cd-select" href="detailForm.do?soupNo=${list.soupNo }">상세보기</a>
							</footer> <!-- .cd-pricing-footer --></li>


						<!-- 무료2 -->
						<c:forEach items="${mainFsView2}" var="list">
							<li data-type="yearly" class="is-hidden"><header
									class="cd-pricing-header"
									style="padding-top: 5px; padding-bottom: 5px;">
									<b style="font-size: 20px;">${list.soupAddr2}/${list.soupField2}</b><br />

									<fmt:parseNumber var="endDate_n"
										value="${list.soupEndDate.time/(1000*60*60*24)}"
										integerOnly="true" />
									<fmt:parseNumber var="startDate_n"
										value="${list.soupStartDate.time/(1000*60*60*24)}"
										integerOnly="true" />
									<fmt:parseNumber var="giganDate"
										value="${(endDate_n - startDate_n)/7}" integerOnly="true" />
									<span style="color: #999999;">${giganDate}주</span>

								</header> <!-- .cd-pricing-header --> <header class="cd-pricing-header">
									<div class="cd-price">
								
										<c:choose>
											<c:when test="${list.memberFace != null}">
												<img alt="" src="${list.memberFace}" width="345px"
													height="240px">
											</c:when>
											<c:otherwise>
												<img alt="" src="resources/upload/memberFace/anonymous.jpg" width="345px"
													height="240px">
											</c:otherwise>
										</c:choose>
									</div>
									<div>2/${list.soupMemberMax }</div>

								</header> <!-- .cd-pricing-header -->

								<div class="cd-pricing-body">
									<ul class="cd-pricing-features">
										<li style="text-align: center;"><b
											style="font-size: 19px;">${list.soupTitle }</b><br /> <fmt:formatDate
												var="strDate" value="${list.soupStartDate }"
												pattern="MM월 dd일 (E)" />${strDate}<br />
											${list.soupStartTime }~${list.soupEndTime }<br /> <b
											style="color: red;">첫 시작</b></li>
									</ul>
								</div> <!-- .cd-pricing-body --> <footer class="cd-pricing-footer">
									<a class="cd-select" href="detailForm.do?soupNo=${list.soupNo }">상세보기</a>
								</footer> <!-- .cd-pricing-footer --></li>
						</c:forEach>


					</ul> <!-- .cd-pricing-wrapper -->
				</li>
			</c:forEach>

			<!--유료3  -->
			<c:forEach items="${mainPsView3}" var="list">
				<li>
					<ul class="cd-pricing-wrapper">

						<li data-type="monthly" class="is-visible"><header
								class="cd-pricing-header"
								style="padding-top: 5px; padding-bottom: 5px;">
								<b style="font-size: 20px;">${list.soupAddr2}/${list.soupField2}</b><br />
								<span style="font-size: 15px; color: #369F36;"> <fmt:formatNumber
										value="${list.soupPrice}" pattern="#,###" />원
								</span>&nbsp;
								<fmt:parseNumber var="endDate_n"
									value="${list.soupEndDate.time/(1000*60*60*24)}"
									integerOnly="true" />
								<fmt:parseNumber var="startDate_n"
									value="${list.soupStartDate.time/(1000*60*60*24)}"
									integerOnly="true" />
								<fmt:parseNumber var="giganDate"
									value="${(endDate_n - startDate_n)/7}" integerOnly="true" />
								<span style="color: #999999;">${giganDate}주</span>

							</header> <!-- .cd-pricing-header --> <header class="cd-pricing-header">
								<div class="cd-price">
								
									<c:choose>
										<c:when test="${list.memberFace != null}">
											<img alt="" src="${list.memberFace}" width="345px"
												height="240px">
										</c:when>
										<c:otherwise>
											<img alt="" src="resources/upload/memberFace/anonymous.jpg" width="345px"
													height="240px">
										</c:otherwise>
									</c:choose>
								</div>
								<div>2/${list.soupMemberMax }</div>

							</header> <!-- .cd-pricing-header -->

							<div class="cd-pricing-body">
								<ul class="cd-pricing-features">
									<li style="text-align: center;"><b
										style="font-size: 19px;">${list.soupTitle }</b><br /> <fmt:formatDate
											var="strDate" value="${list.soupStartDate }"
											pattern="MM월 dd일 (E)" />${strDate}<br />
										${list.soupStartTime }~${list.soupEndTime }<br /> <b
										style="color: red;">첫 시작</b></li>
								</ul>
							</div> <!-- .cd-pricing-body --> <footer class="cd-pricing-footer">
								<a class="cd-select" href="detailForm.do?soupNo=${list.soupNo }">상세보기</a>
							</footer> <!-- .cd-pricing-footer --></li>


						<!-- 무료3 -->
						<c:forEach items="${mainFsView3}" var="list">
							<li data-type="yearly" class="is-hidden"><header
									class="cd-pricing-header"
									style="padding-top: 5px; padding-bottom: 5px;">
									<b style="font-size: 20px;">${list.soupAddr2}/${list.soupField2}</b><br />

									<fmt:parseNumber var="endDate_n"
										value="${list.soupEndDate.time/(1000*60*60*24)}"
										integerOnly="true" />
									<fmt:parseNumber var="startDate_n"
										value="${list.soupStartDate.time/(1000*60*60*24)}"
										integerOnly="true" />
									<fmt:parseNumber var="giganDate"
										value="${(endDate_n - startDate_n)/7}" integerOnly="true" />
									<span style="color: #999999;">${giganDate}주</span>

								</header> <!-- .cd-pricing-header --> <header class="cd-pricing-header">
									<div class="cd-price">
										
										<c:choose>
											<c:when test="${list.memberFace != null}">
												<img alt="" src="${list.memberFace}" width="345px"
													height="240px">
											</c:when>
											<c:otherwise>
												<img alt="" src="resources/upload/memberFace/anonymous.jpg" width="345px"
													height="240px">
											</c:otherwise>
										</c:choose>
									</div>
									<div>2/${list.soupMemberMax }</div>

								</header> <!-- .cd-pricing-header -->

								<div class="cd-pricing-body">
									<ul class="cd-pricing-features">
										<li style="text-align: center;"><b
											style="font-size: 19px;">${list.soupTitle }</b><br /> <fmt:formatDate
												var="strDate" value="${list.soupStartDate }"
												pattern="MM월 dd일 (E)" />${strDate}<br />
											${list.soupStartTime }~${list.soupEndTime }<br /> <b
											style="color: red;">첫 시작</b></li>
									</ul>
								</div> <!-- .cd-pricing-body --> <footer class="cd-pricing-footer">
									<a class="cd-select" href="detailForm.do?soupNo=${list.soupNo }">상세보기</a>
								</footer> <!-- .cd-pricing-footer --></li>
						</c:forEach>
					</ul> <!-- .cd-pricing-wrapper -->
				</li>
			</c:forEach>

		</ul>
	</div>

</section>



<section id="business" class="portfolio sections">
	<div class="container">
		<div class="head_title text-center">
			<h1>PROJECT</h1>
			<p>자신에게 알맞는 프로젝트를 찾아보세요.</p>
		</div>

		<div class="row">
			<div class="portfolio-wrapper text-center">

				<c:forEach items="${mainProjectView}" var="list">
					<div class="col-md-3 col-sm-6 col-xs-12" >
					
						<div class="community-edition">
								
							<div>
							
								<b>${list.soupField2}</b>
								<hr id="lineColor"></hr>
								<p>
									<fmt:parseNumber var="endDate_n"
										value="${list.soupEndDate.time/(1000*60*60*24)}"
										integerOnly="true" />
									<fmt:parseNumber var="startDate_n"
										value="${list.soupStartDate.time/(1000*60*60*24)}"
										integerOnly="true" />
									<fmt:parseNumber var="giganDate"
										value="${(endDate_n - startDate_n)/7}" integerOnly="true" />
									${giganDate}주
								</p>
								<c:choose>
									<c:when test="${list.memberFace != null}">
										<img alt="" src="${list.memberFace}" width="180px"
											height="112px">
									</c:when>
									<c:otherwise>
										<div>${list.memberName }</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div style="font-size: 10px">2/${list.soupMemberMax }</div>
							<br /> <b>[${list.soupTitle }]</b><br />

							<fmt:formatDate var="strDate" value="${list.soupStartDate }"
								pattern="MM월 dd일 (E)" />${strDate}<br /> ${list.soupStartTime }~${list.soupEndTime }<br />
							<b style="color: red;">첫 시작</b>
						</div>
						<footer class="cd-pricing-footer">
							<a class="cd-select" href="detailForm.do?soupNo=${list.soupNo }">상세보기</a>
						</footer>						
					</div>					
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- /container -->
</section>
<section id="explain" class="explain sections">
	<div class="container">
		<div class="head_title text-center">
			<h2>APPLY</h2>
			<p>
				재능을 낭비하지 않으신가요?<br />공간의 활용방안이 생각나지 않으신가요?
			</p>
		</div>
	</div>

	<div class="single_service2 left" style="width: 300px;" id="teacherLoc">
	<a href="teacherApply.do"><img src="resources/images/teacher.png" alt=""></a>

	</div>
	<span class="explainLoc" style="margin-top: -3.5%;"><b>TEACHER</b> : 프리미엄스터디 리더</span>
	<br /> <br />
	
	<div class="single_service2 right" style="width: 300px; align: center">
	<a href="businessApply.do">	<img src="resources/images/businessman.png" alt=""></a>
	</div>
	
	<span class="explainLoc" style="margin-top: -3%;"><b>BUSINESS</b>: 스터디룸 제휴</span><br />
	<br />

	<p style="text-align: center; margin-bottom: 80px;">
		<img class="mainImage" src="resources/images/business.jpg" alt=""
			style="width: 500; height: 500px;" />
	</p>
</section>

