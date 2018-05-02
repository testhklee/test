<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

	html {overflow:hidden;} 
	div {
		margin: auto;
		margin-bottom: 20px;
		width: 830px;
	}
	#content {height: 500px;}
	#select {text-align: right; margin-left: -50px;}
	#action {text-align: center;}
</style>

<script src="resources/js/jquery-3.3.1.min.js" ></script>
<script src="resources/js/autoSizePopup.js"></script>
<script type="text/javascript">

	autoSizePopup();

	$(function(){
		
		$("#cancleBtn").click(function(){
			self.close();
		});
		
		$("#agreeBtn").click(function(){
			$("#disAgreeBtn").prop("checked",false);
		});
		
		$("#disAgreeBtn").click(function(){
			$("#agreeBtn").prop("checked",false);
		});
		
		$("#okayBtn").click(function(){
			if($("#agreeBtn").is(":checked")){
				$("#soupPaymentClauseForm").submit();
			}else{
				alert("동의해 주십시오");
				$("#agreeBtn").focus();
			}
		});
	
	});

</script>

<section id="price" class="price sections">
	<form action="soupPaymentForm.do" id="soupPaymentClauseForm" method="post">
		<input type="hidden" id="soupNo" name="soupNo" value="${soupDetailDto.soupNo }">
		<input type="hidden" id="soupPrice" name="soupPrice" value="${soupDetailDto.soupPrice }">
		<input type="hidden" id="soupTitle" name="soupTitle" value="${soupDetailDto.soupTitle }">
		<div class="padd container">
			<div class="form-group container">
			 	 <div class="col-md-8" id="content" style="overflow: auto; word-break: keep-all;">
						<ol class="depth1">
							<li>
								<h4>제1조 (목적)</h4>
								<p>SOUP 유료서비스 이용 및 결제약관(이하 "결제약관")은 SOUP㈜(이하 "SOUP")가 제공하는 유료서비스의 이용 및 결제에 필요한 사항을 규정함을 목적으로 합니다.</p>
							</li>
							<li>
								<h4>제2조 (정의)</h4>
								<p>결제약관의 용어는 SOUP 이용약관(이하 "이용약관"이라 합나다) 제2조의 정의조항에 따릅니다.</p>
							</li>
							<li>
								<h4>제3조(유료서비스 등)</h4>
								<ol class="depth2">
									<li>SOUP가 회원에게 제공하는 서비스는 기본적으로 무료입니다. 단, SOUP가 유료로 책정한 서비스나 제3자와의 업무제휴를 통해 제공하는 별도의 유료정보를 이용하기 위해서는 회원이 해당 정보에 명시된 요금을 먼저 회사가 정한 방법으로 지불하여야 하며 이는 회원의 동의를 전제로 합니다.</li>
									<li>
										이용요금은 SOUP 회원에게 제공되는 서비스 중 유료 서비스를 이용하기 위해 지불하는 요금으로 회원의 종류에 따라 차등 적용할 수 있으며, 서비스에 준하여 산정된 금액은 회원에게 사전에 고지합니다.  이를 위해 SOUP는 유료서비스 이용과 관련하여 다음 각 호의 사항을 해당 유료서비스의 소개화면이나 그 포장, FAQ 등에 회원이 알기 쉽게 표시합니다. 변경 시에는 변경 7일 전에 고지합니다. 
										<ol class="depth3">
											<li>"유료서비스"의 명칭 또는 제호</li>
											<li>"유료서비스" 제작자의 성명(법인인 경우에는 법인의 명칭), 주소, 전화번호</li>
											<li>"유료서비스"의 내용, 이용방법, 이용료 기타 이용조건</li>
										</ol>
									</li>
									<li> SOUP는 결제의 이행을 위하여 반드시 필요한 회원의 개인정보를 추가적으로 요구할 수 있으며, 회원은 SOUP가 요구하는 개인정보를 정확하게 제공하여야 합니다. SOUP는 회원이 허위로 또는 부정확하게 제공한 개인정보로 인하여 회원에게 발생하는 손해에 대하여 SOUP의 고의⋅과실이 없는 한 회원의 손해를 배상할 책임을 부담하지 않습니다 </li>
									<li>유료 서비스를 이용한 회원이 본 약관에서 정한 사유가 발생하여 회원가입을 취소하고 환불을 요구하거나, SOUP의 귀책사유로 서비스를 지속할 수 없을 경우 SOUP는 잔여 이용요금을 이용자가 지정하는 구좌로 환불 합니다.</li>
								</ol>
							</li>
							<li>
								<h4>제4조 (이용계약의 성립)</h4>
								<ol class="depth2">
									<li>유료서비스를 이용하기 위해서는 회원이 유료서비스 이용에 동의한 후 SOUP가 별도로 정하는 이용요금을 납부함으로써 이용계약이 성립됩니다. 회원은 SOUP에 전자우편 또는 전화로 입금하였음을 통보하고 SOUP는 이를 확인하여 인증처리 한 후 전자우편 또는 전화로 서비스이용이 가능함을 통보합니다. 서비스 이용자와 이용요금 납입자가 다를 경우 SOUP는 이를 확인하기 위하여 제 증명을 요구하고 가입여부를 승인할 수 있습니다.</li>
									<li>SOUP는 만 20세 미만의 미성년회원이 유료서비스를 이용하고자 하는 경우에 부모 등 법정 대리인의 동의를 얻거나, 계약체결 후 추인을 얻지 않으면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있다는 내용을 계약체결 전에 고지합니다.</li>
								</ol>
							</li>
							<li>
								<h4>제5조 (이용자보호)</h4>
								<ol class="depth2">
									<li>
										SOUP는 다음 각 호에서 정한 거래관련 정보 관리 절차를 갖고 있습니다.
										<ol class="depth3">
											<li>SOUP가 제공하는 서비스의 명칭, 종류, 내용 및 가격 등을 표시합니다.</li>
											<li>SOUP에서 구입하신 서비스는 SOUP 고객지원센터로 문의 주시면 안내 받으실 수 있습니다.</li>
											<li>소비자 피해 보상 및 불만이 있을 경우, 고객지원센터를 통해 처리 받으실 수 있습니다.</li>
										</ol>
									</li>
									<li>
										회원은 다음과 같은 절차를 통하여 SOUP의 서비스를 구매하고, 구매 사항을 교환 및 환불 받으실 수 있습니다
										<ol class="depth3">
											<li>구매를 희망하는 SOUP 서비스에 대한 이용요금 지급 방법은 계좌이체, 신용카드결제, 온라인 무통장 입금, 마일리지가 있습니다. 서비스 이용요금 지급 완료시기는 현금의 경우 무통장 입금 확인 후, 카드결제는 자동승인 인정합니다. </li>
											<li>SOUP는 결제/입금이 완료된 기업회원이 서비스 제공 전에 환불을 요청하는 경우에는 무조건 환불 또는 동일금액의 타 서비스로 대체 처리합니다.</li>
											<li>이미 서비스를 이용한 회원에게는 환불을 하지 않는 것을 원칙으로 하나, SOUP의 시스템상의 오류나 에러로 인한 환불 요청에는 전액 환불 처리합니다.</li>
											<li>불가피한 사유로 서비스를 제공할 수 없을 때, 3일 이내 대금 환불 조치를 취하고 있습니다.</li>
											<li> SOUP 고객보호규정에서 규정한 인재 DB 사용제한 업체, 혹은 정당한 사유로 서비스 이용을 제한하는 기업, 중요한 사실을 조작 및 누락하여 서비스를 이용하는 경우, 명의를 도용하여 이용하는 경우, 기타 법규 및 공공정서에 어긋나는 행위를 통해서 서비스를 이용하다 적발되는 경우는 거래취소 및 환불처리가 불가능합니다. </li>
										</ol>
									</li>
									<li>SOUP는 이용약관 제20조 (손해배상과 면책)에 해당하는 경우를 제외하고, SOUP를 통하여 이용자가 피해를 보았을 때는 결제약관 제7조에 따른 환불 등의 방법으로 피해를 보상합니다.</li>
									<li>만 20세 미만의 이용자의 경우 거래 발생 시 법률상의 법정 대리인의 동의가 필요합니다. <br>
										법정 대리인의 동의 없이 거래가 이루어진 경우, 회원의 요청에 따라 SOUP는 거래 취소 및 환불요청을 수용합니다.</li>
									<li>SOUP는 해당 담당직원에게 이용자 보호 지침 공지 및 교육을 실시하고 있습니다.</li>
									<li>서비스에 대한 기타 문의는 SOUP 고객지원센터(1588-6577 또는 incruit@incruit.com)로 문의 주시면 친절히 안내해 드립니다.</li>
								</ol>
							</li>
							<li>
								<h4>제6조(유료서비스 이용계약의 해지)</h4>
								<ol class="depth2">
									<li>회원이 유료서비스 이용계약을 해지하고자 하는 때에는 언제든지 회원정보관리에서 SOUP가 정한 절차에 따라 회원의 ID를 삭제하고 탈퇴할 수 있습니다.</li>
									<li>회원이 이용약관 제11조의 규정을 위반한 경우 SOUP는 일방적으로 본 계약을 해지할 수 있고, 이로 인하여 서비스 운영에 손해가 발생한 경우 이에 대한 민, 형사상 책임도 물을 수 있습니다.</li>
									<li>유료서비스 이용계약의 해지는 회원의 서비스 해지신청 및 SOUP의 승낙에 의해 성립합니다. SOUP가 승낙한 시점에 해지의 효과는 발생하며 환불할 금액이 있는 경우 환불도 이루어지게 됩니다. 환불에 대해서는 제7조의 규정을 따릅니다</li>
									<li>각 개별 유료서비스에서 제4항의 규정과 다른 계약해지의 방법 및 효과를 개별 약관에서 규정하고 있는 경우 각 개별 유료서비스의 계약해지에 관해서는 당해 개별약관의 규정을 따릅니다</li>
								</ol>
							</li>
							<li>
								<h4>제7조 (서비스 이용요금 환불)</h4>
								<ol class="depth2">
									<li>
										SOUP는 이용요금과 관련하여 오류가 있는 경우에 회원의 요청, 또는 SOUP의 사전 통지에 의하여 다음에 해당하는 조치를 취합니다.
										<ol class="depth3">
											<li>과다 납입한 요금에 대하여는 그 금액을 반환합니다. 다만, 회원이 동의할 경우 다음달에 청구할 요금에서 해당 금액만큼을 감하여 청구합니다.</li>
											<li>
												SOUP가 제공하는 유료서비스가 결제 후 1개월(결제 기준)을 초과하여 지속되는 서비스인 경우 해지일로부터 이용일수에 해당하는 금액과 총 남은 이용일수의 10%를 제외한 금액을 환불합니다. 단, 유료 서비스 이용 개시일로부터 7일 이내에 해지를 요구하는 경우 이용일수에 해당하는 금액만을 제외하고 환불합니다.　단 아래 각 목의 경우에는 회원이 결제한 전액을 환불합니다.
												<ol class="depth4">
													<li>회원이 결제를 완료한 후 서비스를 이용한 내역이 없는 경우</li>
													<li>서비스 장애 또는 SOUP가 제시한 최소한의 기술사양을 충족하였음에도 불구하고 SOUP의 귀책사유로 서비스를 이용하지 못한 경우</li>
													<li>회원이 구매한 서비스가 제공되지 않은 경우</li>
													<li>제공되는 서비스의 결함으로 서비스의 정상적인 이용이 현저히 불가능한 경우</li>
												</ol>
											</li>
										</ol>
									</li>
									<li>회원은 이용요금에 대하여 이의를 제기할 수 있습니다. 단, 이용요금에 관한 이의는 그 사유 발생을 안 날로부터 1월, 그 사유가 발생한 날로부터 3월 이내에 제기하여야 합니다.</li>
									<li>회원이 이용약관 제11조의 규정을 위반하여 SOUP가 회원의 서비스 이용을 제한하거나 일방적으로 이용계약을 해지하는 경우 SOUP는 회원에게 대하여 환불을 하지 않을 수 있습니다.</li>
									<li> 전액 환불의 경우 회원이 해당 서비스의 이용을 위하여 이용한 결제수단으로 환불하는 것을 원칙으로 하나 이것이 불가능 하거나 서비스의 중도해지로 인한 부분 환불 등의 경우에는 SOUP가 정하는 별도의 방법으로 환불합니다.</li>
									<li>환불에 소요되는 비용은 회원의 귀책사유로 인한 환불의 경우에는 회원이, SOUP의 귀책사유로 인한 환불의 경우에는 SOUP가 각각 부담합니다.  요금을 반환 받아야 할 회원의 요금 체납이 있는 경우에는 반환해야 할 요금에서 이를 우선 공제하고 반환합니다.</li>
								</ol>
							</li>
							<li>
								<h4>제8조(이용약관의 적용)</h4>
								<p>결제약관에서 정하지 아니한 사항 중 필요한 사항은 이용약관의 규정을 적용합니다.</p>
							</li>
						</ol>
			 	 </div>
			 	 <div class="col-md-8" id="select">
			 	 	<input type="radio" id="agreeBtn" value="동의"> 동의
			 	 	<input type="radio" id="disAgreeBtn" checked="checked" value="동의 안함"> 동의안함
			 	 </div>
			 	 <div class="col-md-8" id="action">
				 	 <input type="button" id="okayBtn" value="확인">
					 <input type="button" id="cancleBtn" value="취소">
				 </div>
			</div>
		</div>
	</form>
</section>