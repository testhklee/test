<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function list(page){
	location.href="noticeList.do?curPage="+page
}
</script>
<style>
th {
    text-align: center;
  }
  td {
    text-align: center;
    }
</style>

<div class="container">
	
	
		<h2 style="margin-top: 50px;"><b style="font-size: 80%; margin-left: 50px; color: #92e3af">공지 사항</b></h2>
	
		<div
			style="border: 1.4px solid #92e3af; background-color: #92e3af; width: 18%; height: 1px; float: left">
		</div>
		
		<div
			style="border: 1.4px solid #92e3af; background-color: #F7817E; margin-botton:100px; width:77%; height: 1px; margin-left: 55px; float: left">
		</div>
	<div align="center">
			<table  border="1" class="table table-bordered dataTable no-footer dtr-inline" style="margin-top: 40px;"> 
				<tr>
					<th width="50">번호</th>
					<th width="800">제목</th>
					<th width="100">작성일</th>
					<th width="90">조회수</th>
				<%-- <c:if test="${login.memberGrade != ADMIN}" >
					<th width=90>삭제</th>
				</c:if> --%>
				</tr>
					<c:forEach items="${noticeList }" var="noticeList">
						<tr align="center">
							<td>${noticeList.noticeNo }</td>
							<td><a href="noticeDetail.do?noticeNo=${noticeList.noticeNo}">${noticeList.noticeTitle }</a></td>
							<td>${noticeList.noticeDate }</td>
							<td>${noticeList.noticeHit }</td>
						<%-- <c:if test="${login.memberGrade != ADMIN}" >
							<td>
								<input type="button" value="삭제" onclick="confirm()">
							</td>
						</c:if> --%>
						</tr>
					</c:forEach>
					
					<%-- <c:if test="${login.memberGrade != ADMIN}" >
					
						<td colspan="5" style="border-bottom-style: hidden;border-left-style: hidden;border-right-style: hidden;">
							<input type="button" value="작성" onclick="location.href='noticeInsertForm.do'">
						</td>
					</c:if> --%>
			</table>
		<div align="center" style="margin-bottom: 60px; margin-top: 35px;" >
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
	</div>
</div>
