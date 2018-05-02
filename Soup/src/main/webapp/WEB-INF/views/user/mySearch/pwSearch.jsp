<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	
		$('#clobtn').click(function() {
			window.close();
		});
			
		$("#loginBtn").click(function(){
			alert("메일을 전송합니다");
		});
	});

</script>

<style type="text/css">

.placestyle {
	margin-bottom: 15px;
}


.inputCenter{
	width:350px; 
	margin:0 auto;
	
}

.input-Form{
	padding-left:10px;
}

.maionLgBtn {
	width: 180px;
	border: none;
	margin-bottom:20px;
	height: 30px;
}

.abut { 
	text-decoration:none 
}



</style>

<div style="border:2px solid; color:#82ca9c">
</div>

<div style="text-align: center; margin-top: 20px; margin-bottom:20px ">
	<b style="font-size:20px">비밀번호 확인</b>
</div>

<div id="pwCheckB">
	
	<div id="pwCheckIn" style="text-align:center">
			<c:choose>
				<c:when test="${pwSearch == null}">	
						 <form action="pwMacth.do" method="post">
							
								<div class="form-group inputCenter">
									<input type="email" required="required" placeholder="Enter Email" class="placestyle form-control input-Form" name="memberEmail" > 
									
								</div>
							
								<div class="form-group inputCenter">
									<input type="text" required="required" placeholder="Enter Name" class="placestyle form-control input-Form" name="memberName"> 
									
								</div>
								<div class="form-group inputCenter">
									<input type="text" required="required" placeholder="Enter H.P"class="placestyle form-control input-Form" name=memberTel> 
								
								</div><br/>
								
							
								<button type="submit" class="btn btn-primary btn-block maionLgBtn" style="background:#82ca9c" id="loginBtn">비밀번호찾기</button><br/>
								
								<button type="button" class="btn btn-primary btn-block maionLgBtn" style="background:#82ca9c" id="clobtn">Cancel</button>
							</form>
					</c:when>
				<c:otherwise>
				고객님의  ${idSearch} 메일로 임시 비밀번호가 보내졌습니다.
					${pwSearch}
					<button type="button" class="btn btn-primary btn-block maionLgBtn" style="background:#82ca9c" id="clobtn">확인</button>
			
			</c:otherwise>
		</c:choose>
	</div>
</div>




