<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/studyManage.css">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script type="text/javascript">

	function memostart() {
		
		$.ajax({
			type:"post",
			url:"startmemo.do",
			data:"soup_no=${soupNo }",
			success:function(msg) {
				$(".memo textarea").attr("readonly", false);
				$(".memo_start_btn").css("display", "none");
				$(".memo").append("<div class='memo_update_btn'><button class='btn btn-default' onclick='memoupdate()'>저장</button></div>");
				
			},error:function(statusCode) {
				alert("error : " + statusCode.status);
			}
		});
	}
	
	function memoupdate() {
		
		var data = $(".memo_area").val();
		
		$.ajax({
			type:"post",
			url:"updatememo.do",
			data:"soup_no=${soupNo }&memo_content=" + data,
			success:function(msg) {
				alert("저장되었습니다.");
			},error:function(statusCode) {
				alert("error : " + statusCode.status);
			}
		});
	}
		
	$( document ).ready(function() {
		
		var delay = (function() {
			
			var timer = 0;
			
			return function(callback, ms) {
				
			clearTimeout (timer);
			timer = setTimeout(callback, ms);
			
			};
			
		})();
		
		$(".memo_area").keyup(function() {
			
			delay(function(){
				
				var data = $(".memo_area").val();
				
				$.ajax({
					type:"post",
					url:"updatememo.do",
					data:"soup_no=${soupNo }&memo_content=" + data,
					success:function(msg) {
					},error:function(statusCode) {
						alert("error : " + statusCode.status);
					}
				});
				
			}, 2000 );
			
		});

	});

</script>
<section class="container">
	<div class="clearfix">
		<ul class="nav navbar-nav navbar-light">
			<li class="navMenu"><a href="myStudy.do?soupNo=${soupNo }">나의 스터디</a></li>
			<li class="navMenu"><a href="studyschedule.do?soup_no=${soupNo }">일정관리</a></li>
			<li class="navMenu"><a href="studyCurriculum.do?soup_no=${soupNo }">커리큘럼</a></li>
			<li class="navMenu"><a href="evaluateChart.do?soup_no=${soupNo }">커리큘럼 차트</a></li>
			<li class="navMenu"><a href="studyBoardList.do?soup_no=${soupNo }">게시판</a></li>
		</ul>				
	</div>
	<div class="inner_container">
		<div class="memo">
			<c:choose>
				<c:when test="${empty memo }">
					<div>				
						<div><textarea class="memo_area form-control" readonly="readonly"></textarea></div>				
					</div>
					<div class="memo_start_btn">
						<div class="memo_start_btn_img"><span class="glyphicon glyphicon-edit"></span></div>
						<p>메모기능을 사용하시려면<br>활성화 시켜셔야 합니다.<br>활성화 버튼을 누르시고<br>메모기능을 사용하시기<br>바랍니다.</p>
						<button class="btn btn-default" onclick="memostart()">메모 활성화</button>
					</div>
				</c:when>
				<c:otherwise>
					<div>				
						<div><textarea class="memo_area form-control">${memo.memoContent }</textarea></div>				
					</div>
					<div class="memo_update_btn">
						<button class="btn btn-default" onclick="memoupdate()">저장</button>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="content">
			<div><h6><strong>[커리큘럼이 작성되면 차트가 생성되고 코멘트가 표시되게 됩니다.]</strong></h6></div>
			<div id="container" class="my_chart" style="min-width: 310px; height: 400px; margin: 0 auto"></div>								
			<div id="container_member_all" style="min-width: 310px; height: 400px; margin: 0 auto"></div>	
			<div id="comment">
				<h4><strong>종합 코멘트</strong></h4>
				<ul class="tab">
					<c:choose>
						<c:when test="${ empty allEvaluatCommentNum }">
						
						</c:when>
						<c:otherwise>
							<c:forEach items="${allEvaluatCommentNum }" var="allEvaluatNum" varStatus="status">								
								<c:if test="${status.index == 0}">
									<li class="current" data-tab="tab${status.index+1 }">${allEvaluatNum }회차 </li>
								</c:if>
								<c:if test="${status.index > 0}">
									<li data-tab="tab${status.index+1 }">${allEvaluatNum }회차 </li>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>				
				</ul>
				<c:choose>
					<c:when test="${ empty allEvaluatComment }">
						<div style="text-align: center">스터디 멤버의 작성된 코멘트가 존재 하지 않습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${allEvaluatCommentNum }" var="allEvaluatNum" varStatus="status">	
							<c:if test="${status.index == 0}">
								<div id="tab${status.index+1 }" class="tabcontent current">
									<c:forEach items="${ allEvaluatComment }" var="allComment">
										<c:if test="${allComment.curiNo == status.index+1 }">
											<textarea rows="6" readonly="readonly">${allComment.itemVal }</textarea>
										</c:if>
									</c:forEach>
								</div>
							</c:if>
							<c:if test="${status.index > 0}">
								<div id="tab${status.index+1 }" class="tabcontent">
									<c:forEach items="${ allEvaluatComment }" var="allComment">
										<c:if test="${allComment.curiNo == status.index+1 }">
											<textarea rows="6" readonly="readonly">${allComment.itemVal }</textarea>
										</c:if>
									</c:forEach>
								</div>
							</c:if>						
						</c:forEach>
					</c:otherwise>
				</c:choose>						
			</div>		
		</div>
	</div>   
