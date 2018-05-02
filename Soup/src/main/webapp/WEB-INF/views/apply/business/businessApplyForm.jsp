<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비지니스 신청</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/vendor/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="https://cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
</head>
<body>
	
	<h2>비지니스 신청 양식</h2>
	
	<form action="businessApplyInsert.do" method="post" class="frm">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>${login.memberName }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${login.memberTel }</td>
			</tr>
		</table>
		<div>제출 서류 (사업자 등록증) 및 간단한 소개</div>
		<textarea class="businessDoc" id="ckeditor" name="businessDoc" required="required"></textarea>
		<button class="btn btn-default" style="margin-left: 50%; margin-top: 10px ">제출</button>
	</form>
	
	<script type="text/javascript">
	$(function(){
	    
		CKEDITOR.config.width = 690;
		CKEDITOR.config.height = 300;
		CKEDITOR.config.language = 'ko';
		
	    CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
	        
	        filebrowserImageUploadUrl: 'businessApplyInsertCK.do' //여기 경로로 파일을 전달하여 업로드 시킨다.
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
	     
	});
	</script>
	
</body>
</html>