<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    

<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>

	<center>
		<form action="localList.do">
			<h3>상호명으로 검색해주세요</h3>
			<h5>ex)양평역 커피더캠프</h5>
			<input type="text" name="keyword"> <input type="submit" value="검색">
		</form>
	</center>
	<table>
		<tr>
			<td colspan="4" width="100%" bgcolor="pink"></td>
		</tr>
		<c:forEach items="${localList}" var="b">
		<input type="hidden" class="ar" value="${b.address}" />
			<tr>
				<td class="title" rowspan="4" width="800">"${b.title}"</td>
				<td class="address" rowspan="4" width="800">${b.address }</td>
			</tr>
			<tr>

			</tr>

		</c:forEach>
	</table>

<script>
$(".title").click(function(){
	var index=$(".title").index(this);
	var address2 = $(".ar").eq(index).val();
	opener.document.getElementById("address2").value=address2
	$(opener.location).attr("href","javascript:assdasd(" + "'" +address2 + "'" + ")");
	window.close();
})
 
</script>
</html>