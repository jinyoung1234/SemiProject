<%@page import="kr.co.yagaja.vo.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>YaGaJa</title>
<style>

.login
{
    top: 100px;
    width: 1350px;
    padding: 10px;
    border: 3px solid gray;
    margin: 0;
}	
	
	
	
#div_top
{
	width:100%;
	height:40px;
	background-color:white;
	font-family:Fantasy; 
	font-size:70px;
	color:#99b3ff;
	margin-left: 450px; 
}

#search
{
	margin-top: 100px;
	margin-left: 600px;
	margin-bottom:100px;

}
</style>

</head>

<body>


<div id="div_top">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YAGAJA
</div><br><br><br>

	<%
		if (request.getAttribute("errorMessage") != null) {
	%>
	<span style="color: red;"><%=request.getAttribute("errorMessage")%></span>
	<%
		} //end of if
	%>


	<!--============로그인 영역 시작=================-->
	<%
		if (((Member) session.getAttribute("loginInfo")) != null) {
	%>

		<!-- 로그인 세션이 있을 경우 -->
		<div class="login">
			<%=((Member)session.getAttribute("loginInfo")).getMemberName()%>님 환영합니다. <br>
			<form action="/yagaja_project_back2/mypage" method="post">
				<button name="memberId" value="${sessionScope.loginInfo.memberId}">마이페이지</button>
				<a href="/yagaja_project_back2/logout"><input type="button" value="로그아웃"></a> 
			</form>  
		</div><%
		} else {
	%>
		<!-- 로그인 세션이 없을 경우 -->
		<div class="login">
		<form action="/yagaja_project_back2/login" method="post">
			<input type="hidden" name="url" value="/login/main.jsp">
			
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
	
	
	
	<div id="search">
		<form action="/yagaja_project_back2/FindHouse" method="post">
			<select name="location">
					<!--name 옆에 multiple   -->
					<option value="">::지역::</option>
					<option value="서울">서울시</option>
					<option value="고양">고양시</option>
					<option value="시흥">시흥시</option>
					<option value="안산">안산시</option>
					<option value="성남">성남시</option>
					<option value="수원">수원시</option>
					<option value="안양">안양시</option>
					<option value="강릉">강릉시</option>
					<option value="제주">제주시</option>
		</select>
		<select name="type">
					<!--name 옆에 multiple   -->
					<option value="">::유형::</option>
					<option value="펜션">펜션</option>
					<option value="모텔">모텔</option>
					<option value="호텔">호텔</option>
		</select>
					<button type="submit">검색</button>
		</form>
	</div>

	<br>
	<jsp:include page="/WEB-INF/pagefoot.jsp" />
</body>
</html>