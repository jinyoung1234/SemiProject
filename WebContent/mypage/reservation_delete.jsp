<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
예약이 취소되었습니다.
<form action="/yagaja_project_back2/mypage" method="post">
<button name="memberId" value="${sessionScope.loginInfo.memberId}">마이페이지</button>
<a href="/yagaja_project_back2/login/main.jsp"><input type="button" value="메인으로"></a> 
</form>    
<jsp:include page="/WEB-INF/pagefoot.jsp" />
</body>
</html>