<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
$(function(){
	$(".y").click(function(){
		location.href="answer.do?questionNo="+$(this).val();
	});


});

function list(page){
	location.href="questionUserList.do?curPage="+page
}
</script>

<div class="container" style=" height: 605px;">

	<h2 style="margin-top: 50px;"><b style="font-size: 80%; margin-left: 60px; color: #92e3af">문의 내역</b></h2>
	
		<div
			style="border: 1.4px solid #92e3af; background-color: #92e3af; width: 15%; height: 1px; margin-left: 30px; float: left">
		</div>
		
		<div
			style="border: 1.4px solid #92e3af; background-color: #F7817E; margin-botton:100px; width:70%; height: 1px; margin-left: 45px; float: left">
		</div>
	
	<div align="center" style="margin-top : 90px;">
		<table border="1" class="table table-hover table-bordered" style="width: 900px;">
			<tr style="text-align: center; ">
				<th style="text-align: center;">분류</th>
				<th style="text-align: center;">제목</th>
				<th style="text-align: center;">작성일</th>
				<th style="text-align: center;">답변여부</th>
			</tr>
			<c:forEach items="${questionUserList }" var="questionUserList">
				<tr>
					<td width="80" style="text-align: center;">
						<c:choose>
							<c:when test="${questionUserList.questionGubun =='site' }">
								사이트
							</c:when>
							<c:when test="${questionUserList.questionGubun == 'etc'}">
								기타
							</c:when>
							<c:when test="${questionUserList.questionGubun == 'ETC'}">
								기타
							</c:when>
							<c:when test="${questionUserList.questionGubun == 'project' }">
								프로젝트
							</c:when>
							<c:when test="${questionUserList.questionGubun == 'pay' }">
								결제
							</c:when>
							<c:when test="${questionUserList.questionGubun == 'refund' }">
								환불
							</c:when>
							<c:when test="${questionUserList.questionGubun == 'study' }">
								스터디
							</c:when>
						</c:choose>
					</td>
					<td width="500px" style="text-align: center;overflow: hidden; text-overflow: ellipsis; white-space: nowrap; "><a href='answer.do?questionNo=${questionUserList.questionNo }'>${questionUserList.questionTitle}</a></td>
					<td width="80px;"><fmt:formatDate value="${questionUserList.questionDate }" pattern="yyyy-MM-dd" /></td>
					<td width="80px;">
						<c:choose>
							<c:when test="${questionUserList.questionYn == 'Y'}">
								답변완료
							</c:when>
							<c:otherwise>
								답변대기
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
	<div align="center" style="margin-bottom: 60px;" >
			<c:if test="${boardPager.curBlock > 1}">
	        	<a href="javascript:list('1')">[처음]</a>
	        </c:if>
	        <c:if test="${boardPager.curBlock > 1}">
	             <a href="javascript:list('${boardPager.prevPage}')">[이전]</a>
	        </c:if>
	        
	        <c:forEach var="num" begin="${boardPager.blockBegin}" end="${boardPager.blockEnd}">
				<c:choose>
	            	<c:when test="${num == boardPager.curPage}">
	                	<span style="color: red">${num}</span>&nbsp;
	                </c:when>
	                <c:otherwise>
	               		<a href="javascript:list('${num}')">${num}</a>&nbsp;
	                </c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${boardPager.curBlock <= boardPager.totBlock}">
				<a href="javascript:list('${boardPager.nextPage}')">[다음]</a>
			</c:if>  
	   
			<c:if test="${boardPager.curPage <= boardPager.totPage}">
	        	<a href="javascript:list('${boardPager.totPage}')">[끝]</a>
	        </c:if>
	    </div>

