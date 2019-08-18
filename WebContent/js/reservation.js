$('document').ready(function(){
	
	//로그인 안했으면 return
	$("#insertReservation_logout").on('click', function(){
		alert("먼저 로그인 해주세요.");
		return;
	});
	
	
	$("#insertReservation").on('click', function(){
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		var selectedHouseId = $('#insertReservation').val();
		var memberId = $('#memberId').val();
		
		
		//모든값 입력되었는지 검사		
        if (startDate == "" || endDate == "" ) {
            if (startDate == "") {
                alert("입실일을 선택해주세요.");
                return;
            } else if (endDate == "") {
                alert("퇴실일을 선택해주세요.");
                return;
            }
        }
        
        
		//입실, 퇴실일 제대로 들어갔는지 체크 
        if( startDate >= endDate){
        	alert("입퇴실일을 바르게 입력해주세요. 입실일은 퇴실일 이전에 선택되어야합니다.");
        	$('input[type=date]').val("");
        	return;
        }
		
		
		
        
        
        
		var startDateArray = startDate.split('-'); // 년, 월, 일이 순서대로 배열에 담김 (문자열)
		var endDateArray = endDate.split('-');     // 년, 월, 일이 순서대로 배열에 담김 (문자열)
		//문자열을 숫자로 바꿔 년,월,일 구분해서 담기
		var startDateYear = parseInt(startDateArray[0]);   //입실 년
		var startDateMonth = parseInt(startDateArray[1]);  //입실 월
		var startDateDay = parseInt(startDateArray[2]);    //입실 일
		
		var endDateYear = parseInt(endDateArray[0]);	   //퇴실 년
		var endDateMonth = parseInt(endDateArray[1]);      //퇴실 월
		var endDateDay = parseInt(endDateArray[2]);	       //퇴실 일
		

        
		var startDateStr = startDateArray[0] + startDateArray[1] + startDateArray[2]
		var endDateStr   = endDateArray[0] + endDateArray[1] + endDateArray[2]		
		

		
		//예약 중복체크 
		$.ajax({
			url : "/yagaja_project_back2/reserveHouse",
			type : "Post",
			data : {startDate:startDateStr, endDate:endDateStr, houseId: $('#insertReservation').val(), memberId: $('#memberId').val()},
			cache : false,
			async : false,
			success : function(response) {
				//alert(response);
				if(response=="중복"){
					alert("예약일이 중복되었습니다. 다시 선택해주세요.");
					//값 비우기
					$('input[type=date]').val("");
					return;
	
				}
				else{					
					//Dao 처리
					alert("예약완료되었습니다.");
					$('input[type=date]').val("");
					$('input[type=date]').html(response);
					$(".reservationList").append(
							//예약 테이블에 새로 예약된 예약리스트 행 추가	
							"<tr><td style='background-color:#b3ccff;'>"+startDateArray[0]+"년 "+startDateArray[1]+"월 "+startDateArray[2]+"일 ~ "
						 	      +endDateArray[0]+"년 "+startDateArray[1]+"월 "+startDateArray[2]+"일</td></tr>"
					);
				}

			}

		}); 		
		
	});	//버튼클릭시 
	
	
});