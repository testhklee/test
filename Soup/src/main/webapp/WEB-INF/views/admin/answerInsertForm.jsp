<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
    
<div class="container" align="center">
	
	<table border="1">
		<tr>
			<th>분류</th>
			<td><input type="text" readonly="readonly" value="${answerDto.questionGubun }"/></td>
		</tr>
		<tr>	
			<th>작성일</th>
			<td><input type="text" readonly="readonly" value="${answerDto.questionDate }"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" readonly="readonly" value="${answerDto.memberName }"/></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" readonly="readonly" value="${answerDto.questionTitle }"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea style="resize : none;" rows="10" cols="60" readonly="readonly">${answerDto.questionContent }</textarea></td>
		</tr>
	</table>
	<form action="answerInsert.do" method="post">
		<input type="hidden" value="${answerDto.questionNo }" name="questionNo">
			<table border="1">
				<tr>
					<th>답변 내용</th>
					<td><textarea style="resize : none;" rows="10" cols="60" name="answerContent"></textarea></td>
				</tr>
				<tr>
					<th></th>
					<td><button type="submit">작성</button></td>
				</tr>
			</table>	
	</form>
</div>