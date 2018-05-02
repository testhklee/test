<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/fullcalendar.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="resources/css/studyManage.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function() {
    $( "#testDatepicker" ).datepicker({
    	dateFormat: "yymmdd"
    });
});
</script>
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
		
		$(".addschedule_btn").on("click", function() {
			$(".schedule_bg").css("left", "0");
			$(".inner_schedule").css("left", "50%");
			$(".navbar-default").css("display", "none");
		});
		
		$(".cancel_btn").on("click", function() {
			$(".schedule_bg").css("left", "-100%");
			$(".inner_schedule").css("left", "-100%");
			$(".navbar-default").css("display", "block");
			$(".inner_schedule .schedule form").attr("action", "addschedule.do");
			$(".inner_schedule .schedule .form-group input[name=title]").val("").attr("readonly", false);
			$(".inner_schedule .schedule .form-group input[name=date]").val("").attr("readonly", false).attr("id", "testDatepicker");
			$(".inner_schedule .schedule .form-group textarea[name=content]").val("");
		});
		
		$(".inner_schedule .schedule .submit_btn").on("click", function() {			
			if(!$(".inner_schedule .schedule input[name=lat]").val()) {
				alert("장소를 검색하거나 지도에 원하는 지점을 클릭해 주세요.");
				return false;
			}			
		});
		
		$(".schedule_detail .schedule_detail_header .schedule_update").on("click", function() {			
			var title = $(".schedule_detail .title").text();
			var content = $(".schedule_detail .content").text();
			var dday = $(".schedule_detail .dday").text();
			
			$(".schedule_bg").css("left", "0");
			$(".inner_schedule").css("left", "50%");
			$(".navbar-default").css("display", "none");
			
			$(".inner_schedule .schedule .form-group input[name=title]").val(title).attr("readonly", true);
			$(".inner_schedule .schedule .form-group input[name=date]").val(dday).attr("readonly", true).attr("id", "");
			$(".inner_schedule .schedule .form-group textarea[name=content]").val(content);		
			$(".inner_schedule .schedule form").attr("action", "updateschedule.do");		
		});
		
		$(".schedule_detail .schedule_detail_header .schedule_delete").on("click", function() {			
			var title = $(".schedule_detail .title").text();
			var dday = $(".schedule_detail .dday").text();
			
			$.ajax({
				type:"post",
				url:"delschedule.do",
				data:"soup_no=${soupNo }&title=" + title + "&dday=" + dday,
				success:function(msg) {
					location.reload();
				},error:function(statusCode) {
					alert("error : " + statusCode.status);
				}
			});
			
		});

	});
	
</script>
<script src="resources/js/moment.min.js"></script>
<script src="resources/js/fullcalendar.js"></script>
<script src="resources/js/ko.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=vkp4Ijrl6FMIwdNAqZjl&submodules=panorama,geocoder,drawing,visualization"></script>
<script>
	/* Calendar */
	$(document).ready(function() {
	  
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		$('#calendar').fullCalendar({
		  header: {
			left: 'prev',
			center: 'title',
			right: 'next'
		  },
		  businessHours: true,
		  editable: true,
		   events: [
			   ${schedule}
		  ],
		  eventClick: function(date, jsEvent, view) {
		      
		      var eventDate = moment(date.start).format('YYYYMMDD');
		      
		      $.ajax({
					type:"post",
					url:"dateList.do",
					data:"soup_no=${soupNo }&dday=" + eventDate,
					dataType:"json",
					success:function(data) {						
						var jsonData = data;
						
						$(".schedule_list .list tbody").find("tr").remove();	
						$(".schedule_detail .schedule_detail_header button").css("display", "none");
						$(".schedule_detail .dday").text("")
						$(".schedule_detail .title").text("")
						$(".schedule_detail .write_date").text("")
						$(".schedule_detail .content").text("")
						
						$("#Dmap").children().remove()
						
						for(var i=0; i < jsonData.jsonObjAll.length; i++) {
							
							$(".schedule_list .list tbody").append("<tr>"										
									+"<td class='listTitile'>" + jsonData.jsonObjAll[i].title + "</td>"
									+"<td class='listDday'>" + jsonData.jsonObjAll[i].dday + "</td>"
									+"<td>" + jsonData.jsonObjAll[i].writeDate + "</td>"
							+"</tr>");
							
						}
						
						$(".schedule_list .list table td.listTitile").on("click", function() {
							
							var title = $(this).text();
							var dday = $(this).parent().find("td.listDday").text();
							
							$.ajax({
								type:"post",
								url:"dateDetail.do",
								data:"soup_no=${soupNo }&dday=" + dday + "&title=" + title,
								dataType:"json",
								success:function(data) {
									
									var jsonData = data;
									
									$(".schedule_detail .schedule_detail_header button").css("display", "block");
									$(".schedule_detail .dday").text(data.dday);
									$(".schedule_detail .title").text(data.title);
									$(".schedule_detail .write_date").text(data.writeDate + " 작성됨");
									$(".schedule_detail .content").text(data.content);
									
									$("#Dmap").children().remove();
									
									var map = new naver.maps.Map('Dmap', {
									    center: new naver.maps.LatLng(data.lat, data.lng),
									    zoomControl: true,
									    zoom: 12
									});

									var marker = new naver.maps.Marker({
									    position: new naver.maps.LatLng(data.lat, data.lng),
									    map: map,
									    animation: naver.maps.Animation.BOUNCE
									});

									
								},error:function(statusCode) {
									alert("error : " + statusCode.status);
								}
							});
							
						});
						
					},error:function(statusCode) {
						alert("error : " + statusCode.status);
					}
				});
		      
		      return false;
		     }
		});
		
	});
		
