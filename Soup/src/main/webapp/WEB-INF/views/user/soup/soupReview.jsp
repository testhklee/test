<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<script src="resources/js/vendor/jquery-1.11.2.min.js"></script>
<title>스터디 후기 작성</title>
</head>
<body>
	<form action="insertSoupReview.do" method="post">
		<input type="hidden" name="soupNo" value="<c:out value="${soup.soupNo }"/>">
		<input type="hidden" name="teacherNo" value="<c:out value="${soup.teacherNo }"/>">
		<div class="form-group">
			<h1><c:out value="${soup.soupTitle }"/></h1>
		  	<h3><c:out value="${soup.memberName }"/></h3>
		</div>
		<div class="form-group">
		  	<label>후기</label>
		  	<select name="reviewScore">
		  		<option value="1">★☆☆☆☆</option>
		  		<option value="2">★★☆☆☆</option>
		  		<option value="3">★★★☆☆</option>
		  		<option value="4">★★★★☆</option>
		  		<option value="5">★★★★★</option>
		  	</select>
		  	<textarea name="reviewContent" class="form-control" rows="8" required="required" style="resize: none;" placeholder="스터디에 대해서 후기를 남겨주세요."></textarea>
		</div>
		<div style="text-align: center;">
			<button class="btn btn-success btn-sm sendBtn">보내기</button>
			<button type="button" class="btn btn-success btn-sm cancelBtn" onclick="window.close();">취소</button>
		</div>
	</form>
</body>
</html>