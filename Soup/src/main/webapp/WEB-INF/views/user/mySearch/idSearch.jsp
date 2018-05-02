<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="resources/js/vendor/jquery-1.11.2.min.js"></script>
<script type="text/javascript">


$(function(){
	
		$('#clobtn').click(function() {
			window.close();
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


</style>

<div style="border:2px solid; color:#82ca9c">
</div>

<div style="text-align: center; margin-top: 20px; margin-bottom:20px ">
	<b style="font-size:20px">이메일 확인</b>
</div>

<div class="pwCheckB">
	
	<div id="pwCheckIn" style="text-align:center">
			<c:choose>
				<c:when test="${idSearch == null}">	
						 <form action="idMacth.do" method="post">					
								<div class="form-group inputCenter">
									<input type="text" required="required" placeholder="Enter Name" class="placestyle form-control input-Form" name="memberName"> 
									
								</div>
								<div class="form-group inputCenter">
									<input type="text" required="required" placeholder="Enter H.P"class="placestyle form-control input-Form" name="memberTel"> 
								
								</div><br/>
								
							
								<button type="submit" class="btn btn-primary btn-block maionLgBtn" style="background:#82ca9c" id="loginBtn">이메일찾기</button><br/>
								
								<button type="button" class="btn btn-primary btn-block maionLgBtn" style="background:#82ca9c" id="clobtn">Cancel</button>
							</form>
					</c:when>
				<c:otherwise>
				고객님의 이메일은: ${idSearch} 
					
					<button type="button" class="btn btn-primary btn-block maionLgBtn" style="background:#82ca9c; margin-top:30px" id="clobtn">확인</button>
						
			</c:otherwise>
		</c:choose>
		</div>
	</div>


