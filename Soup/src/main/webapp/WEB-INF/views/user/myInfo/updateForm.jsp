<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
		
	$("#deleteBtn").click(function(){
		
		var memberEmail=$("#memberEmail").val();
			
		var con=confirm("탈퇴하시겠습니까?")
		if(con==true){
			location.href="userDelete.do?memberEmail="+memberEmail;
			alert("탈퇴가 완료되었습니다.")
		}else{			
		}		
	})
	

	$("#formSty").submit(function(){
		var memberName=$("#memberName").val();
	
		var file=$("#file").val();
		
		if (file=="") {
			$(this).attr("action","userUpdate2.do");		
		}
	});				
});

</script>

<style type="text/css">

#formSty{
	padding-top:20px;
	padding-bottom: 30px;

}

.updateBtn {
	margin-left: 10px;
	margin-right: 10px;
	background-color: #82ca9c;
    color: white;
    border: none;
    width: 100px;
    height: 70px;
	
}

#btnXY	{
	
	text-align:center;
	margin-top:20px;
}

.updatIinputCenter{
	width:450px; 
	margin:0 auto;
}

</style>


<!-- Update -->
<div style="border:2px solid; color:#82ca9c">
</div>

<div style="text-align:center; margin-top:20px">
<b style="font-size:30px">내 정보</b>
 </div>	
	<form action="userUpdate.do" method="POST" enctype="multipart/form-data" id="formSty">
		<div>
		
			<div class="form-group updatIinputCenter">
				<b>이메일</b>
				<input type="email" readonly="readonly" value="${login.memberEmail}" class="placestyle form-control " name="memberEmail" id="memberEmail"/> 						
			</div>	
					
			<div class="form-group updatIinputCenter">
				<b>비밀번호</b>
				<input type="password" required="required" placeholder="Enter password"class="placestyle form-control " name="memberPw" id="memberPw"> 
				<p id="pwCkMsg"></p>
			</div>
			
			<div class="form-group updatIinputCenter">
				<input type="password" required="required" placeholder="Confirm password"class="placestyle form-control " id="memberPwCk"> 
				<p id="pwRe"></p>
			</div>
			
			<div class="form-group updatIinputCenter">
				<b>이름</b>
				<input type="text"  value="${login.memberName}" class="placestyle form-control " name="memberName" id="memberName"> 							
			</div>
			
			<div class="form-group updatIinputCenter">
				<b>H.P</b>
				<input type="text" required="required" readonly="readonly"  value="${login.memberTel}" class="placestyle form-control " name="memberTel" id="memberTel" maxlength="11"> 
				<div id="telCkMsg"></div>
			</div>
			<fmt:formatDate var="strDate" value="${login.memberJoinDate }" pattern="yyyy년 MM월 dd일" />
			<div class="form-group updatIinputCenter">
				<b>가입날짜</b>
				<input type="text" readonly="readonly" value="${strDate}" class="placestyle form-control "> 
			</div>
			<div class="form-group updatIinputCenter">						
				<img id=preview src="${login.memberFace}" style="width: 140px; height: 140px;">			
				<input type="file" name="file" id="file" accept="image/*" class="placestyle form-control " style="margin-right:1px;"> <br/>  
			</div>
														
		</div>
		<div id="btnXY">
			<button type="submit" class="updateBtn" id="updateSuc">수정확인</button>
			<button  class="updateBtn" id="deleteBtn">탈퇴</button>
		</div>
	</form>
	
<script type="text/javascript" src="resources/js/vendor/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        
	      
	        reader.onload = function (e) {
	        	$('#preview').attr('src', e.target.result);
	        }        
	        reader.readAsDataURL(input.files[0]);
	    }	 
	}; 	
	   $("#file").change(function(){
		    readURL(this); 
	    
	    });
});
</script>
	

