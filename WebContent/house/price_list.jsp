
<%@page import="kr.co.yagaja.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:include page="/WEB-INF/menu.jsp"/>
<title>Insert title here</title>
<style type="text/css">
a:link {
	/*방문하지 않은 링크 설정.*/
	text-decoration: none; /*밑줄 안나오도록 처리.*/
	color: green;
}

a:visited {
	/*방문한 링크 설정*/
	text-decoration: none;
	color: green;
}

a:hover {
	/*마우스 포인터가 올라간 시점의 설정.*/
	text-decoration: underline;  /*line-through : 지우는것처럼 표시가능  */
	color: red;
}

a:active {
	/*마우스를 링크에 클릭하는 시점*/
	color: blue;
}

table, td {
	border: 1px solid gray;
}

table {
	border-collapse: collapse;
	width: 500px;
}

td {
	padding: 10px; /*안쪽 공간은 padding, 바깥쪽 공간은 margin  */
}

table, th, td {
    border: 2px solid black;
}

</style>
</head>
<body>
<link rel="stylesheet" href="/yagaja_project_back2/yagaja.css"> 
<div id="div_top">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YAGAJA
</div>
	

	<br>

	검색한 숙소<br>	
	<form action="/yagaja_project_back2/PriceController" method="post">
	<select name="order" id="selectH">
         <option value="lowprice"> 선택해주세요.</option>
         <option value="lowprice" <c:if test="${param.order =='lowprice'}">selected</c:if>>가격 낮은순</option>
         <option value="highprice" <c:if test="${param.order =='highprice'}">selected</c:if>>가격 높은순</option>
      </select>
	<input type="hidden" name="location" value="${param.location }">
	<input type="hidden" name="type" value="${param.type }">
	<button type="submit"> 정렬 </button>
	</form>

	
	<table border="1">
		<thead>
			<tr>
				<td>HouseID</td>
				<td>유형</td>
				<td>위치</td>
				<td>이름</td>
				<td>가격</td>
				<td>사진</td>
				<td>상세정보</td>
			</tr>
		</thead>
		<tbody>
		   
			<c:forEach items="${requestScope.result }" var="result">
				<tr>
					<td>${result.houseId }</td>
					<td>${result.type }</td>
					<td>${result.location}</td>
					<td>${result.houseName}</td>
					<td>${result.price}</td>
					<c:forEach items="${result.pictureList}" var="list">
						<td><img src='${list["pictureName"]}' width="100px"></td>
					</c:forEach>
					<td>
						<form action="/yagaja_project_back2/datailHouse" method="post">
							<button name="houseId" value="${ result.houseId }">상세보기</button>
						</form>
					</td>

				</tr>
			</c:forEach>
		</tbody>

	</table>
  	
  <a href="${initParam.rootPath }/PriceController?page=1">첫페이지</a>

		<!--
		이전 페이지 그룹 처리.
		만약에 이전페이지 그룹이 있으면 링크처리하고 없으면 화살표만 나오도록 처리.
	 -->
		<c:choose>
			<c:when test="${requestScope.pageBean.previousPageGroup }">
				<!--이전 페이지 그룹이 있다면: is  -->
				<!--이전 페이지 그룹이 있다면  -->
				   
				
				 <a href="${initParam.rootPath }/PriceController?page=${requestScope.pageBean.beginPage-1}&location=${param.location}&type=${param.type}">◀ </a> 
				  
				   
			</c:when>
			<c:otherwise>

			</c:otherwise>

		</c:choose>
		
		
		
		
  <c:forEach begin="${requestScope.pageBean.beginPage }" end="${requestScope.pageBean.endPage }" var="page">
       
       <c:choose>
          <c:when test= "${requestScope.pageBean.page!=page }">
          
        <a href="${initParam.rootPath}/PriceController?page=${page}&location=${param.location}&type=${param.type}&order=${requestScope.order}">${page }&nbsp;&nbsp;</a> <!--찍고있는 페이지가 현재페이지라면 링크처리하지않기 어차피 그 페이지 보는거니깐.  -->
         
          
          </c:when>
          <c:otherwise>
          
           [${page }]&nbsp;&nbsp;
           </c:otherwise>
           </c:choose>
       </c:forEach>
       

       
<!-- 
		다음페이지 그룹으로 이동
		만약에 다음페이지 그룹이 있으면 링크 처리 없으면 화살표만 나오도록 처리
	 -->

       <c:choose>
       <c:when test="${requestScope.pageBean.nextPageGroup }">   <!--} 와 " 공백안생기게 조심!!!!!!  -->
           
         <a href="${initParam.rootPath }/PriceController?page=${requestScope.pageBean.endPage+1}&location=${param.location}&type=${param.type}">▶</a>
          
       </c:when>

       <c:otherwise>
       
       </c:otherwise>
       
       </c:choose>
  
  
		<!-- 마지막 페이지로 이동 -->
		<a href="${initParam.rootPath }/PriceController?page=${requestScope.pageBean.totalPage}&location=${param.location}&type=${param.type}">마지막
			페이지</a>
 
<jsp:include page="/WEB-INF/pagefoot.jsp" />
</body>
</html>