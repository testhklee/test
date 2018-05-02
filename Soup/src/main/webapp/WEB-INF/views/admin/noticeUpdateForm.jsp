<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<style>
td{
align-self: right;
float: right;
}
</style>

<div class="container">
	<div align="center">
		<form action="noticeUpdate.do?noticeNo=${noticeDto.noticeNo }">
			<input type="text" hidden="hidden" value="${noticeDto.noticeNo }" name="noticeNo">
			<table border="1">
				<tr>
					<th>제목</th>
					<td><input type="text" style="width: 443px" value="${noticeDto.noticeTitle }" name="noticeTitle"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea style="resize: none;" rows="10" cols="60" name="noticeContent">${noticeDto.noticeContent }</textarea></td>
				</tr>
				<tr>
					<th></th>
					<td><button type="submit">수정</button></td>
				</tr>
			</table>
		</form>
	
	</div>
</div>