
<%@page import="kr.co.yagaja.vo.Member"%>
<%@page import="kr.co.yagaja.vo.Picture"%>
<%@page import="kr.co.yagaja.vo.House"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%  Member member=(Member)session.getAttribute("loginInfo"); %>

<!DOCTYPE html>

<script type="text/javascript" src="/yagaja_project_back2/js/jquery-1.11.3.min.js"></script>
<script src="/yagaja_project_back2/js/reservation.js"></script>

<html>
<head>

<meta charset="UTF-8">

<title>Insert title here</title>
</head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
.mySlides {
   display: none
}
</style>

<body >

<link rel="stylesheet" href="/yagaja_project_back2/yagaja.css"> 
<div id="div_top">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YAGAJA
</div>


<%-- 
	<div class="w3-content" style="max-width:800px;position:relative">
      <c:forEach items="${sessionScope.selectPicture }" var="picture">
         <img class="mySlides" src='${picture.pictureName }'
            style="width: 50%; hight: 50%">
      </c:forEach>

	<a class="w3-btn-floating" style="position:absolute;top:45%;left:0;color:white" onclick="plusDivs(-1)">❮</a>
	<a class="w3-btn-floating" style="position:absolute;top:45%;right:50%;color:white" onclick="plusDivs(1)">❯</a>
	</div>

	<script>
	var slideIndex = 1;
	showDivs(slideIndex);
	
	function plusDivs(n) {
	  showDivs(slideIndex += n);
	}
	
	function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("mySlides");
	  if (n > x.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = x.length} ;
	  for (i = 0; i < x.length; i++) {
	     x[i].style.display = "none";  
	  }
	  x[slideIndex-1].style.display = "block";  
	}
	</script>


 --%>



	<!--============로그인 영역 시작=================-->
	<%
		if (((Member) session.getAttribute("loginInfo")) != null) {
	%>

		<!-- 로그인 세션이 있을 경우 -->
		<div class>
			<%=((Member)session.getAttribute("loginInfo")).getMemberName()%>님 환영합니다. <br>
			<form action="/yagaja_project_back2/mypage" method="post">
				<button name="memberId" value="${sessionScope.loginInfo.memberId}">마이페이지</button>
				<a href="/yagaja_project_back2/logout"><input type="button" value="로그아웃"></a> 
			</form>  
		</div><%
		} else {
	%>
		<!-- 로그인 세션이 없을 경우 -->
		<div class>
		<form action="/yagaja_project_back2/login" method="post">
			<input type="hidden" name="url" value="/detailed/detailed.jsp">
			
			ID: <input type="text" name="memberId" size="25"> 
			PW: <input	type="password" name="password" size="25">
			
			<input type="submit" value="로그인">&nbsp;
			<button type="button" onclick="window.open('/yagaja_project_back2/login/login_join.jsp', '회원가입', 'top=100px, left=100px, height=500px, width=800px')">회원가입</button>
		</form>
		</div>

	<%
		} //end of if
	%>
	<!--================로그인 영역 끝==================-->


	<hr>



	<!--==================숙소 정보 영역=====================-->
	
	<%
		House selectedHouse = (House) session.getAttribute("selectHouse");
		List<Picture> list= (List)session.getAttribute("selectPicture");
	%>
		
	[ 숙소 정보 ] <br>
	
 	숙소 사진<br>
<%--	<c:forEach items="${sessionScope.selectPicture }" var="picture">		
		<img src='${picture.pictureName }' width="200px" high="100px">
		&nbsp;&nbsp;
	</c:forEach> --%>
	 
	<div class="w3-content" style="max-width:800px;position:relative">
      <c:forEach items="${sessionScope.selectPicture }" var="picture">
         <img class="mySlides" src='${picture.pictureName }'
            style="width: 50%; hight: 50%">
      </c:forEach>

	<a class="w3-btn-floating" style="position:absolute;top:45%;left:0;color:white" onclick="plusDivs(-1)">❮</a>
	<a class="w3-btn-floating" style="position:absolute;top:45%;right:50%;color:white" onclick="plusDivs(1)">❯</a>
	</div>

	<script>
	var slideIndex = 1;
	showDivs(slideIndex);
	
	function plusDivs(n) {
	  showDivs(slideIndex += n);
	}
	
	function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("mySlides");
	  if (n > x.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = x.length} ;
	  for (i = 0; i < x.length; i++) {
	     x[i].style.display = "none";  
	  }
	  x[slideIndex-1].style.display = "block";  
	}
	</script>
	

	<br>
	<ul>
		<li/>숙소 이름 :<%=selectedHouse.getHouseName()%> <br>
		<li/>숙소 위치 :<%=selectedHouse.getLocation()%> <br>
		<li/>가격 : <%=selectedHouse.getPrice() %><br>
		<li/>유형 : <%=selectedHouse.getType() %> <br>
	</ul>	
	<br>



	[ 예약리스트 ]
	<br>
   <table border="1">
      <thead>
         <tr>
            <td width="270px" ><center>예약된 입실날짜 ~ 퇴실날짜</center></td>
         </tr>
      </thead>
      <tbody class="reservationList">
         <c:forEach items="${sessionScope.selectHouse.reservationList }" var="dateInfo">
            <c:choose>
               <c:when test="${dateInfo.rentTime!=null}">
                  <tr>
                       <td>
                        <fmt:formatDate value="${dateInfo.startRentDate }" pattern="yyyy년 MM월 dd일 "/> ~ 
                        <fmt:formatDate value="${dateInfo.endRentDate }" pattern="yyyy년 MM월 dd일 "/>
                     </td>

                  </tr>
               </c:when>
               <c:otherwise>
                  <tr>
                     <td><center>예약된 내역이 없습니다.</center></td>
                  </tr>
               </c:otherwise>
            </c:choose>
         </c:forEach>
      </tbody>
   </table>

	<br>
	
	<!--==================숙소 정보 영역 끝===================-->
	
	
	
	
	<hr>
	
	
	
	
	
	<!--======================예약 영역=======================-->

	[ 예약하기 ]
	<form>
		입실일 : <input type="date" id="startDate" name="startDate"> ~
		퇴실일 : <input type="date" id="endDate" name="endDate">
	</form>
		
	<!-- 로그인한 멤버아이디 넘겨주기위한 hidden tag -->
	<input type="hidden" id="memberId" value="${sessionScope.loginInfo.memberId }">
	
	
	<% if(((Member) session.getAttribute("loginInfo")) == null) { %>
		<button id="insertReservation_logout" value="${ sessionScope.selectHouse.houseId }" type="button">예약하기</button>
	<%  } else {	    %>	
		<button id="insertReservation" value="${ sessionScope.selectHouse.houseId }" type="button">예약하기</button>
	<%  } //end of if	%>
	
	<!--======================예약 영역 끝=====================-->
	
	
	
	
	
	<hr>
	<br>
	<form action="/yagaja_project_back2/FindHouse" method="post">
	<input type="hidden" name="location" value="${sessionScope.selectHouse.location}">
    <input type="hidden" name="type" value="${sessionScope.selectHouse.type}">
    <a href="/yagaja_project_back2/login/main.jsp"><input type="button" value="홈으로"></a>
	<input type="submit" value="목록으로"> 
	</form>
 	<br>
<jsp:include page="/WEB-INF/pagefoot.jsp" />
</body>
</html>