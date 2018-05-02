<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
    
<div class="container">
	<div align="center">
		<table style="margin-top: 120px; margin-bottom:120px; align-content: center;">
			<tr class="input-group">
				<th class="input-group-addon" id="basic-addon1" style="width: 131px;">이 름</th>
				<td class="form-control" style="width: 190px; text-align: left;" aria-describedby="basic-addon1">${teacherDao.memberName }</td>
				<th class="input-group-addon" id="basic-addon1" style="width: 131px;">전화 번호</th>
				<td class="form-control" style="width: 165px; text-align: left;" aria-describedby="basic-addon1">${teacherDao.memberTel }</td>
				<th class="input-group-addon" id="basic-addon1" style="width: 131px;">현재 상태</th>
				<td class="form-control" style="width: 190px; text-align: left;" aria-describedby="basic-addon1">${teacherDao.teacherStatus }</td>
			</tr>
			<tr class="input-group">
				<th class="input-group-addon" id="basic-addon1" style="width: 131px;">이메일</th>
				<td class="form-control" style="width: 190px; text-align: left;" aria-describedby="basic-addon1">${teacherDao.memberEmail }</td>
				<th class="input-group-addon" id="basic-addon1" style="width: 131px;">현재 등급</th>
				<td class="form-control" style="width: 165px; text-align: left;" aria-describedby="basic-addon1">${teacherDao.memberGrade }</td>
				<th class="input-group-addon" id="basic-addon1" style="width: 131px;">주민 번호</th>
				<td class="form-control" style="width: 190px; text-align: left;" aria-describedby="basic-addon1">${teacherDao.teacherDd }</td>
			</tr>
			<tr class="input-group">
				<th class="input-group-addon" id="basic-addon1" style="width:131px;">증명서</th>
				<td aria-describedby="basic-addon1" style="padding: 6px 12px; border: 1px solid #ccc;border-radius: 4px; text-align: left; resize : none; width: 808px;">${teacherDao.teacherCertificate }</td>
			</tr>
			<tr class="input-group">
				<th class="input-group-addon" id="basic-addon1" style="width:131px;">PR 동영상</th>
				<td aria-describedby="basic-addon1" style="padding: 6px 12px; border: 1px solid #ccc;border-radius: 4px; text-align: left; resize : none; width: 808px;">
					<video controls style="width: 700px; height: 400px;" >
					<source src="${teacherDao.teacherPrvideo}" type='video/mp4; codecs="avc1.4D401E, mp4a.40.2"'/>
				</video>
				</td>
			</tr>
		</table>
	
	<button class="btn btn-success" onclick = "location.href='teacherStatusUpdate.do?memberNo=${teacherDao.memberNo}&teacherStatus=PASS'">수락하기</button>
	<button class="btn btn-success" onclick = "location.href='teacherStatusUpdate.do?memberNo=${teacherDao.memberNo}&teacherStatus=FAIL'">거절하기</button>
	<button class="btn btn-success" onclick="location.href='adminApplyTeacher.do'">목록으로</button>
	</div>
</div>