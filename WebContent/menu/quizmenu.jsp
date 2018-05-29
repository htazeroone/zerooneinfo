<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/smenu.css" />
<title>Insert title here</title>

</head>

<center><h2>${subname }</h2></center>
<nav class="link-effect-11" id="link-effect-11">

<c:forEach items="${sub }" var="ss">
	<c:if test="${ss.head!=0 }">
		<a href="Chapter?num=${ss.head}&subject=${subname}&chname=${ss.title}"><span>Ch.${ss.head } ${ss.title }</span></a><br><br>
	</c:if>
</c:forEach>
</nav>

