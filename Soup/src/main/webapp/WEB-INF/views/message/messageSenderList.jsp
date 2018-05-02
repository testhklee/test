<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	function allchk(bool) {
		var chks = document.getElementsByName("messageNo");
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = bool;
		}
	}
	
	function allchk2(bool) {
		var chks = document.getElementsByName("messageNo");
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = bool;
		}
	}

	function list(page){
		location.href="messageSenderList.do?curPage="+page
	}
</script>
  <style>
  #tabs-vertical { width: 1200px; }
}
  #tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; }

  #tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; }

  </style>
<div class="container">
	<h2 style="margin-top: 50px;"><b style="font-size: 80%; margin-left: 50px; color: #92e3af">보낸 쪽지</b></h2>
	
		<div
			style="border: 1.4px solid #92e3af; background-color: #92e3af; width: 18%; height: 1px; float: left">
		</div>
		
		<div
			style="border: 1.4px solid #92e3af; background-color: #F7817E; margin-botton:100px; width:77%; height: 1px; margin-left: 55px; float: left">
		</div>

	<div style="margin-top: 40px;">
		<button onclick="location.href='messageTargetList.do'" class="btn btn-primary btn-lg" style="width: 140px;">받은쪽지함</button>
		<button onclick="location.href='messageSenderList.do'" class="btn btn-primary btn-lg" style="width: 140px;">보낸쪽지함</button>
	</div>
	
	<div  align="center">
		<form action="mulDelSend.do" style="margin-bottom: 200px">
			<table border="1" class="table table-hover table-bordered">
				<tr>
					<th width="10"><input type="checkbox" onclick="allchk2(this.checked);"></th>
					<th width="100">받는이</th>
					<th width="700">내용</th>
					<th width="100">보낸 날짜</th>
				</tr>
				<c:choose>
					<c:when test="${messageSenderList.size()==0}">
						<tr>
							<td colspan="4" align="center">==========보낸 메세지가 없습니다.==========</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${messageSenderList}" var="messageSenderList">
							<tr>
								<td><input type="checkbox" name="messageNo" value="${messageSenderList.messageNo }"></td>
								<td>${messageSenderList.memberName }</td>
								<td><a onclick="window.open('senderOne.do?messageNo=${messageSenderList.messageNo}', '_blank', 'width=370,height=320,left=750, top=250')"><c:out value="${messageSenderList.messageContent }" escapeXml="true" /></a></td>
								<td>${messageSenderList.messageDate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
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
			<input type="submit" class="btn btn-success btn-sm" value="삭제">
		</form>
	</div>
</div>
