<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>



<style>

	.addrDiv, .dayDiv{
		display: none;
	}
	
	select.form-control{
		width: 200px;
		height: 34px;
	}
	.btn-default{
		margin-top: 0px;
		height: 34px;
		width: 40px;
		padding: 0px;
	}
	.input-group{
		width: 300px;
	}
	input.form-control{
		height: 34px;
	}
	#dayDiv{
		border: 1px solid;
		border-color: #ddd;
		width: 300px;
	}
	.allDiv div{
		margin-right: 10px;
		float: left;
	}
</style>


<script type="text/javascript"> 


$(function(){
	
	$(".gubun").change(function(){
		if($(".gubun").val()=='PS'||$(".gubun").val()=='FS'){
			$(".addrDiv").show();
			$(".dayDiv").show();
		}else {
			$(".addrDiv").hide();
			$(".dayDiv").hide();
		}
	});	
	
	// 지역
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
		$addr2.append("<option value=''>전체</option>");
		$.each(addrData[$addr1.val()], function(index, val){
			$addr2.append("<option>" + val + "</option>");
		});	
	});
	
	// 분류
	$(".field1").change(function changeAddr() {
		var $field1 = $(".field1");
		var $field2 = $(".field2");
		var fieldData={
			"취업" : ["토익","토익스피킹","토플","오픽","인적성","면접","자기소개서","대외활동","공모전"],
			"어학" : ["영어","일본어","중국어","스페인어","독일어","프랑스어","아랍어","러시아어","이탈리아어","기타"],
			"프로그래밍" : ["JAVA","C/C++","Python","Budy","Android","Objective-C","LINUX","웹프로그래밍","게임프로그래밍","시스템프로그래밍","임베디드","데이터베이스","빅데이터","소프트웨어공학","기타"],
			"자기계발" : ["발표","자격증","악기","바리스타","베이킹","번역","기타"],
			"고시" : ["사법","행정","외무","CPA","공무원","임용","감정평가사","공인노무사","변리사","세무사","기타"],
			"기타" : ["이민","입시","기타"],
		}
		$field2.empty();
		$field2.append("<option value=''>전체</option>");
		$.each(fieldData[$field1.val()], function(index, val){
			$field2.append("<option>" + val + "</option>");
		});	
	});
	
	$("input[name=all]").click(function() {
		if ($("input[name=all]")[0].checked) {
			for (var i = 0; i < $("input[name=dayChk]").length; i++) {
				$("input[name=dayChk]")[i].checked = true;
			};
		} else {
			for (var i = 0; i < $("input[name=dayChk]").length; i++) {
				$("input[name=dayChk]")[i].checked = false;
			};
		}
	});
	
	
	$("input[name=dayChk]").click(function() {
		for (var i = 0; i < $("input[name=dayChk]").length; i++) {
			if($("input[name=dayChk]")[i].checkd=true){
				$("input[name=all]")[0].checked=false;
			}
		}
	});
	
	$(".filterForm").submit(function(){
		if($(".gubun").val()=="선택"){
			alert("구분을 선택하십시오");
			return false;
		}
		
		var day = "";
		$("input[name=dayChk]:checked").each(function() {
			day+=$(this).val()+" ";
		});
		$("#day").val(day);
	});
});

</script>

<section id="price" class="price sections">
	<form action="searchSoup.do" class="filterForm" method="post">
		<div class="allDiv container">
			<div class="gubunDiv">
				구분
				<select class="form-control gubun" required="required" name="soupGubun">
					<option value="선택">선택</option>
					<option value="PS">유료스터디</option>
					<option value="FS">무료스터디</option>
					<option value="P">프 로 젝 트</option>
				</select>
			</div>
			<div class="fieldDiv">
				분야
				<select class="form-control field1" required="required" name="soupField1">
					<option value="전체">전체</option>
					<option value="취업">취업</option>
					<option value="어학">어학</option>
					<option value="프로그래밍">프로그래밍</option>
					<option value="자기계발">자기계발</option>
					<option value="고시">기타</option>
				</select>
				<select class="form-control field2" name="soupField2">
					<option value="전체">전체</option>
				</select>
			</div>
			<div class="addrDiv">
				지역
				<select class="form-control addr1" required="required" name="soupAddr1">
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
				</select>
				<select class="form-control addr2" name="soupAddr2">
					<option value="시/군/구">시/군/구</option>
				</select>
			</div>
			<div class="dayDiv">
				요일<br/>
				<div id="dayDiv">
					<input type="hidden" id="day" name="soupDay" value=""/>
					<input type="checkbox" name="all" />전체선택
					<input type="checkbox" name="dayChk" value="월"/>월
					<input type="checkbox" name="dayChk" value="화"/>화
					<input type="checkbox" name="dayChk" value="수"/>수
					<input type="checkbox" name="dayChk" value="목"/>목
					<input type="checkbox" name="dayChk" value="금"/>금
					<input type="checkbox" name="dayChk" value="토"/>토
					<input type="checkbox" name="dayChk" value="일"/>일
				</div>
			</div>
			<div class="selectDiv">
				검색
				<select class="form-control select" name="soupSearchSelect">
					<option value="All">전체</option>
					<option value="SOUP_TITLE">제목</option>
					<option value="MEMBER_NAME">리더 이름</option>
					<option value="SOUP_ADDR">장소</option>
				</select>
				<div class="form-group input-group">
                    <input type="text" class="form-control" id="title" name="soupSearchWord" placeholder="어떤 스터디/프로젝트를 찾으시나요?">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
			</div>
		</div>
	</form>
</section>
