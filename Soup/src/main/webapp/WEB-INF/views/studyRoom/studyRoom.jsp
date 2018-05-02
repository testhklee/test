<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function list(page){
	location.href="studyRoom.do?curPage="+page
}
</script>

<div class="container" style="margin-bottom: 50px;">
	<h2 style="margin-top: 50px;"><b style="font-size: 80%; margin-left: 50px; color: #92e3af">스터디룸</b></h2>
	
		<div
			style="border: 1.4px solid #92e3af; background-color: #92e3af; width: 18%; height: 1px; float: left">
		</div>
		
		<div
			style="border: 1.4px solid #92e3af; background-color: #F7817E; margin-botton:100px; width:77%; height: 1px; margin-left: 55px; float: left">
		</div>
	<div class="row" style="margin-top: 40px;">
		<c:forEach items="${list}" var="dto">
			<div class="col-md-4 col-sm-6 col-xs-12" style="word-break:break-all;">
				<img src="${dto.studyRoomThumbnail }" style="height: 300px;" onclick="location.href='studyRoomDetail.do?&studyRoomNo=${dto.studyRoomNo}'"><br>
				
		      	<table>
		      		<tr class="input-group">
		      			<th class="input-group-addon" style="color : white; background-color: #92e3af; font-size: 11px; height: 30px;">이 름</th>
		      			<td class="form-control" style="font-size: 11px; width: 311px; height: 30px;" >${dto.studyRoomName }</td>
		      		</tr>
		      		<tr class="input-group">
		      			<th class="input-group-addon" style="color : white; background-color: #92e3af; font-size: 11px; height: 30px;">위 치</th>
		      			<td class="form-control" style="font-size: 11px; width: 311px; height: 30px;" >${dto.studyRoomAddr1 } ${dto.studyRoomAddr2 }</td>
		      		</tr>
		      		<tr class="input-group">
		      			<th class="input-group-addon" style="color : white; background-color: #92e3af; font-size: 11px; height: 30px;">비 용</th>
		      			<td class="form-control" style="font-size: 11px; width: 311px; height: 30px;" >${dto.studyRoomPrice }</td>
		      		</tr>
		      	</table>
			</div>
		</c:forEach>
	</div>
	<div align="center" style="margin-top: 90px;">
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
	
	<form action="studyRoomSearch.do">
		<select name="searchOption">
			<option value="all" <c:out value="${searchOption == 'all'?'selected':'' }"/> >전체</option>
			<option value="STUDYROOM_NAME" <c:out value="${searchOption == 'STUDYROOM_NAME'?'selected':'' }"/>>스터디룸 명</option>
			<option value="STUDYROOM_ADDR" <c:out value="${searchOption == 'STUDYROOM_ADDR'?'selected':'' }"/>>지역</option>
		</select>
		<input type="text" name="keyword" value="${keyword }" placeholder="검색어를 입력해 주세요.">
		<input type="submit" value="검색">
	</form>
	</div>
</div>

