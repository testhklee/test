<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">	

	<h2 style="margin-top: 50px;"><b style="font-size: 80%; margin-left: 50px; color: #92e3af">공지 사항</b></h2>
	
		<div
			style="border: 1.4px solid #92e3af; background-color: #92e3af; width: 18%; height: 1px; float: left">
		</div>
		
		<div
			style="border: 1.4px solid #92e3af; background-color: #F7817E; margin-botton:100px; width:77%; height: 1px; margin-left: 55px; float: left">
		</div>
	<div align="center" style="margin-top: 40px; margin-bottom: 50px;">
		
		<table style="width: 650px;">
			<tr>
				<th class="input-group-addon" id="basic-addon1" style="background-color: #92e3af;">제목</th>
				<td><input class="form-control" style="width:600px; text-align: left;" aria-describedby="basic-addon1" type="text" readonly="readonly" value="${noticeDto.noticeTitle }"></td>
			</tr>
			<tr>
				<th class="input-group-addon" id="basic-addon1" style="background-color: #92e3af;">내용</th>
				<td><textarea  class="form-control"aria-describedby="basic-addon1"  style="resize: none; width:600px; text-align: left;" rows="10" cols="60" readonly="readonly">${noticeDto.noticeContent }</textarea></td>
			</tr>
		</table>
			<div align="center" style="margin-top: 50px; margin-bottom: 60px;">
				<button class="btn btn-success btn-sm" onclick="location.href='noticeList.do'">목록으로</button>
			</div>
	</div>
</div>

