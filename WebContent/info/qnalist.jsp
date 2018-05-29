<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<link rel="stylesheet" href="/SemiQuiz/cssb/bootstrap.css">

<style type="text/css">

#dd{
	margin: 0 auto;
	width: 800px;
	height: 500px;

}

</style>

<div id="dd">
	<c:choose>
		<c:when test="${param.kind eq 'qna' }">
			<h1>Q&A</h1>
		</c:when>
		
		<c:otherwise>
			<h1>Notice</h1>
		</c:otherwise>
	</c:choose>
	<table class="table">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>등록일</th>
			<th>추천수</th>
			<th>조회수</th>
		</tr>
		
		<c:choose>
			<c:when test="${data.size()==0 }">
				<tr>
					<td colspan="7">게시물이 없습니다.</td>
				</tr>
			</c:when>
		
		
			<c:otherwise>
			
				<c:forEach items="${data }" var="dd" varStatus="no">
		
					
				<tr>

					<td>${no.index+start }</td>
					<c:choose>
						<c:when test="${dd.title eq null }">
							<td>
								<c:choose>
									<c:when test="${dd.total==0 }">
										<a href="Detail?id=${dd.id }&page=${page}">　　　</a>
									</c:when>
									<c:otherwise>
										<a href="Detail?id=${dd.id }&page=${page}">　　　(${dd.total })</a>
									</c:otherwise>
								</c:choose>
							</td>
						</c:when>
						
						<c:otherwise>
							<td>
								<c:if test="${dd.lev>0 }">
								
									<c:forEach begin="1" end="${dd.lev }">
									&nbsp;&nbsp;
									</c:forEach>
									
									└
								</c:if>
								<c:choose>
									<c:when test="${dd.total==0 }">
										<a href="Detail?id=${dd.id }&page=${page}">${dd.title}</a>
									</c:when>
									<c:otherwise>
										<a href="Detail?id=${dd.id }&page=${page}">${dd.title}(${dd.total })</a>
									</c:otherwise>
								</c:choose>
								
							</td>	
						</c:otherwise>
					</c:choose>
					
					<td>${dd.pname}</td>
					<td>${dd.reg_date}</td>
					<td>${dd.rec }</td>
					<td>${dd.cnt}</td>
		
				</tr>
				
				</c:forEach>
				
				
				
				
				<tr>
					<td colspan="7" align="center"> 
						<a href="List?page=1&kind=${kind }">[처음]</a>
						<c:if test="${startpage > 1 }">
							<a href="List?page=${startpage-1 }&kind=${kind }">이전</a>
						</c:if>
						
						<c:forEach var="i" begin="${startpage }" end="${endpage }">
							<c:choose>
								<c:when test="${i==page }">
									[${i }]
								</c:when>	
								<c:otherwise>
									<a href="List?page=${i }&kind=${kind }">${i }</a>
								</c:otherwise>
							</c:choose>		
						</c:forEach>
						
						<c:if test="${endpage<totalpage }">
							<a href="List?page=${endpage+1 }&kind=${kind }">다음</a>					
						</c:if>
						
						<a href="List?page=${totalpage }&kind=${kind }">[마지막]</a>				
						
					</td>
				</tr>
				
			</c:otherwise>
		</c:choose>
		
		<c:if test="${kind=='qna'||pname=='admin' }">
			<tr>
				<td colspan="7" align="right"><a href="Insert?kind=${kind }&page=${page}">글쓰기</a></td>
			</tr>
		</c:if>
	</table>
</div>


<script src="/SemiQuiz/jsb/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/SemiQuiz/jsb/bootstrap.js"></script>
