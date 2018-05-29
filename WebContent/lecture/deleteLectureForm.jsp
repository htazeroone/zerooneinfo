<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>



#dd{
	margin: 0 auto;
	width: 800px;
	height: 500px;
}

</style>

<link rel="stylesheet" href="/SemiQuiz/cssb/bootstrap.css">
 
<div id ="dd">
<form action="DeleteLectureReg">
<center>
<table border="">
	<tr>
		<td>삭제하고자 하는 과목</td>
		<td>
			<select name="subject">
				<c:forEach var="i" items="${subjects }" varStatus="no">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select>		
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<input type="submit" value="선택과목 삭제">
		</td>
	</tr>
</table>
</center>
</form>

</div>
<script src="/SemiQuiz/jsb/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/SemiQuiz/jsb/bootstrap.js"></script>