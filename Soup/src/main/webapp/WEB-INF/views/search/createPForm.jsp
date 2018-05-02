<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
		<form class="form-horizontal" action="createP.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="soupGubun" id="soupGubun" value="P"/>
			<input type="hidden" name="memberNo" value="${login.memberNo}"/>
			<div class="form-group">
			  <label class="col-md-2 control-label">작성자</label>
			  <div class="col-md-8">
				<input type="text" class="form-control" disabled="disabled" value="${login.memberName }">
			  </div>
			</div>
			<div class="form-group">
			  <label class="col-md-2 control-label">프로젝트 이름</label>
			  <div class="col-md-8">
				<input type="text" class="form-control" required="required" name="soupTitle" id="soupTitle" placeholder="스터디 이름을 입력하세요">
			  </div>
			</div>
			<div class="form-group">
			  <label class="col-md-2 control-label">프로젝트 분류</label>
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
			  <label class="col-md-2 control-label">프로젝트 기간</label>
			  <div class="col-md-8">
				<input type="date" class="form-control" name="soupStartDate" id="soupStartDate" required="required">
				<input type="date" class="form-control" name="soupEndDate" id="soupEndDate" required="required">
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
			  <label class="col-md-2 control-label">프로젝트 마감 기간</label>
			  <div class="col-md-8">
				<input type="date" class="form-control" name="soupRecruitEndDate" id="soupRecruitEndDate" required="required">
				<input type="time" class="form-control" name="soupRecruitEndTime" id="soupRecruitEndTime" required="required">
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