<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<section id="price" class="price sections">
	<form action="soupApply.do" id="soupApplyForm" method="post">
		<input type="hidden" name="soupNo" value="${soupDetailDto.soupNo }">
		<input type="hidden" name="memberNo" value="${login.memberNo }">
		<div class="padd container">
			<div class="form-group container">
				<label class="col-md-2 control-label">자기소개</label>
			 	 <div class="col-md-8">
					<textarea rows="10" cols="50" name="soupApplyIntro"></textarea>
			 	 </div>
			</div>
		</div>
		<input type="submit" value="신청">
		<input type="button" id="cancleBtn" value="취소">
	</form>
</section>