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
<div class="container" align="center" style="margin-bottom: 80px">
	<h2 style="margin-top: 50px;"><b style="font-size: 80%; margin-right: 900px; color: #92e3af">1:1 문의</b></h2>
	
		<div
			style="border: 1.4px solid #92e3af; background-color: #92e3af; width: 15%; height: 1px; margin-left: 30px; float: left">
		</div>
		
		<div
			style="border: 1.4px solid #92e3af; background-color: #F7817E; margin-botton:100px; width:70%; height: 1px; margin-left: 45px; float: left">
		</div>
	<table style="margin-top: 80px; margin-bottom: 30px;">
		<tr class="input-group">
			<th class="input-group-addon" id="basic-addon1" style="background-color: #92e3af;">문의 제목</th>
			<td class="form-control" style="width: 290px; text-align: left;" aria-describedby="basic-addon1">${questionDto.questionTitle }</td>
			<th class="input-group-addon" id="basic-addon1" style="background-color: #92e3af;">문의 일시</th>
			<td class="form-control" style="width: 165px; text-align: left;" aria-describedby="basic-addon1"><fmt:formatDate value="${questionDto.questionDate }" pattern="yyyy-MM-dd" /></td>
			
		</tr>
		<tr class="input-group">
			<th class="input-group-addon" id="basic-addon1" style="background-color: #92e3af;">문의 내용</th>
			<td class="form-control" aria-describedby="basic-addon1" style="text-align: left; resize : none; width: 538px; height: 250px;">${questionDto.questionContent }</td>
		</tr>
		<c:if test="${answerDto != null }">
			<tr class="input-group">
				<th class="input-group-addon" id="basic-addon1" style="background-color: #92e3af;">답변 일시</th>
				<td class="form-control" style="width: 538px; text-align: center;" aria-describedby="basic-addon1"><fmt:formatDate value="${answerDto.answerDate }" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr class="input-group">
				<th class="input-group-addon" id="basic-addon1" style="background-color: #92e3af;">답변 내용</th>
				<td class="form-control" aria-describedby="basic-addon1" style="text-align: left; resize : none; width: 538px; height: 250px;">${answerDto.answerContent }</td>
			</tr>
		</c:if>
	</table>
	
	<input class="btn btn-success btn-sm" onclick="location.href='questionUserList.do'" type="button" value="목록으로">
	
</div>
