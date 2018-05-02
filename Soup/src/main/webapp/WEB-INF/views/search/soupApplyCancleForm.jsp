<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>

	html {overflow:hidden;} 

</style>

<script src="resources/js/jquery-3.3.1.min.js" ></script>
<script src="resources/js/autoSizePopup.js"></script>
<script type="text/javascript">

	autoSizePopup();

	$(function(){
		
		$("#cancleBtn").click(function(){
			self.close();
		});
		
	});

</script>

<section id="price" class="price sections" >
	<form action="soupApplyCancle.do" id="soupApplyForm" method="post">
		<input type="hidden" name="soupNo" value="${soupDetailDto.soupNo }">
		<input type="hidden" name="memberNo" value="${login.memberNo }">
		<div class="padd container">
			<div class="form-group container">
				<div class="col-md-8">
					<h2>신청 취소 하시겠습니까</h2>
				</div>
				<div class="col-md-8">
					<input type="submit" value="YES">
					<input type="button" id="cancleBtn" value="NO">
				</div>
			</div>
		</div>
	</form>
</section>