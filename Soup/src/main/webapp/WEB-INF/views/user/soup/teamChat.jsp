<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅방</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/chat.css?ver=2">
<script src="resources/js/vendor/jquery-1.11.2.min.js"></script>
<script src="resources/js/vendor/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/sockjs.js" ></script>
<script type="text/javascript" src="resources/js/teamChat.js?ver=12"></script>
</head>
<body>
	<div class="container">
	    <div class="row">
	        <div class="col-md-5">
	            <div class="panel panel-primary">
	                <div class="panel-heading">
	                    <span class="glyphicon glyphicon-comment"></span> Chat
	                </div>
	                <div class="panel-body">
	                    <ul id="chatContent" class="chat">
							<!-- 채팅내용 -->
	                    </ul>
	                </div>
	                <div class="panel-footer">
	                    <div class="input-group">
	                        <input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />
	                        <span class="input-group-btn">
	                            <button class="btn btn-warning btn-sm" id="sendBtn">Send</button>
	                        </span>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

<script type="text/javascript">
	var memberFace = "<c:out value="${login.memberFace}"/>";
</script>
</body>
</html>