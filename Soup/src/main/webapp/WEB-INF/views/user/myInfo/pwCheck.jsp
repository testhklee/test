<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	
	$("#backBtn").click(function(){
		history.back();
	});
	
	$("#loginBtn").click(function(){	
		
		
		var pwCompare=$("#memberPw").val();
		var pwCkCompare=$("#memberPwCk").val();
		var originPw="${login.memberPw}";
		
		if(pwCompare==pwCkCompare && pwCompare==originPw){				
			location.href="updateForm.do";
		}else{			
			alert("잘못입력하셨습니다.")
			location.href="redirect:pwCheck.do";
		}
	});
});

</script>

<style type="text/css">

#pwCheckIn{
	margin-top:50px;
}

#pwCheckB{
	margin-bottom: 180px;
}
</style>

<div style="border:2px solid; color:#82ca9c">
</div>

<div style="text-align: center; margin-top: 150px">
	<b style="font-size:30px">비밀번호 확인</b>
</div>

<div id="pwCheckB">

	<div id="pwCheckIn" style="text-align:center">
		<div class="form-group inputCenter">
			<input type="password" required="required" placeholder="Enter password" class="placestyle form-control input-Form" id="memberPw" > 
			<span class="glyphicon glyphicon-lock iconSpace" style="position: absolute; top: 360px; left:783px;"></span>
		</div>
		<div class="form-group inputCenter">
			<input type="password" required="required" placeholder="Confirm password"class="placestyle form-control input-Form" id="memberPwCk"> 
			<span class="glyphicon glyphicon-lock iconSpace" style="position: absolute; top: 420px; left:783px;"></span>
		</div><br/>
		
	
		<button type="button" class="btn btn-primary btn-block maionLgBtn" style="background:#82ca9c" id="loginBtn">확인</button><br/>
		
		<button type="button" class="btn btn-primary btn-block maionLgBtn" style="background:#82ca9c" id="backBtn">Cancel</button>
	</div>

</div>


