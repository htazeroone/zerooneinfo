<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/SemiQuiz/cssb/bootstrap.css">
<style>
#dd{
	margin: 0 auto;
	width: 800px;
	height: 500px;	
}

.kind {
	width : 60px;  
	text-align:center;
}     

</style>
<div id="dd">
	<table border="" style="width: 100%; height: 50%">
		<tr>
			<td class="kind" nowrap="nowrap">챕터</td>
			<td>${chapName }</td>
		</tr>
		<tr>
			<td class="kind" nowrap="nowrap">제목</td>
			<td>${data.title}</td>
		</tr>
		<tr>
			<td class="kind" nowrap="nowrap">작성자</td>
			<td>${data.pname}</td>
		</tr>
		<tr>
			<td class="kind" nowrap="nowrap">등록일</td>
			<td><fmt:formatDate value="${data.reg_date }" pattern="yyyy-MM-dd(E) HH:mm"/></td>
		</tr>
		<tr>
			<td class="kind" nowrap="nowrap">조회수</td>
			<td>${data.cnt}</td>
		</tr>
		
		<tr>
			<td class="kind" nowrap="nowrap">이론내용</td>
			<td>${data.content}</td>
			
		</tr>	
		<tr>
			<td colspan="2" align="right">
			 <c:choose>
			 	<c:when test="${param.head != 0}"> <!--말머리로 들어왔을 때 목록으로를 누르면 그냥 처음으로 넘어간다-->
			 		<a href="List?subject=${param.subject }">목록으로</a>
			 	</c:when>
			 	<c:otherwise> <!-- '전체'인 상태에서 들어왔을 때 목록을 누르면 그 페이지로 돌아가야 한다-->
			 		<a href="List?id=${data.id}&page=${param.page}&subject=${param.subject }">목록으로</a>
			 	</c:otherwise>
			 </c:choose>
			 	
				<c:if test="${sessionScope.pid == 'admin'}">
					<a href="DeleteForm?id=${data.id }&head=${data.head}&subject=${param.subject }">삭제</a>
					<a href="ModifyForm?id=${data.id }&head=${data.head}&subject=${param.subject }">수정</a>
				</c:if>
			</td>
		</tr>
		
		<c:if test="${sessionScope.pid != null and sessionScope.pid != 'admin'}">
		<tr>
			<td colspan="2" align="right">
				<a href="Detail?pid=${sessionScope.pid }&id=${data.id }&page=${param.page }&head=${data.head}&subject=${param.subject}">학습완료 체크</a>
			</td>
		</tr>
		</c:if>
	</table>
</div>
<script src="/SemiQuiz/jsb/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/SemiQuiz/jsb/bootstrap.js"></script>