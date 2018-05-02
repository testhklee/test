<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>
	select.form-control{
		float: left;
		width: 200px;
		height: 100px;
	}
	input.form-control{
		float: left;
		width: 280px;
	}
	
	#faceImg {
		width: 345px;
		height: 240px;
		margin-left: 210px;
	}
	
	#backBtn {
		background-color: #82ca9c;
	}
	.btnDiv input[type=button]{
		float: left;
		width: 150px;
		margin-right: 10px;
		margin-bottom: 30px;
	}
	.topBtn{
		width: 600px;
	}
	.reviewMemberImg{
		width: 70px;
	}
</style>


<script type="text/javascript">

	$(function(){
		
		
		if(${soupJJimUmoo == null}){
			$("#jjimBtn").val("찜하기");
		}else{
			$("#jjimBtn").val("찜취소");
		}
		
		if(${soupApplyUmoo == null}||${soupApplyUmoo.soupApplyEntered != 'N'}){
			$("#soupApplyBtn").val("신청하기");
		}else{
			$("#soupApplyBtn").val("신청취소");
		}
		
		$("#soupApplyBtn").click(function(){
			if(${login==null}){
				$("#loginForm").click();
				alert("login 해주세요");
			}else{
				if ($(this).val() === "신청하기"){
					if(${soupMemberUmoo.soupMemberStatus == 'BELONG'}){
						alert("이미 참여중인 SOUP입니다.");
						return false;
					}else if(${soupApplyUmoo.soupApplyEntered == 'R'}){
						alert("거부당한 SOUP입니다.");
						return false;
					}else if(${soupMemberUmoo.soupMemberStatus == 'KICK'}){
						alert("추방당한 SOUP입니다.");
						return false;
					}else{
						if('${selectDto.soupGubun}'=='PS'){
							$("#applyForm").attr("action","soupPaymentClause.do");
							$("#applyForm").attr("target","Payment");
							window.open("","Payment", "width=837, height=600, left=500, top=100, toolbar=no, location=no, directories=no, scrollbar=no, status=no, resizable=no");
							$("#applyForm").submit();
						}else{
							$("#applyForm").attr("action","soupApplyForm.do");
							$("#applyForm").attr("target","SoupApply");
							window.open("","SoupApply", "width=450, height=250, left=500, top=100, toolbar=no, location=no, directories=no, scrollbar=no, status=no, resizable=no");
							$("#applyForm").submit();
						}
					}
				}else{
					if('${selectDto.soupGubun}'=='PS'){
						$("#applyForm").attr("action","soupPaymentCancleForm.do");
						$("#applyForm").attr("target","PaymentCancle");
						window.open("","PaymentCancle", "width=837, height=600, left=500, top=100, toolbar=no, location=no, directories=no, scrollbar=no, status=no, resizable=no");
						$("#applyForm").submit();
					}else{
						$("#applyForm").attr("action","soupApplyCancleForm.do");
						$("#applyForm").attr("target","SoupApplyCancle");
						window.open("","SoupApplyCancle", "width=450, height=250, left=500, top=100, toolbar=no, location=no, directories=no, scrollbar=no, status=no, resizable=no");
						$("#applyForm").submit();
					}
				}
			}	
		});

		$("#jjimBtn").click(function(){
			if(${login==null}){
				$("#loginForm").click();
				alert("login 해주세요");
			}else{
				if ($(this).val() === "찜하기"){
					$.ajax({
						url : "soupJJimInsert.do",
						type : "POST",
						data: {
							soupNo : ${selectDto.soupNo}
						},
						success : function(){
							alert("찜목록에 추가하였습니다");
							$("#jjimBtn").val("찜취소");
						}
					});
					
				}else{
					$.ajax({
						url : "soupJJimCancle.do",
						type : "POST",
						data: {
							soupNo : ${selectDto.soupNo}
						},
						success : function(){
							alert("찜목록에서 지웠습니다");
							$("#jjimBtn").val("찜하기");
						}
					});
				}
			}
		});
		
		
		$("#backBtn").click(function(){
			history.back();
		});
		
	});

</script>

