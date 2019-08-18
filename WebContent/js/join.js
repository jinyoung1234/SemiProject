$('document').ready(function(){
	var id_isOK = 0;
	
	
	//아이디 중복확인 
	$("#idDupCheck").on('click', function(){
		var id = $('#id').val();
		//alert(id);
		$.ajax({
			url : "/yagaja_project_back2/idcheck",
			type : "Post",
			data : {id: $('#id').val()},
			cache : false,
			async : false,
			success : function(response) {
				//alert(response);
				if(response=="중복"){
					alert("아이디가 중복되었습니다. 다른 아이디를 입력해주세요.");
					//값 비우기
					$("#id").val("");
					id_isOK = 0;
					return;	
				}
				else{					
					alert("사용가능한 아이디입니다. ");
					id_isOK = 1;
				}
			}
		});
		
		
	});
	
	
	
	$("#join").on('click', function(){
		//비밀번호 체크먼저하기
		if( $('#pw').val() != $('#pw_check').val() ){
			alert("비밀번호를 확인해주세요.");
			return;
		}
		//중복체크 했는지 
		if(id_isOK==0){
			alert("아이디 중복체크를 해주세요.");
			return;
		}
		$.ajax({
			url : "/yagaja_project_back2/join",
			type : "Post",
			data : {id: $('#id').val(), pw: $('#pw').val(), name: $('#name').val(), phoneNumber: $('#phone_number').val(), email: $('#email').val()},
			cache : false,
			async : false,
			success : function(response) {
				if(response=="가입완료"){
					alert("회원가입이 완료되었습니다.");
					$('input[type=text]').val("");
					$('input[type=password]').val("");
				}
			}
		});		
		
		
	});
	
	
	
	


});
