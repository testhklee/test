<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/js/vendor/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script type="text/javascript" src="resources/js/sockjs.js" ></script>
<script type="text/javascript">
$(function(){
	var sock = new SockJS('alarmSocket.do');
	
	$("form").submit(function(){
		sock.send($(".targetNo").val());
	});
	
});
</script>
<title>쪽지 보내기</title>
</head>
<body>
	<form action="messageInsert.do">
		 <div class="form-group">
		   	<label>받는이</label>
		   	<input type="hidden" name="memberName" value="${receiver.memberName }">
		   	<input type="text" class="form-control" readonly="readonly" value="<c:out value="${receiver.memberName }"/> (<c:out value="${receiver.memberEmail }"/>)">
		   	<input type="hidden" class="targetNo" name="targetNo" value="${receiver.memberNo }">
		 </div>
		 <div class="form-group">
		   	<label>내용</label>
		   	<textarea name="content" class="form-control" rows="8" required="required" style="resize: none;"></textarea>
		 </div>
		 <div style="text-align: center;">
			 <button class="btn btn-success btn-sm sendBtn">보내기</button>
			 <button type="button" class="btn btn-success btn-sm cancelBtn" onclick="window.close();">취소</button>
		 </div>
 	</form>
</body>
</html>