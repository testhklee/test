<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/js/vendor/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<title>받은 쪽지</title>
</head>
<body>
		 <div class="form-group">
		   	<label>보낸이</label>
		   	<input type="text" class="form-control" readonly="readonly" value="<c:out value="${messageDto.memberName }"/>">
		 </div>
		 <div class="form-group">
		   	<label>내용</label>
		   	<textarea name="content" class="form-control" rows="8" readonly="readonly" required="required" style="resize: none;">${messageDto.messageContent }</textarea>
		 </div>
		 <div style="text-align: center;">
			 <button class="btn btn-success btn-sm sendBtn" onclick="window.open('message.do?memberNo=${messageDto.messageSenderNo}', '_blank', 'width=370,height=320,left=750, top=250');top.window.close();">답장</button>
			 <button type="button" class="btn btn-success btn-sm cancelBtn" onclick="window.close();">취소</button>
		 	 <button class="btn btn-success btn-sm sendBtn" onclick = "location.href='delTarget.do?messageNo=${messageDto.messageNo}'">삭제</button>
		 </div>
</body>
</html>
		 
		 
		 
		 