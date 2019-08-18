<%@page import="kr.co.yagaja.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript" src="/yagaja_project_back2/js/jquery-1.11.3.min.js"></script>
<script src="/yagaja_project_back2/js/reservation.js"></script>
<link rel="stylesheet" href="/yagaja_project_back2/yagaja.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
tr:hover{
	background-color : #ef8b47
}
</style>
<title>${sessionScope.loginInfo.memberName}의 마이페이지</title>
</head>
<body>
<div id="div_top">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YAGAJA
</div>	 	
<br>
<a href="/yagaja_project_back2/logout"><button type="button"> 로그아웃 </button></a>&nbsp;
<a href="/yagaja_project_back2/login/main.jsp"><button type="button"> 홈으로 </button></a>&nbsp;

		<h2>내정보</h2>
<table width="700" cellpading="0" cellspacing="0">
<table width="700" bgcolor="#d0d4dd" border="0" cellpadding="5" cellspacing="1" style="text-align:center">
<tr bgcolor="fffff">
<td bgcolor="f5f5f5">ID</td>
				<td>${sessionScope.loginInfo.memberId}</td>
			</tr>
<tr bgcolor="fffff">
<td bgcolor="f5f5f5">이름</td>
				<td>${sessionScope.loginInfo.memberName}</td>
			</tr>
<tr bgcolor="fffff">
<td bgcolor="f5f5f5">핸드폰 번호</td>
				<td>${sessionScope.loginInfo.phoneNumber}</td>
			</tr>
<tr bgcolor="fffff">
<td bgcolor="f5f5f5">이메일</td>
				<td>${sessionScope.loginInfo.email}</td>
			</tr>
<tr bgcolor="fffff">
<td bgcolor="f5f5f5">Point</td>
				<td>${sessionScope.loginInfo.point}</td>
			</tr>
		</table>
		<a href="/yagaja_project_back2/mypage/modify_form.jsp"><button name="memberId"
		 		value="${sessionScope.loginInfo.memberId}">수정하기</button></a>
		<hr>
		<h2>예약정보</h2>
		<c:forEach items="${sessionScope.house}" var="house">
			<c:forEach items="${house.reservationList}" var="reservation">
				<table width="1000" cellpading="0" cellspacing="0">
				<table width="1000" bgcolor="#d0d4dd" border="0" cellpadding="5" cellspacing="1" style="text-align:center">
					<thead>
						<tr bgcolor="fffff">
						<td bgcolor="f5f5f5">예약 번호</td>
						<td bgcolor="f5f5f5">예약자</td>
						<td bgcolor="f5f5f5">숙소 이름</td>
						<td bgcolor="f5f5f5">지역</td>
						<td bgcolor="f5f5f5">가격</td>
						<td bgcolor="f5f5f5">입실 날짜</td>
						<td bgcolor="f5f5f5">예약 시간</td>
						<td bgcolor="f5f5f5">상세보기</td>
						<td bgcolor="f5f5f5">예약 취소</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${reservation.rentNo}</td>
							<td>${sessionScope.loginInfo.memberName}</td>
							<td>${house.houseName}</td>
							<td>${house.location}</td>
							<td>${house.price}</td>
							<td><fmt:formatDate 
									value="${reservation.startRentDate}" pattern="yyyy년 MM월 dd일 " /> ~ 
								<fmt:formatDate 
								    value="${reservation.endRentDate}" pattern="yyyy년 MM월 dd일 " /></td>
							<td><fmt:formatDate value="${reservation.rentTime}"	pattern="yyyy년 MM월 dd일 " /></td>
							<td>
								<form action="/yagaja_project_back2/datailHouse" method="post">
								<button name="houseId" value="${house.houseId}">상세보기</button>
								</form>
							</td>
							<td>
								<form action="/yagaja_project_back2/deleteReservation" method="post">
								<button name="rentNo" value="${reservation.rentNo}">예약취소</button>
								</form>
							</td>
						</tr>
					</tbody>
				</table>			
			</c:forEach>
		</c:forEach>
		<jsp:include page="/WEB-INF/pagefoot.jsp" />
</body>
</html>
