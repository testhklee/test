<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function list(page){
	location.href="adminNotice.do?curPage="+page
}

function yn(){
	var con = confirm("삭제 하시겠습니까?")
	if(con == true){
		location.href="noticeDelete.do?noticeNo="+this.val();
	}else{
		
	}
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
	<div align="center">
	
		<br><br><h2>공지사항</h2><br><br>
			<table  border="1" class="table table-bordered dataTable no-footer dtr-inline">
				<tr>
					<th width="50">번호</th>
					<th width="800">제목</th>
					<th width="100">작성일</th>
					<th width="90">조회수</th>
					<th width=90>삭제</th>
				</tr>
					<c:forEach items="${noticeList }" var="noticeList">
						<tr align="center">
							<td>${noticeList.noticeNo }</td>
							<td><a href="adminNoticeDetail.do?noticeNo=${noticeList.noticeNo}">${noticeList.noticeTitle }</a></td>
							<td>${noticeList.noticeDate }</td>
							<td>${noticeList.noticeHit }</td>
							<td>
								<button value="${noticeList.noticeNo }" onclick="yn()">삭제</button>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" style="border-bottom-style: hidden;border-left-style: hidden;border-right-style: hidden;">
							<input type="button" value="작성" onclick="location.href='noticeInsertForm.do'">
						</td>
					</tr>
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