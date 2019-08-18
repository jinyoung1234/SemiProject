<%@page import="kr.co.yagaja.vo.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>



<%-- 포함될 페이지. 포함될 내용만 입력 --%>



<!-- 로그인 영역 -->



<%
	if (((Member) session.getAttribute("loginInfo")) != null) {
%>
<%--로그인 세션이 있을경우 --%>
<div class="d5">
	<%=((Member) session.getAttribute("loginInfo")).getMemberName()%>님
	환영합니다. <br> 
	<form action="/yagaja_project_back2/mypage" method="post">
	<button name="memberId" value="${sessionScope.loginInfo.memberId}">마이페이지</button>&nbsp;
	<a href="/yagaja_project_back2/logout"><button type="button"> 로그아웃 </button></a>&nbsp;
	<a href="/yagaja_project_back2/login/main.jsp"><button type="button"> 홈으로 </button></a>&nbsp;
	</form> 
</div>

<%
	} else {
%>
<%--로그인 세션이 없을 경우 --%>
<div class="d5">
	<form action="/yagaja_project_back2/login" method="post">
		ID: <input type="text" name="memberId" size="25"> 
		PW: <input type="password" name="password" size="25">
				 <input type="submit" value="로그인">&nbsp;
		<%--		<button><a href="/yagaja_project@@/login/login_join.jsp">회원가입</a></button>  --%>
			<button type="button" onclick="location.href='/yagaja_project_back2/login/login_join.jsp'"> 회원가입 </button>&nbsp;
			<a href="/yagaja_project_back2/login/main.jsp"><button type="button"> 홈으로 </button></a>&nbsp;
	</form>
</div>

<%
	} //end of if
%>
<!-- 로그인 영역 끝 -->










<%-- 필요없는 구문 --%>
<%-- 
<% if(session.getAttribute("loginInfo")==null){ %>
	<a href="/session_web/login/login_form.jsp">로그인</a> <!-- 로그인 안한 상태의 메뉴 -->
<%}else{ %>
	<a href="/session_web/logout">로그아웃</a><!-- 로그인 한 상태의 메뉴 -->
	<a href="/session_web/stacknum/stack">숫자누적요청</a>
<%} %> 
--%>



<hr>