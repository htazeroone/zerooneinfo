<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chkmenu.css" />
<title>Insert title here</title>

</head>
<body>
<center><h3 style="color:green;">${subject } 오답노트</h3></center>
<nav class="link-effect-11" id="link-effect-11">
<!-- for문  -->
<c:forEach var="ch" items="${chList }">
<%-- 	<form action="Note" method="post">
		<input type="hidden" value="${ch.chid }" name="chid">
		<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
		<input type="submit" value="${ch.chname }">
	</form> --%>
	<a href="IncorrectNote?chid=${ch.chid }&subject=${subject}"><span>Ch.${ch.chid} ${ch.chname }</span></a><br><br>
</c:forEach>
</nav>

</body>
</html>