</section>
<script type="text/javascript">
	
	$(function() {
				
	  //Create the chart
		Highcharts.chart('container', {
		 chart: {
		     type: 'column'
		 },
		 title: {
		     text: '나의 커리큘럼 종합 차트'
		 },
		 subtitle: {
		     text: '커리큘럼 항목을 평가하시면, 차트가 표시됩니다.'
		 },
		 xAxis: {
		     type: 'category'
		 },
		 yAxis: {
		     title: {
		         text: '평점 (%)'
		     }					
		 },
		 legend: {
		     enabled: false
		 },
		 plotOptions: {
		     series: {
		         borderWidth: 0,
		         dataLabels: {
		             enabled: true,
		             format: '{point.y:.1f}%'
		         }
		     }
		 },
		
		 tooltip: {
		     headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
		     pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b>'
		 },
		
		 series: [{
		     name: '개인 차트',
		     colorByPoint: true,
		     data: ${curriculum}
		 }],
		 drilldown: {
		     series: ${evaluate}
		 }
		});			
	  
		$('ul.tab li').click(function() {
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			
			$(this).addClass('current');			
			for(var i = 0; i < $(".tabcontent").length; i++) {
				if($(this).attr("data-tab") == $(".tabcontent:eq(" + i + ")").attr("id")) {
					$(".tabcontent:eq(" + i + ")").addClass('current');
				}
			}
					
		});

		Highcharts.chart('container_member_all', {
		    chart: {
		        type: 'spline'
		    },
		    title: {
		        text: '스터디 멤버 커리큘럼 종합 차트'
		    },
		    subtitle: {
		        text: '스터디 멤버들의 작성된 커리큘럼 차트입니다.'
		    },
		    xAxis: {
		        categories: [${allChartTitle}]
		    },
		    yAxis: {
		        title: {
		            text: 'Temperature'
		        },
		        labels: {
		            formatter: function () {
		                return this.value + '%';
		            }
		        },
		        title: {
			         text: '평점 (%)'
			     }	
		    },
		    tooltip: {
		        crosshairs: true,
		        shared: true
		    },
		    plotOptions: {
		        spline: {
		            marker: {
		                radius: 4,
		                lineColor: '#666666',
		                lineWidth: 1
		            }
		        }
		    },
		    series: [{
		        name: '커리큘럼 종합 평균',
		        marker: {
		            symbol: 'square'
		        },
		        data: [${TotalAvg}]

		    }]
		});
		$(".highcharts-credits").remove();
		
	});
	
</script>
