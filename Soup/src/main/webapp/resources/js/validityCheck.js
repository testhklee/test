
//id 유효성 검사
$(document).ready(function() {
	$("#memberEmail").keyup(function() {
		var email = $("#memberEmail").val();
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

		var emailid = $("#memberEmail").val().split('@')[0];
		var chk_num = emailid.search(/[0-9]/g);
		var chk_eng = emailid.search(/[a-z]/ig);
		if (regex.test(email) === false) {
			$('#emailCkMsg').html("<span class='glyphicon glyphicon-remove' style='position: absolute; top: 28px; left:330px; color:red; font-size:21px '></span>");
			return false;
		}
		//아이디 중복체크
		$.ajax({
			url : 'checkId.do',
			data : {
				"memberEmail" : $('#memberEmail').val()
			},
			success : function(data) {
				if ($.trim(data) > 0) {
					$('#emailCkMsg').html("<span class='glyphicon glyphicon-remove' style='position: absolute; top: 28px; left:330px; color:red; font-size:21px '></span>");
				} else {
					$('#emailCkMsg').html("<span class='glyphicon glyphicon-ok' style='position: absolute; top: 28px; left:330px; color:green;font-size:21px '></span>");
				}
			}
		});
		
		//비밀번호 유효성 검사
		$("#memberPw").keyup(function() {
			var pwval = $("#memberPw").val();
			var regexx = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			if (regexx.test(pwval) === false) {
				$('#pwCkMsg').html("<span class='glyphicon glyphicon-remove' style='position: absolute; top: 92px; left:330px; color:red; font-size:21px '></span>");
				return false;
			} else {
				$('#pwCkMsg').html("<span class='glyphicon glyphicon-ok' style='position: absolute; top: 92px; left:330px; color:green;font-size:21px '></span>");
			}

			//비밀번호 재확인
			$("#memberPwCk").keyup(function() {
				//비밀번호값	
				var pwval = $("#memberPw").val();
				//비밀번호 재확인값	
				var pwvalCh = $("#memberPwCk").val();
				if (pwval != pwvalCh) {
					$('#pwRe').html("<span class='glyphicon glyphicon-remove' style='position: absolute; top: 151px; left:330px; color:red; font-size:21px '></span>");
				} else {
					$('#pwRe').html("<span class='glyphicon glyphicon-ok' style='position: absolute; top: 151px; left:330px; color:green;font-size:21px '></span>");
				}

				
				$("#memberName").keyup(function() {
				
					var nam = $("#memberName").val();
					if (nam == null || nam =='') {
						$('#nameCk').html("<span class='glyphicon glyphicon-remove' style='position: absolute; top: 215px; left:330px; color:red; font-size:21px '></span>");
						return false;
					}else{
						$('#nameCk').html("<span class='glyphicon glyphicon-ok' style='position: absolute; top: 215px; left:330px; color:green;font-size:21px '></span>");
					}
			


					//핸드폰번호 유효성 검사
					$("#memberTel").keyup(function() {
						var tel = $("#memberTel").val()
						var realTel= tel.split('-').join('');		
						var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;

						if (regPhone.test(realTel) === false) {
							$('#telCkMsg').html("<span class='glyphicon glyphicon-remove' style='position: absolute; top: 275px; left:330px; color:red; font-size:21px '></span>");
							return false;
						} else if (realTel == null || realTel == '') {
							$('#telCkMsg').html("<span class='glyphicon glyphicon-remove' style='position: absolute; top: 275px; left:330px; color:red; font-size:21px '></span>");
							return false;
						} else if (realTel.length == 10 || realTel.length == 11) {
							$.ajax({
								url : 'checkTel.do',
								data : {
									"memberTel" : $('#memberTel').val()
								},
								success : function(data) {
									if ($.trim(data) > 0) {
										$('#telCkMsg').html("<span class='glyphicon glyphicon-remove' style='position: absolute; top: 275px; left:330px; color:red; font-size:21px '></span>");
									} else {
										$('#telCkMsg').html("<span class='glyphicon glyphicon-ok' style='position: absolute; top: 275px; left:330px; color:green;font-size:21px '></span>");
										$('#joinBtn').removeAttr('disabled');
									}
								}
							
							});
							
						}
					});
				});
					
			});

		});
	});
});