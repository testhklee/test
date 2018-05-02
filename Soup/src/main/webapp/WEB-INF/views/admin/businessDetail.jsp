<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
    
<div class="container">
	<div align="center">
		<table style="margin-top: 120px; margin-bottom:120px; align-content: center;">
			<tr class="input-group">
				<th class="input-group-addon" id="basic-addon1" style="width: 131px;">이 름</th>
				<td class="form-control" style="width: 190px; text-align: left;" aria-describedby="basic-addon1">${businessDao.memberName }</td>
				<th class="input-group-addon" id="basic-addon1" style="width: 131px;">전화 번호</th>
				<td class="form-control" style="width: 165px; text-align: left;" aria-describedby="basic-addon1">${businessDao.memberTel }</td>
				<th class="input-group-addon" id="basic-addon1" style="width: 131px;">현재 상태</th>
				<td class="form-control" style="width: 190px; text-align: left;" aria-describedby="basic-addon1">${businessDao.businessStatus }</td>
			</tr>
			<tr class="input-group">
				<th class="input-group-addon" id="basic-addon1" style="width: 131px;">이메일</th>
				<td class="form-control" style="width: 190px; text-align: left;" aria-describedby="basic-addon1">${businessDao.memberEmail }</td>
				<th class="input-group-addon" id="basic-addon1" style="width: 131px;">현재 등급</th>
				<td class="form-control" style="width: 165px; text-align: left;" aria-describedby="basic-addon1">${businessDao.memberGrade }</td>
				<th class="input-group-addon" id="basic-addon1" style="width: 131px;">회원 번호</th>
				<td class="form-control" style="width: 190px; text-align: left;" aria-describedby="basic-addon1">${businessDao.memberNo }</td>
			</tr>
			<tr class="input-group">
				<th class="input-group-addon" id="basic-addon1" style="width:131px;">사업자 등록 문서</th>
				<td aria-describedby="basic-addon1" style="padding: 6px 12px; border: 1px solid #ccc;border-radius: 4px; text-align: left; resize : none; width: 808px;">${businessDao.businessDoc }</td>
			</tr>
		</table>
	
	<button class="btn btn-success" onclick = "location.href='businessStatusUpdate.do?memberNo=${businessDao.memberNo}&businessStatus=PASS'">수락하기</button>
	<button class="btn btn-success" onclick = "location.href='businessStatusUpdate.do?memberNo=${businessDao.memberNo}&businessStatus=FAIL'">거절하기</button>
	<button class="btn btn-success" onclick="location.href='adminApplyBusiness.do'">목록으로</button>
	</div>
</div>