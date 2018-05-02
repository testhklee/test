<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<style>
	select.form-control{
		float: left;
		width: 200px;
		height: 100px;
	}
	input.form-control{
		float: left;
		width: 280px;
	}
	#soupMemberMax,#soupMemberMin{
		height: 45px;
	}
	#backBtn {
		background-color: #82ca9c;
	}
</style>

<script type="text/javascript" src="https://cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
<script type="text/javascript" src="resources/js/soupCreate.js"></script>
<script type="text/javascript">

	
	$(function(){
		CKEDITOR.config.width = 1000;
		CKEDITOR.config.height = 500;
		CKEDITOR.config.language = 'ko';
		
	    CKEDITOR.replace( 'soupContent', {//해당 이름으로 된 textarea에 에디터를 적용
	        
	        filebrowserImageUploadUrl: 'searchUpload.do?' //여기 경로로 파일을 전달하여 업로드 시킨다.
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

<section id="price" class="price sections">
  <div class="padd container">
	<h1>스터디 생성</h1>
	<!-- Form starts.  -->
		<form class="form-horizontal" action="createPs.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="soupGubun" value="PS"/>
			<input type="hidden" name="memberNo" value="${login.memberNo}"/>
			<div class="form-group">
			  <label class="col-md-2 control-label">작성자</label>
			  <div class="col-md-8">
				<input type="text" class="form-control" disabled="disabled" value="${login.memberName }">
			  </div>
			</div>
			<div class="form-group">
			  <label class="col-md-2 control-label">스터디 이름</label>
			  <div class="col-md-8">
				<input type="text" class="form-control" required="required" id="soupTitle" name="soupTitle" placeholder="스터디 이름을 입력하세요">
			  </div>
			</div>
			<div class="form-group">
			  <label class="col-md-2 control-label">스터디 분류</label>
			  <div class="col-md-8">
				<select multiple="multiple" name="soupField1" id="soupField1" class="form-control" required="required">
					<option value="취업">취업</option>
					<option value="어학">어학</option>
					<option value="프로그래밍">프로그래밍</option>
					<option value="자기계발">자기계발</option>
					<option value="고시">기타</option>
				</select>
				<select multiple="multiple" name="soupField2" id="soupField2" class="form-control" required="required">
				</select>
			  </div>
			</div>
			<div class="form-group">
			  <label class="col-md-2 control-label">지역(시/도/군/구)</label>
			  <div class="col-md-8">
				<select multiple="multiple" name="soupAddr1" id="soupAddr1" class="form-control" required="required">
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
				<select multiple="multiple" name="soupAddr2" id="soupAddr2" class="form-control" required="required">
				</select>
			  </div>
			</div>            
			<div class="form-group">
			  <label class="col-md-2 control-label">스터디 기간</label>
			  <div class="col-md-8">
				<input type="date" class="form-control" id="soupStartDate" name="soupStartDate" required="required">
				<input type="date" class="form-control" id="soupEndDate" name="soupEndDate" required="required">
			  </div>
			</div>                         
			<div class="form-group">
			  <label class="col-md-2 control-label">스터디 요일</label>
			  <div class="col-md-8">
			  	<input type="hidden" id="soupDay" name="soupDay"/>
				<label class="checkbox-inline">
				  <input type="checkbox" name="dayAll" value="전체"> 전체
				</label>
				<label class="checkbox-inline">
				  <input type="checkbox" name="dayChk" value="월"> 월
				</label>
				<label class="checkbox-inline">
				  <input type="checkbox" name="dayChk" value="화"> 화
				</label>
				<label class="checkbox-inline">
				  <input type="checkbox" name="dayChk" value="수"> 수
				</label>
				<label class="checkbox-inline">
				  <input type="checkbox" name="dayChk" value="목"> 목 
				</label>
				<label class="checkbox-inline">
				  <input type="checkbox" name="dayChk" value="금"> 금 
				</label>
				<label class="checkbox-inline">
				  <input type="checkbox" name="dayChk" value="토"> 토
				</label>
				<label class="checkbox-inline">
				  <input type="checkbox" name="dayChk" value="일"> 일
				</label>
			  </div>
			</div>
			<div class="form-group">
			  <label class="col-md-2 control-label">스터디 시간</label>
			  <div class="col-md-8">
				<input type="time" class="form-control" id="soupStartTime" name="soupStartTime" required="required">
				<input type="time" class="form-control" id="soupEndTime" name="soupEndTime" required="required">
			  </div>
			</div>
			<div class="form-group">
			  <label class="col-md-2 control-label">최대/최소 인원</label>
			  <div class="col-md-8">
				<select name="soupMemberMax" id="soupMemberMax" class="form-control" required="required">
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				<select name="soupMemberMin" id="soupMemberMin" class="form-control" required="required">
					<option value="1">1</option>
				</select>
			  </div>
			</div>            
			<div class="form-group">
			  <label class="col-md-2 control-label">스터디 마감 기간</label>
			  <div class="col-md-8">
				<input type="date" class="form-control" id="soupRecruitEndDate" name="soupRecruitEndDate" required="required">
				<input type="time" class="form-control" id="soupRecruitEndTime" name="soupRecruitEndTime" required="required">
			  </div>
			</div>
			<div class="form-group">
			  <label class="col-md-2 control-label">스터디 금액</label>
			  <div class="col-md-8">
				<input type="number" class="form-control" id="soupPrice" name="soupPrice" required="required">
			  </div>
			</div>
			<div class="form-group">
			  <label class="col-md-2 control-label">동영상</label>
			  <div class="col-md-8">
				<input type="file" class="form-control" id="upload" name="upload">
			  </div>
			</div>
			<div class="form-group">
			  <label class="col-md-2 control-label">본문</label>
			  <div class="col-md-8">
				<textarea name="soupContent" id="ckeditor" required="required"></textarea>
			  </div>
			</div>
			<div class="form-group">
			  <div class="col-md-offset-2 col-md-8">
				<button type="submit" class="btn btn-success">확인</button>
				<button type="button" id="backBtn" class="btn btn-primary">취소</button>
			  </div>
			</div>
		</form>
 	</div>
 </section> 