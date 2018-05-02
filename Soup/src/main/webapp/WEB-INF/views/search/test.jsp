<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE>
<html>
<head>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	$(function(){
		$("#testBtn").click(function(){
			$.ajax({
				url:"soupApplyForm.do",
				type: "POST",
				data:{
						soupNo : 206,
						memberNo : ${login.memberNo}
					 },
				success : function() {
					alert("성공");
				}
			});
		});
	});
	
</script>

</head>
<body>

	<input type="button" id="testBtn" value="test">

</body>
</html>