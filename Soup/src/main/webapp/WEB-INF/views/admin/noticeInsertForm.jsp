<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>

<style>
td{
align-self: right;
float: right;
}
</style>

<div class="container" align="center">
	<form action="noticeInsert.do">
		<table>
			<tr>
				<th>제 목 　　</th>
				<td><input type="text" style="width: 443px" name="noticeTitle"/></td>
			</tr>
			<tr>
				<th>내　용　　</th>
				<td><textarea style="resize : none;" rows="10" cols="60" name="noticeContent"></textarea></td>
			</tr>
			<tr>
				<th></th>
				<td><button type="submit">작성</button></td>
			</tr>
		</table>
	</form>






</div>