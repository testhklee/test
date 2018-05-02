<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
th {
    text-align: center;
  }
  td {
    text-align: center;
    }
</style>
<script>
$(function(){
	$(".y").click(function(){
			location.href="answerInsertForm.do?questionNo="+$(this).val();
	})
	$(".n").click(function(){
		alert("답변이 완료된 상태 입니다.")
	})
	
	
});
</script>
<div class="container" align="center">
	<table border="1">
		<tr>
			<th>작성자</th>
			<th>제목</th>
			<th>구분</th>
			<th>작성일</th>
			<th>답변여부</th>
		</tr>
		<c:forEach items="${questionAdminList }" var="questionAdminList">
			<tr>
				<td width="80">${questionAdminList.memberName }</td>
				<td width="500">
						<a onclick="location.href='answerInsertForm.do?questionNo=${questionAdminList.questionNo}';">${questionAdminList.questionTitle }</a>
				</td>
				<c:choose>
					<c:when test="${questionAdminList.questionGubun =='site' }">
						<td width="100">사이트</td>
					</c:when>
					<c:when test="${questionAdminList.questionGubun == 'etc'}">
						<td width="100">기타</td>
					</c:when>
					<c:when test="${questionAdminList.questionGubun == 'ETC'}">
						<td width="100">기타</td>
					</c:when>
					<c:when test="${questionAdminList.questionGubun == 'project' }">
						<td width="100">프로젝트</td>
					</c:when>
					<c:when test="${questionAdminList.questionGubun == 'pay' }">
						<td width="100">결제</td>
					</c:when>
					<c:when test="${questionAdminList.questionGubun == 'refund' }">
						<td width="100">환불</td>
					</c:when>
					<c:when test="${questionAdminList.questionGubun == 'study' }">
						<td width="100">스터디</td>
					</c:when>
				</c:choose>
				
				<td width="100"><fmt:formatDate value="${questionAdminList.questionDate }" pattern="yyyy-MM-dd" /></td>
				<td>
					<c:choose>
						<c:when test="${questionAdminList.questionYn == 'N'}">
							<button class = "y" value="${questionAdminList.questionNo }">답변하기</button>
						</c:when>
						<c:otherwise>
							<button class = "n" value="답변완료" value="${questionAdminList.questionNo }">답변완료</button>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>

	</table>
</div>