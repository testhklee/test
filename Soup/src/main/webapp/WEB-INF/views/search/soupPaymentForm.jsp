<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<script type="text/javascript">
	var IMP = window.IMP; // 생략가능
	IMP.init('imp19176780');

	//결제창
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '${soupDetailDto.soupTitle}',
	    amount : ${soupDetailDto.soupPrice},
	    buyer_email : '${login.memberEmail}',
	    buyer_name : '${login.memberName}',
	    buyer_tel : '${login.memberTel}'
	}, function(rsp) {
		if ( rsp.success ) {
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	$.ajax({
				url:"soupPayment.do",
				type: "POST",
				data:{
					soupNo : ${soupDetailDto.soupNo},
					memberNo : ${login.memberNo}
    			},
    			success : function() {
    				var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;

	    			alert(msg);
	    			opener.parent.location.reload();
	    			self.close();
    			}
			})
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;

	        alert(msg);
	    }
	});
</script>


</body>
</html>