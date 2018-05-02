<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<script type="text/javascript"
	src="https://cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
<div class="container">
	<script type="text/javascript">
		function jusoCallBack(address2) {
			document.form.address2.value = address2;
		}
	</script>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ksPIa8XN8Z9UIW6m9_4J&submodules=geocoder"></script>
<form action="studyRoomInsert.do" method="post" class="form-horizontal" enctype="multipart/form-data">
	<div class="col-sm-6">
		<img id=preview src="resources\upload\studyRoom\초기 사진.jpg" style="width: 490px; height: 300px;">	
			<input type="file" name="file" id="file" accept="image/*"> <br>
		<!-- </form>
		<form action="studyRoomInsert.do" method="post" class="form-horizontal"> -->
			이름 <input type="text" required="required" name="studyRoomName"><br>
			비용 <input type="text" required="required" name="studyRoomPrice"><br>
			지역 <select class="addr1" required="required" name="studyRoomAddr1">
				<option value="시/도">시/도</option>
				<option value="서울특별시">서울특별시</option>
				<option value="인천광역시">인천광역시</option>
				<option value="대전광역시">대전광역시</option>
				<option value="광주광역시">광주광역시</option>
				<option value="대구광역시">대구광역시</option>
				<option value="울산광역시">울산광역시</option>
				<option value="부산광역시">부산광역시</option>
				<option value="경기도">경기도</option>
				<option value="강원도">강원도</option>
				<option value="충청북도">충청북도</option>
				<option value="충청남도">충청남도</option>
				<option value="전라북도">전라북도</option>
				<option value="전라남도">전라남도</option>
				<option value="경상북도">경상북도</option>
				<option value="경상남도">경상남도</option>
				<option value="제주도">제주도</option>
			</select> <select class="addr2" required="required" name="studyRoomAddr2">
				<option value="시/군/구">시/군/구</option>
			</select> <br> 위치 <input type="text" id="address2" onclick="Address()"
				name="studyRoomAddr" required="required"><br>
		<!-- </form> -->
	</div>
	<div class="col-sm-6">
		<div id="map" style="width: 570px; height: 420px;"></div>
	</div>

	<!-- <form id="editorForm" method="post"
		action="studyRoomInsert.do"> -->
		<div class="form-group">
			<div class="form-group">
				<div class="col-lg-12" align="center">
					<textarea name="studyRoomContent" id="ckeditor"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-12" align="right">
					<!-- <input type="button" onclick="multiForm()" class="btn btn-default" value="작성"> -->
					<button type="submit" class="btn btn-default">작성 </button>
				</div>
			</div>
			
		</div>
</form>
			
</div>
<script>

	$(".addr1").change(function changeAddr() {
		var $addr1 = $(".addr1");
		var $addr2 = $(".addr2");
		var addrData={
			"서울특별시" : ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"],
			"인천광역시" : ["강화군","계양구","남구","남동구","동구","부평구","서구","연수구","옹진군","중구"],
			"대전광역시" : ["대덕구","동구","서구","유성구","중구"],
			"광주광역시" : ["광산구","남구","동구","북구","서구"],
			"대구광역시" : ["남구","달서구","동구","북구","서구","수성구","중구","달성군"],
			"울산광역시" : ["남구","동구","북구","중구","울주군"],
			"부산광역시" : ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"],
			"경기도" : ["가평군","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","양평군","여주군","여주시","연천군","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천군","포천시","하남시","화성시"],
			"강원도" : ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"],
			"충청북도" : ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"],
			"충청남도" : ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"],
			"전라북도" : ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"],
			"전라남도" : ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"],
			"경상북도" : ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"],
			"경상남도" : ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"],
			"제주도" : ["서귀포시","제주시","남제주군","북제주군"]
		}
		
		$addr2.empty();
		$addr2.append("<option value=''>시/군/구</option>");
		
		$.each(addrData[$addr1.val()], function(index, val){
			$addr2.append("<option>" + val + "</option>");
		});	
	});
	
	var file = document.querySelector('#file');
	
	file.onchange = function () { 
	    var fileList = file.files ;
	    
	    // 읽기
	    var reader = new FileReader();
	    reader.readAsDataURL(fileList [0]);
	
	    //로드 한 후
	    reader.onload = function  () {
	        document.querySelector('#preview').src = reader.result ;
	    }; 
	    
	}; 
	
  function Address() {
      window.open("localList.do", "pop", "width=470,height=220");
   };
   
   var map = new naver.maps.Map('map');
   
   function assdasd(address2){
	   var map = new naver.maps.Map('map');
	   var myaddress = address2;// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
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
   };
   
   $(function(){
	    
		CKEDITOR.config.width = 1180;
		CKEDITOR.config.height = 500;
		CKEDITOR.config.language = 'ko';
		
	    CKEDITOR.replace( 'studyRoomContent', {//해당 이름으로 된 textarea에 에디터를 적용
	        
	        filebrowserImageUploadUrl: 'Upload.do' //여기 경로로 파일을 전달하여 업로드 시킨다.
	    });
	     
	     
	    CKEDITOR.on('dialogDefinition', function( ev ){
	        var dialogName = ev.data.name;
	        var dialogDefinition = ev.data.definition;
	      
	        switch (dialogName) {
	            case 'image': //Image Properties dialog
	                //dialogDefinition.removeContents('info');
	                dialogDefinition.removeContents('Link');
	                dialogDefinition.removeContents('advanced');
	                break;
	        }
	    });
	     
	});
   </script>
