<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>티쳐 신청</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/vendor/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="https://cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
</head>
<body>
	
	<h2>티쳐 신청 양식</h2>
	
	<form action="teacherApplyInsert.do" method="post" class="frm" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>${login.memberName }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${login.memberTel }</td>
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td>
					<input type="text" class="dd1" maxlength="6" required="required"> - <input type="text" class="dd2" maxlength="7" required="required">
					<input type="hidden" name="teacherDd" class="teacherDd">
				</td>
			</tr>
			<tr>
				<th>자기소개 동영상</th>
				<td><input type="file" name="file" required="required"></td>
			</tr>
		</table>
		<div>자격증 및 자기 소개</div>
		<textarea id="ckeditor" name="teacherCertificate" required="required"></textarea>
		<button class="btn btn-default" style="margin-left: 50%; margin-top: 10px ">제출</button>
	</form>
	
	<script type="text/javascript">
	$(function(){
	    
		CKEDITOR.config.width = 690;
		CKEDITOR.config.height = 300;
		CKEDITOR.config.language = 'ko';
		
	    CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
	        
	        filebrowserImageUploadUrl: 'teacherApplyInsertCK.do' //여기 경로로 파일을 전달하여 업로드 시킨다.
	    });
	     
	     
	    CKEDITOR.on('dialogDefinition', function( ev ){
	        var dialogName = ev.data.name;
	        var dialogDefinition = ev.data.definition;
	      
	        switch (dialogName) {
	            case 'image':
	                dialogDefinition.removeContents('Link');
	                dialogDefinition.removeContents('advanced');
	                break;
	        }
	    });
	     
	   $(".frm").submit(function() {
		   var dd1 = $(".dd1").val();
		   var dd2 = $(".dd2").val();
		   
		   if (isNaN(Number(dd1)) || isNaN(Number(dd2))) {
			   alert("주민등록번호를 제대로 입력해주세요");
			   return false;
		   } else if (dd1.length !== 6 || dd2.length !== 7) {
			   alert("주민등록번호를 제대로 입력해주세요");
			   return false;
		   } else {
			   $(".teacherDd").val(dd1 + "-" + dd2);
		   }
		   
	   });
	});
	</script>
	
</body>
</html>