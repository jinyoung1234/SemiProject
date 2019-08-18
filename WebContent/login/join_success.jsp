<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.yagaja.vo.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<link rel="stylesheet" href="/yagaja_project_back2/yagaja.css"> 
<div id="div_top">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YAGAJA
</div>
<center><span style="color:blue;"><h1>회원가입 성공</h1><br>
 ${sessionScope.joinInfoMemberId }님 가입을 축하드립니다.</span></center>
<%-- <% System.out.println(session.getAttribute("joinInfoMemberId")); %>
<%=session.getId() %> --%>
 <a href="/yagaja_project_back2/login/main.jsp">메인페이지</a>
 <a href="/yagaja_project_back2/logout">로그아웃</a>
</body>
</html>