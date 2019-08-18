<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>수정완료</title>

</head>
<body>
<link rel="stylesheet" href="/yagaja_project_back2/yagaja.css"> 
<div id="div_top">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YAGAJA
</div>
<h2>정보 수정이 완료되었습니다.</h2>
<form action="/yagaja_project_back2/mypage" method="post">
<button name="memberId" value="${sessionScope.loginInfo.memberId}">마이페이지</button>
<a href="/yagaja_project_back2/login/main.jsp"><input type="button" value="메인으로"></a> 
</form>    
<jsp:include page="/WEB-INF/pagefoot.jsp" />
</body>
</html>