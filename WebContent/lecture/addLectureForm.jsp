<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" href="/SemiQuiz/cssb/bootstrap.css">

<script> 
var cnt =4;

function view(){

	var id = 'chapNum'+cnt;
	var dd = document.getElementById(id);
	dd.style.display='block';

	cnt++;
}
</script>


<style>


.hhh{

	display: none;
}

#dd{
	margin: 0 auto;
	width: 800px;
	height: 500px;
}
</style>

<div id ="dd">
<form action="AddLectureReg" method="post"> 
<center>
<table border="" style="width: 70%;" class="table">
	<tr>
		<td>새로운 과목명: 
		<input type="text" name="boardName"></td>
	</tr>
	<tr><td>
	<table>
	<c:forEach var="i" begin="1" end="3">
		<tr>
			<td>챕터 ${i } 이름: 
			<input type="text" name="chapNum${i }"></td>
		</tr>
	</c:forEach>	
	<c:forEach var="i" begin="4" end="20">
		<tr class="hhh" id="chapNum${i }">
			<td>챕터 ${i } 이름: 
			<input type="text" name="chapNum${i }"></td>
		</tr>
	</c:forEach>	
	</table>
	</td></tr>	
	<tr>
		<td colspan="2">
			<input type="submit" value="새 게시판 만들기">
			<button type="button" onclick="view()">과목 추가</button>
		</td>
	</tr>
</table>
<center>
</form>
</div>
<script src="/SemiQuiz/jsb/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/SemiQuiz/jsb/bootstrap.js"></script>