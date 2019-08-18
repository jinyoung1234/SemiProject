<%@page import="kr.co.yagaja.vo.Reservation"%>
<%@page import="kr.co.yagaja.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>

#div_top
{
	width:100%;
	height:40px;
	background-color:#99b3ff;
	font-family:Fantasy; 
	font-size:30px;
	color:white;
}
.head
{
	text-align: center;
}

</style>

<title>회원정보 수정</title>
</head>	
<body>
<div id="div_top">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YAGAJA
</div>

<center><h2>회원 정보 수정</h2></center>


<% if(request.getAttribute("errorMessage")!=null){ %>
<a style="color:red;"><%=request.getAttribute("errorMessage") %></a>
<% } %>


<center>
<form action="/yagaja_project_back2/modify" method="post">
<table width="700" cellpading="0" cellspacing="0">
<tr>
<td>
<table width="700" bgcolor="#d0d4dd" border="0" cellpadding="5" cellspacing="1">
<tr bgcolor="fffff">
<td bgcolor="f5f5f5">ID : </td>
<td><input type="text" name="memberId" readonly value="${sessionScope.loginInfo.memberId}" style="background-color: #e2e2e2;"><br></td>
</tr> 
<tr bgcolor="fffff">
<td bgcolor="f5f5f5">새 비밀번호 : </td>
<td><input type="password" name="password"><td>
</tr> 
<tr bgcolor="fffff">
<td bgcolor="f5f5f5">새 비밀번호 확인 : </td>
<td><input type="password" name="password2"></td>
</tr> 
<tr bgcolor="fffff">
<td bgcolor="f5f5f5">이름 : </td>
<td><input type="text" name="memberName" readonly value="${sessionScope.loginInfo.memberName}" style="background-color: #e2e2e2;"></td>
</tr> 
<tr bgcolor="fffff">
<td bgcolor="f5f5f5">이메일 : </td>
<td><input type="text" name="email" value="${sessionScope.loginInfo.email}"></td>
</tr> 
<tr bgcolor="fffff">
<td bgcolor="f5f5f5">핸드폰번호 :<br> 
<font size="2em" color="green"> - 없이 숫자만 입력해주세요.</font> 
</td>
<td><input type="number" name="phoneNumber" value="${sessionScope.loginInfo.phoneNumber}"></td>	
</tr> 
<tr bgcolor="fffff">
<td bgcolor="f5f5f5">포인트 : </td>
<td><input type="number" name="point" readonly value="${sessionScope.loginInfo.point}" style="background-color: #e2e2e2;"></td>
</tr>
<input type="submit" value="저장">
<input type="reset" value="초기화">                               
</table>
</form>
</center>                            





<jsp:include page="/WEB-INF/pagefoot.jsp" />
</body>
</html>

 