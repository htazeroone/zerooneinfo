<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="ct" tagdir="/WEB-INF/tags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="/SemiQuiz/cssb/bootstrap.css">

<%
    String chk = (String)session.getAttribute("pname");
%>


<script>
var getout = <%=chk %>
    if(getout==null){
        alert('로그인해주세요')
        location.href="../main/Main"
    }

function re(a){
	
	var b = 'rd'+a;
	
 	rehide();
 
	document.getElementById(b).style.display='inline';

}    

function rehide(){
	var abc = document.getElementsByClassName('rediv');

	for(var i=0;i<abc.length;i++){
		abc.item(i).style.display='none'
	}
	
}

</script>

<style>


	.rediv{
	
		background-color: gray;
		display: none; 
	}

	#dd{
		margin: 0 auto;
		width: 800px;
		height: auto;
	
	}

	.rebutton {
		-moz-box-shadow:inset 0px 1px 0px 0px #8300cf;
		-webkit-box-shadow:inset 0px 1px 0px 0px #8300cf;
		box-shadow:inset 0px 1px 0px 0px #8300cf;
		background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #c123de), color-stop(1, #a20dbd));
		background:-moz-linear-gradient(top, #c123de 5%, #a20dbd 100%);
		background:-webkit-linear-gradient(top, #c123de 5%, #a20dbd 100%);
		background:-o-linear-gradient(top, #c123de 5%, #a20dbd 100%);
		background:-ms-linear-gradient(top, #c123de 5%, #a20dbd 100%);
		background:linear-gradient(to bottom, #c123de 5%, #a20dbd 100%);
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#c123de', endColorstr='#a20dbd',GradientType=0);
		background-color:#c123de;
		-moz-border-radius:6px;
		-webkit-border-radius:6px;
		border-radius:6px;
		border:1px solid #a511c0;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:13px;  
		font-weight:bold; 
		padding:1px 3px;
		text-decoration:none;
		text-shadow:0px 1px 0px #9b14b3;
		margin: 5px;
	}
	.rebutton:hover {
		background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #a20dbd), color-stop(1, #c123de));
		background:-moz-linear-gradient(top, #a20dbd 5%, #c123de 100%);
		background:-webkit-linear-gradient(top, #a20dbd 5%, #c123de 100%);
		background:-o-linear-gradient(top, #a20dbd 5%, #c123de 100%);
		background:-ms-linear-gradient(top, #a20dbd 5%, #c123de 100%);
		background:linear-gradient(to bottom, #a20dbd 5%, #c123de 100%);
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#a20dbd', endColorstr='#c123de',GradientType=0);
		background-color:#a20dbd;
	}
	.rebutton:active {
		position:relative;
		top:1px;
	}
</style>


<div id="dd">
	<table class="table">
		<tr>
		
			<td>번호</td>
			<td>${data.id }</td>
			
			<td>종류</td>
			<td>${data.kind }</td>
		
			<td>글쓴이</td>
			<td>${data.pname }</td>
			
			<td>등록일</td>
			<td>${data.reg_date }</td>
	
			<td>추천수</td>
			<td>${data.rec }</td>
		
			<td>조회수</td>
			<td>${data.cnt }</td>
	
		</tr>	

		<c:if test="${data.upfile!='' }">
			<tr>
				<td>파일</td>
				<td colspan="11">
				<a href="FileDown?file=${data.upfile}&kind=${data.kind }">${data.upfile }</a>
				</td>
			</tr>
		</c:if>
		
		<tr>	
			<td>제목</td>
			<td colspan="10">${data.title }</td>
			<td>
				<a href='Rec?id=${data.id}&page=${page }'>
				<img src="/SemiQuiz/cssb/like.png" height="20px"> 
				</a>
				
		<%-- 		<input type="button" value="추천" onclick="location.href='Rec?id=${data.id}&page=${page }'"> --%>
			</td>
		</tr>	
		
		<tr height="370px">	
			<td colspan="12"><ct:conBr>${data.content }</ct:conBr></td>
		</tr>
	
		<tr>
			<td colspan="12">댓글</td>
		</tr>
	<!-- ========================================================댓글리스트 tr -->	
		<tr>
			<c:choose>
				<c:when test="${reply.size()==0 }">
					<td colspan="12">댓글이없습니다.</td>
				
				</c:when>
			
				<c:otherwise>
					<td colspan="12" bgcolor="#DAD9FF">
						<table width="100%">
							<c:forEach var="rr" items="${reply }">
								<tr>
								
									<td bgcolor="#DAD9FF">
										${rr.pname }
									</td>
									
									<td bgcolor="#DAD9FF">
									
										<c:if test="${rr.lev>0 }">
									
											<c:forEach begin="1" end="${rr.lev }">
											&nbsp;&nbsp;
											</c:forEach>
											
											
										</c:if>
										
										${rr.content }
										<button onclick="re(${rr.id})" class="rebutton">댓글</button>
										
										<!-- <button onclick="rehide()">댓글안보이기</button> -->
									</td>
									

										<c:if test="${rr.pname==pname||pname=='admin'}">
											<td bgcolor="#DAD9FF" align="right">
												<form action="Recdelete">
													<input type="hidden" name="id" value="${rr.id }">
													<input type="hidden" name="orid" value="${data.id }">
													<input type="hidden" name="page" value="${page }">
													<input class="rebutton" type="submit" value="댓글삭제">
												</form>
											</td>
										</c:if>
									
								</tr>
								
		<!-- ========================================================/댓글리스트 tr -->		
		<!-- ========================================================대댓글숨기기 tr -->							
	
								<tr>
									<td colspan="2">
										<table class="rediv" id = "rd${rr.id }" width="100%" height="100%">
											<tr>
												<td bgcolor="#DAD9FF">
													<form action="Rereinsert" id="rrinfrm${rr.id }">
														<textarea cols="85px" name="rrcontent" style="resize: none;"></textarea>
														<input type="hidden" name="orid" value="${data.id }">
														<input type="hidden" name="id" value = "${rr.id }">
														<input type="hidden" name="gid" value = "${rr.gid }">
														<input type="hidden" name="seq" value = "${rr.seq }">
														<input type="hidden" name="lev" value = "${rr.lev }">
														<input type="hidden" name="page" value="${page }">
														<input type="hidden" name="pname" value="<%=session.getAttribute("pname")%>">
													</form>
												</td>	
												
												
												<td bgcolor="#DAD9FF">
													<button class="rebutton" onclick="document.getElementById('rrinfrm${rr.id}').submit()">댓글달기</button>
												</td>
											</tr>
										
										</table>
					
										
									</td>
								</tr>
		<!-- ==========================================================/대댓글숨기기 tr -->							
							</c:forEach>		
						</table>
					</td>
				</c:otherwise>
			</c:choose>
		</tr>
	<!-- 댓글달수있는 창 -->
		<tr style="border-top: 2px solid #789;">
	
			<td colspan="11" bgcolor=#DAD9FF>
				<form action="Replyinsert" id="rinsert">
				<textarea cols="100" name="content" style="resize: none;"></textarea>
				<input type="hidden" name="id" value="${data.id }">
				<input type="hidden" name="page" value="${page }">
				<input type="hidden" name="pname" value="<%=session.getAttribute("pname")%>">
				</form>
			</td>
			<td bgcolor=#DAD9FF>	
				<button class="rebutton" onclick="document.getElementById('rinsert').submit()">등록</button>
			</td>
			
			
		</tr>
		
	<!-- ========================================================수정삭제 tr -->		
		<tr>
		
			<c:choose>
				<c:when test="${data.pname==pname||pname=='admin' }">
					<td align="left">
						<a href="Modify?id=${data.id }&kind=${data.kind }&page=${page}">수정</a>
						<a href="Delete?id=${data.id }&kind=${data.kind}">삭제</a>
					</td>
					<td colspan="9"></td>
				</c:when>
				
				<c:otherwise>
					<td colspan="10"></td>	
					
				</c:otherwise>
		
			</c:choose>
					<td colspan="2" align="right">
					<a href="List?kind=${data.kind }&page=${page}">목록으로</a>
					<a href="Cominsert?id=${data.id }&page=${page}">답글</a>
			</td>
		</tr>
		
	<!-- ========================================================/수정삭제 tr -->		
	</table>
	<!-- /댓글달수있는 창 -->

</div>
<script src="/SemiQuiz/jsb/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/SemiQuiz/jsb/bootstrap.js"></script>