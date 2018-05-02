<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<script type="text/javascript" src="resources/js/vendor/jquery-1.11.2.min.js"></script>
<script type="text/javascript">

$(function(){
	
	$("#formTmp").submit(function(){
		var hiPw = $("#hiddenPw").val();
		var tmPw = $("#tmpPw").val();
		var tmPwC =	$("#tmpPwCk").val();
		
		
		if(tmPw==tmPwC && hiPw ==tmPw ){
			alert("임시비밀번호를 확인했습니다.");
			alert(tmPwC);
			alert(hiPw);
			alert(tmPw);
			
			
		}else{
			alert("잘못입력하셨습니다.");
			return false;
		}
			
	})
});

</script>
<form action="pwUpdateForm.do" method="post" id="formTmp">
<input type="hidden" name="newPw" value="${newPw}" id="hiddenPw">

이메일: <input type="email" name="memberEmail">
임시비밀번호:<input type="password" name="tmpPw" id="tmpPw">
임시비밀번호 확인:<input type="password" name="tmpPwCf" id="tmpPwCk">

<button type="submit">확인</button>
</form>