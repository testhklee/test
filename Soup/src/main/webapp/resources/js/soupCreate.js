
$(function() {

	document.addEventListener('keydown', function(event) {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	    }
	}, true);

	var fieldData = {
			"취업" : [ "토익", "토익스피킹", "토플", "오픽", "인적성", "면접", "자기소개서", "대외활동", "공모전" ],
			"어학" : [ "영어", "일본어", "중국어", "스페인어", "독일어", "프랑스어", "아랍어", "러시아어", "이탈리아어", "기타" ],
			"프로그래밍" : [ "JAVA", "C/C++", "Python", "Budy", "Android", "Objective-C", "LINUX", "웹프로그래밍", "게임프로그래밍", "시스템프로그래밍", "임베디드", "데이터베이스", "빅데이터", "소프트웨어공학", "기타" ],
			"자기계발" : [ "발표", "자격증", "악기", "바리스타", "베이킹", "번역", "기타" ],
			"고시" : [ "사법", "행정", "외무", "CPA", "공무원", "임용", "감정평가사", "공인노무사", "변리사", "세무사", "기타" ],
			"기타" : [ "이민", "입시", "기타" ],
	}
	
	var addrData = {
			"서울특별시" : [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ],
			"인천광역시" : [ "강화군", "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "옹진군", "중구" ],
			"대전광역시" : [ "대덕구", "동구", "서구", "유성구", "중구" ],
			"광주광역시" : [ "광산구", "남구", "동구", "북구", "서구" ],
			"대구광역시" : [ "남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군" ],
			"울산광역시" : [ "남구", "동구", "북구", "중구", "울주군" ],
			"부산광역시" : [ "강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군" ],
			"경기도" : [ "가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천군", "포천시", "하남시", "화성시" ],
			"강원도" : [ "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군" ],
			"충청북도" : [ "제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군" ],
			"충청남도" : [ "계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군" ],
			"전라북도" : [ "군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군" ],
			"전라남도" : [ "광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군" ],
			"경상북도" : [ "경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ],
			"경상남도" : [ "거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군" ],
			"제주도" : [ "서귀포시", "제주시", "남제주군", "북제주군" ]
	}
	
	 var soupMember={
			"2" : ["1"],
			"3" : ["1","2"],
			"4" : ["1","2","3"],
			"5" : ["1","2","3","4"],
			"6" : ["1","2","3","4","5"],
			"7" : ["1","2","3","4","5","6"],
			"8" : ["1","2","3","4","5","6","7"],
			"9" : ["1","2","3","4","5","6","7","8"],
			"10" : ["1","2","3","4","5","6","7","8","9"],
			"11" : ["1","2","3","4","5","6","7","8","9","10"],
			"12" : ["1","2","3","4","5","6","7","8","9","10","11"]
	}
	
	if($("#thisView").val()=='updateForm'){
	   
		$("#soupField1").val($("#Field1").val());
	    $.each(fieldData[$("#soupField1").val()], function(index, val){
	    	$("#soupField2").append("<option>" + val + "</option>");
			 $("#soupField2").val($("#Field2").val());
		});	
	    
	    if($("#Addr1").val() != ""){
		    $("#soupAddr1").val($("#Addr1").val());
		    $.each(addrData[$("#soupAddr1").val()], function(index, val){
		    	$("#soupAddr2").append("<option>" + val + "</option>");
				 $("#soupAddr2").val($("#Addr2").val());
			});	
	    }
	    
	    var soupDay = $("#Day").val();
	    var soupDaySplit = soupDay.split(" ");
	    $("input[name=dayChk]").each(function() {
			for(var i in soupDaySplit){
				if($(this).val()==soupDaySplit[i]){
					$(this).prop("checked",true);
				}
			}
		});
	    
	    $("#soupMemberMax").val($("#MemberMax").val());
	    $.each(soupMember[$("#soupMemberMax").val()], function(index, val){
	    	$("#soupMemberMin").append("<option>" + val + "</option>");
			 $("#soupMemberMin").val($("#MemberMin").val());
		});	
		
		$("#backBtn").click(function(){
			location.href="detailForm.do?soupNo="+$("#soupNo").val();
		});
		
    }
	
	
	$("#soupField1").change(function() {
		var select = $("#soupField1").val();
		if (select.length >= 2) {
			alert("하나만 선택해 주세요");
			return false;
		}
		var $field1 = $("#soupField1");
		var $field2 = $("#soupField2");
		
		$field2.empty();
		$.each(fieldData[$field1.val()], function(index, val) {
			$field2.append("<option>" + val + "</option>");
		});
	});

	$("#soupField2").change(function() {
		var select = $("#soupField2").val();
		if (select.length >= 2) {
			alert("하나만 선택해 주세요");
			return false;
		}
	});

	if($("#soupGubun").val()!='P'){
		$("#soupAddr1").change(function() {
			var select = $("#soupAddr1").val();
			if (select.length >= 2) {
				alert("하나만 선택해 주세요");
				return false;
			}
			var $addr1 = $("#soupAddr1");
			var $addr2 = $("#soupAddr2");
			
			$addr2.empty();
			$.each(addrData[$addr1.val()], function(index, val) {
				$addr2.append("<option>" + val + "</option>");
			});
		});
	
		$("#soupAddr2").change(function() {
			var select = $("#soupAddr2").val();
			if (select.length >= 2) {
				alert("하나만 선택해 주세요");
				return false;
			}
		});
	}

	$("#soupStartDate").change(function() {
		var now = new Date();
		var nowTime = now.getFullYear();
		nowTime += '-' + (now.getMonth() + 1);
		nowTime += '-' + (now.getDate() + 1);

		var soupStartDate = $("#soupStartDate").val();

		var now = new Date(nowTime);
		var start = new Date(soupStartDate);

		if (start < now) {
			alert("오늘 이후 날짜를 선택해 주세요");
			return false;
		} else {
			$("#soupEndDate").val(soupStartDate);
		}
	});

	$("#soupEndDate").change(function() {
		var soupStartDate = $("#soupStartDate").val();
		var soupEndDate = $("#soupEndDate").val();

		var start = new Date(soupStartDate);
		var end = new Date(soupEndDate);

		if (end < start) {
			alert("시작 또는 이후 날짜를 선택해 주세요");
		}
	});

	$("#soupMemberMax").change(function() {
		var $soupMemberMax = $("#soupMemberMax");
		var $soupMemberMin = $("#soupMemberMin");
		var soupMember = {
			"2" : [ "1" ],
			"3" : [ "1", "2" ],
			"4" : [ "1", "2", "3" ],
			"5" : [ "1", "2", "3", "4" ],
			"6" : [ "1", "2", "3", "4", "5" ],
			"7" : [ "1", "2", "3", "4", "5", "6" ],
			"8" : [ "1", "2", "3", "4", "5", "6", "7" ],
			"9" : [ "1", "2", "3", "4", "5", "6", "7", "8" ],
			"10" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9" ],
			"11" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" ],
			"12" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11" ]
		}
		$soupMemberMin.empty();
		$.each(soupMember[$soupMemberMax.val()], function(index, val) {
			$soupMemberMin.append("<option>" + val + "</option>");
		});
	});

	$("#soupRecruitEndDate").change(function() {
		var now = new Date();
		var nowTime = now.getFullYear();
		nowTime += '-' + (now.getMonth() + 1);
		nowTime += '-' + (now.getDate() + 1);

		var soupRecruitEndDate = $("#soupRecruitEndDate").val();
		var soupStartDate = $("#soupStartDate").val();

		var recruitNow = new Date(nowTime);
		var recruitStart = new Date(soupStartDate);
		var recruitEnd = new Date(soupRecruitEndDate);
		if (recruitEnd < recruitNow || recruitEnd > recruitStart) {
			alert("오늘 이후 / 시작 이전 날짜를 선택해 주세요");
			return false;
		}
	});

	$("#soupPrice").change(function() {
		if ($("#soupPrice").val() < 100) {
			alert("100원 이상 입력해 주세요");
			$(this).focus();
			return false;
		}
	});

	$("input[name=dayAll]").click(function() {
		if ($("input[name=dayAll]")[0].checked) {
			for (var i = 0; i < $("input[name=dayChk]").length; i++) {
				$("input[name=dayChk]")[i].checked = true;
			}
			;
		} else {
			for (var i = 0; i < $("input[name=dayChk]").length; i++) {
				$("input[name=dayChk]")[i].checked = false;
			}
			;
		}
	});

	$("input[name=dayChk]").click(function() {
		for (var i = 0; i < $("input[name=dayChk]").length; i++) {
			if ($("input[name=dayChk]")[i].checkd = true) {
				$("input[name=dayAll]")[0].checked = false;
			}
		}
	});

	$(".form-horizontal").submit(function() {
		var day = "";
		$("input[name=dayChk]:checked").each(function() {
			day += $(this).val() + " ";
		});
		$("#soupDay").val(day);
		
		var select = $("#soupField1").val();
		if (select.length >= 2) {
			alert("하나만 선택해 주세요");
			$("#soupField1").focus();
			return false;
		}
		
		var select = $("#soupField2").val();
		if (select.length >= 2) {
			alert("하나만 선택해 주세요");
			$("#soupField2").focus();
			return false;
		}
		
		if($("#soupGubun").val()!='P'){
			var select = $("#soupAddr1").val();
			if (select.length >= 2) {
				alert("하나만 선택해 주세요");
				$("#soupAddr1").focus();
				return false;
			}
			
			var select = $("#soupAddr2").val();
			if (select.length >= 2) {
				alert("하나만 선택해 주세요");
				$("#soupAddr2").focus();
				return false;
			}
		}
		
		var now = new Date();
		var nowTime = now.getFullYear();
		nowTime += '-' + (now.getMonth() + 1);
		nowTime += '-' + (now.getDate() + 1);

		var soupStartDate = $("#soupStartDate").val();

		var now = new Date(nowTime);
		var start = new Date(soupStartDate);

		if (start < now) {
			alert("오늘 이후 날짜를 선택해 주세요");
			$("#soupStartDate").focus();
			return false;
		}
		
		soupStartDate = $("#soupStartDate").val();
		var soupEndDate = $("#soupEndDate").val();

		start = new Date(soupStartDate);
		var end = new Date(soupEndDate);

		if (end < start) {
			$("#soupEndDate").focus();
			alert("시작 또는 이후 날짜를 선택해 주세요");
			return false;
		}

		now = new Date();
		nowTime = now.getFullYear();
		nowTime += '-' + (now.getMonth() + 1);
		nowTime += '-' + (now.getDate() + 1);

		var soupRecruitEndDate = $("#soupRecruitEndDate").val();
		var soupStartDate = $("#soupStartDate").val();

		var recruitNow = new Date(nowTime);
		var recruitStart = new Date(soupStartDate);
		var recruitEnd = new Date(soupRecruitEndDate);
		if (recruitEnd < recruitNow || recruitEnd > recruitStart) {
			alert("오늘 이후 / 시작 이전 날짜를 선택해 주세요");
			$("#soupRecruitEndDate").focus();
			return false;
		}
		
		if ($("#soupPrice").val() < 100) {
			alert("100원 이상 입력해 주세요");
			$(this).focus();
			return false;
		}
		
		if ($("#upload").val()==""){
			alert("동영상을 업로드 해주세요");
			return false;
		}
	});

});