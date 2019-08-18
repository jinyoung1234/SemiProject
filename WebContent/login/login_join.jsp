<%@page import="kr.co.yagaja.vo.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<script type="text/javascript" src="/yagaja_project_back2/js/jquery-1.11.3.min.js"></script>
<script src="/yagaja_project_back2/js/join.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>

.head{
				text-align: center;
			}

</style>



</head>
<body>
<link rel="stylesheet" href="/yagaja_project_back2/yagaja.css"> 
<div id="div_top">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YAGAJA
</div>

	<center>
		<h2>회원 가입</h2>
	</center>

 
  
<% if(request.getAttribute("errorMessage")!=null){ %>

<span style="color:red;"><%=request.getAttribute("errorMessage") %></span>
  <%} %> 
     
	<center>
	
		<form>
			<table width="700" bgcolor="#d0d4dd" border="0" cellpadding="5"
				cellspacing="1">
				<tr bgcolor="fffff" >
					<td bgcolor="f5f5f5">ID:</td>
					<td><input type="text" id="id" name="memberId" size="25"><button type="button" id="idDupCheck">중복확인</button></td>					
				</tr>
				<tr bgcolor="fffff" >
					<td bgcolor="f5f5f5">패스워드:</td>
					<td><input type="password" id="pw" name="password" size="25"></td>
				</tr>
				<tr bgcolor="fffff" >
					<td bgcolor="f5f5f5">패스워드 확인:</td>
					<td><input type="password" id="pw_check" name="password" size="25"></td>
				</tr>
				<tr bgcolor="fffff">
					<td bgcolor="f5f5f5">이름:</td>
					<td><input type="text" id="name" name="memberName" size="25"></td>
				</tr>
				<tr bgcolor="fffff">
					<td bgcolor="f5f5f5">핸드폰번호:<br>
					<font size="2em" color="green"> - 없이 숫자만 입력해주세요.</font> </td>
					<td><input type="text" id="phone_number" name="phoneNumber" size="25"></td>
				</tr>
				<tr bgcolor="fffff">
					<td bgcolor="f5f5f5">email:</td>
					<td><input type="text" id="email" name="email" size="25"></td>
				</tr>
				<tr bgcolor="fffff">
					<td bgcolor="f5f5f5">point:</td>
					<td><input type="text" id="point" name="point" size="25" readonly/></td>
				</tr>
				<tr>
					<td><input type="button" id="join" value="가입">&nbsp; 
						<input type="reset" value="다시 작성하기">&nbsp;</td>
				</form>
				</tr>

			</table>
		</form>
		
	</center>




                      

 
 

 

<jsp:include page="/WEB-INF/pagefoot.jsp" />
</body>
</html>