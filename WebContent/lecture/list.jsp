<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/SemiQuiz/cssb/bootstrap.css">

<script type="text/javascript">
	function listCate(){
		document.frm.submit();
	}

</script>
<style>
table {
	text-align: center;
}
#mal {
	text-align: left;
}
#dd{
	margin: 0 auto;
	width: 800px;
	height: 500px;
}


</style>
<div id="dd">
	<table class="table">
		<tr>
			<td colspan="6" align="center">
				<h3><b>${subject}게시판</b></h3>
			</td>
		</tr>
		<tr>
			<td>말머리</td>
			<td colspan="6" id="mal">
				<form name="frm" action="?">
					<select name="head" onchange="listCate()">
						<c:forEach var="i" items="${chapList}" varStatus="no">
							<c:choose>
								<c:when test="${no.index == head}">
									<option value="${no.index }" selected="selected">${i }</option>
								</c:when>
								<c:otherwise>
									<option value="${no.index }">${i }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<input type="hidden" name="subject" value="${subject }">
				</form>
			</td>
		
		</tr>
		<tr>
			<td>번호</td><td>제목</td><td>글쓴이</td><td>등록일</td><td>조회수</td><td>내 학습여부</td>
		</tr>
		
	<c:choose>
	<c:when test="${data.size() == 0 }">
		<tr><td colspan="6">글이 없습니다. 새 글을 등록하세요.</td></tr>
	</c:when>
	
	<c:otherwise>
		<c:forEach var="i" items="${data }" varStatus="no">
			
			<tr>
				<td>${no.index + start }</td>
				<td>
					
					<a href="Detail?id=${i.id}&head=${param.head}&page=${page}&subject=${subject}">${i.title}</a>
				</td>
				
				<td>${i.pname }</td>
				<td><fmt:formatDate value="${i.reg_date }" pattern="yyyy-MM-dd(EE)"/></td>
				<td>${i.cnt}</td>
				
				<td>
			<c:if test="${readList.size() != 0}">
				
					<c:forEach var="num" items="${readList }">
						<c:choose>
						<c:when test="${num == i.id}">
							학습완료
						</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
					</c:forEach>
				
			</c:if>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="center">
				<c:if test="${startPage > 1 }">
					<a href="List?page=1&head=${head}&subject=${subject}">[처음]</a>
					<a href="List?page=${startPage -1 }&head=${head}&subject=${subject}">◀</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:choose>
						<c:when test="${i == page }">
							[${i }]
						</c:when>
						<c:otherwise>
							<a href="List?page=${i }&head=${head}&subject=${subject}">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${totalPage > endPage }">
					<a href="List?page=${endPage + 1 }&head=${head}&subject=${subject}">▶</a>
					<a href="List?page=${totalPage }&head=${head}&subject=${subject}">[마지막]</a>
				</c:if>
			</td>
		</tr>
		
	</c:otherwise>
	
	</c:choose>
	
		<c:if test="${sessionScope.pid == 'admin'}">
		<tr>
			<td colspan="6" align="right">
				<a href="InsertForm?page=${page }&head=${head}&subject=${subject}">글쓰기</a>
			</td>
		</tr>
		</c:if>	
	</table>
</div>
<script src="/SemiQuiz/jsb/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/SemiQuiz/jsb/bootstrap.js"></script>