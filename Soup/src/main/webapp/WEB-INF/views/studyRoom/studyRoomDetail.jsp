<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ksPIa8XN8Z9UIW6m9_4J&submodules=geocoder"></script>

<div class="container" style="margin-bottom: 120px;">

	<h2 style="margin-top: 50px;"><b style="font-size: 80%; margin-left: 50px; color: #92e3af">스터디룸 소개</b></h2>
	
		<div
			style="border: 1.4px solid #92e3af; background-color: #92e3af; width: 18%; height: 1px; float: left">
		</div>
		
		<div
			style="border: 1.4px solid #92e3af; background-color: #F7817E; margin-botton:100px; width:77%; height: 1px; margin-left: 55px; float: left">
		</div>
		
	<div class="col-sm-6" style="margin-top: 50px;">
		<img alt="studyRoom" src="${studyRoom.studyRoomThumbnail }"  style="width: 490px; height: 300px;">
		<table style="margin-top: 10px;">
		      		<tr class="input-group">
		      			<th class="input-group-addon" style="background-color: #92e3af; color : white; font-size: 14px; height: 40px;">이 름</th>
		      			<td class="form-control" style="font-size: 14px; width: 432px; height: 40px;" >${studyRoom.studyRoomName }</td>
		      		</tr>
		      		<tr class="input-group">
		      			<th class="input-group-addon" style="background-color: #92e3af; color : white; font-size: 14px; height: 40px;">비 용</th>
		      			<td class="form-control" style="font-size: 14px; width: 432px; height: 40px;" >${studyRoom.studyRoomAddr1 } ${dto.studyRoomAddr2 }</td>
		      		</tr>
		      		<tr class="input-group">
		      			<th class="input-group-addon" style="background-color: #92e3af; color : white; font-size: 14px; height: 40px;">지 역</th>
		      			<td class="form-control" style="font-size: 14px; width: 432px; height: 40px;" >${studyRoom.studyRoomPrice }</td>
		      		</tr>
		      	</table>
	
	</div>
	<div class="col-sm-6" style="margin-top: 50px;">
		<div id="map" style="width: 570px; height: 420px;"></div>
	</div>
	
	
	<div class="col-sm-12" align="center" style="margin-top: 50px;">
		
		${studyRoom.studyRoomContent }
	</div>
</div>

<script>
$(function(){ 
	var map = new naver.maps.Map('map');
	
	$(document).ready(function assdasd(){
		   var map = new naver.maps.Map('map');
		   var myaddress = '${studyRoom.studyRoomAddr}';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
		      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
		          if (status !== naver.maps.Service.Status.OK) {
		              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
		          }
		          var result = response.result;
		          // 검색 결과 갯수: result.total
		          // 첫번째 결과 결과 주소: result.items[0].address
		          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
		          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
		          
		          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
		          // 마커 표시
		          var marker = new naver.maps.Marker({
		            position: myaddr,
		            map: map
		          });
		          // 마커 클릭 이벤트 처리
		          naver.maps.Event.addListener(marker, "click", function(e) {
		            if (infowindow.getMap()) {
		                infowindow.close();
		            } else {
		                infowindow.open(map, marker);
		            }
		          });
		      });
	});
});
</script>