<section id="price" class="price sections">
  <div class="padd container">
		<c:if test="${selectDto.memberNo != login.memberNo }">
			<div class="form-group topBtn container">
			  <div class="col-md-8 btnDiv">
			  	  <form id="applyForm" name="applyForm" method="post" target="SoupApply">
			  		<input type="hidden" id="soupNo" name="soupNo" value="${selectDto.soupNo }">
					<input type="hidden" id="soupPrice" name="soupPrice" value="${selectDto.soupPrice }">
					<input type="hidden" id="soupTitle" name="soupTitle" value="${selectDto.soupTitle }">
					<input type="button" id="soupApplyBtn" class="btn btn-success" value="신청하기">
				  </form>
				<input type="button" id="jjimBtn" class="btn btn-success" value="찜하기">
			  </div>
			</div>
		</c:if>
	<!-- Form starts.  -->
		<div class="form-group container">
			<img alt="" id="faceImg" src="${selectDto.memberFace }">
		</div>
		<div class="form-group container">
		  <label class="col-md-2 control-label">작성자</label>
		  <div class="col-md-8">
			<input type="text" class="form-control" readonly="readonly" value="${selectDto.memberName }">
		  </div>
		</div>
		<div class="form-group container">
		  <label class="col-md-2 control-label">스/프 이름</label>
		  <div class="col-md-8">
			<input type="text" class="form-control" readonly="readonly" value="${selectDto.soupTitle }">
		  </div>
		</div>
		<c:if test="${selectDto.soupGubun == 'PS'}">
		<div class="form-group container">
		  <label class="col-md-2 control-label">스터디 비용</label>
		  <div class="col-md-8">
		    <input type="text" class="form-control" readonly="readonly" value="${selectDto.soupPrice}">
		  </div>
		</div>
		</c:if>             
		<div class="form-group container">
		  <label class="col-md-2 control-label">스/프 분류</label>
		  <div class="col-md-8">
			<input type="text" class="form-control" readonly="readonly" value="${selectDto.soupField2 }">
		  </div>
		</div>
		<c:if test="${selectDto.soupAddr2 != null}">
		<div class="form-group container">
		  <label class="col-md-2 control-label">스/프 주소</label>
		  <div class="col-md-8">
			<input type="text" class="form-control" readonly="readonly" value="${selectDto.soupAddr1} ${selectDto.soupAddr2}">
		  </div>
		</div>
		</c:if>
		<div class="form-group container">
		  <label class="col-md-2 control-label">스/프 기간</label>
		  <div class="col-md-8">
		    <fmt:formatDate var="soupStartDate" value="${selectDto.soupStartDate }" pattern="MM월 dd일 (E)"/>
		    <fmt:formatDate var="soupEndDate" value="${selectDto.soupStartDate }" pattern="MM월 dd일 (E)"/>
		    <input type="text" class="form-control" readonly="readonly" value="${soupStartDate }">
		    <input type="text" class="form-control" readonly="readonly" value="${soupEndDate }">
		  </div>
		</div>
		<c:if test="${selectDto.soupGubun != 'P' }">
		<div class="form-group container">
		  <label class="col-md-2 control-label">스/프 시간</label>
		  <div class="col-md-8">
		    <input type="text" class="form-control" readonly="readonly" value="${selectDto.soupStartTime } ~ ${selectDto.soupEndTime}">
		  </div>
		</div>
		<div class="form-group container">
		  <label class="col-md-2 control-label">스/프 요일</label>
		  <div class="col-md-8">
		    <input type="text" class="form-control" readonly="readonly" value="${selectDto.soupDay}">
		  </div>
		</div>
		</c:if>                              
		<div class="form-group container">
		  <label class="col-md-2 control-label">최대/최소 인원</label>
		  <div class="col-md-8">
		    <input type="text" class="form-control" readonly="readonly" value="${selectDto.soupMemberMax }">
		    <input type="text" class="form-control" readonly="readonly" value="${selectDto.soupMemberMin }">
		  </div>
		</div>            
		<div class="form-group container">
		  <label class="col-md-2 control-label">스/프 마감 기간</label>
		  <div class="col-md-8">
		    <fmt:formatDate var="soupRecruitEndDate" value="${selectDto.soupRecruitEndDate }" pattern="MM월 dd일 (E)"/>
		    <input type="text" class="form-control" readonly="readonly" value="${soupRecruitEndDate }">
		    <input type="text" class="form-control" readonly="readonly" value=" ${selectDto.soupRecruitEndTime }">
		  </div>
		</div>
		<c:if test="${selectDto.soupIntroVideo != null}">
		<div class="form-group container">
		  <label class="col-md-2 control-label">영상</label>
		  <div class="col-md-8">
			<video controls style="width: 800px; height: 400px;" >
				<source src="${fn:substringAfter(selectDto.soupIntroVideo,'webapp/')}" type='video/mp4; codecs="avc1.4D401E, mp4a.40.2"'/>
			</video>
		  </div>
		</div>
		</c:if>
		<div class="form-group container">
		  <label class="col-md-2 control-label">본문</label>
		  <div class="col-md-8">
		  	${selectDto.soupContent }
		  </div>
		</div>
		<div class="form-group container">
		  <div class="col-md-offset-2 col-md-8">
			  <form action="soupUpdateForm.do" method="post">
			    <c:if test="${selectDto.memberNo == login.memberNo }">
			  	<input type="hidden" id="soupNo" name="soupNo" value="${selectDto.soupNo }">
			    <button type="submit" id="updateBtn" class="btn btn-success">수정</button>
			    </c:if>
			    <button type="button" id="backBtn" class="btn btn-primary">목록</button>
			  </form>
		  </div>
		</div>
  </div>
  <hr/>
  <div class="padd container">
  	<div class="form-group container">
	  	<c:choose>
	  		<c:when test="${not empty soupReviewList }">
	  			
	  			<table  border="1" class="table table-bordered dataTable no-footer dtr-inline">
					<tr>
						<th width="80">작성자</th>
						<th width="500">내용</th>
						<th width="100">작성일</th>
						<th width="90">평점</th>
					</tr>
						<c:forEach items="${soupReviewList }" var="list">
							<tr align="center">
								<td><img alt="" class="reviewMemberImg" src="${list.memberFace }"><br/>
									${list.memberName }</td>
								<td>${list.reviewContent }</td>
								<td><fmt:formatDate var="rivewDate" value="${list.reviewDate }" pattern="yy/MM/dd hh:mm"/>${rivewDate}</td>
								<td>
									<c:forEach begin="1" end="${list.reviewScore }">
										★
									</c:forEach>
								</td>
							</tr>
						</c:forEach>
				</table>
				
	  				<div class="col-md-offset-2 col-md-8">
						
						<h5>${list.memberName }</h5>
					</div>
					<div class="col-md-offset-2 col-md-8">
						<h4>${list.reviewContent }</h4>
					</div>
	  		</c:when>
	  		<c:otherwise>
	  			<h3>등록된 리뷰가 없습니다</h3>
	  		</c:otherwise>
	  	</c:choose>
	  </div>
  </div>
</section>