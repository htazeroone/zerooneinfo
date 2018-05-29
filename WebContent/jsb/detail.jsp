<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
    String chk = (String)session.getAttribute("pname");
%>

<script>
var getout = <%=chk %>
    if(getout==null){
        alert('getout')
        location.href="../main/Main"
    }

function re(a){
	var b = 'rd'+a;
	
	rehide();
	document.getElementById(b).style.display='block';

}    

function rehide(){
	var abc = document.getElementsByClassName('rediv');
	
	for(var i=0;i<abc.length;i++){
		abc.item(i).style.display='none'
	}
	
}
</script>

<style>
	#td1{
		margin:2px;
	 	width: 800px;
	 	height: 30px;
	 	background-color: gray;
	 	float:left;
	}
	#td2{
		margin:2px;
	 	width: 100px;
	 	height: 50px;
	 	background-color: gray;
	 	float:left;
	}

	.tr{
		background-color: pink;

	}
	.td{
		display: inline-block;
		border: 3px solid purple; 
		width: 120px;
		margin: 3px;
	}
	
	.rinsert{
		background-color: pink;

	}
	.ritd1{
		align-items: center;
		margin:2px;
		display: inline-block;
		border: 3px solid purple; 
		width: 795px;
	}
	.ritd2{
		top:0px;	
		align-items: center;
		display: inline-block;
		background-color:pink;
		width: 100px;
		height: 30px;
		cursor: pointer;
	}
	
	.rediv{
	
		background-color: gray;
		display: none; 
	}
	
</style>


<!-- ====================================테이블로~~============================================= -->
<table border="">
	<tr>
		<th>종류</th>
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>등록일</th>
		<th>추천수</th>
		<th>조회수</th>
	</tr>
	





</table>


<!-- =====================================테이블로~~============================================ -->
<div>
<!-- 	<div class="tr">
		<div class="td">kind</div>
		<div class="td">id</div>
		<div class="td">gid</div>
		<div class="td">seq</div>
		<div class="td">lev</div>
		<div class="td">cnt</div>
		<div class="td">rec</div>
		<div class="td">reg_date</div>
		<div class="td">pname</div>
		<div class="td">title</div>
		<div class="td">content</div>
		<div class="td">upfile</div>
	</div> -->

	<div class="tr">
		<div class="td">${data.kind }</div>
		<div class="td">${data.id }</div>
		<div class="td">${data.gid }</div>
		<div class="td">${data.seq }</div>
		<div class="td">${data.lev }</div>
		<div class="td">${data.cnt }</div>
		<div class="td">${data.rec }</div>
		<div class="td">${data.reg_date }</div>
		<div class="td">${data.pname }</div>
		<div class="td">${data.title }</div>
		<div class="td">${data.content }</div>
		<div class="td">${data.upfile }</div>

	</div>


	<div>

	<c:choose>
		<c:when test="${reply.size()==0 }">
			<div class="tr">
				<div class="td">
					댓글이 없습니다.
				</div>
			</div>
		</c:when>
		<c:otherwise>
			
			<c:forEach var="rr" items="${reply }">
			<div class="tr">
				<div id="td1">
				${rr.content }
				<button onclick="re(${rr.id})">댓글</button>
				
				<button onclick="rehide()">댓글안보이기</button>
				</div>
				<div id="td2">
				${rr.pname }
				
				
				<c:if test="${rr.pname==pname }">
				
				<form action="Recdelete">
					<input type="hidden" name="id" value="${rr.id }">
					<input type="hidden" name="orid" value="${data.id }">
					<input type="hidden" name="page" value="${page }">
					<input type="submit" value="댓글삭제">
				</form>
	
				</c:if>
				</div>
			</div>
<!-- ================================================================================= -->
			<div class="rediv" id = "rd${rr.id }">
				<div id="td3">
					<form action="Rereinsert">
	
						<div class="rinsert">
							<div class="ritd1">
								<textarea cols="100" name="content"></textarea>
								<input type="hidden" name="orid" value="${data.id }">
								<input type="hidden" name="id" value = "${rr.id }">
								<input type="hidden" name="gid" value = "${rr.gid }">
								<input type="hidden" name="seq" value = "${rr.seq }">
								<input type="hidden" name="lev" value = "${rr.lev }">
								<input type="hidden" name="page" value="${page }">
								<input type="hidden" name="pname" value="<%=session.getAttribute("pname")%>">
							</div>
							<div class="ritd2">
				
								<input type="submit" value="등록">
							</div>
						</div>
					</form>
				</div>
			</div>
<!-- ================================================================================= -->			
			</c:forEach>
		
		</c:otherwise>
	</c:choose>
	
	</div>
	
	<form action="Replyinsert">
	
	<div class="rinsert">
		<div class="ritd1">
			<textarea cols="100" name="content"></textarea>
			<input type="hidden" name="id" value="${data.id }">
			<input type="hidden" name="page" value="${page }">
			<input type="hidden" name="pname" value="<%=session.getAttribute("pname")%>">
		</div>
		<div class="ritd2">
			
			<input type="submit" value="등록">
		</div>
	</div>
	</form>
	
	<div class="tr">
		<c:if test="${data.pname==pname }">
		
			<div class="td">
				<a href="Modify?id=${data.id }&kind=${data.kind }&page=${page}">수정</a>
				<a href="Delete?id=${data.id }&kind=${data.kind}">삭제</a>
			</div>
		
		</c:if>
		<div class="td">
				<input type="button" value="추천" onclick="location.href='Rec?id=${data.id}&page=${page }'">
				<a href="List?kind=${data.kind }&page=${page}">목록으로</a>
				<a href="Cominsert?id=${data.id }&page=${page}">답글</a>
		</div>
	</div>
</div>