<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="/SemiQuiz/cssb/bootstrap.css">
<style>

	#dd{
		margin: 0 auto;
		width: 800px;
		height: 500px;
	
	}

	.myButton {
		-moz-box-shadow: 3px 4px 0px 0px #1564ad;
		-webkit-box-shadow: 3px 4px 0px 0px #1564ad;
		box-shadow: 3px 4px 0px 0px #1564ad;
		background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #378de5));
		background:-moz-linear-gradient(top, #79bbff 5%, #378de5 100%);
		background:-webkit-linear-gradient(top, #79bbff 5%, #378de5 100%);
		background:-o-linear-gradient(top, #79bbff 5%, #378de5 100%);
		background:-ms-linear-gradient(top, #79bbff 5%, #378de5 100%);
		background:linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#378de5',GradientType=0);
		background-color:#79bbff;
		-moz-border-radius:5px;
		-webkit-border-radius:5px;
		border-radius:5px;
		border:1px solid #337bc4;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:13px;
		font-weight:bold;
		padding:5px 10px; 
		text-decoration:none;
		text-shadow:0px 1px 0px #528ecc;
	}
	.myButton:hover {
		background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #378de5), color-stop(1, #79bbff));
		background:-moz-linear-gradient(top, #378de5 5%, #79bbff 100%);
		background:-webkit-linear-gradient(top, #378de5 5%, #79bbff 100%);
		background:-o-linear-gradient(top, #378de5 5%, #79bbff 100%);
		background:-ms-linear-gradient(top, #378de5 5%, #79bbff 100%);
		background:linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5', endColorstr='#79bbff',GradientType=0);
		background-color:#378de5;
	}
	.myButton:active {
		position:relative;
		top:1px;
	}
</style>

<form action="Comreg" method="post" enctype="multipart/form-data">

	<div id="dd">
	
		<table class="table">
			<tr>
				<td>kind</td>
				<td>${data.kind }
				<input type="hidden" name="kind" value="${data.kind }">
				<input type="hidden" name="id" value="${data.id }">
				<input type="hidden" name="page" value="${page }">
				</td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td>
				<%=session.getAttribute("pname")%>
				<input type="hidden" name="pname" value="<%=session.getAttribute("pname")%>">
				</td>
			</tr>
			
			<tr>
				<td>제목</td>
				<td>
				<input type="text" name="title" value="${data.title }" style="background-color: #D4F4FA; width: 97% ;">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
				<textarea rows="20" cols="100%" name="content" style="resize: none; background-color: #D4F4FA ">${data.content }</textarea>
				</td>
			</tr>
	   
			<tr>
				<td colspan="2" align="right">
					<input type="button" class="myButton" value="목록으로" onclick="location.href='Detail?id=${data.id }&page=${page}'">
					<input type="submit" value="입력" class="myButton">
					<%-- <a href="Detail?id=${data.id }&page=${page}">뒤로</a> --%>
				</td>
			</tr>
		</table>
	</div>	
</form>	

<script src="/SemiQuiz/jsb/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/SemiQuiz/jsb/bootstrap.js"></script>