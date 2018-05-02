<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<script>
$(function(){
	$(document).ready(function(){
		if(${login == null}){
			alert("로그인이 필요합니다.")
		}
	});
});
</script>
<style>
 .submitButton {
    text-align: "center";
    align-items: "center";
  }
</style>
    
<div class="container" style="margin-top: 60px; margin-bottom: 60px;">
	<h2 style="margin-top: 50px;"><b style="font-size: 80%; margin-right: 900px; color: #92e3af">문의 하기</b></h2>
	<div
			style="border: 1.4px solid #92e3af; background-color: #92e3af; width: 18%; height: 1px; float: left">
		</div>
		
		<div
			style="border: 1.4px solid #92e3af; background-color: #F7817E; margin-botton:100px; width:77%; height: 1px; margin-left: 55px; float: left">
		</div>
	<div align="center">
		<form action="questionInsert.do">
		<input type="hidden" value="${login.memberNo }" name="memberNo">
			<table style="margin-top: 50px;">
			<tr class="input-group" style="height:42">
					<th class="input-group-addon" id="basic-addon1" style="background-color: #92e3af;">분 류</th>
					<td>
						<select name="questionGubun" class="form-control" style="font-size: 12px; text-align: left; width: 112px;">
							<option value="site">사이트</option>
							<option value="study">스터디</option>
							<option value="project">프로젝트</option>
							<option value="pay">결제</option>
							<option value="refund">환불</option>
							<option value="etc">기타</option>
						</select>
					</td>
					<th class="input-group-addon" id="basic-addon1" style="background-color: #92e3af;">제 목</th>
					<td><input type="text" class="form-control" placeholder="제목을 입력해 주세요." aria-describedby="basic-addon1" style="font-size : 9pt; width: 293px" name="questionTitle" required="required"/></td>
				</tr>
				<tr class="input-group">
					<th class="input-group-addon" id="basic-addon1" style="width: 57px; background-color: #92e3af;">내 용</th>
					<td><textarea class="form-control" placeholder="문의 내용을 입력해 주세요." aria-describedby="basic-addon1" required="required" style="font-size : 9pt; resize : none;" rows="12" cols="70" name="questionContent"></textarea></td>
				</tr>
				<tr>
					<th style="text-align: center;"><br><br><button type="submit" id="submitButton" class="btn btn-success">작성</button></th>
				</tr>
			</table>
		</form>
	</div>
</div>