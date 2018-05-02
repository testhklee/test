<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<form action="teacherUpdate.do" id="grade" >
		<table border="1" class="table table-bordered dataTable no-footer dtr-inline" style="margin-top: 120px;">
			<tr>
				<th>이름</th>
				<th>전화 번호</th>
				<th>이메일</th>
				<th>지원 결과</th>
				<th>현재 등급</th>
			</tr>
			<c:forEach items="${list }" var="list">
				<tr onclick="location.href='teacherOne.do?memberNo=${list.memberNo}'">
					<td>
						<input type="hidden" name="memberNo" value="${list.memberNo }">
						${list.memberName }
					</td>
					<td>${list.memberTel }</td>
					<td>${list.memberEmail }</td>
					<td>
						<select name ="teacherStatus2">
							<option value="PASS" ${list.teacherStatus eq ("PASS")? "selected":""}>통과</option>
							<option value="WAIT" ${list.teacherStatus eq ("WAIT")? "selected":""}>대기</option>
							<option value="FAIL" ${list.teacherStatus eq ("FAIL")? "selected":""}>탈락</option>	
						</select>
					</td>
					<td>${list.memberGrade }</td>
				</tr>
			</c:forEach>
		</table>
		<button class="btn btn-success btn-sm" type="submit" style="text-align: right;">변경</button>
	</form>

	<script type="text/javascript">
		$("select").parent().click(function(evt) {
			evt.stopPropagation();
		});
	</script>
</div>