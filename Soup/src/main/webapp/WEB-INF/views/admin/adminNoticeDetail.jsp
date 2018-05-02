<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div align="center">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" style="width: 443px" readonly="readonly" value="${noticeDto.noticeTitle }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea style="resize: none;" rows="10" cols="60" readonly="readonly">${noticeDto.noticeContent }</textarea></td>
			</tr>
				<tr>
					<th></th>
					<td>
						<input type="button" value="수정" onclick="location.href='noticeUpdateForm.do?noticeNo=${noticeDto.noticeNo}'">
						<input type="button" value="삭제" onclick="location.href='noticeDelete.do?noticeNo=${noticeDto.noticeNo}'">
					</td>
				</tr>
		</table>
			<div align="right">
				<button onclick="location.href='adminNotice.do'">목록으로</button>
			</div>
	</div>
</div>