</script>
<div class="schedule_bg"></div>
<div class="inner_schedule">
	<div class="schedule">				
		<form action="addschedule.do" method="post">
			<input type="hidden" name="lat" value="">
			<input type="hidden" name="lng" value="">
			<input type="hidden" name="member_no" value="${login.memberNo }">
			<input type="hidden" name="soup_no" value="${soupNo }">
			<div class="form-group">		
				<label>제목 : </label>
				<input class="form-control" type="text" name="title" placeholder="제목을 입력해주세요." required="required">
			</div>
			<div class="form-group">
				<label>상세내용 : </label>
				<textarea rows="6" class="form-control" name="content" placeholder="내용을 입력해주세요." required="required"></textarea>
			</div>
			<div class="form-group">
				<label>예정일 : </label>
				<input class="form-control" type="text" id="testDatepicker" name="date" placeholder="스터디 모임 예정일을 선택해 주세요." required="required">
			</div>		
			<div class="form-group">
				<label>주소 : </label>
				<input class="form-control" id="address" type="text" placeholder="장소를 검색하거나 지도에 원하는 지점을 클릭해 주세요.">
				<button type="button" class="btn btn-default search_btn" onclick="searchAD()">검색</button>
			</div>
			<div id="Imap" style="width:100%;height:300px;"></div>			
			<div class="form-group">
				<input class="btn btn-default submit_btn" type="submit" value="일정 작성완료">
				<button type="button" class="btn btn-default cancel_btn">일정 작성취소</button>
			</div>		
		</form>
	</div>
</div>
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
			<h4><strong>스터디 일정</strong></h4>
			<div class="matter">
				<div class="row">
					<div class="col-md-12">
					<!-- Widget -->
						<div class="widget wred">
						<!-- Widget title -->
							<div class="widget-content">
									  <!-- Widget content -->
								<div class="padd">
											<!-- Below line produces calendar. I am using FullCalendar plugin. -->
									<div id="calendar"></div>
								</div>
							</div>
						</div> 
					</div>
				</div>
			</div>
			<c:if test="${myPosition=='L' }">
				<div class="addschedule_btn"><button type="button" class="btn btn-default"><strong>일정추가</strong></button></div>
			</c:if>			
			<div class="schedule_list">
				<div class="schedule_list_title"><h4><strong>일정리스트</strong></h4></div>
				<div class="list table-responsive">
					<table class="table table-hover list">
						<colgroup>
							<col width="50%">
						    <col width="25%">
						    <col width="25%">
						</colgroup>
						<thead>
							<tr>
								<th>제목</th>
								<th>일정일</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
			<div class="schedule_detail">
				<div class="schedule_detail_header clearfix">
					<div><h4><strong>일정상세내용</strong></h4></div>
					<c:if test="${myPosition=='L' }">
						<button type="button" class="btn btn-default schedule_update">일정 수정</button>
						<button type="button" class="btn btn-warning schedule_delete">일정 삭제</button>
					</c:if>					
				</div>				
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12"><h4><strong>일정일</strong> : <small class="dday"></small></h4></div>
					<div class="col-xs-2 col-sm-2 col-md-1"><h4><strong>제목</strong></h4></div>
					<div class="col-xs-10 col-sm-7 col-md-8"><h5 class="title"></h5></div>
					<div class="col-xs-12 col-sm-3 col-md-3 text-right"><h6><small class="write_date"></small></h6></div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12"><h4><strong>내용:</strong></h4></div>
					<div class="col-xs-12 col-sm-12 col-md-12"><textarea readonly="readonly" class="lead content form-control" rows="6"></textarea></div>
				</div>
				<div id="mapCanvas">
					<h4><strong>지도위치:</strong></h4>
					<div id="Dmap" style="width:100%;height:400px;"></div>
				</div>
			</div>
		</div>
	</div>	
</section>
<script>
	var position = new naver.maps.LatLng(37.5641759, 126.9770509);
	
	var map = new naver.maps.Map('Imap', {
		zoomControl: true,
	    center: position,
	    zoom: 10
	});
	
	var marker = new naver.maps.Marker({
	    position: position,
	    map: map
	});
	
	var infoWindow = new naver.maps.InfoWindow({
	    anchorSkew: true
	});
	
	naver.maps.Event.addListener(map, 'click', function(e) {
	    marker.setPosition(e.latlng);
	    searchCoordinateToAddress(e.coord);
	});
	
	function searchCoordinateToAddress(latlng) {
	    
	    infoWindow.close();
	    
	    naver.maps.Service.reverseGeocode({
	        location: latlng	        
	    }, function(status, response) {
	    	
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }
	        
	        $(".schedule input[name=lat]").val(response.result.userquery.split(",")[1]);
	        $(".schedule input[name=lng]").val(response.result.userquery.split(",")[0]);
	    });
	}
	
	function searchAD() {
		
		var data = $("#address").val();

		$.ajax({
			type:"get",
			url:"searchAD.do",
			data:"address=" + data,
			success:function(data) {
				
				var address = data.searchAddress;
				
				naver.maps.Service.geocode({
			        address: address
			    }, function(status, response) {
			    	
			        if (status === naver.maps.Service.Status.ERROR) {
			            return alert('Something Wrong!');
			        }

			        var item = response.result.items[0],
			            point = new naver.maps.Point(item.point.x, item.point.y);

			        marker.setPosition(point);
			        map.setCenter(point);
			       			        
			        $(".schedule input[name=lat]").val(point.y);
			        $(".schedule input[name=lng]").val(point.x);
			    });

			},error:function(statusCode) {
				alert("error : " + statusCode.status);
			}
		});
		
	}
</script>